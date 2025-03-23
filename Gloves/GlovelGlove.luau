if not game.IsLoaded then
game.Loaded:Wait()
end

function EquipGlove(glove, time)
    glove = glove or "Default"
    time = time or 0.4
    task.wait()
    repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("leaderstats") and game.Players.LocalPlayer.leaderstats:FindFirstChild("Glove")
    task.wait()
    if workspace.Lobby:FindFirstChild(glove) and workspace.Lobby[glove]:FindFirstChildWhichIsA("ClickDetector") then
        if fireclickdetector or fireclickdetector() then
            fireclickdetector(workspace.Lobby[glove].ClickDetector)
            repeat task.wait() until game.Players.LocalPlayer.leaderstats.Glove.Value == glove
            task.wait(time)
        end
    end
end
function EnterPortal(portal, time)
    portal = portal or "Teleport1"
    time = time or 0.8
    task.wait()
    repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") 
    task.wait()
    if workspace.Lobby:FindFirstChild(portal) and workspace.Lobby[portal]:FindFirstChildWhichIsA("Script") and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
        workspace.Lobby[portal].CanCollide = false
        old = workspace.Lobby[portal].CFrame
        workspace.Lobby[portal].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("entered")
        workspace.Lobby[portal].CFrame = old
        workspace.Lobby[portal].CanCollide = true
        task.wait(time)
    end
end

-- Credits, message is not squished up cuz it looks bad
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Credits to Nexer1234_AnotherAlt",
	Text = "Made by @nexer1234 ( youtube & discord )",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000
})

if game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then
  
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
        task.wait(1)
    end
end
if game.Players.LocalPlayer.Quests.QuestsActive._questChainHitmansHandkerchief.Value == false then
ClickButton(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.HomePage.QuestButton.Button)
for i,v in ipairs(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.QuestsPage:GetChildren()) do
if v.Name == "NewQuestButton" and v:FindFirstChild("Button") and v.Button:FindFirstChild("Title") and v.Button.Title.Text == "A Hunt for the Hunter" then
v.Name = "skibidi"
end
end
repeat task.wait(.1) until game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.QuestsPage:FindFirstChild("skibidi")
ClickButton(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.QuestsPage.skibidi.Button)
ClickButton(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.QuestInfoPage.AcceptQuest, UDim2.new(10000, 0, -10000, 0))
workspace.BountyHunterRoom.BountyHunterBooth._configPart.LeaveRemote:FireServer()
end
EnterPortal("Teleport2")
repeat task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(43, -6, 92)
task.wait(.01)
game:GetService("ReplicatedStorage").DigEvent:FireServer({["index"] = 2,["cf"] = CFrame.new(43, -6, 92, 0, 2, -1, -6, 1, 4, 1, 7, 0)})
until game.Workspace:FindFirstChild("TreasureChestFolder") ~= nil and game.Workspace.TreasureChestFolder:FindFirstChild("TreasureChest") ~= nil
task.wait(1)
game.Workspace.TreasureChestFolder.TreasureChest.OpenRemote:FireServer()
task.wait(1)
game.Players.LocalPlayer.Character.Humanoid.Health = 0
task.wait(5)
workspace.BountyHunterRoom.BountyHunterBooth._activate:Fire()
ClickButton(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.HomePage.QuestButton.Button)
for i,v in ipairs(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.QuestsPage:GetChildren()) do
if v.Name == "NewQuestButton" and v:FindFirstChild("Button") and v.Button:FindFirstChild("Title") and v.Button.Title.Text == "A Hunt for the Hunter" then
v.Name = "skibidi"
end
end
ClickButton(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.QuestsPage.skibidi.Button)
ClickButton(game.Players.LocalPlayer.PlayerGui.QuestHunterComponent.QuestHunter.Element.Main.Main.Page.QuestInfoPage.AcceptQuest, UDim2.new(10000, 0, -10000, 0))
workspace.BountyHunterRoom.BountyHunterBooth._configPart.LeaveRemote:FireServer()
  
else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Wrong game buddy",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
