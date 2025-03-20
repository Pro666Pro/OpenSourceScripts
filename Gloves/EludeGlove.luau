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

if getgenv().AutoGetEludeExecuted == true then return end

if getgenv or getgenv() then
getgenv().AutoGetEludeExecuted = true
end

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})


if game.PlaceId == 11828384869 then

if firetouchinterest or firetouchinterest() then
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game.Workspace.Ruins.Elude.Glove, 0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game.Workspace.Ruins.Elude.Glove, 1)
else
game.Workspace.Ruins.Elude.Glove.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart
end
  
elseif game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then
  
while task.wait() do game:GetService("TeleportService"):Teleport(11828384869) end

else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Wrong game buddy",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
