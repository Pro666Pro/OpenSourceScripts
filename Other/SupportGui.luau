pcall(function()
local a = Instance.new("Hint")
a.Text = "Support Gui Loading..."
a.Name = "HintGui"
a.Parent = game.CoreGui
end)
pcall(function()
getgenv().gethui = function() return game:GetService("CoreGui") end
gethui = function() return game:GetService("CoreGui") end
end)
pcall(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/BypassAntiCheat/main/main.lua'))()
end)
local success, error = pcall(function()
Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)
if success then
print("Loaded New Rayfield")
Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
elseif not success then
print("Loaded Old Rayfield")
Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()
end

Window = Rayfield:CreateWindow({
   Name = "Support Gui - nexer scripts",
   Icon = 0,    
   LoadingTitle = "Support Gui",
   LoadingSubtitle = "by nexer",
   Theme = "Amethyst",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = "SlapFarmGui",
      FileName = "SlapFarmGuiConfiguration"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Verify yourself firstly!",
      Subtitle = "Key Needed!",
      Note = "The key is ''cheese''",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"cheese"}
   }
})


function Notify(title, content, time, mode)
time = time or 10
mode = mode or false
if mode == true then
img = 136186846844342
elseif mode == false then
img = 71508738660632
end
Rayfield:Notify({
	Title = title,
	Content = content,
	Duration = time,
	Image = img,
	Actions = {},
})
end

local Main = Window:CreateTab("Main", 98952570395426)
local Other = Window:CreateTab("Other", 12809025337)

local ScriptLabel = Main:CreateLabel("Choose script here!")
_G.Script = "Unknown"
local ScriptDropdown = Main:CreateDropdown({
   Name = "Choose Version",
   Options = {"Ultimate Badge Hub","Slap Farm Gui","Mastery Farm Gui"},
   CurrentOption = "Unknown",
   MultiSelection = false,
   Callback = function(Option)
_G.Script = Option
Notify("Success", "".._G.Script.." choosen!", 10, true)
   end,
})

local CategoryLabel = Main:CreateLabel("Choose category here!")
_G.MessageType = "Unknown"
local CategoryDropdown = Main:CreateDropdown({
   Name = "Choose Category",
   Options = {"Bug Report","Suggestion"},
   CurrentOption = "Unknown",
   MultiSelection = false,
   Callback = function(Option)
_G.MessageType = Option
Notify("Success", "".._G.MessageType.." choosen!", 10, true)
   end,
})

local MessageLabel = Main:CreateLabel("Write message here!")
_G.Message = "Unknown"
local MessageTextbox = Main:CreateInput({
   Name = "Write Message",
   PlaceholderText = "Input...",
   NumbersOnly = false,
   OnEnter = true,
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
_G.Message = Text
Notify("Success", "Message written!", 10, true)
   end,
})

