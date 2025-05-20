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


if game.PlaceId == 7234087065 then

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.QuestStuff.Key.CFrame
task.wait(1.5)
game:GetService("ReplicatedStorage").RemoteEvents.SuitUpClown:FireServer()
task.wait(.25)
game:GetService("ReplicatedStorage").RemoteEvents.KeyQuest:FireServer()
task.wait(.25)
game:GetService("ReplicatedStorage").RemoteEvents.KeyAcquired:FireServer()
task.wait(.25)
game:GetService("ReplicatedStorage").RemoteEvents.GOHOME:FireServer()
task.wait(.25)
game:GetService("ReplicatedStorage").RemoteEvents.KeyBadgeReward:FireServer()
task.wait(1.5)
  
elseif game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then
  
while task.wait() do game:GetService("TeleportService"):Teleport(7234087065) end

else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Wrong game buddy",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
