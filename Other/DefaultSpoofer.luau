-- i know you are here to skid it >:[
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
game:GetService('Players').LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').Died:Connect(OverrideDisable)
