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

if getgenv().AutoGetClockExecuted == true then return end

if getgenv or getgenv() then
getgenv().AutoGetClockExecuted = true
end

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})


if game.PlaceId == 102908326578005 then

-- Sorry, at the moment i was lazy to search for click detectors
for i,v in ipairs(workspace:GetDescendants()) do
if v.ClassName == "ClickDetector" then
fireclickdetector(v)
end
end
wait(3)
for i,v in ipairs(workspace:GetDescendants()) do
if v.ClassName == "ClickDetector" then
fireclickdetector(v)
end
end
wait(3)
while task.wait() do game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(26.34327507019043, 4.055271148681641, -1.8455318212509155) end

elseif game.PlaceId == 7234087065 then

while task.wait() do game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(249.473419, 157.87326, -458.792145, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247) end
  
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
