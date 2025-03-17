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
  
if game.Players.LocalPlayer.leaderstats.Glove.Value == "Tycoon" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17892.921875, -23.757728576660156, -3525.60986328125)
wait(1)
local args = {
    [1] = CFrame.new(17892.921875, -26.257728576660156, -3535.60986328125) * CFrame.Angles(-3.424421279873968e-08, 2.6262986672020115e-14, -9.837128089884573e-08)
}
game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
wait(2)
repeat task.wait()
fireclickdetector(workspace["ÅTycoon"..game.Players.LocalPlayer.Name].Click.ClickDetector)
until game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2236076719770808)
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
