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

if game.Players.LocalPlayer.leaderstats.Slaps.Value >= 5000 then
doors = 1
for i = 1, 9 do
Old = game.Workspace.PocketDimension.Doors[doors].CFrame
task.wait()
game.Workspace.PocketDimension.Doors[doors].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
task.wait()
game.Workspace.PocketDimension.Doors[doors].CFrame = Old
task.wait(4)
doors = doors + 1
end
else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "You don't have enough slaps",
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
