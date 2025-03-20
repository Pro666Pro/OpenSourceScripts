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

if getgenv().AutoGetFrostbiteExecuted == true then return end

if getgenv or getgenv() then
getgenv().AutoGetFrostbiteExecuted = true
end

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})


if game.PlaceId == 17290438723 then

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-555, 180, 55)
wait(1)
for i,v in ipairs(workspace:GetDescendants()) do
if v.ClassName == "ProximityPrompt" then
if v.HoldDuration ~= 0 then
v.HoldDuration = 0
end
if v.RequiresLineOfSight ~= false then
v.RequiresLineOfSight = false
end
if v.MaxActivationDistance ~= math.huge then
v.MaxActivationDistance = math.huge
end
v.Enabled = true
fireproximityprompt(v)
end
end
  
elseif game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then
  
while task.wait() do game:GetService("TeleportService"):Teleport(17290438723) end

else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Wrong game buddy",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
