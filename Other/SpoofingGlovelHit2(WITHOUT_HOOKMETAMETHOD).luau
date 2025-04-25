local Spoof = Instance.new("Part")
Spoof.Name = "GlovelSpoofer"
Spoof.Transparency = .5
Spoof.CanCollide = true
Spoof.CanTouch = true
Spoof.Anchored = true
Spoof.Material = Enum.Material.Air
Spoof.Size = Vector3.new(10,.2,10)
Spoof.Parent = workspace

function IfEquippedGlovel()
if game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("leaderstats") and game.Players.LocalPlayer.leaderstats:FindFirstChild("Glove") and game.Players.LocalPlayer.leaderstats.Glove.Value == "Glovel" then
return true
else
return false
end
end

function HasRoot()
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
return true
else
return false
end
end

while task.wait(4) do
if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").StateChanged:Connect(function(_, newState)
if IfEquippedGlovel() and newState == Enum.HumanoidStateType.Freefall or newState == Enum.HumanoidStateType.Jumping or newState == Enum.HumanoidStateType.Ragdoll or game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and game.Players.LocalPlayer.Character.Ragdolled.Value == true then
Spoof.CanCollide = false
else
Spoof.CanCollide = true
end
end)
game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").AnimationPlayed:Connect(function(anim)
if IfEquippedGlovel() and anim.Name == "Slap" and workspace:FindFirstChild("GlovelSpoofer") then
local time = tick()
while tick() - time < 0.5 do
task.wait()
if HasRoot() then
Spoof.CFrame = game.Players.LocalPlayer.Character["HumanoidRootPart"].CFrame * CFrame.new(0,-3.095,0)
end
end
Spoof.CFrame = CFrame.new(0,50,0)
end
end)
end
end
