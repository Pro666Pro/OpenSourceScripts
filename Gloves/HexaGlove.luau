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

if getgenv().AutoGetHexaExecuted == true then return end

if getgenv or getgenv() then
getgenv().AutoGetHexaExecuted = true
end

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})


if game.PlaceId == 98726100529621 then

repeat task.wait(.2) until workspace:FindFirstChild("Part I") and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
task.wait(5)
workspace["Part I"].Obby["end"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
repeat task.wait(.2) until workspace:FindFirstChild("Part 2") and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
task.wait(5) -- waiting some time cuz script may break
workspace["Part 2"]["Adjacent Island"].PortalActivator.CanCollide = false
workspace["Part 2"]["Adjacent Island"].PortalActivator.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
repeat task.wait(.1) until workspace["Part 2"]:FindFirstChild("Portal")
workspace["Part 2"].Portal.CanCollide = false
workspace["Part 2"].Portal.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
repeat task.wait(.2) until workspace:FindFirstChild("Part 3") and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
task.wait(5)
fireclickdetector(workspace["Part 3"].TpToNext.HitBox.Click)
repeat task.wait(.2) until workspace:FindFirstChild("Part 4") and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
task.wait(5)
workspace["Part 4"].TPPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
repeat task.wait(.2) until workspace:FindFirstChild("Part 5") and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
task.wait(5)
fireclickdetector(workspace["Part 5"].Glove.Hitbox.Click)
repeat task.wait(.2) until workspace:FindFirstChild("Finale") and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
task.wait(5)
fireclickdetector(workspace.Finale.Reward.Hitbox.Click)

elseif game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
if game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2130463063) then -- Checking for obby
fireclickdetector(workspace.Lobby["Obby"].ClickDetector) -- Equiping obby
repeat task.wait(.1) until game.Players.LocalPlayer.leaderstats.Glove.Value == "Obby"
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Lobby["Teleport1"].CFrame
repeat task.wait(.1) until game.Players.LocalPlayer.Character:FindFirstChild("entered") -- Waiting for our character to get teleported to arena
task.wait(.6)
-- Creating table so we can easily use all args
partspos = {
    [1] = CFrame.new(241.82754516601562, -18.416065216064453, 4.669858455657959) * CFrame.Angles(2.5299831118985594e-09, 1.1053541898727417, -2.506274521252294e-09),
    [2] = CFrame.new(232.99655151367188, -18.416065216064453, 5.007986545562744) * CFrame.Angles(-3.141592502593994, 1.0570828914642334, 3.141592502593994),
    [3] = CFrame.new(246.00315856933594, -18.416065216064453, 11.59123706817627) * CFrame.Angles(3.141592502593994, -0.12516921758651733, 3.1415927410125732),
    [4] = CFrame.new(228.64903259277344, -18.416065216064453, 12.657069206237793) * CFrame.Angles(-3.1415927410125732, -0.04263044893741608, -3.1415927410125732),
    [5] = CFrame.new(242.11700439453125, -18.416065216064453, 19.456865310668945) * CFrame.Angles(3.141592502593994, 0.9149928092956543, -3.141592502593994),
    [6] = CFrame.new(233.44776916503906, -18.416065216064453, 20.341604232788086) * CFrame.Angles(-1.062227994452769e-07, 1.0962058305740356, 8.786906846580678e-08)
}
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(238.15428161621094, -15.716065406799316, 13.426663398742676) -- Teleporting to place where we are going to place hexagon
task.wait(1)
for i,v in ipairs(partspos) do
game:GetService("ReplicatedStorage").GeneralAbility:FireServer(v,5) -- placing blocks
task.wait(3) -- obby cooldown
end
else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "You don't have obby",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Use in lobby",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Wrong game buddy",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
