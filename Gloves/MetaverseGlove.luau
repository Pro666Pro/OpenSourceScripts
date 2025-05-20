if not game.IsLoaded then
game.Loaded:Wait()
end

-- Credits, message is not squished up cuz it looks bad
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Credits to Nexer1234_AnotherAlt",
	Text = "Made by @nexer1234 ( youtube & discord )",
        Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Thanks!"
})

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})



if game.PlaceId == 136005148166028 then

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Please don't move and don't touch anything!",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Ok i guess."
})

local Platform = (game.UserInputService.TouchEnabled and not game.UserInputService.MouseEnabled) and "Mobile" or "PC"
fireclickdetector(workspace.Kitchen.Fridge.HitBox.ClickDetector)
task.wait(1)
fireclickdetector(workspace.Kitchen.Fridge.GrantAward.ClickDetector)
task.wait(1)
fireclickdetector(workspace.Microwave.HitBox.ClickDetector)
task.wait(10)
fireclickdetector(workspace.Microwave.HitBox.ClickDetector)
task.wait(1)
fireclickdetector(workspace.Microwave.Brewzucki.ClickDetector)
task.wait()
repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Brewzucki")
task.wait()
if game.Players.LocalPlayer.Backpack:FindFirstChild("Brewzucki") then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Brewzucki"])
task.wait(1)
game.Players.LocalPlayer.Character["Brewzucki"]:Activate()
task.wait(2)
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
if game.Players.LocalPlayer.Backpack:FindFirstChild("Brewzucki") then
game.Players.LocalPlayer.Backpack["Brewzucki"]:Destroy()
else
game.Players.LocalPlayer.Character["Brewzucki"]:Destroy()
end
else
game.Players.LocalPlayer.Character["Brewzucki"]:Activate()
task.wait(2)
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
if game.Players.LocalPlayer.Backpack:FindFirstChild("Brewzucki") then
game.Players.LocalPlayer.Backpack["Brewzucki"]:Destroy()
else
game.Players.LocalPlayer.Character["Brewzucki"]:Destroy()
end
end
task.wait(5)
fireclickdetector(workspace.BasementTable.HitBox.ClickDetector)
task.wait(15)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ComputerChair.Seat.CFrame
task.wait(5)
local start = tick()
while tick() - start < 30 do  -- copy paste it into your script i dare you
for i,v in pairs(game.Players.LocalPlayer.PlayerGui.RealComputerScreenGui.ComputerScreen.SuggestionsQTE:GetChildren()) do
if v and v.Name:find("Popup_") then
v.Position = game.Players.LocalPlayer.PlayerGui.RealComputerScreenGui.ComputerScreen.SuggestionsQTE.RecyclingBin.Position
end
end
task.wait()
end
task.wait(2)
game:GetService("ReplicatedStorage").Remotes.ComputerState:FireServer("Victory")
task.wait(.25)
game:GetService("ReplicatedStorage").Remotes.ComputerState:Destroy()
game.Players.LocalPlayer.PlayerGui.RealComputerScreenGui.Enabled = false
game.Players.LocalPlayer.Character.Humanoid.Sit = false
task.wait(1.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-14,37,49)
task.wait(2)
repeat task.wait()
if Platform == "Mobile" then
if game.Players.LocalPlayer.PlayerGui.DavidShrineQTE.DavidShrineQTE.Mobile.SpawnArea:FindFirstChild("TapLabel") then
game.Players.LocalPlayer.PlayerGui.DavidShrineQTE.DavidShrineQTE.Mobile.SpawnArea.TapLabel.Size = UDim2.new(10000, 0, 10000, 0)
game:GetService("VirtualUser"):CaptureController()
game:GetService("VirtualUser"):ClickButton1(Vector2.new())
end
elseif Platform == "PC" then
if game.Players.LocalPlayer.PlayerGui.DavidShrineQTE.DavidShrineQTE.PC.QuickTimeLabel.Visible == true then
game:GetService("VirtualInputManager"):SendKeyEvent(true, game.Players.LocalPlayer.PlayerGui.DavidShrineQTE.DavidShrineQTE.PC.QuickTimeLabel.Text, false, game:GetService("VirtualInputManager"))
end
end
until game.Players.LocalPlayer.PlayerGui.DavidShrineQTE.DavidShrineQTE.ScoreLabel.Text == "Score: 150"

elseif game.PlaceId == 7234087065 then


repeat task.wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(250, 95, -62830) until workspace.Buildings:FindFirstChild("wizard twoer 2")
task.wait(1.5)
while task.wait() do
for i,v in pairs(workspace.Buildings["wizard twoer 2"]:GetChildren()) do
if v.Name == "Model" and v:FindFirstChild("Trigger") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChild("Trigger").CFrame
end
end
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
