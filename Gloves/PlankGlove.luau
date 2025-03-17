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

if game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then
  
if game.Players.LocalPlayer.leaderstats.Glove.Value == "Fort" then
old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3000, 100, 5000)
task.wait(.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
task.wait(.5)
game:GetService("ReplicatedStorage").Fortlol:FireServer()
task.wait(4)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
task.wait(.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3000, 110, 4090)
task.wait(.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = old
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
