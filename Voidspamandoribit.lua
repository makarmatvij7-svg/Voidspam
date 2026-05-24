local Players      = game:GetService('Players')
local RunService   = game:GetService('RunService')
local CoreGui      = game:GetService('CoreGui')
local UIS          = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local StarterGui   = game:GetService('StarterGui')

local LocalPlayer = Players.LocalPlayer
local Character   = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP         = Character:WaitForChild('HumanoidRootPart')

local orbActive     = false
local vspamActive   = false
local notifyActive  = true
local menuVisible   = true

local orbConn
local hitConns = {}
local angle = 0


-- VOID SPAM V2 state
local vspamLastPos    = nil
local vspamFakeY      = -9999999999999999999999999
local vspamCurrentVal = 9999999999999999999999999
local vspamFlip       = true
local vspamRgbOn      = false
local vspamPhase      = 0

-- HIT NOTIFY state
local lastHealthMap = {}
local notifyQueue   = {}

----------------------------------------------------------------
-- TEAM CHECK
----------------------------------------------------------------
local function isSameTeam(p)
    if not p or p == LocalPlayer then return true end
    if LocalPlayer.Team ~= nil and p.Team ~= nil and LocalPlayer.Team == p.Team then
        return true
    end
    if LocalPlayer.TeamColor and p.TeamColor and LocalPlayer.TeamColor == p.TeamColor then
        if LocalPlayer.Neutral == false and p.Neutral == false then
            return true
        end
    end
    return false
end

----------------------------------------------------------------
-- TARGETING
----------------------------------------------------------------
local function getClosest()
    local closest, dist = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            if not isSameTeam(p) then
                local d = (HRP.Position - p.Character.HumanoidRootPart.Position).Magnitude
                if d < dist then
                    dist    = d
                    closest = p
                end
            end
        end
    end
    return closest
end

local function getHRP()
    local c = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    return c:WaitForChild("HumanoidRootPart")
end

----------------------------------------------------------------
-- GUI CLEANUP
----------------------------------------------------------------
for _, g in ipairs((gethui and gethui() or CoreGui):GetChildren()) do
    if g.Name == "Gru_tegk" then g:Destroy() end
