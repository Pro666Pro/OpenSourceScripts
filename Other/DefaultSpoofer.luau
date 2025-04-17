-- i know you are here to skid it >:[

 
ScreenGui = Instance.new("ScreenGui")
Frame = Instance.new("Frame")
TextButton = Instance.new("TextButton")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.18982631, 0, 0.0528455302, 0)
Frame.Size = UDim2.new(0, 0, 0, 0)
Frame.Active = true
Frame.Draggable = false
TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(1, 1, 1, 1)
TextButton.Size = UDim2.new(0, 100, 0, 100)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Spoof"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
TextButton.Draggable = true

Spy = false
hit = loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Other/SlapRemotesTable.luau'))()
name = loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Other/SlapRemotesNamesTable.luau'))()
local function SpyHit()
if Spy == false then
game.ReplicatedStorage.b.Name = "BlockedRemote"
if hit[game.Players.LocalPlayer.leaderstats.Glove.Value] ~= nil then
hit[game.Players.LocalPlayer.leaderstats.Glove.Value].Name = "b"
else
game.ReplicatedStorage.GeneralHit.Name = "b"
end
Spy = true
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "DS Enabled!",
	Text = "",
    Icon = "rbxassetid://125704683916878",
	Duration = 10,
	Button1 = "Ok"
})
elseif Spy == true then
if name[game.Players.LocalPlayer.leaderstats.Glove.Value] ~= nil then
game.ReplicatedStorage.b.Name = name[game.Players.LocalPlayer.leaderstats.Glove.Value]
else
game.ReplicatedStorage.b.Name = "GeneralHit"
end
game.ReplicatedStorage.BlockedRemote.Name = "b"
Spy = false
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "DS Disabled!",
	Text = "",
    Icon = "rbxassetid://125704683916878",
	Duration = 10,
	Button1 = "Ok"
})
end
end
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
  if input.KeyCode == Enum.KeyCode.T and not gameProcessedEvent then
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Backpack:FindFirstChild("Default") or game.Players.LocalPlayer.Character:FindFirstChild("Default") then
      SpyHit()
    end
  end
end)
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "DS Loaded",
	Text = "",
    Icon = "rbxassetid://125704683916878",
	Duration = 10,
	Button1 = "Ok"
})
local function OverrideDisable()
if name[game.Players.LocalPlayer.leaderstats.Glove.Value] ~= nil then
game.ReplicatedStorage.b.Name = name[game.Players.LocalPlayer.leaderstats.Glove.Value]
else
game.ReplicatedStorage.b.Name = "GeneralHit"
end
game.ReplicatedStorage.BlockedRemote.Name = "b"
Spy = false
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "DS Disabled!",
	Text = "",
    Icon = "rbxassetid://125704683916878",
	Duration = 10,
	Button1 = "Ok"
})
end
TextButton.MouseButton1Click:Connect(SpyHit)
game:GetService('Players').LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').Died:Connect(OverrideDisable)
