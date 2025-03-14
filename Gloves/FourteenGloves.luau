if not game.IsLoaded then
game.Loaded:Wait()
end

function Checkamogus()
DontGetAvatar = false
repeat task.wait() until DontGetAvatar ~= nil

if DontGetAvatar == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3258, -65, 824)
if not game.IsLoaded then
game.Loaded:Wait()
end
wait(5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["the cube of life"].Part.CFrame
if not game.IsLoaded then
game.Loaded:Wait()
end
wait(5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Big Heart"].CFrame
if not game.IsLoaded then
game.Loaded:Wait()
end
wait(5)
end

end

function EquipGlove(glove, time)
    glove = glove or "Default"
    time = time or 0.4
    task.wait()
    repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("leaderstats") and game.Players.LocalPlayer.leaderstats:FindFirstChild("Glove")
    task.wait()
    if workspace.Lobby:FindFirstChild(glove) and workspace.Lobby[glove]:FindFirstChildWhichIsA("ClickDetector") then
        if fireclickdetector or fireclickdetector() then
            fireclickdetector(workspace.Lobby[glove].ClickDetector)
            repeat task.wait() until game.Players.LocalPlayer.leaderstats.Glove.Value == glove
            task.wait(time)
        end
    end
end
function EnterPortal(portal, time)
    portal = portal or "Teleport1"
    time = time or 0.8
    task.wait()
    repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") 
    task.wait()
    if workspace.Lobby:FindFirstChild(portal) and workspace.Lobby[portal]:FindFirstChildWhichIsA("Script") and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
        workspace.Lobby[portal].CanCollide = false
        old = workspace.Lobby[portal].CFrame
        workspace.Lobby[portal].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("entered")
        workspace.Lobby[portal].CFrame = old
        workspace.Lobby[portal].CanCollide = true
        task.wait(time)
    end
end

-- Credits, message is not squished up cuz it looks bad
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Credits to Nexer1234_AnotherAlt",
	Text = "Made by @nexer1234 ( youtube & discord )",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000
})

local teleport = queueonteleport or queue_on_teleport -- just look at function name bro
if teleport then
    teleport([[
if not game.IsLoaded then
game.Loaded:Wait()
end
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/AdminGlove.luau'))()
	]])
else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Your executor doesn't support queueonteleport/queue_on_teleport, please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end

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
repeat task.wait() until game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 1060832194529561)
while task.wait() do game:GetService("TeleportService"):Teleport(6403373529) end
elseif game.PlaceId == 18550498098 then

Checkamogus()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3258, -65, 824)
if not game.IsLoaded then
game.Loaded:Wait()
end
wait(5)
for i,v in pairs(workspace:GetDescendants()) do
if v.Name == "ShackLever" and v:FindFirstChild("ClickDetector") then
fireclickdetector(v.ClickDetector, 0)
fireclickdetector(v.ClickDetector, 1)
end
end
repeat task.wait(.1) until workspace.Map.Components:FindFirstChild("GuideNPC")
task.wait(.8)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(599, 250, -322)
task.wait(.8)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true

while task.wait(.1) do
if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then
game.Players.LocalPlayer.Backpack.Lantern.Parent = game.Players.LocalPlayer.Character
end
game:GetService("ReplicatedStorage").Remotes.Data.AnswerInCutscene:FireServer("Spare")

for i,v in pairs(workspace:GetChildren()) do

if v.Name == "PusherWall" then
v.CanCollide = false
end

if v.Name == "DungeonGolem" and v:FindFirstChild("Cube.001") then
if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
game.Players.LocalPlayer.Character.Lantern:Activate()
game.Players.LocalPlayer.Character.Lantern.Network:FireServer("Hit", v["Cube.001"])
end
end

if v.Name == "golem" and v:FindFirstChild("Hitbox") then
if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
game.Players.LocalPlayer.Character.Lantern:Activate()
game.Players.LocalPlayer.Character.Lantern.Network:FireServer("Hit", v.Hitbox)
end
end

if v.Name == "ReplicaNPC" and v:FindFirstChild("HumanoidRootPart") then
if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
game.Players.LocalPlayer.Character.Lantern:Activate()
game.Players.LocalPlayer.Character.Lantern.Network:FireServer("Hit", v.HumanoidRootPart)
end
end

if v.Name == "GuideNPC" and v:FindFirstChild("HumanoidRootPart") then
if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
game.Players.LocalPlayer.Character.Lantern:Activate()
game.Players.LocalPlayer.Character.Lantern.Network:FireServer("Hit", v.HumanoidRootPart)
end
end

