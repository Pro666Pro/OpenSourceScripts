if not game.IsLoaded then
game.Loaded:Wait()
end



function Checkamogus()
DontGetAvatar = false
repeat task.wait() until DontGetAvatar ~= nil

if DontGetAvatar == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3258, -65, 824)
if not game.IsLoaded then
game.Loaded:Wait()
end
wait(5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["the cube of life"].Part.CFrame
if not game.IsLoaded then
game.Loaded:Wait()
end
wait(5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Big Heart"].CFrame
if not game.IsLoaded then
game.Loaded:Wait()
end
wait(5)
end

end

-- Credits, message is not squished up cuz it looks bad
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Credits to Nexer1234_AnotherAlt",
	Text = "Made by @nexer1234 ( youtube & discord )",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000
})

if getgenv().AutoGetAvatarAndReludeExecuted == true then return end

if getgenv or getgenv() then
getgenv().AutoGetAvatarAndReludeExecuted = true
end

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})


if game.PlaceId == 18550498098 then

Checkamogus()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3258, -65, 824)
if not game.IsLoaded then
game.Loaded:Wait()
end
wait(5)
for i,v in pairs(workspace:GetDescendants()) do
if v.Name == "ShackLever" and v:FindFirstChildWhichIsA("ClickDetector") then
fireclickdetector(v:FindFirstChildWhichIsA("ClickDetector"))
end
end
repeat task.wait(.1) until workspace.Map.Components:FindFirstChild("GuideNPC")
task.wait(.8)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(599, 250, -322)
task.wait(.8)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true

while task.wait(.1) do
if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then
game.Players.LocalPlayer.Backpack.Lantern.Parent = game.Players.LocalPlayer.Character
end
game:GetService("ReplicatedStorage").Remotes.Data.AnswerInCutscene:FireServer("Spare")

for i,v in pairs(workspace:GetChildren()) do

if v.Name == "PusherWall" then
v.CanCollide = false
end

if v.Name == "DungeonGolem" and v:FindFirstChild("Cube.001") then
if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
game.Players.LocalPlayer.Character.Lantern:Activate()
game.Players.LocalPlayer.Character.Lantern.Network:FireServer("Hit", v["Cube.001"])
end
end

if v.Name == "golem" and v:FindFirstChild("Hitbox") then
if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
game.Players.LocalPlayer.Character.Lantern:Activate()
game.Players.LocalPlayer.Character.Lantern.Network:FireServer("Hit", v.Hitbox)
end
end

if v.Name == "ReplicaNPC" and v:FindFirstChild("HumanoidRootPart") then
if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
game.Players.LocalPlayer.Character.Lantern:Activate()
game.Players.LocalPlayer.Character.Lantern.Network:FireServer("Hit", v.HumanoidRootPart)
end
end

if v.Name == "GuideNPC" and v:FindFirstChild("HumanoidRootPart") then
if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
game.Players.LocalPlayer.Character.Lantern:Activate()
game.Players.LocalPlayer.Character.Lantern.Network:FireServer("Hit", v.HumanoidRootPart)
end
end

if v.Name == "TrackGloveMissile" then
if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
game.Players.LocalPlayer.Character.Lantern:Activate()
game.Players.LocalPlayer.Character.Lantern.Network:FireServer("Hit", v)
end
end

end
end

  
elseif game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then
  
for i,v in pairs(workspace.BountyHunterRoom:GetChildren()) do
if v and v:IsA('Model') and v:FindFirstChild('Meshes/boxshadow_Cube.005') then
if v["Meshes/boxshadow_Cube.005"].PlayerCounter.SurfaceGui.TextLabel.Text == "0/4 Hunters" then
if v["Meshes/boxshadow_Cube.005"].Counter.SurfaceGui.TextLabel.Text ~= "1" then
repeat task.wait(.1) until v["Meshes/boxshadow_Cube.005"].Counter.SurfaceGui.TextLabel.Text == "1"
end
while task.wait() do game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v["Meshes/boxshadow_Cube.005"].Hitbox.CFrame end
else
repeat task.wait(.1) until v["Meshes/boxshadow_Cube.005"].PlayerCounter.SurfaceGui.TextLabel.Text == "0/4 Hunters"
if v["Meshes/boxshadow_Cube.005"].Counter.SurfaceGui.TextLabel.Text ~= "1" then
repeat task.wait(.1) until v["Meshes/boxshadow_Cube.005"].Counter.SurfaceGui.TextLabel.Text == "1"
end
while task.wait() do game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v["Meshes/boxshadow_Cube.005"].Hitbox.CFrame end
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
