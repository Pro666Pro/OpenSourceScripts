if not game.IsLoaded then
game.Loaded:Wait()
end

-- Credits, message is not squished up cuz it looks bad
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Credits to Nexer1234_AnotherAlt",
	Text = "Made by @nexer1234 ( youtube & discord )",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000
})

if getgenv().AutoGetMetaverseExecuted == true then return end

if getgenv or getgenv() then
getgenv().AutoGetMetaverseExecuted = true
end

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})



if game.PlaceId == 136005148166028 then

local Platform = (game.UserInputService.TouchEnabled and not game.UserInputService.MouseEnabled) and "Mobile" or "PC"
fireclickdetector(workspace.Kitchen.Fridge.HitBox.ClickDetector)
task.wait(1)
fireclickdetector(workspace.Kitchen.Fridge.GrantAward.ClickDetector)
task.wait(1)
fireclickdetector(workspace.Microwave.HitBox.ClickDetector)
task.wait(10)
fireclickdetector(workspace.Microwave.HitBox.ClickDetector)
task.wait(1)
fireclickdetector(workspace.Microwave.Brewzucki.ClickDetector)
task.wait()
repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Brewzucki")
task.wait()
if game.Players.LocalPlayer.Backpack:FindFirstChild("Brewzucki") then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Brewzucki"])
task.wait(1)
game.Players.LocalPlayer.Character["Brewzucki"]:Activate()
task.wait(2)
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
if game.Players.LocalPlayer.Backpack:FindFirstChild("Brewzucki") then
game.Players.LocalPlayer.Backpack["Brewzucki"]:Destroy()
else
game.Players.LocalPlayer.Character["Brewzucki"]:Destroy()
end
else
game.Players.LocalPlayer.Character["Brewzucki"]:Activate()
task.wait(2)
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
if game.Players.LocalPlayer.Backpack:FindFirstChild("Brewzucki") then
game.Players.LocalPlayer.Backpack["Brewzucki"]:Destroy()
else
game.Players.LocalPlayer.Character["Brewzucki"]:Destroy()
end
end
task.wait(5)
fireclickdetector(workspace.BasementTable.HitBox.ClickDetector)
task.wait(15)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ComputerChair.Seat.CFrame
task.wait(5)
local start = tick()
while tick() - start < 30 do  -- copy paste it into your script i dare you
for i,v in ipairs(game.Players.LocalPlayer.PlayerGui.RealComputerScreenGui.ComputerScreen.SuggestionsQTE:GetChildren()) do
if v and v.Name:find("Popup_") then
v.Position = game.Players.LocalPlayer.PlayerGui.RealComputerScreenGui.ComputerScreen.SuggestionsQTE.RecyclingBin.Position
end
end
task.wait()
end
task.wait(2)
game:GetService("ReplicatedStorage").Remotes.ComputerState:FireServer("Victory")
task.wait(1)
game:GetService("ReplicatedStorage").Remotes.ComputerState:Destroy()
game.Players.LocalPlayer.PlayerGui.RealComputerScreenGui.Enabled = false
game.Players.LocalPlayer.Character.Humanoid.Sit = false  -- copy paste it into your script i dare you
task.wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-14,37,49)
task.wait(2)
repeat task.wait()
if Platform == "Mobile" then
if game.Players.LocalPlayer.PlayerGui.DavidShrineQTE.DavidShrineQTE.Mobile.SpawnArea:FindFirstChild("TapLabel") then
game.Players.LocalPlayer.PlayerGui.DavidShrineQTE.DavidShrineQTE.Mobile.SpawnArea.TapLabel.Size = UDim2.new(10000, 0, 10000, 0)
game:GetService("VirtualUser"):CaptureController()
game:GetService("VirtualUser"):ClickButton1(Vector2.new())
end
elseif Platform == "PC" then
if game.Players.LocalPlayer.PlayerGui.DavidShrineQTE.DavidShrineQTE.PC.QuickTimeLabel.Visible == true then
game:GetService("VirtualInputManager"):SendKeyEvent(true, game.Players.LocalPlayer.PlayerGui.DavidShrineQTE.DavidShrineQTE.PC.QuickTimeLabel.Text, false, game:GetService("VirtualInputManager"))
end
end
until game.Players.LocalPlayer.PlayerGui.DavidShrineQTE.DavidShrineQTE.ScoreLabel.Text == "Score: 150"

