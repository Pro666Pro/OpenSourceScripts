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

local quests = game.Players.LocalPlayer:WaitForChild("Quests"):WaitForChild("QuestsActive")

local queststate = quests:GetAttribute("_questChainEasterHunter")

if queststate then
for i,v in pairs(workspace.EasterHuntEggs:GetChildren()) do
if v and v:FindFirstChildWhichIsA("ClickDetector") then
fireclickdetector(v:FindFirstChildWhichIsA("ClickDetector"))
end
end
repeat task.wait() until workspace:FindFirstChild("EggTeleport")
task.wait()
fireclickdetector(workspace.EggTeleport.ClickDetector)  
else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "You should take task from hitman",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end

elseif game.PlaceId == 125704683916 then

while task.wait() do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(69,4240,2)
for i,v in pairs(workspace:GetDescendants()) do
if v and v.Name == "root" and v:FindFirstChildWhichIsA("TouchTransmitter") then
v.CanCollide = false
v.CanTouch = true
v.CanQuery = true
v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end
end
fireproximityprompt(workspace.Kenneth.Head.ProximityPrompt)
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