end
pcall(function()
    for _, g in ipairs(LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        if g.Name == "Gru_tegk" then g:Destroy() end
    end
end)

local ScreenGui = Instance.new('ScreenGui')
ScreenGui.Name           = 'Gru_tegk'
ScreenGui.ResetOnSpawn   = false
ScreenGui.DisplayOrder   = 999999999
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.IgnoreGuiInset = true

local parented = false
if not parented and typeof(gethui) == "function" then
    local ok = pcall(function() ScreenGui.Parent = gethui() end)
    if ok then parented = true end
end
if not parented then
    local ok = pcall(function() ScreenGui.Parent = CoreGui end)
    if ok then parented = true end
end
if not parented then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

----------------------------------------------------------------
-- TOGGLE BUTTON
----------------------------------------------------------------
local toggleBtn = Instance.new('TextButton')
toggleBtn.Size             = UDim2.new(0, 110, 0, 35)
toggleBtn.Position         = UDim2.new(0.8, 0, 0.4, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
toggleBtn.Text             = 'Open/Close Lua'
toggleBtn.TextColor3       = Color3.fromRGB(255, 255, 255)
toggleBtn.Font             = Enum.Font.GothamBold
toggleBtn.TextSize         = 14
toggleBtn.Draggable        = true
toggleBtn.Parent           = ScreenGui
Instance.new('UICorner', toggleBtn)
Instance.new('UIStroke',  toggleBtn).Color = Color3.fromRGB(60, 40, 150)

----------------------------------------------------------------
-- MAIN FRAME
----------------------------------------------------------------
local MainFrame = Instance.new('Frame')
MainFrame.Size             = UDim2.new(0, 190, 0, 250)
MainFrame.Position         = UDim2.new(0.5, -95, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
MainFrame.Active           = true
MainFrame.Draggable        = true
MainFrame.Parent           = ScreenGui
Instance.new('UICorner', MainFrame)
Instance.new('UIStroke',  MainFrame).Color = Color3.fromRGB(60, 40, 150)

local Title = Instance.new('TextLabel', MainFrame)
Title.Size                   = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text                   = 'Gru_tegk Lua'
Title.TextColor3             = Color3.fromRGB(220, 220, 255)
Title.Font                   = Enum.Font.GothamBold
Title.TextSize               = 16

local Status = Instance.new('TextLabel', MainFrame)
Status.Size                   = UDim2.new(1, 0, 0, 18)
Status.Position               = UDim2.new(0, 0, 0, 30)
Status.BackgroundTransparency = 1
Status.Text                   = 'STATUS: OFF'
Status.TextColor3             = Color3.fromRGB(150, 150, 150)
Status.TextSize               = 11
Status.Font                   = Enum.Font.GothamMedium

local Yread = Instance.new('TextLabel', MainFrame)
Yread.Size                   = UDim2.new(1, 0, 0, 14)
Yread.Position               = UDim2.new(0, 0, 0, 48)
Yread.BackgroundTransparency = 1
Yread.Text                   = 'Y: 0'
Yread.TextColor3             = Color3.fromRGB(0, 255, 180)
Yread.TextSize               = 11
Yread.Font                   = Enum.Font.Code

local function makeBtn(text, y)
    local b = Instance.new('TextButton', MainFrame)
    b.Size             = UDim2.new(0, 170, 0, 30)
    b.Position         = UDim2.new(0, 10, 0, y)
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    b.Text             = text
    b.TextColor3       = Color3.fromRGB(255, 255, 255)
    b.Font             = Enum.Font.GothamBold
    b.TextSize         = 13
    Instance.new('UICorner', b)
    return b
end

local orbBtn    = makeBtn('ORBIT',         70)
local vspamBtn  = makeBtn('Void Spam',     104)
local notifyBtn = makeBtn('HIT NOTIFY: ON', 138)
notifyBtn.BackgroundColor3 = Color3.fromRGB(60, 40, 150)

local infoLbl = Instance.new('TextLabel', MainFrame)
infoLbl.Size                   = UDim2.new(1, -20, 0, 30)
infoLbl.Position               = UDim2.new(0, 10, 0, 172)
infoLbl.BackgroundTransparency = 1
infoLbl.Text                   = 'Gru_tegk Lua'
infoLbl.TextColor3             = Color3.fromRGB(180, 180, 220)
infoLbl.Font                   = Enum.Font.GothamMedium
infoLbl.TextSize               = 11
infoLbl.TextWrapped            = true

local linkLbl = Instance.new('TextLabel', MainFrame)
linkLbl.Size                   = UDim2.new(1, -20, 0, 14)
linkLbl.Position               = UDim2.new(0, 10, 0, 206)
linkLbl.BackgroundTransparency = 1
linkLbl.Text                   = 'Gru_tegk'
linkLbl.TextColor3             = Color3.fromRGB(88, 180, 255)
linkLbl.Font                   = Enum.Font.Code
linkLbl.TextSize               = 10

local credit = Instance.new('TextLabel', MainFrame)
credit.Size                   = UDim2.new(1, -20, 0, 14)
credit.Position               = UDim2.new(0, 10, 0, 226)
credit.BackgroundTransparency = 1
credit.Text                   = 'Gru_tegk Lua'
credit.TextColor3             = Color3.fromRGB(120, 120, 160)
credit.Font                   = Enum.Font.Gotham
credit.TextSize               = 10

local function updateStatus()
    local parts = {}
    if orbActive    then table.insert(parts, "ORB")    end
    if vspamActive  then table.insert(parts, "Void Spam")  end
    if notifyActive then table.insert(parts, "NTFY")   end
    Status.Text       = (#parts > 0) and ("STATUS: " .. table.concat(parts, "+")) or "STATUS: OFF"
    Status.TextColor3 = (#parts > 0) and Color3.fromRGB(100, 255, 150) or Color3.fromRGB(150, 150, 150)
end

----------------------------------------------------------------
-- NOTIFY HOLDER
----------------------------------------------------------------
local NotifyHolder = Instance.new('Frame', ScreenGui)
NotifyHolder.Name                   = 'NotifyHolder'
NotifyHolder.Size                   = UDim2.new(0, 300, 1, 0)
NotifyHolder.Position               = UDim2.new(1, -320, 0, 0)
NotifyHolder.BackgroundTransparency = 1

local function repositionNotifications()
    for i, frame in ipairs(notifyQueue) do
        local targetPosY = 80 + (i - 1) * 70
        TweenService:Create(frame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, targetPosY)
        }):Play()
    end
end

local function pushNotification(playerName, damage, partName)
    local frame = Instance.new('Frame', NotifyHolder)
    frame.Size                   = UDim2.new(0, 290, 0, 60)
    frame.Position               = UDim2.new(1, 320, 0, 80)
    frame.BackgroundColor3       = Color3.fromRGB(15, 15, 22)
    frame.BorderSizePixel        = 0
    Instance.new('UICorner', frame)
    local stroke = Instance.new('UIStroke', frame)
    stroke.Color = Color3.fromRGB(120, 60, 200)
    stroke.Thickness = 1.5

    local accent = Instance.new('Frame', frame)
    accent.Size               = UDim2.new(0, 4, 1, 0)
    accent.BackgroundColor3   = Color3.fromRGB(255, 80, 80)
    accent.BorderSizePixel    = 0
    Instance.new('UICorner', accent)

    local hitLbl = Instance.new('TextLabel', frame)
    hitLbl.Size                   = UDim2.new(1, -15, 0, 18)
    hitLbl.Position               = UDim2.new(0, 12, 0, 4)
    hitLbl.BackgroundTransparency = 1
    hitLbl.Text                   = "HIT DETECTED"
    hitLbl.TextColor3             = Color3.fromRGB(255, 100, 100)
    hitLbl.Font                   = Enum.Font.GothamBold
    hitLbl.TextSize               = 13
    hitLbl.TextXAlignment         = Enum.TextXAlignment.Left

    local nameLbl = Instance.new('TextLabel', frame)
    nameLbl.Size                   = UDim2.new(1, -15, 0, 14)
    nameLbl.Position               = UDim2.new(0, 12, 0, 22)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text                   = "Target: " .. playerName
    nameLbl.TextColor3             = Color3.fromRGB(220, 220, 255)
    nameLbl.Font                   = Enum.Font.GothamMedium
    nameLbl.TextSize               = 12
    nameLbl.TextXAlignment         = Enum.TextXAlignment.Left

    local dmgLbl = Instance.new('TextLabel', frame)
    dmgLbl.Size                   = UDim2.new(0.5, -10, 0, 14)
    dmgLbl.Position               = UDim2.new(0, 12, 0, 38)
    dmgLbl.BackgroundTransparency = 1
    dmgLbl.Text                   = "DMG: " .. string.format("%.1f", damage)
    dmgLbl.TextColor3             = Color3.fromRGB(255, 200, 80)
    dmgLbl.Font                   = Enum.Font.Code
    dmgLbl.TextSize               = 12
    dmgLbl.TextXAlignment         = Enum.TextXAlignment.Left

    local partLbl = Instance.new('TextLabel', frame)
    partLbl.Size                   = UDim2.new(0.5, -10, 0, 14)
    partLbl.Position               = UDim2.new(0.5, 0, 0, 38)
    partLbl.BackgroundTransparency = 1
    partLbl.Text                   = "Part: " .. partName
    partLbl.TextColor3             = Color3.fromRGB(120, 220, 255)
    partLbl.Font                   = Enum.Font.Code
    partLbl.TextSize               = 12
    partLbl.TextXAlignment         = Enum.TextXAlignment.Left

    table.insert(notifyQueue, 1, frame)
    repositionNotifications()

    TweenService:Create(frame, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 80)
    }):Play()

    task.delay(3.5, function()
        if not frame.Parent then return end
        local fade = TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
            Position = UDim2.new(1, 320, 0, frame.Position.Y.Offset),
            BackgroundTransparency = 1
        })
        fade:Play()
        for _, child in ipairs(frame:GetDescendants()) do
            if child:IsA("TextLabel") then
                TweenService:Create(child, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
            elseif child:IsA("UIStroke") then
                TweenService:Create(child, TweenInfo.new(0.4), {Transparency = 1}):Play()
            elseif child:IsA("Frame") then
                TweenService:Create(child, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
            end
        end
        fade.Completed:Connect(function()
            for i, f in ipairs(notifyQueue) do
                if f == frame then
                    table.remove(notifyQueue, i)
                    break
                end
            end
            frame:Destroy()
            repositionNotifications()
        end)
    end)
end

----------------------------------------------------------------
-- HIT DETECTION
----------------------------------------------------------------
local function findHitPart(character)
    local commonParts = {"Head", "Torso", "UpperTorso", "LowerTorso", "HumanoidRootPart",
                          "LeftArm", "RightArm", "LeftLeg", "RightLeg",
                          "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm",
                          "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg",
                          "LeftHand", "RightHand", "LeftFoot", "RightFoot"}

    local bestPart, bestVel = nil, -1
    for _, name in ipairs(commonParts) do
        local p = character:FindFirstChild(name)
        if p and p:IsA("BasePart") then
            local v = p.AssemblyLinearVelocity.Magnitude
            if v > bestVel then
                bestVel = v
                bestPart = p
            end
        end
    end
    if bestPart then return bestPart.Name end
    return "Unknown"
end

local function hookPlayerHealth(player)
    if player == LocalPlayer then return end
    if hitConns[player] then return end

    local function bindCharacter(character)
        local humanoid = character:WaitForChild("Humanoid", 5)
        if not humanoid then return end

        lastHealthMap[player] = humanoid.Health

        local conn = humanoid.HealthChanged:Connect(function(newHealth)
            local prev = lastHealthMap[player] or humanoid.MaxHealth
            local diff = prev - newHealth
            lastHealthMap[player] = newHealth

            if diff > 0.05 and notifyActive and not isSameTeam(player) then
                local partName = findHitPart(character)
                pushNotification(player.Name, diff, partName)
            end
        end)

        hitConns[player] = conn

        humanoid.Died:Connect(function()
            lastHealthMap[player] = 0
        end)
    end

    if player.Character then bindCharacter(player.Character) end
    player.CharacterAdded:Connect(function(c)
        if hitConns[player] then
            pcall(function() hitConns[player]:Disconnect() end)
            hitConns[player] = nil
        end
        task.wait(0.3)
        bindCharacter(c)
    end)
end

for _, p in ipairs(Players:GetPlayers()) do
    task.spawn(hookPlayerHealth, p)
end
Players.PlayerAdded:Connect(hookPlayerHealth)
Players.PlayerRemoving:Connect(function(p)
    if hitConns[p] then
        pcall(function() hitConns[p]:Disconnect() end)
        hitConns[p] = nil
    end
    lastHealthMap[p] = nil
end)

----------------------------------------------------------------
-- RGB title pulse
----------------------------------------------------------------
task.spawn(function()
    local h = 0
    while true do
        if vspamRgbOn then
            h = (h + 0.008) % 1
            Title.TextColor3 = Color3.fromHSV(h, 1, 1)
        else
            Title.TextColor3 = Color3.fromRGB(220, 220, 255)
        end
        task.wait()
    end
end)

----------------------------------------------------------------
-- Y readout
----------------------------------------------------------------
task.spawn(function()
    while true do
        if vspamActive then
            vspamFakeY      = vspamFakeY + math.random(5000, 15000)
            vspamCurrentVal = vspamCurrentVal + (vspamFakeY - vspamCurrentVal) * 0.1
            Yread.Text     = "Y: " .. math.floor(vspamCurrentVal)
        else
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                Yread.Text = "Y: " .. math.floor(hrp.Position.Y)
            end
        end
        task.wait(0.08)
    end
end)

----------------------------------------------------------------
-- TOGGLE MENU
----------------------------------------------------------------
toggleBtn.MouseButton1Click:Connect(function()
    menuVisible       = not menuVisible
    MainFrame.Visible = menuVisible
end)

----------------------------------------------------------------
-- ORBIT — FASTER (0.18 -> 0.45 angular speed, tighter radius)
----------------------------------------------------------------
orbBtn.Activated:Connect(function()
    orbActive               = not orbActive
    orbBtn.BackgroundColor3 = orbActive and Color3.fromRGB(60, 40, 150) or Color3.fromRGB(35, 35, 55)
    if orbActive then
        orbConn = RunService.Heartbeat:Connect(function(dt)
            local target = getClosest()
            if target and not isSameTeam(target) and target.Character and orbActive then
                local hrp = target.Character:FindFirstChild("HumanoidRootPart")
                local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp and myHRP then
                    -- MUCH faster orbit + framerate-independent
                    angle = angle + 0.85 * (dt * 60) -- ~3x previous speed, dt-normalized
                    local radius = 5 -- tighter orbit for faster apparent rotation
                    pcall(function()
                        myHRP.CFrame = CFrame.new(
                            hrp.Position + Vector3.new(math.cos(angle) * radius, 3, math.sin(angle) * radius),
                            hrp.Position
                        )
                        myHRP.AssemblyLinearVelocity = Vector3.zero
                    end)
                end
            end
        end)
    else
        if orbConn then orbConn:Disconnect() orbConn = nil end
    end
    updateStatus()
end)

----------------------------------------------------------------
-- VOID SPAM V2 — bigger range, faster spam, multi-axis chaos
----------------------------------------------------------------
vspamBtn.Activated:Connect(function()
    local hrp = getHRP()
    vspamActive               = not vspamActive
    vspamBtn.BackgroundColor3 = vspamActive and Color3.fromRGB(60, 40, 150) or Color3.fromRGB(35, 35, 55)

    if vspamActive then
        vspamRgbOn   = true
        vspamLastPos = hrp.CFrame
        vspamFakeY   = -21827262828
        vspamPhase   = 0

        task.spawn(function()
            while vspamActive do
                local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if h then
                    -- BIGGER safe range — still within Roblox limits but much farther
                    -- Roblox CFrame breaks ~16M, we stay safely under at 2M
                    local minV = 500000     -- 500k
                    local maxV = 2000000    -- 2M (4x farther than before)

                    vspamPhase = vspamPhase + 1

                    local rx = math.random(minV, maxV)
                    local ry = math.random(minV, maxV)
                    local rz = math.random(minV, maxV)

                    -- Multi-pattern chaos cycle for unpredictability
                    local mode = vspamPhase % 4
                    if mode == 0 then
                        -- All positive
                    elseif mode == 1 then
                        rx = -rx; rz = -rz
                    elseif mode == 2 then
                        ry = -ry
                        rx = -rx
                    else
                        rx = -rx; ry = -ry; rz = -rz
                    end

                    vspamFlip = not vspamFlip

                    pcall(function()
                        h.CFrame                  = CFrame.new(rx, ry, rz)
                        h.AssemblyLinearVelocity  = Vector3.zero
                        h.AssemblyAngularVelocity = Vector3.zero
                    end)
                end
                task.wait(0.06) -- ~2x faster spam (was 0.12-0.15)
            end
        end)
    else
        vspamRgbOn = false
        local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if h then
            pcall(function()
                h.AssemblyLinearVelocity  = Vector3.zero
                h.AssemblyAngularVelocity = Vector3.zero
                if vspamLastPos then
                    h.CFrame = vspamLastPos
                else
                    h.CFrame = CFrame.new(0, 10, 0)
                end
            end)
        end
    end
    updateStatus()
end)

----------------------------------------------------------------
-- HIT NOTIFY TOGGLE
----------------------------------------------------------------
notifyBtn.Activated:Connect(function()
    notifyActive = not notifyActive
    notifyBtn.Text             = "HIT NOTIFY: " .. (notifyActive and "ON" or "OFF")
    notifyBtn.BackgroundColor3 = notifyActive and Color3.fromRGB(60, 40, 150) or Color3.fromRGB(35, 35, 55)
    updateStatus()
end)

----------------------------------------------------------------
-- RESPAWN HANDLER
----------------------------------------------------------------
LocalPlayer.CharacterAdded:Connect(function(c)
    Character = c
    HRP       = c:WaitForChild('HumanoidRootPart')
end)

updateStatus()

----------------------------------------------------------------
-- WELCOME NOTIFICATION
----------------------------------------------------------------
pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title    = "Gru_tegk lua loaded",
        Text     = "Gru_tegk Lua Loaded",
        Duration = 8
    })
end)

print("[Gru_tegk] loaded")
print("[Gru_tegk] Lua active")
