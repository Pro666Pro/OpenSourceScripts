
if not game.IsLoaded then
game.Loaded:Wait()
end

-- Credits, message is not squished up cuz it looks bad
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Credits to Nexer1234_AnotherAlt",
	Text = "Made by @nexer1234 ( youtube & discord )",
        Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Thanks!"
})

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})


if game.PlaceId == 92516899071319 then

workspace:FindFirstChild("Unstable Artifact").Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
task.wait(1)
repeat task.wait() if workspace:FindFirstChild("Unstable Artifact") then workspace:FindFirstChild("Unstable Artifact").Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end until workspace:FindFirstChild("Unstable Artifact") == nil
if game.Players.LocalPlayer.Backpack:FindFirstChild("Unstable Artifact") then
game.Players.LocalPlayer.Backpack:FindFirstChild("Unstable Artifact").Parent = game.Players.LocalPlayer.Character
repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("Unstable Artifact")
end
game.Players.LocalPlayer.Character:FindFirstChild("Unstable Artifact"):Activate()

elseif game.PlaceId == 118650724506449 then

for i = 1, 10 do
if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(54,50,196)
workspace.rooms["room exit"].EXIT.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
task.wait(.5)
end
end
game:GetService("TeleportService"):Teleport(6403373529)
  
elseif game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then
  
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "You should execute in the dreamscape!",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})

else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Wrong game buddy",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
