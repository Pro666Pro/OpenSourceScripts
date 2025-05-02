game:GetService("ReplicatedStorage").Slap.AnimationId = "rbxassetid://133068451086106" -- changing slap animation ( optional )
if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").AnimationPlayed:Connect(function(anim)
if anim.Name == "Slap" then
game:GetService("ReplicatedStorage").Scythe:FireServer("ScytheWeapon")
end
end)
end