if v.Name == "TrackGloveMissile" then
if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
game.Players.LocalPlayer.Character.Lantern:Activate()
game.Players.LocalPlayer.Character.Lantern.Network:FireServer("Hit", v)
end
end

end
end

elseif game.PlaceId == 115782629143468 then

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 200, 0)

elseif game.PlaceId == 102908326578005 then

-- Sorry, at the moment i was lazy to search for click detectors
for i,v in ipairs(workspace:GetDescendants()) do
if v.ClassName == "ClickDetector" then
fireclickdetector(v)
end
end
wait(3)
for i,v in ipairs(workspace:GetDescendants()) do
if v.ClassName == "ClickDetector" then
fireclickdetector(v)
end
end
wait(3)
repeat task.wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(26.34327507019043, 4.055271148681641, -1.8455318212509155) until game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2035627575374951)
while task.wait() do game:GetService("TeleportService"):Teleport(115782629143468) end

elseif game.PlaceId == 7234087065 then

if game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 1223765330375569) and not game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 1060832194529561) then

local time = tick()
while tick() - time < 10 do
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

else
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.QuestStuff.Key.CFrame
task.wait(.8)
remotes = {
    [1] = game:GetService("ReplicatedStorage").RemoteEvents.SuitUpClown
    [2] = game:GetService("ReplicatedStorage").RemoteEvents.KeyQuest
    [3] = game:GetService("ReplicatedStorage").RemoteEvents.KeyAcquired
    [4] = game:GetService("ReplicatedStorage").RemoteEvents.GOHOME
    [5] = game:GetService("ReplicatedStorage").RemoteEvents.KeyBadgeReward
}
repeat task.wait until remotes ~= nil
for i,v in ipairs(remotes) do
v:FireServer()
task.wait(.1)
end
task.wait(.8)
if workspace:FindFirstChild("BoxingGloves") == nil then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Buildings.house.TP.CFrame * CFrame.new(0,10,0)
repeat task.wait(.1) until workspace:FindFirstChild("BoxingGloves")
task.wait(.5)
fireclickdetector(workspace.BoxingGloves.ClickDetector)
else
fireclickdetector(workspace.BoxingGloves.ClickDetector)
end

while task.wait() do game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["wizard twoer"].Cone.CFrame * CFrame.new(0,10,0) end

end

elseif game.PlaceId == 6403373529 then

if not game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 1223765330375569) then

while task.wait() do game:GetService("TeleportService"):Teleport(7234087065) end

elseif game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 1223765330375569) and not game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 1060832194529561) then

while task.wait() do game:GetService("TeleportService"):Teleport(7234087065) end

elseif game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 1223765330375569) and game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 1060832194529561) then

if workspace.BountyHunterRoom.Model["Meshes/boxshadow_Cube.005"].PlayerCounter.SurfaceGui.TextLabel.Text == "0/4 Hunters" then
if workspace.BountyHunterRoom.Model["Meshes/boxshadow_Cube.005"].Counter.SurfaceGui.TextLabel.Text ~= "1" then
repeat task.wait(.1) until workspace.BountyHunterRoom.Model["Meshes/boxshadow_Cube.005"].Counter.SurfaceGui.TextLabel.Text == "1"
end
while task.wait() do game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.BountyHunterRoom.Model["Meshes/boxshadow_Cube.005"].Hitbox.CFrame end
else
repeat task.wait(.1) until workspace.BountyHunterRoom.Model["Meshes/boxshadow_Cube.005"].PlayerCounter.SurfaceGui.TextLabel.Text == "0/4 Hunters"
if workspace.BountyHunterRoom.Model["Meshes/boxshadow_Cube.005"].Counter.SurfaceGui.TextLabel.Text ~= "1" then
repeat task.wait(.1) until workspace.BountyHunterRoom.Model["Meshes/boxshadow_Cube.005"].Counter.SurfaceGui.TextLabel.Text == "1"
end
while task.wait() do game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.BountyHunterRoom.Model["Meshes/boxshadow_Cube.005"].Hitbox.CFrame end
end

end

  
elseif game.PlaceId == 11828384869 then

