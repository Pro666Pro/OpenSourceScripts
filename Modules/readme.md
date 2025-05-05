# Sry it's not open source, i don't want to people fully skid my scripts :)

## Booting up

NexerModuleOrWhateverThisVariableNameIs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Modules/SlapBattlesModuleScript.lua"))()

## All commands / functions

ModuleScript:HasCharacter(player) -- Checks if player have character

ModuleScript:HasRoot(char) -- Checks if player have root part

ModuleScript:HasHumanoid(char) -- Checks if player have humanoid

ModuleScript:GetCharacter(player) -- Returns player character

ModuleScript:GetRoot(char) -- Returns player root part

ModuleScript:GetHumanoid(char) -- Returns player humanoid

ModuleScript:SetCFrame(part, position, isspawninghigher, height) -- Sets cframe of anything
Example: ModuleScript:SetCFrame(ModuleScript:GetRoot(ModuleScript:GetCharacter(game:GetService("Players").LocalPlayer)), CFrame.new(0,0,0), true, 50)

ModuleScript:Kill(humanoid) -- Kills any entity except players but including you

ModuleScript:Reset(waiting, time) -- Resets player

ModuleScript.GetLeaderstats() -- Returns leaderstats folder

ModuleScript.GetSlaps() -- Returns your current slaps value

ModuleScript.GetGlove() -- Returns your current glove value

ModuleScript:EquipGlove(glove, time) -- Equips glove

ModuleScript:EnterPortal(portal, time) -- Enters portal
Example: ModuleScript:EnterPortal("Teleport1")

ModuleScript.RandomGlove() -- Returns random glove you have

ModuleScript:HasGlove(glove) -- Checks if player have glove. Returns either false or true

ModuleScript:HasGlove(glove) -- Checks if player have glove. Returns either false or true

ModuleScript:Slap(args, mode) -- Slaps { literally }
Example: ModuleScript:Slap({[1]=game.Players.LocalPlayer.Character.HumanoidRootPart;[2]=true;})

ModuleScript:SetDB(boolval) -- Sets death barrier mode ( false is disable and true is enable )
