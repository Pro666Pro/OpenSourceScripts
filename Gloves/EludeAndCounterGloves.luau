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


if game.PlaceId == 11828384869 then

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
task.wait(.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
wait(1)
while task.wait() do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ruins.Elude.Glove.CFrame
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA("ClickDetector") then
fireclickdetector(v)
end
end
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