for i,v in pairs(workspace:GetDescendants()) do
if v:IsA("ClickDetector") then
fireclickdetector(v)
end
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1000,1000,1000)
wait(0.6)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
Time = 120
repeat task.wait() until Time ~= nil
for i = 1,Time do
Time = Time - 1
Instance.new("Message",workspace).Text = "Time left to receive: "..Time
wait(1)
workspace:FindFirstChildWhichIsA("Message"):Destroy()
end
wait(1.5)
if firetouchinterest or firetouchinterest() then
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game.Workspace.Ruins.Elude.Glove, 0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game.Workspace.Ruins.Elude.Glove, 1)
else
game.Workspace.Ruins.Elude.Glove.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart
end
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA("ClickDetector") then
fireclickdetector(v)
end
end

elseif game.PlaceId == 74169485398268 then

repeat task.wait() fireclickdetector(workspace.Orb.ClickDetector) until game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 3199562682373814)
while task.wait() do game:GetService("TeleportService"):Teleport(11828384869) end

  
elseif game.PlaceId == 17290438723 then


game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-555, 180, 55)
wait(1)
for i,v in ipairs(workspace:GetDescendants()) do
if v.ClassName == "ProximityPrompt" then
if v.HoldDuration ~= 0 then
v.HoldDuration = 0
end
if v.RequiresLineOfSight ~= false then
v.RequiresLineOfSight = false
end
if v.MaxActivationDistance ~= math.huge then
v.MaxActivationDistance = math.huge
end
v.Enabled = true
fireproximityprompt(v)
end
end
repeat task.wait() until game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 1286358044443937)
while task.wait() do game:GetService("TeleportService"):Teleport(74169485398268) end


  
elseif game.PlaceId == 9015014224 then
  
game:GetService("ReplicatedStorage").GRRRRR:FireServer(true)
game:GetService("ReplicatedStorage").IceSkate:FireServer("Freeze")
fireclickdetector(game.Workspace.Arena["default island"]["Rubber Ducky"].ClickDetector)
fireclickdetector(game.Workspace.Arena.island5.Orange.ClickDetector)
fireclickdetector(game.Workspace.Lobby.Scene.knofe.ClickDetector)
workspace.BountyHunterRoom.BountyHunterBooth._activate:Fire()
function ClickButton(button, size)
    textbutton = button
	size = size or UDim2.new(10000, 0, 10000, 0)
    task.wait()
    if textbutton and textbutton.ClassName == "TextButton" or textbutton.ClassName == "ImageButton" then
        textbutton.Size = size
        task.wait()
        repeat task.wait() until textbutton.Size == size
        task.wait()
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):ClickButton1(Vector2.new())
        task.wait(1)
    end
end
ClickButton(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.HomePage.QuestButton.Button)
for i,v in ipairs(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.QuestsPage:GetChildren()) do
if v.Name == "NewQuestButton" and v:FindFirstChild("Button") and v.Button:FindFirstChild("Title") and v.Button.Title.Text == "A Hunt for the Hunter" then
v.Name = "skibidi"
end
end
ClickButton(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.QuestsPage.skibidi.Button)
ClickButton(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.QuestInfoPage.AcceptQuest, UDim2.new(10000, 0, -10000, 0))
workspace.BountyHunterRoom.BountyHunterBooth._configPart.LeaveRemote:FireServer()
EnterPortal("Teleport2")
repeat task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(43, -6, 92)
task.wait(.01)
game:GetService("ReplicatedStorage").DigEvent:FireServer({["index"] = 2,["cf"] = CFrame.new(43, -6, 92, 0, 2, -1, -6, 1, 4, 1, 7, 0)})
until game.Workspace:FindFirstChild("TreasureChestFolder") ~= nil and game.Workspace.TreasureChestFolder:FindFirstChild("TreasureChest") ~= nil
task.wait(1)
game.Workspace.TreasureChestFolder.TreasureChest.OpenRemote:FireServer()
task.wait(1)
game.Players.LocalPlayer.Character.Humanoid.Health = 0
task.wait(5)
workspace.BountyHunterRoom.BountyHunterBooth._activate:Fire()
ClickButton(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.HomePage.QuestButton.Button)
for i,v in ipairs(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.QuestsPage:GetChildren()) do
if v.Name == "NewQuestButton" and v:FindFirstChild("Button") and v.Button:FindFirstChild("Title") and v.Button.Title.Text == "A Hunt for the Hunter" then
v.Name = "skibidi"
end
end
ClickButton(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.QuestsPage.skibidi.Button)
ClickButton(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.QuestInfoPage.AcceptQuest, UDim2.new(10000, 0, -10000, 0))
workspace.BountyHunterRoom.BountyHunterBooth._configPart.LeaveRemote:FireServer()
while task.wait() do game:GetService("TeleportService"):Teleport(17290438723) end

    
else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Wrong game buddy",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
