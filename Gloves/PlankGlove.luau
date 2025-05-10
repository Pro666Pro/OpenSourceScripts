if not game.IsLoaded then
game.Loaded:Wait()
end

pcall(function()
-- Credits, message is not squished up cuz it looks bad
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Credits to Nexer1234_AnotherAlt",
	Text = "Made by @nexer1234 ( youtube & discord )",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
        Button1 = "Ok"
})
end)

if game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then

fireclickdetector(workspace.Lobby.Fort.ClickDetector)

if game.Players.LocalPlayer.leaderstats.Glove.Value == "Fort" then
old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3000, 100, 5000)
task.wait(.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
task.wait(.5)
game:GetService("ReplicatedStorage").Fortlol:FireServer()
task.wait(3)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
local start = tick()
while tick() - start < 2 do
for i,v in ipairs(workspace:GetChildren()) do
if v.Name == "Part" and v:FindFirstChild("brownsmoke") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
end
end
end
else
fireclickdetector(workspace.Lobby.Fort.ClickDetector)
task.wait(1)
old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3000, 100, 5000)
task.wait(.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
task.wait(.5)
game:GetService("ReplicatedStorage").Fortlol:FireServer()
task.wait(3)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
local start = tick()
while tick() - start < 2 do
for i,v in ipairs(workspace:GetChildren()) do
if v.Name == "Part" and v:FindFirstChild("brownsmoke") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
end
end
end
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
