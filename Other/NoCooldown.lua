while game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 and game.Players.LocalPlayer.Character:FindFirstChild("entered") do
local a = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") or game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool")
local b = a:FindFirstChildWhichIsA("LocalScript"):Clone()
b.Parent = a
task.wait(.05)
end
