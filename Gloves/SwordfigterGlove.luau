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

if getgenv().AutoGetSwordfighterExecuted == true then return end

if getgenv or getgenv() then
getgenv().AutoGetSwordfighterExecuted = true
end

function ClickButton(button, size)
    textbutton = button
	size = size or UDim2.new(10000, 0, 10000, 0)
    task.wait()
    if textbutton and textbutton.ClassName == "TextButton" or textbutton.ClassName == "ImageButton" then
        textbutton.Size = size
        task.wait()
        repeat task.wait() until textbutton.Size == size
        task.wait()
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):ClickButton1(Vector2.new())
    end
end

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})


if game.PlaceId == 117232463555132 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.Components.NPCs.FinalBoss.FinalBoss.Head.CFrame * CFrame.new(0,10,0)
task.wait(3)
workspace.Map.Components.NPCs.FinalBoss.FinalBoss:FindFirstChildWhichIsA("Humanoid").RigType = "R15"
workspace.Map.Components.NPCs.FinalBoss.FinalBoss:FindFirstChildWhichIsA("Humanoid").Health = 0
repeat task.wait() until game.Players.LocalPlayer.PlayerGui.SkipButton.SkipDialogueButton.Visible == true
task.wait()
repeat task.wait() until game.Players.LocalPlayer.PlayerGui.SkipButton.SkipDialogueButton.Visible == false
while task.wait() do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.Components.GloveIsland.ClaimGlove.CFrame
fireproximityprompt(workspace.Map.Components.GloveIsland.ClaimGlove:FindFirstChildWhichIsA("ProximityPrompt"))
end
elseif game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then
for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
if v:IsA("BasePart") and v.CanCollide == true then
v.CanCollide = false
end
end
task.wait(.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(316,40,196)
task.wait(1)
game.ReplicatedStorage.RetroAbility:FireServer("Ban Hammer")
task.wait(2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(310,34,191)

else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Wrong game buddy",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
