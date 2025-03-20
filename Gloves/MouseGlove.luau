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

if getgenv().AutoGetMouseExecuted == true then return end

if getgenv or getgenv() then
getgenv().AutoGetMouseExecuted = true
end

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})


if game.PlaceId == 97220865182663 then

-- Starting game
if workspace.Game.Buildings.City:FindFirstChild("City") == nil then
game:GetService("ReplicatedStorage").Remotes.PlaceBuilding:FireServer("City", Vector3.new(3.125, 43.4450798034668, -57.1875), 0)
end

while task.wait() do
if workspace.Game.Enemies:FindFirstChild("Rat") and workspace.Game.Enemies.Rat:FindFirstChildWhichIsA("Humanoid") then
if workspace.Game.Enemies.Rat.Humanoid.Health ~= 0 then
workspace.Game.Enemies.Rat.Humanoid.Health = 0 -- I tested and this method is faster than firing remotes
end
end
-- If we get 3000 orbs it will automatically win
game:GetService("ReplicatedStorage").Remotes.UnlockGloveWithOrbs:FireServer()
end

elseif game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
if game.Players.LocalPlayer.leaderstats.Slaps.Value >= 11500 then -- Checking for elgato
fireclickdetector(workspace.Lobby["el gato"].ClickDetector) -- Equiping el gato
repeat task.wait(.1) until game.Players.LocalPlayer.leaderstats.Glove.Value == "el gato"
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Lobby["Teleport1"].CFrame
repeat task.wait(.1) until game.Players.LocalPlayer.Character:FindFirstChild("entered") -- Waiting for our character to get teleported to arena
task.wait(.1)
fireclickdetector(workspace.Cheese.ClickDetector) -- clicking this cheesy thing
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