_G.ArleadyBeingSent = false
local MainButton = Main:CreateButton({
   Name = "Send Message",
   Callback = function()
if _G.ArleadyBeingSent ~= true then
_G.ArleadyBeingSent = true
local success, error = pcall(function()
Notify("Success", "Sending message...", 10, true)

--[[
please do not nuke my webhook, i did nothing wrong 🥺

Which things this webhook logs?
It only logs:
Your device ( need to fix bugs )
Your ping ( also need to fix bugs )
Your executor ( this also need to fix bugs )
Your username and userid ( for feedback )
That's all! So please don't nuke it 😽
]]--

local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then local v82=0;while true do if (v82==0) then v19=v0(v3(v30,1,1));return "";end end else local v83=v2(v0(v30,16));if v19 then local v89=v5(v83,v19);v19=nil;return v89;else return v83;end end end);local function v20(v31,v32,v33) if v33 then local v84=0 -0 ;local v85;while true do if (v84==0) then v85=(v31/((879 -(282 + 595))^(v32-(2 -1))))%(2^(((v33-(1 -0)) -(v32-(2 -1))) + (620 -(555 + 64)))) ;return v85-(v85%(932 -(857 + 74))) ;end end else local v86=(570 -(367 + 201))^(v32-(928 -(214 + 713))) ;return (((v31%(v86 + v86))>=v86) and (1 + (1637 -(1523 + 114)))) or (0 + 0) ;end end local function v21() local v34=0 + 0 ;local v35;while true do if (v34==(1 -0)) then return v35;end if (v34==(1065 -(68 + 997))) then v35=v1(v16,v18,v18);v18=v18 + (1271 -((343 -(32 + 85)) + 1044)) ;v34=4 -3 ;end end end local function v22() local v36,v37=v1(v16,v18,v18 + 2 + 0 );v18=v18 + 1 + 1 ;return (v37 * (1213 -(892 + 65))) + v36 ;end local function v23() local v38,v39,v40,v41=v1(v16,v18,v18 + ((187 -(67 + 113)) -(3 + 1)) );v18=v18 + 4 ;return (v41 * ((76138599 -45126987) -14234396)) + (v40 * (120312 -54776)) + (v39 * (606 -(87 + 263))) + v38 ;end local function v24() local v42=0 + 0 ;local v43;local v44;local v45;local v46;local v47;local v48;while true do if (v42==(3 -2)) then v45=(1383 -(44 + 386)) -(802 + 150) ;v46=(v20(v44,1487 -(998 + 488) ,53 -33 ) * (((1 + 2) -1)^32)) + v43 ;v42=2 + 0 ;end if (v42==(1000 -(915 + 82))) then if (v47==(0 -0)) then if (v46==(0 + (0 -0))) then return v48 * 0 ;else v47=1 -0 ;v45=1187 -(628 + 441 + 118) ;end elseif (v47==(4643 -2596)) then return ((v46==(0 -0)) and (v48 * ((1 -0)/(0 + 0)))) or (v48 * NaN) ;end return v8(v48,v47-(1817 -(2819 -2025)) ) * (v45 + (v46/((2 + 0)^(843 -(368 + (1282 -(814 + 45))))))) ;end if (v42==2) then v47=v20(v44,(160 -95) -(3 + 41) ,31);v48=((v20(v44,50 -(10 + 8) )==((3 + 0) -2)) and  -(443 -(416 + 26))) or (3 -2) ;v42=2 + (773 -(201 + 571)) ;end if (v42==(0 -0)) then v43=v23();v44=v23();v42=439 -(145 + 293) ;end end end local function v25(v49) local v50=1423 -(630 + 793) ;local v51;local v52;while true do if (v50==(3 -2)) then v51=v3(v16,v18,(v18 + v49) -(4 -(1 + 2)) );v18=v18 + v49 ;v50=1 + 1 ;end if (v50==(2 + 1)) then return v6(v52);end if (v50==(887 -(261 + 624))) then v52={};for v90=1914 -(1789 + 124) , #v51 do v52[v90]=v2(v1(v3(v51,v90,v90)));end v50=769 -(745 + 21) ;end if (v50==((0 + 0) -0)) then v51=nil;if  not v49 then v49=v23();if (v49==(0 -(1055 -(87 + 968)))) then return "";end end v50=1081 -(1020 + 60) ;end end end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v53=(function() return 1551 -(226 + 1325) ;end)();local v54=(function() return;end)();local v55=(function() return;end)();local v56=(function() return;end)();local v57=(function() return;end)();local v58=(function() return;end)();local v59=(function() return;end)();local v60=(function() return;end)();while true do local v67=(function() return 0 + 0 ;end)();while true do if (v67==(1 + 0)) then if (v53==3) then for v100= #"~",v23() do local v101=(function() return v21();end)();if (v20(v101, #" ", #":")==0) then local v103=(function() return 0 + 0 ;end)();local v104=(function() return;end)();local v105=(function() return;end)();local v106=(function() return;end)();while true do if (v103==(2 + 1)) then if (v20(v105, #"91(", #"asd")~= #"[") then else v106[ #"0313"]=(function() return v60[v106[ #".com"]];end)();end v55[v100]=(function() return v106;end)();break;end if ((3 -1)==v103) then if (v20(v105, #"[", #"{")~= #"/") then else v106[2]=(function() return v60[v106[1 + 1 ]];end)();end if (v20(v105,2 -0 ,1 + 1 )== #"}") then v106[ #"xnx"]=(function() return v60[v106[ #"91("]];end)();end v103=(function() return 1639 -(1373 + 263) ;end)();end if (v103==1) then v106=(function() return {v22(),v22(),nil,nil};end)();if (v104==0) then local v122=(function() return 0 + 0 ;end)();local v123=(function() return;end)();while true do if ((0 -0)==v122) then v123=(function() return 0 -0 ;end)();while true do if ((1384 -(746 + 638))==v123) then v106[ #"19("]=(function() return v22();end)();v106[ #"http"]=(function() return v22();end)();break;end end break;end end elseif (v104== #"}") then v106[ #"-19"]=(function() return v23();end)();elseif (v104==(1324 -(1249 + 73))) then v106[ #"gha"]=(function() return v23() -((1 + 1)^(7 + 9)) ;end)();elseif (v104~= #"asd") then else local v269=(function() return 0 -0 ;end)();local v270=(function() return;end)();while true do if (v269==(1145 -(466 + 679))) then v270=(function() return 341 -(218 + 123) ;end)();while true do if ((1581 -(1535 + 46))==v270) then v106[ #"xnx"]=(function() return v23() -(2^(45 -29)) ;end)();v106[ #"asd1"]=(function() return v22();end)();break;end end break;end end end v103=(function() return 2 + 0 ;end)();end if (v103==0) then local v115=(function() return 0;end)();while true do if (v115==(1 + 0)) then v103=(function() return 1 + 0 ;end)();break;end if ((560 -(306 + 254))~=v115) then else v104=(function() return v20(v101,5 -3 , #"91(");end)();v105=(function() return v20(v101, #".dev",1 + 5 );end)();v115=(function() return 115 -(4 + 110) ;end)();end end end end end end for v102= #",",v23() do v56,v102,v28=(function() return v54(v56,v102,v28);end)();end return v58;end if ((586 -(57 + 527))==v53) then local v99=(function() return 0 -0 ;end)();while true do if (1==v99) then v58[ #"xnx"]=(function() return v21();end)();v53=(function() return 3;end)();break;end if (v99==(1467 -(899 + 568))) then v60=(function() return {};end)();for v110= #",",v59 do local v111=(function() return 0 + 0 ;end)();local v112=(function() return;end)();local v113=(function() return;end)();while true do if (v111==(1427 -(41 + 1386))) then local v116=(function() return 0 -0 ;end)();local v117=(function() return;end)();while true do if (v116==(603 -(268 + 335))) then v117=(function() return 290 -(60 + 230) ;end)();while true do if (v117~=(572 -(426 + 146))) then else v112=(function() return v21();end)();v113=(function() return nil;end)();v117=(function() return 2 -1 ;end)();end if (1==v117) then v111=(function() return 1 + 0 ;end)();break;end end break;end end end if (v111~=(1457 -(282 + 1174))) then else if (v112== #":") then v113=(function() return v21()~=(811 -(569 + 242)) ;end)();elseif (v112==(5 -3)) then v113=(function() return v24();end)();elseif (v112~= #"-19") then else v113=(function() return v25();end)();end v60[v110]=(function() return v113;end)();break;end end end v99=(function() return 3 -2 ;end)();end end end break;end if (v67==(0 + 0)) then local v92=(function() return 1024 -(706 + 318) ;end)();while true do if ((1251 -(721 + 530))==v92) then if (v53==1) then local v108=(function() return 1271 -(945 + 326) ;end)();while true do if (v108~=(0 -0)) then else v57=(function() return {};end)();v58=(function() return {v55,v56,nil,v57};end)();v108=(function() return 1;end)();end if ((701 -(271 + 429))~=v108) then else v59=(function() return v23();end)();v53=(function() return 2 + 0 ;end)();break;end end end if (v53==(65 -(30 + 35))) then local v109=(function() return 1500 -(1408 + 92) ;end)();while true do if (v109~=(1087 -(461 + 625))) then else v56=(function() return {};end)();v53=(function() return 3 -2 ;end)();break;end if (v109~=(1212 -(323 + 889))) then else v54=(function() return function(v124,v125,v126) local v127=(function() return 0;end)();local v128=(function() return;end)();while true do if (v127~=(0 -0)) then else v128=(function() return 1288 -(993 + 295) ;end)();while true do if (v128~=(0 + 0)) then else local v271=(function() return 1171 -(418 + 753) ;end)();while true do if (v271==0) then v124[v125-#"]" ]=(function() return v126();end)();return v124,v125,v126;end end end end break;end end end;end)();v55=(function() return {};end)();v109=(function() return 321 -(53 + 267) ;end)();end end end v92=(function() return 1 + 0 ;end)();end if (v92==(1 + 0)) then v67=(function() return 1;end)();break;end end end end end end local function v29(v61,v62,v63) local v64=v61[2 -1 ];local v65=v61[415 -(15 + 375 + 23) ];local v66=v61[985 -(18 + 964) ];return function(...) local v68=v64;local v69=v65;local v70=v66;local v71=v27;local v72=1;local v73= -(3 -(1 + 1));local v74={};local v75={...};local v76=v12("#",...) -(1 + 0) ;local v77={};local v78={};for v87=850 -(20 + (2937 -2107)) ,v76 do if (v87>=v70) then v74[v87-v70 ]=v75[v87 + 1 + 0 + 0 ];else v78[v87]=v75[v87 + (127 -(116 + 10)) ];end end local v79=(v76-v70) + 1 + (796 -(588 + 208)) ;local v80;local v81;while true do local v88=738 -(542 + 196) ;while true do if (v88==(0 -0)) then v80=v68[v72];v81=v80[1 + 0 ];v88=1 + 0 ;end if (v88==(506 -(351 + 154))) then if ((1941>=450) and (v81<=((32 -20) + 19))) then if (v81<=(281 -(28 + 238))) then if (v81<=(18 -11)) then if (v81<=(7 -4)) then if ((v81<=(1560 -(1381 + 178))) or (4646<324)) then if (v81>(1551 -(1126 + 425))) then v78[v80[407 -(118 + 287) ]]=v80[11 -8 ];else local v132=v80[1123 -(118 + 1003) ];do return v13(v78,v132,v132 + v80[8 -5 ] );end end elseif (v81==(472 -(381 + (1889 -(884 + 916))))) then v78[v80[2]]=v78[v80[380 -(142 + 235) ]][v80[18 -14 ]];else local v135=v80[2];do return v13(v78,v135,v73);end end elseif (v81<=5) then if ((3833==3833) and (v81>(1 + 3))) then if (v78[v80[979 -(553 + 424) ]]==v80[(14 -7) -3 ]) then v72=v72 + 1 + 0 + 0 ;else v72=v80[(656 -(232 + 421)) + 0 ];end else v78[v80[2]]=v78[v80[2 + 1 ]];end elseif ((v81==(3 + 3)) or (1240>3370)) then if ((v78[v80[1786 -((2103 -(1569 + 320)) + 1570) ]]~=v80[3 + 1 ]) or (2481==4682)) then v72=v72 + (2 -1) ;else v72=v80[(2 + 5) -4 ];end else v63[v80[1 + 1 + 1 ]]=v78[v80[4 -2 ]];end elseif (v81<=(4 + 7)) then if (v81<=(43 -34)) then if (v81>((2564 -1803) -(239 + 514))) then v63[v80[2 + 1 ]]=v78[v80[1331 -(797 + 532) ]];else local v142=v80[(607 -(316 + 289)) + 0 ];local v143={v78[v142](v78[v142 + (2 -1) ])};local v144=1202 -(373 + 829) ;for v232=v142,v80[735 -(476 + 255) ] do local v233=1130 -(369 + 761) ;while true do if (v233==(0 + 0)) then v144=v144 + 1 + 0 ;v78[v232]=v143[v144];break;end end end end elseif (v81==(9 + 1)) then local v145=0 + 0 ;local v146;local v147;while true do if (v145==(1 -0)) then v78[v146 + (1 -0) ]=v147;v78[v146]=v147[v80[1473 -(1269 + 200) ]];break;end if (v145==(238 -((167 -103) + 174))) then v146=v80[1 + 1 + 0 ];v147=v78[v80[(1456 -(666 + 787)) -0 ]];v145=337 -(144 + 192) ;end end else v72=v80[219 -(42 + (599 -(360 + 65))) ];end elseif (v81<=(10 + 3 + 0)) then if ((4727>=208) and (v81==(10 + 2))) then local v149=v80[(255 -(79 + 175)) + 1 ];local v150,v151=v71(v78[v149](v78[v149 + 1 + 0 ]));v73=(v151 + v149) -(1505 -(363 + 1141)) ;local v152=0;for v234=v149,v73 do v152=v152 + (1581 -(1183 + 397)) ;v78[v234]=v150[v152];end else do return v78[v80[5 -3 ]];end end elseif (v81==(11 + 3)) then v78[v80[2 + 0 ]]=v80[1978 -(1913 + 62) ]~=((0 -0) + 0) ;else local v154=0;local v155;local v156;local v157;local v158;while true do if (v154==(2 + 0)) then for v288=v155,v73 do local v289=0 + 0 ;while true do if (v289==(0 + 0 + 0)) then v158=v158 + (2 -1) ;v78[v288]=v156[v158];break;end end end break;end if (v154==((5928 -3994) -(565 + 1368))) then v73=(v157 + v155) -(3 -2) ;v158=0 + 0 ;v154=1663 -(1477 + 184) ;end if ((280<3851) and (v154==(0 -0))) then v155=v80[2 + 0 ];v156,v157=v71(v78[v155](v78[v155 + ((629 -302) -(192 + 134)) ]));v154=857 -(564 + 292) ;end end end elseif ((v81<=(13 + 10)) or (3007>3194)) then if ((v81<=((931 -(503 + 396)) -13)) or (2136>=2946)) then if (v81<=(16 + (182 -(92 + 89)))) then if (v81==(48 -32)) then v78[v80[306 -(244 + 60) ]]=v63[v80[3 + (0 -0) ]];else local v161=v80[(246 + 232) -(41 + 435) ];v78[v161]=v78[v161](v13(v78,v161 + (1002 -(938 + 38 + 25)) ,v73));end elseif (v81>(14 + 4)) then v78[v80[2]][v80[1128 -(936 + (739 -550)) ]]=v80[2 + 2 ];else v78[v80[(221 + 1394) -(1565 + 48) ]]={};end elseif (v81<=(13 + 8)) then if (v81==(18 + 2)) then v78[v80[1140 -(782 + 356) ]]=v63[v80[3]];elseif ((2165<=2521) and  not v78[v80[269 -(176 + 91) ]]) then v72=v72 + ((4 -2) -1) ;else v72=v80[4 -1 ];end elseif (v81>((1687 + 246) -(340 + 1571))) then local v168=v80[1094 -(975 + 117) ];local v169=v78[v168];local v170=v80[1878 -(157 + 1718) ];for v237=(847 + 926) -(1733 + 39) ,v170 do v169[v237]=v78[v168 + v237 ];end elseif v78[v80[2 + (0 -0) ]] then v72=v72 + (3 -2) ;else v72=v80[10 -7 ];end elseif ((2861>661) and (v81<=(1045 -(697 + 321)))) then if (v81<=(12 + 2 + 11)) then if (v81>(65 -41)) then local v171=v80[3 -(1 -0) ];do return v78[v171](v13(v78,v171 + (2 -1) ,v73));end else do return;end end elseif (v81==(11 + 15)) then if  not v78[v80[238 -(46 + 190) ]] then v72=v72 + (1 -0) ;else v72=v80[7 -4 ];end else v78[v80[1319 -(1114 + 203) ]]=v80[1230 -(322 + 905) ]~=(611 -(602 + 9)) ;end elseif (v81<=(1218 -(449 + 740))) then if ((4525>4519) and (v81==(900 -(826 + 46)))) then local v173=v80[949 -(245 + 702) ];local v174=v78[v173];for v240=v173 + (3 -2) ,v80[1 + (1246 -(485 + 759)) ] do v7(v174,v78[v240]);end else local v175=v80[1900 -(260 + (3789 -2151)) ];local v176,v177=v71(v78[v175](v13(v78,v175 + (441 -(382 + 58)) ,v80[9 -6 ])));v73=(v177 + v175) -(1 + (1189 -(442 + 747))) ;local v178=1162 -(171 + 991) ;for v241=v175,v73 do v178=v178 + (1 -0) ;v78[v241]=v176[v178];end end elseif (v81==(89 -59)) then v78[v80[1207 -(902 + 303) ]]=v29(v69[v80[5 -2 ]],nil,v63);else v78[v80[(1139 -(832 + 303)) -2 ]]=v29(v69[v80[1 + 2 ]],nil,v63);end elseif ((3178>972) and (v81<=(135 -(1034 -(88 + 858))))) then if (v81<=(62 -23)) then if (v81<=(1725 -(1121 + 569))) then if ((4766==4766) and (v81<=(247 -(22 + 192)))) then if (v81==(715 -(483 + 200))) then local v181=v80[1466 -(428 + 976 + 59) ];local v182=v78[v181];for v244=v181 + ((2 + 0) -1) ,v80[4] do v182=v182   .. v78[v244] ;end v78[v80[2 -0 ]]=v182;else local v184=v80[2];v78[v184](v78[v184 + 1 + 0 + 0 ]);end elseif (v81==(799 -(468 + 297))) then v78[v80[2 + 0 ]]=v78[v80[(1563 -(766 + 23)) -(326 + 445) ]][v80[17 -13 ]];else for v245=v80[564 -(334 + 228) ],v80[10 -(34 -27) ] do v78[v245]=nil;end end elseif (v81<=(748 -(530 + 181))) then if (v81>(917 -((839 -225) + 267))) then if v78[v80[4 -2 ]] then v72=v72 + (1 -0) ;else v72=v80[5 -2 ];end else do return v78[v80[(2 -1) + 1 ]];end end elseif (v81>38) then local v187=v80[2];v78[v187]=v78[v187](v13(v78,v187 + (237 -(141 + 95)) ,v80[(10 -7) + (1073 -(1036 + 37)) ]));elseif ((v78[v80[4 -2 ]]~=v80[9 -5 ]) or (2745>3128)) then v72=v72 + 1 + 0 ;else v72=v80[8 -5 ];end elseif (v81<=43) then if ((v81<=(106 -65)) or (1144>=4606)) then if (v81==(29 + 11)) then local v189=0 + 0 + 0 ;local v190;while true do if ((3338>=277) and (v189==0)) then v190=v80[2 -0 ];v78[v190](v78[v190 + 1 + 0 ]);break;end end else v78[v80[165 -(92 + 71) ]][v80[1 + (3 -1) ]]=v80[2 + 2 ];end elseif (v81>(10 + 32)) then do return;end else local v193=0 -0 ;local v194;while true do if ((2610>2560) and (v193==0)) then v194=v80[767 -(574 + 191) ];v78[v194]=v78[v194](v13(v78,v194 + 1 + 0 ,v80[7 -4 ]));break;end end end elseif ((v81<=(23 + 22)) or (1194>3083)) then if ((916>=747) and (v81>(893 -(200 + 54 + 595)))) then local v195=v80[128 -((1535 -(641 + 839)) + 71) ];local v196=v78[v80[(922 -(910 + 3)) -6 ]];v78[v195 + (1 -0) ]=v196;v78[v195]=v196[v80[5 -1 ]];else local v200=1790 -(573 + (3102 -1885)) ;local v201;local v202;while true do if (v200==(0 -0)) then v201=v80[3 -0 ];v202=v78[v201];v200=(1685 -(1466 + 218)) + 0 ;end if (v200==(1 -0)) then for v290=v201 + (1 -0) ,v80[943 -(329 + 385 + (1373 -(556 + 592))) ] do v202=v202   .. v78[v290] ;end v78[v80[5 -(2 + 1) ]]=v202;break;end end end elseif (v81==(63 -17)) then v78[v80[1849 -(559 + 1288) ]][v80[1934 -(609 + 1322) ]]=v78[v80[(809 -(329 + 479)) + 3 ]];else v72=v80[3 -0 ];end elseif (v81<=(861 -(118 + 688))) then if ((v81<=(99 -(25 + 23))) or (2444>2954)) then if ((2892<3514) and (v81<=(10 + 39))) then if (v81==(1934 -(927 + 959))) then for v247=v80[1 + 1 ],v80[10 -7 ] do v78[v247]=nil;end else local v206=v80[734 -(16 + 716) ];local v207={v78[v206](v78[v206 + (1 -0) ])};local v208=97 -(11 + (177 -91)) ;for v249=v206,v80[9 -5 ] do v208=v208 + (286 -(125 + 50 + 110)) ;v78[v249]=v207[v208];end end elseif ((533==533) and (v81==(126 -76))) then local v209=v80[9 -(746 -(396 + 343)) ];v78[v209]=v78[v209]();else local v211=1796 -(503 + 1293) ;local v212;while true do if ((0 -0)==v211) then v212=v80[2 + 0 ];v78[v212]=v78[v212](v13(v78,v212 + (1062 -(810 + 251)) ,v73));break;end end end elseif ((595<=3413) and (v81<=(37 + 16))) then if ((3078>=2591) and (v81>(16 + 36))) then v78[v80[2 + 0 ]]=v78[v80[536 -(43 + 490) ]];else local v215=v80[735 -(63 + 648 + 22) ];do return v78[v215](v13(v78,v215 + (3 -2) ,v73));end end elseif (v81>(913 -(240 + 619))) then if ((3199<4030) and (v78[v80[(1478 -(29 + 1448)) + 1 ]]==v80[5 -1 ])) then v72=v72 + 1 + 0 ;else v72=v80[3];end else local v216=v80[2 -0 ];do return v13(v78,v216,v73);end end elseif (v81<=(4 + 55)) then if ((777<2078) and (v81<=(1801 -(1344 + 400)))) then if ((1696<=2282) and (v81>(1445 -(135 + 1254)))) then local v217=v80[2 + 0 ];v78[v217]=v78[v217]();else v78[v80[407 -(255 + (565 -415)) ]]=v80[3 + 0 ];end elseif (v81>(32 + 26)) then if (v80[(9 -7) + 0 ]==v78[v80[16 -12 ]]) then v72=v72 + ((2 + 1) -2) ;else v72=v80[1742 -(404 + 1335) ];end else local v221=v80[2 + 0 ];local v222=v78[v221];local v223=v80[409 -(183 + 223) ];for v252=843 -(497 + 345) ,v223 do v222[v252]=v78[v221 + v252 ];end end elseif (v81<=(74 -13)) then if (v81==((1567 -(389 + 1138)) + (594 -(102 + 472)))) then if (v80[2]==v78[v80[2 + 2 ]]) then v72=v72 + (1334 -(605 + 728)) ;else v72=v80[340 -(10 + 327) ];end else v78[v80[2 + 0 ]]={};end elseif ((v81==(400 -(118 + 220))) or (1761>=2462)) then v78[v80[1 + 1 ]][v80[(427 + 25) -(108 + 341) ]]=v78[v80[4 + 0 ]];else local v227=v80[1 + 1 ];local v228,v229=v71(v78[v227](v13(v78,v227 + (4 -3) ,v80[1496 -(711 + 434 + 348) ])));v73=(v229 + v227) -1 ;local v230=0 -0 ;for v255=v227,v73 do local v256=489 -(427 + 30 + 32) ;while true do if (v256==(469 -(270 + 199))) then v230=v230 + 1 + 0 ;v78[v255]=v228[v230];break;end end end end v72=v72 + (1820 -(580 + 1239)) ;break;end end end end;end return v29(v28(),{},v17)(...);end return v15("LOL!483Q00028Q00030E3Q00526571756972655365727669636503083Q00636C6F6E6572656603043Q0067616D652Q033Q0055676303073Q00506C6179657273030A3Q0047657453657276696365026Q00F03F026Q00084003063Q0069737072656D030B3Q00676574757365726E616D6503093Q00676574757365726964026Q001040027Q004003103Q0055736572496E7075745365727669636503053Q005374617473030B3Q00482Q747053657276696365026Q00144003093Q00676574736372697074030A3Q006765746D73677479706503063Q006765746D7367026Q00184003063Q00506C61796572030B3Q004C6F63616C506C6179657203113Q005265706C69636174656453746F72616765030F3Q005265706C696361746564466972737403053Q007063612Q6C2Q033Q00726571030C3Q00682Q74705F7265717565737403073Q007265717565737403083Q00482Q7470506F73742Q033Q0073796E03053Q007072696E7403193Q00452Q726F72206F2Q6375726564212043612Q6C6261636B3A2003793Q00682Q7470733A2Q2F6

Notify("Success", "Message sent!", 10, true)
task.delay(60, function()
_G.ArleadyBeingSent = false
end
end)
if not success then
_G.ArleadyBeingSent = false
Notify("Error", "Message has not been sent. Possible errors: webhook is down or you didn't choose category/script or you didn't wrote message.")
end
else
Notify("Error", "You're sending messages too fast!")
end
   end,
})

local CloseHubButton = Other:CreateButton({
   Name = "Close Launcher",
   Callback = function()
Rayfield:Destroy()
   end,
})

pcall(function()
game.CoreGui:FindFirstChild("HintGui"):Destroy()
end)
