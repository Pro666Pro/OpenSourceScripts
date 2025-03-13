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

if getgenv().AutoGetFanAndBoxerExecuted == true then return end

if getgenv or getgenv() then
getgenv().AutoGetFanAndBoxerExecuted = true
end

local teleport = queueonteleport or queue_on_teleport -- just look at function name bro
if teleport then
    teleport([[
if not game.IsLoaded then
game.Loaded:Wait()
end
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/FanAndBoxerGloves.luau'))()
	]])
else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Your executor doesn't support queueonteleport/queue_on_teleport, please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end

if game.PlaceId == 7234087065 then

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.QuestStuff.Key.CFrame
task.wait(.8)
remotes = {
    [1] = game:GetService("ReplicatedStorage").RemoteEvents.SuitUpClown
    [2] = game:GetService("ReplicatedStorage").RemoteEvents.KeyQuest
    [3] = game:GetService("ReplicatedStorage").RemoteEvents.KeyAcquired
    [4] = game:GetService("ReplicatedStorage").RemoteEvents.GOHOME
    [5] = game:GetService("ReplicatedStorage").RemoteEvents.KeyBadgeReward
}
repeat task.wait until remotes ~= nil
for i,v in ipairs(remotes) do
v:FireServer()
task.wait(.1)
end
task.wait(.8)
if workspace:FindFirstChild("BoxingGloves") == nil then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Buildings.house.TP.CFrame * CFrame.new(0,10,0)
repeat task.wait(.1) until workspace:FindFirstChild("BoxingGloves")
task.wait(.5)
fireclickdetector(workspace.BoxingGloves.ClickDetector)
else
fireclickdetector(workspace.BoxingGloves.ClickDetector)
end
  
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