elseif game.PlaceId == 7234087065 then

local time = tick()
while tick() - time < 20 do
if workspace.Buildings:FindFirstChild("wizard twoer 2") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(249, 94, -62820)
else
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Buildings["wizard twoer"].ORB.CFrame
end
if fireproximityprompt then
fireproximityprompt(workspace.Buildings["wizard twoer"].ORB.ProximityPrompt)
end
end 

local PlaceID = 7234087065 -- This is serverhop to small server in brazil
local v0={};local v1="";local v2=os.date("!*t").hour;local v3=false;local v4=pcall(function() v0=game:GetService("HttpService"):JSONDecode(readfile("SmallServerServerHop-Nexer1234.json"));end);if  not v4 then table.insert(v0,v2);writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));end function TPReturner() local v5;if (v1=="") then v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100" ));else v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100&cursor="   .. v1 ));end local v6="";if (v5.nextPageCursor and (v5.nextPageCursor~="null") and (v5.nextPageCursor~=nil)) then v1=v5.nextPageCursor;end local v7=0;for v8,v9 in pairs(v5.data) do local v10=true;v6=tostring(v9.id);if (tonumber(v9.maxPlayers)>tonumber(v9.playing)) then for v12,v13 in pairs(v0) do if (v7~=0) then if (v6==tostring(v13)) then v10=false;end elseif (tonumber(v2)~=tonumber(v13)) then local v14=pcall(function() delfile("SmallServerServerHop-Nexer1234.json");v0={};table.insert(v0,v2);end);end v7=v7 + 1 ;end if (v10==true) then table.insert(v0,v6);wait();pcall(function() writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));wait();game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID,v6,game.Players.LocalPlayer);end);wait(4);end end end end function Teleport() while wait() do pcall(function() TPReturner();if (v1~="") then TPReturner();end end);end end
task.wait()
while task.wait() do Teleport() end
  
elseif game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then
  
local PlaceID = 7234087065 -- This is serverhop to small server in brazil
local v0={};local v1="";local v2=os.date("!*t").hour;local v3=false;local v4=pcall(function() v0=game:GetService("HttpService"):JSONDecode(readfile("SmallServerServerHop-Nexer1234.json"));end);if  not v4 then table.insert(v0,v2);writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));end function TPReturner() local v5;if (v1=="") then v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100" ));else v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100&cursor="   .. v1 ));end local v6="";if (v5.nextPageCursor and (v5.nextPageCursor~="null") and (v5.nextPageCursor~=nil)) then v1=v5.nextPageCursor;end local v7=0;for v8,v9 in pairs(v5.data) do local v10=true;v6=tostring(v9.id);if (tonumber(v9.maxPlayers)>tonumber(v9.playing)) then for v12,v13 in pairs(v0) do if (v7~=0) then if (v6==tostring(v13)) then v10=false;end elseif (tonumber(v2)~=tonumber(v13)) then local v14=pcall(function() delfile("SmallServerServerHop-Nexer1234.json");v0={};table.insert(v0,v2);end);end v7=v7 + 1 ;end if (v10==true) then table.insert(v0,v6);wait();pcall(function() writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));wait();game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID,v6,game.Players.LocalPlayer);end);wait(4);end end end end function Teleport() while wait() do pcall(function() TPReturner();if (v1~="") then TPReturner();end end);end end
task.wait()
while task.wait() do Teleport() end

else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Wrong game buddy",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
