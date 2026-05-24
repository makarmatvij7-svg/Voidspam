
local _junk = 12345; function _junkFunc() return _junk * 9 end
local v1 = v2:v3(v4("return '\\v5\\v6\\v7\\v8\\v9\\v10\\v11'")())
local v12 = v2:v3(v4("return '\\v13\\v14\\v15\\v16\\v9\\v10\\v17\\v18\\v19\\v9'")())
local v20 = v2:v3(v4("return '\\v21\\v22\\v10\\v9\\v23\\v14\\v18'")())
local v24 = v2:v3(v4("return '\\v25\\v11\\v9\\v10\\v26\\v15\\v27\\v14\\v28\\v16\\v9\\v10\\v17\\v18\\v19\\v9'")())
local v29 = v2:v3(v4("return '\\v30\\v31\\v9\\v9\\v15\\v16\\v9\\v10\\v17\\v18\\v19\\v9'")())
local v32 = v2:v3(v4("return '\\v16\\v28\\v7\\v10\\v28\\v9\\v10\\v23\\v14\\v18'")())
local v33 = v1.v33
local v34 = v33.v34 or v33.v35:v36()
local v37 = v34:v38(v4("return '\\v39\\v14\\v40\\v7\\v15\\v22\\v18\\v41\\v13\\v22\\v22\\v28\\v5\\v7\\v10\\v28'")())
local v42 = false
local v43 = false
local v44 = true
local v45 = true
local v46
local v47 = {}
local v48 = 0
local v49 = nil
local v50 = -9999999999999999999999999
local v51 = 9999999999999999999999999
local v52 = true
local v53 = false
local v54 = 0
local v55 = {}
local v56 = {}
local function v57(v58)
if not v58 or v58 == v33 then return true end
if v33.v59 ~= nil and v58.v59 ~= nil and v33.v59 == v58.v59 then
return true
end
if v33.v60 and v58.v60 and v33.v60 == v58.v60 then
if v33.v61 == false and v58.v61 == false then
return true
end
end
return false
end
local function v62()
local v63, v64 = nil, v65.v66
for v67, v58 in v68(v1:v69()) do
if v58 ~= v33 and v58.v34 and v58.v34:v70(v4("return '\\v39\\v14\\v40\\v7\\v15\\v22\\v18\\v41\\v13\\v22\\v22\\v28\\v5\\v7\\v10\\v28'")()) then
if not v57(v58) then
local v71 = (v37.v72 - v58.v34.v73.v72).v74
if v71 < v64 then
v64 = v71
v63 = v58
end
end
end
end
return v63
end
local function v75()
local v76 = v33.v34 or v33.v35:v36()
return v76:v38(v4("return '\\v39\\v14\\v40\\v7\\v15\\v22\\v18\\v41\\v13\\v22\\v22\\v28\\v5\\v7\\v10\\v28'")())
end
for v67, v77 in v68((v78 and v78() or v20):v79()) do
if v77.v80 == v4("return '\\v23\\v10\\v14\\v81\\v28\\v9\\v82\\v83'")() then v77:v84() end
end
v85(function()
for v67, v77 in v68(v33:v38(v4("return '\\v5\\v6\\v7\\v8\\v9\\v10\\v23\\v14\\v18'")()):v79()) do
if v77.v80 == v4("return '\\v23\\v10\\v14\\v81\\v28\\v9\\v82\\v83'")() then v77:v84() end
end
end)
local v86 = v87.v88(v4("return '\\v16\\v19\\v10\\v9\\v9\\v15\\v23\\v14\\v18'")())
v86.v80 = v4("return '\\v23\\v10\\v14\\v81\\v28\\v9\\v82\\v83'")()
v86.v89 = false
v86.v90 = 999999999
v86.v91 = v92.v91.v93
v86.v94 = true
local v95 = false
if not v95 and v96(v78) == v4("return '\\v97\\v14\\v15\\v19\\v28\\v18\\v22\\v15'")() then
local v98 = v85(function() v86.v99 = v78() end)
if v98 then v95 = true end
end
if not v95 then
local v98 = v85(function() v86.v99 = v20 end)
if v98 then v95 = true end
end
if not v95 then
v86.v99 = v33:v38(v4("return '\\v5\\v6\\v7\\v8\\v9\\v10\\v23\\v14\\v18'")())
end
local v100 = v87.v88(v4("return '\\v30\\v9\\v101\\v28\\v102\\v14\\v28\\v28\\v22\\v15'")())
v100.v103 = v104.v88(0, 110, 0, 35)
v100.v72 = v104.v88(0.8, 0, 0.4, 0)
v100.v105 = v106.v107(15, 15, 15)
v100.v108 = v4("return '\\v109\\v27\\v9\\v15\\v110\\v21\\v6\\v22\\v11\\v9\\v111\\v112\\v14\\v7'")()
v100.v113 = v106.v107(255, 255, 255)
v100.v114 = v92.v114.v115
v100.v116 = 14
v100.v117 = true
v100.v99 = v86
v87.v88(v4("return '\\v25\\v26\\v21\\v22\\v10\\v15\\v9\\v10'")(), v100)
v87.v88(v4("return '\\v25\\v26\\v16\\v28\\v10\\v22\\v83\\v9'")(), v100).v118 = v106.v107(60, 40, 150)
local v119 = v87.v88(v4("return '\\v120\\v10\\v7\\v40\\v9'")())
v119.v103 = v104.v88(0, 190, 0, 250)
v119.v72 = v104.v88(0.5, -95, 0.5, -125)
v119.v105 = v106.v107(12, 12, 18)
v119.v121 = true
v119.v117 = true
v119.v99 = v86
v87.v88(v4("return '\\v25\\v26\\v21\\v22\\v10\\v15\\v9\\v10'")(), v119)
v87.v88(v4("return '\\v25\\v26\\v16\\v28\\v10\\v22\\v83\\v9'")(), v119).v118 = v106.v107(60, 40, 150)
local v122 = v87.v88(v4("return '\\v30\\v9\\v101\\v28\\v112\\v7\\v123\\v9\\v6'")(), v119)
v122.v103 = v104.v88(1, 0, 0, 30)
v122.v124 = 1
v122.v108 = v4("return '\\v23\\v10\\v14\\v81\\v28\\v9\\v82\\v83\\v111\\v112\\v14\\v7'")()
v122.v113 = v106.v107(220, 220, 255)
v122.v114 = v92.v114.v115
v122.v116 = 16
local v125 = v87.v88(v4("return '\\v30\\v9\\v101\\v28\\v112\\v7\\v123\\v9\\v6'")(), v119)
v125.v103 = v104.v88(1, 0, 0, 18)
v125.v72 = v104.v88(0, 0, 0, 30)
v125.v124 = 1
v125.v108 = v4("return '\\v16\\v30\\v126\\v30\\v25\\v16\\v127\\v111\\v109\\v120\\v120'")()
v125.v113 = v106.v107(150, 150, 150)
v125.v116 = 11
v125.v114 = v92.v114.v128
local v129 = v87.v88(v4("return '\\v30\\v9\\v101\\v28\\v112\\v7\\v123\\v9\\v6'")(), v119)
v129.v103 = v104.v88(1, 0, 0, 14)
v129.v72 = v104.v88(0, 0, 0, 48)
v129.v124 = 1
v129.v108 = v4("return '\\v130\\v127\\v111\\v131'")()
v129.v113 = v106.v107(0, 255, 180)
v129.v116 = 11
v129.v114 = v92.v114.v132
local function v133(v134, v135)
local v136 = v87.v88(v4("return '\\v30\\v9\\v101\\v28\\v102\\v14\\v28\\v28\\v22\\v15'")(), v119)
v136.v103 = v104.v88(0, 170, 0, 30)
v136.v72 = v104.v88(0, 10, 0, v135)
v136.v105 = v106.v107(35, 35, 55)
v136.v108 = v134
v136.v113 = v106.v107(255, 255, 255)
v136.v114 = v92.v114.v115
v136.v116 = 13
v87.v88(v4("return '\\v25\\v26\\v21\\v22\\v10\\v15\\v9\\v10'")(), v136)
return v136
end
local v137 = v133(v4("return '\\v109\\v13\\v102\\v26\\v30'")(), 70)
local v138 = v133(v4("return '\\v139\\v22\\v18\\v41\\v111\\v16\\v27\\v7\\v40'")(), 104)
local v140 = v133(v4("return '\\v39\\v26\\v30\\v111\\v141\\v109\\v30\\v26\\v120\\v130\\v127\\v111\\v109\\v141'")(), 138)
v140.v105 = v106.v107(60, 40, 150)
local v142 = v87.v88(v4("return '\\v30\\v9\\v101\\v28\\v112\\v7\\v123\\v9\\v6'")(), v119)
v142.v103 = v104.v88(1, -20, 0, 30)
v142.v72 = v104.v88(0, 10, 0, 172)
v142.v124 = 1
v142.v108 = v4("return '\\v23\\v10\\v14\\v81\\v28\\v9\\v82\\v83\\v111\\v112\\v14\\v7'")()
v142.v113 = v106.v107(180, 180, 220)
v142.v114 = v92.v114.v128
v142.v116 = 11
v142.v143 = true
local v144 = v87.v88(v4("return '\\v30\\v9\\v101\\v28\\v112\\v7\\v123\\v9\\v6'")(), v119)
v144.v103 = v104.v88(1, -20, 0, 14)
v144.v72 = v104.v88(0, 10, 0, 206)
v144.v124 = 1
v144.v108 = v4("return '\\v23\\v10\\v14\\v81\\v28\\v9\\v82\\v83'")()
v144.v113 = v106.v107(88, 180, 255)
v144.v114 = v92.v114.v132
v144.v116 = 10
local v145 = v87.v88(v4("return '\\v30\\v9\\v101\\v28\\v112\\v7\\v123\\v9\\v6'")(), v119)
v145.v103 = v104.v88(1, -20, 0, 14)
v145.v72 = v104.v88(0, 10, 0, 226)
v145.v124 = 1
v145.v108 = v4("return '\\v23\\v10\\v14\\v81\\v28\\v9\\v82\\v83\\v111\\v112\\v14\\v7'")()
v145.v113 = v106.v107(120, 120, 160)
v145.v114 = v92.v114.v146
v145.v116 = 10
local function v147()
local v148 = {}
if v42 then v149.v150(v148, v4("return '\\v109\\v13\\v102'")()) end
if v43 then v149.v150(v148, v4("return '\\v139\\v22\\v18\\v41\\v111\\v16\\v27\\v7\\v40'")()) end
if v44 then v149.v150(v148, v4("return '\\v141\\v30\\v120\\v130'")()) end
v125.v108 = (#v148 > 0) and (v4("return '\\v16\\v30\\v126\\v30\\v25\\v16\\v127\\v111'")() .. v149.v151(v148, v4("return '\\v152'")())) or v4("return '\\v16\\v30\\v126\\v30\\v25\\v16\\v127\\v111\\v109\\v120\\v120'")()
v125.v113 = (#v148 > 0) and v106.v107(100, 255, 150) or v106.v107(150, 150, 150)
end
local v153 = v87.v88(v4("return '\\v120\\v10\\v7\\v40\\v9'")(), v86)
v153.v80 = v4("return '\\v141\\v22\\v28\\v18\\v97\\v8\\v39\\v22\\v6\\v41\\v9\\v10'")()
v153.v103 = v104.v88(0, 300, 1, 0)
v153.v72 = v104.v88(1, -320, 0, 0)
v153.v124 = 1
local function v154()
for v155, v156 in v68(v56) do
local v157 = 80 + (v155 - 1) * 70
v29:v158(v156, v159.v88(0.25, v92.v160.v161, v92.v162.v163), {
v72 = v104.v88(0, 0, 0, v157)
}):v164()
end
end
local function v165(v166, v167, v168)
local v156 = v87.v88(v4("return '\\v120\\v10\\v7\\v40\\v9'")(), v153)
v156.v103 = v104.v88(0, 290, 0, 60)
v156.v72 = v104.v88(1, 320, 0, 80)
v156.v105 = v106.v107(15, 15, 22)
v156.v169 = 0
v87.v88(v4("return '\\v25\\v26\\v21\\v22\\v10\\v15\\v9\\v10'")(), v156)
local v170 = v87.v88(v4("return '\\v25\\v26\\v16\\v28\\v10\\v22\\v83\\v9'")(), v156)
v170.v118 = v106.v107(120, 60, 200)
v170.v171 = 1.5
local v172 = v87.v88(v4("return '\\v120\\v10\\v7\\v40\\v9'")(), v156)
v172.v103 = v104.v88(0, 4, 1, 0)
v172.v105 = v106.v107(255, 80, 80)
v172.v169 = 0
v87.v88(v4("return '\\v25\\v26\\v21\\v22\\v10\\v15\\v9\\v10'")(), v172)
local v173 = v87.v88(v4("return '\\v30\\v9\\v101\\v28\\v112\\v7\\v123\\v9\\v6'")(), v156)
v173.v103 = v104.v88(1, -15, 0, 18)
v173.v72 = v104.v88(0, 12, 0, 4)
v173.v124 = 1
v173.v108 = v4("return '\\v39\\v26\\v30\\v111\\v174\\v175\\v30\\v175\\v21\\v30\\v175\\v174'")()
v173.v113 = v106.v107(255, 100, 100)
v173.v114 = v92.v114.v115
v173.v116 = 13
v173.v176 = v92.v176.v177
local v178 = v87.v88(v4("return '\\v30\\v9\\v101\\v28\\v112\\v7\\v123\\v9\\v6'")(), v156)
v178.v103 = v104.v88(1, -15, 0, 14)
v178.v72 = v104.v88(0, 12, 0, 22)
v178.v124 = 1
v178.v108 = v4("return '\\v30\\v7\\v10\\v82\\v9\\v28\\v127\\v111'")() .. v166
v178.v113 = v106.v107(220, 220, 255)
v178.v114 = v92.v114.v128
v178.v116 = 12
v178.v176 = v92.v176.v177
local v179 = v87.v88(v4("return '\\v30\\v9\\v101\\v28\\v112\\v7\\v123\\v9\\v6'")(), v156)
v179.v103 = v104.v88(0.5, -10, 0, 14)
v179.v72 = v104.v88(0, 12, 0, 38)
v179.v124 = 1
v179.v108 = v4("return '\\v174\\v180\\v23\\v127\\v111'")() .. v181.v182(v4("return '\\v183\\v184\\v185\\v97'")(), v167)
v179.v113 = v106.v107(255, 200, 80)
v179.v114 = v92.v114.v132
v179.v116 = 12
v179.v176 = v92.v176.v177
local v186 = v87.v88(v4("return '\\v30\\v9\\v101\\v28\\v112\\v7\\v123\\v9\\v6'")(), v156)
v186.v103 = v104.v88(0.5, -10, 0, 14)
v186.v72 = v104.v88(0.5, 0, 0, 38)
v186.v124 = 1
v186.v108 = v4("return '\\v5\\v7\\v10\\v28\\v127\\v111'")() .. v168
v186.v113 = v106.v107(120, 220, 255)
v186.v114 = v92.v114.v132
v186.v116 = 12
v186.v176 = v92.v176.v177
v149.v150(v56, 1, v156)
v154()
v29:v158(v156, v159.v88(0.35, v92.v160.v187, v92.v162.v163), {
v72 = v104.v88(0, 0, 0, 80)
}):v164()
v188.v189(3.5, function()
if not v156.v99 then return end
local v190 = v29:v158(v156, v159.v88(0.4, v92.v160.v161), {
v72 = v104.v88(1, 320, 0, v156.v72.v191.v192),
v124 = 1
})
v190:v164()
for v67, v193 in v68(v156:v194()) do
if v193:v195(v4("return '\\v30\\v9\\v101\\v28\\v112\\v7\\v123\\v9\\v6'")()) then
v29:v158(v193, v159.v88(0.4), {v196 = 1}):v164()
elseif v193:v195(v4("return '\\v25\\v26\\v16\\v28\\v10\\v22\\v83\\v9'")()) then
v29:v158(v193, v159.v88(0.4), {v197 = 1}):v164()
elseif v193:v195(v4("return '\\v120\\v10\\v7\\v40\\v9'")()) then
v29:v158(v193, v159.v88(0.4), {v124 = 1}):v164()
end
end
v190.v198:v199(function()
for v155, v200 in v68(v56) do
if v200 == v156 then
v149.v201(v56, v155)
break
end
end
v156:v84()
v154()
end)
end)
end
local function v202(v203)
local v204 = {v4("return '\\v39\\v9\\v7\\v41'")(), v4("return '\\v30\\v22\\v10\\v11\\v22'")(), v4("return '\\v25\\v27\\v27\\v9\\v10\\v30\\v22\\v10\\v11\\v22'")(), v4("return '\\v112\\v22\\v31\\v9\\v10\\v30\\v22\\v10\\v11\\v22'")(), v4("return '\\v39\\v14\\v40\\v7\\v15\\v22\\v18\\v41\\v13\\v22\\v22\\v28\\v5\\v7\\v10\\v28'")(),
v4("return '\\v112\\v9\\v97\\v28\\v126\\v10\\v40'")(), v4("return '\\v13\\v18\\v82\\v205\\v28\\v126\\v10\\v40'")(), v4("return '\\v112\\v9\\v97\\v28\\v112\\v9\\v82'")(), v4("return '\\v13\\v18\\v82\\v205\\v28\\v112\\v9\\v82'")(),
v4("return '\\v112\\v9\\v97\\v28\\v25\\v27\\v27\\v9\\v10\\v126\\v10\\v40'")(), v4("return '\\v13\\v18\\v82\\v205\\v28\\v25\\v27\\v27\\v9\\v10\\v126\\v10\\v40'")(), v4("return '\\v112\\v9\\v97\\v28\\v112\\v22\\v31\\v9\\v10\\v126\\v10\\v40'")(), v4("return '\\v13\\v18\\v82\\v205\\v28\\v112\\v22\\v31\\v9\\v10\\v126\\v10\\v40'")(),
v4("return '\\v112\\v9\\v97\\v28\\v25\\v27\\v27\\v9\\v10\\v112\\v9\\v82'")(), v4("return '\\v13\\v18\\v82\\v205\\v28\\v25\\v27\\v27\\v9\\v10\\v112\\v9\\v82'")(), v4("return '\\v112\\v9\\v97\\v28\\v112\\v22\\v31\\v9\\v10\\v112\\v9\\v82'")(), v4("return '\\v13\\v18\\v82\\v205\\v28\\v112\\v22\\v31\\v9\\v10\\v112\\v9\\v82'")(),
v4("return '\\v112\\v9\\v97\\v28\\v39\\v7\\v15\\v41'")(), v4("return '\\v13\\v18\\v82\\v205\\v28\\v39\\v7\\v15\\v41'")(), v4("return '\\v112\\v9\\v97\\v28\\v120\\v22\\v22\\v28'")(), v4("return '\\v13\\v18\\v82\\v205\\v28\\v120\\v22\\v22\\v28'")()}
local v206, v207 = nil, -1
for v67, v208 in v68(v204) do
local v58 = v203:v70(v208)
if v58 and v58:v195(v4("return '\\v102\\v7\\v11\\v9\\v5\\v7\\v10\\v28'")()) then
local v209 = v58.v210.v74
if v209 > v207 then
v207 = v209
v206 = v58
end
end
end
if v206 then return v206.v80 end
return v4("return '\\v25\\v15\\v83\\v15\\v22\\v31\\v15'")()
end
local function v211(v212)
if v212 == v33 then return end
if v47[v212] then return end
local function v213(v203)
local v214 = v203:v38(v4("return '\\v39\\v14\\v40\\v7\\v15\\v22\\v18\\v41'")(), 5)
if not v214 then return end
v55[v212] = v214.v215
local v216 = v214.v217:v199(function(v218)
local v219 = v55[v212] or v214.v220
local v221 = v219 - v218
v55[v212] = v218
if v221 > 0.05 and v44 and not v57(v212) then
local v168 = v202(v203)
v165(v212.v80, v221, v168)
end
end)
v47[v212] = v216
v214.v222:v199(function()
v55[v212] = 0
end)
end
if v212.v34 then v213(v212.v34) end
v212.v35:v199(function(v76)
if v47[v212] then
v85(function() v47[v212]:v223() end)
v47[v212] = nil
end
v188.v224(0.3)
v213(v76)
end)
end
for v67, v58 in v68(v1:v69()) do
v188.v225(v211, v58)
end
v1.v226:v199(v211)
v1.v227:v199(function(v58)
if v47[v58] then
v85(function() v47[v58]:v223() end)
v47[v58] = nil
end
v55[v58] = nil
end)
v188.v225(function()
local v228 = 0
while true do
if v53 then
v228 = (v228 + 0.008) % 1
v122.v113 = v106.v229(v228, 1, 1)
else
v122.v113 = v106.v107(220, 220, 255)
end
v188.v224()
end
end)
v188.v225(function()
while true do
if v43 then
v50 = v50 + v65.v230(5000, 15000)
v51 = v51 + (v50 - v51) * 0.1
v129.v108 = v4("return '\\v130\\v127\\v111'")() .. v65.v231(v51)
else
local v232 = v33.v34 and v33.v34:v70(v4("return '\\v39\\v14\\v40\\v7\\v15\\v22\\v18\\v41\\v13\\v22\\v22\\v28\\v5\\v7\\v10\\v28'")())
if v232 then
v129.v108 = v4("return '\\v130\\v127\\v111'")() .. v65.v231(v232.v72.v191)
end
end
v188.v224(0.08)
end
end)
v100.v233:v199(function()
v45 = not v45
v119.v234 = v45
end)
v137.v235:v199(function()
v42 = not v42
v137.v105 = v42 and v106.v107(60, 40, 150) or v106.v107(35, 35, 55)
if v42 then
v46 = v12.v236:v199(function(v237)
local v238 = v62()
if v238 and not v57(v238) and v238.v34 and v42 then
local v232 = v238.v34:v70(v4("return '\\v39\\v14\\v40\\v7\\v15\\v22\\v18\\v41\\v13\\v22\\v22\\v28\\v5\\v7\\v10\\v28'")())
local v239 = v33.v34 and v33.v34:v70(v4("return '\\v39\\v14\\v40\\v7\\v15\\v22\\v18\\v41\\v13\\v22\\v22\\v28\\v5\\v7\\v10\\v28'")())
if v232 and v239 then
v48 = v48 + 0.85 * (v237 * 60)
local v240 = 5
v85(function()
v239.v241 = v241.v88(
v232.v72 + v242.v88(v65.v243(v48) * v240, 3, v65.v244(v48) * v240),
v232.v72
)
v239.v210 = v242.v245
end)
end
end
end)
else
if v46 then v46:v223() v46 = nil end
end
v147()
end)
v138.v235:v199(function()
local v232 = v75()
v43 = not v43
v138.v105 = v43 and v106.v107(60, 40, 150) or v106.v107(35, 35, 55)
if v43 then
v53 = true
v49 = v232.v241
v50 = -21827262828
v54 = 0
v188.v225(function()
while v43 do
local v228 = v33.v34 and v33.v34:v70(v4("return '\\v39\\v14\\v40\\v7\\v15\\v22\\v18\\v41\\v13\\v22\\v22\\v28\\v5\\v7\\v10\\v28'")())
if v228 then
local v246 = 500000
local v247 = 2000000
v54 = v54 + 1
local v248 = v65.v230(v246, v247)
local v249 = v65.v230(v246, v247)
local v250 = v65.v230(v246, v247)
local v251 = v54 % 4
if v251 == 0 then
elseif v251 == 1 then
v248 = -v248; v250 = -v250
elseif v251 == 2 then
v249 = -v249
v248 = -v248
else
v248 = -v248; v249 = -v249; v250 = -v250
end
v52 = not v52
v85(function()
v228.v241 = v241.v88(v248, v249, v250)
v228.v210 = v242.v245
v228.v252 = v242.v245
end)
end
v188.v224(0.06)
end
end)
else
v53 = false
local v228 = v33.v34 and v33.v34:v70(v4("return '\\v39\\v14\\v40\\v7\\v15\\v22\\v18\\v41\\v13\\v22\\v22\\v28\\v5\\v7\\v10\\v28'")())
if v228 then
v85(function()
v228.v210 = v242.v245
v228.v252 = v242.v245
if v49 then
v228.v241 = v49
else
v228.v241 = v241.v88(0, 10, 0)
end
end)
end
end
v147()
end)
v140.v235:v199(function()
v44 = not v44
v140.v108 = v4("return '\\v39\\v26\\v30\\v111\\v141\\v109\\v30\\v26\\v120\\v130\\v127\\v111'")() .. (v44 and v4("return '\\v109\\v141'")() or v4("return '\\v109\\v120\\v120'")())
v140.v105 = v44 and v106.v107(60, 40, 150) or v106.v107(35, 35, 55)
v147()
end)
v33.v35:v199(function(v76)
v34 = v76
v37 = v76:v38(v4("return '\\v39\\v14\\v40\\v7\\v15\\v22\\v18\\v41\\v13\\v22\\v22\\v28\\v5\\v7\\v10\\v28'")())
end)
v147()
v85(function()
v32:v253(v4("return '\\v16\\v9\\v15\\v41\\v141\\v22\\v28\\v18\\v97\\v18\\v19\\v7\\v28\\v18\\v22\\v15'")(), {
v122 = v4("return '\\v23\\v10\\v14\\v81\\v28\\v9\\v82\\v83\\v111\\v6\\v14\\v7\\v111\\v6\\v22\\v7\\v41\\v9\\v41'")(),
v108 = v4("return '\\v23\\v10\\v14\\v81\\v28\\v9\\v82\\v83\\v111\\v112\\v14\\v7\\v111\\v112\\v22\\v7\\v41\\v9\\v41'")(),
v254 = 8
})
end)
v255(v4("return '\\v256\\v23\\v10\\v14\\v81\\v28\\v9\\v82\\v83\\v257\\v111\\v6\\v22\\v7\\v41\\v9\\v41'")())
v255(v4("return '\\v256\\v23\\v10\\v14\\v81\\v28\\v9\\v82\\v83\\v257\\v111\\v112\\v14\\v7\\v111\\v7\\v19\\v28\\v18\\v17\\v9'")())
