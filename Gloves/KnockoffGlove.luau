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

if game.Players.LocalPlayer.Character:FindFirstChild("entered") and not game.Players.LocalPlayer.leaderstats.Glove.Value == "Pocket" then
game.Players.LocalPlayer.Reset:FireServer()
wait(5)
end
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
EquipGlove("Pocket")
EnterPortal("Teleport1")
end
if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.leaderstats.Glove.Value == "Pocket" then
local args = {
    [1] = CFrame.new(219.38075256347656, -18.416065216064453, -8.94283676147461, -0.9094663262367249, 0.41577762365341187, -5.250707957316081e-08, -5.4057522902439814e-08, 8.041761034860428e-09, 1, 0.41577762365341187, 0.9094663262367249, 1.5162196831397523e-08)
}
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(unpack(args))
task.wait(.6)
for i,v in ipairs(workspace:GetChildren()) do
if string.find(game.Players.LocalPlayer.Name, "'s Pocket") and v:FindFirstChild("Hitbox") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Hitbox.CFrame
end
end
task.wait(.8)
for i,v in ipairs(workspace:GetChildren()) do
if string.find(game.Players.LocalPlayer.Name, "'s Pocket") and v:FindFirstChildWhichIsA("ProximityPrompt") then
fireproximityprompt(v:FindFirstChildWhichIsA("ProximityPrompt"))
end
end
task.wait(4)
for i,v in ipairs(workspace:GetDescendants()) do
if string.find(v.Name, "'s Room") and v:FindFirstChild("Frame") and v.Frame:FindFirstChildWhichIsA("ProximityPrompt") and v.Frame:FindFirstChild("Meshes/jojoframe_Plane.007") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Frame:FindFirstChild("Meshes/jojoframe_Plane.007").CFrame
task.wait(.8)
fireproximityprompt(v.Frame:FindFirstChildWhichIsA("ProximityPrompt"))
end
end
task.wait(2)
fireclickdetector(game.Workspace.RoomsFolder[game.Players.LocalPlayer.Name.."'s Room"].PocketKeypad.Buttons.Reset.ClickDetector)
wait(.5)
fireclickdetector(game.Workspace.RoomsFolder[game.Players.LocalPlayer.Name.."'s Room"].PocketKeypad.Buttons["4"].ClickDetector)
wait(.5)
fireclickdetector(game.Workspace.RoomsFolder[game.Players.LocalPlayer.Name.."'s Room"].PocketKeypad.Buttons["5"].ClickDetector)
wait(.5)
fireclickdetector(game.Workspace.RoomsFolder[game.Players.LocalPlayer.Name.."'s Room"].PocketKeypad.Buttons["5"].ClickDetector)
wait(.5)
fireclickdetector(game.Workspace.RoomsFolder[game.Players.LocalPlayer.Name.."'s Room"].PocketKeypad.Buttons["3"].ClickDetector)
wait(.5)
fireclickdetector(game.Workspace.RoomsFolder[game.Players.LocalPlayer.Name.."'s Room"].PocketKeypad.Buttons["2"].ClickDetector)
wait(.5)
fireclickdetector(game.Workspace.RoomsFolder[game.Players.LocalPlayer.Name.."'s Room"].PocketKeypad.Buttons["9"].ClickDetector)
wait(.5)
fireclickdetector(game.Workspace.RoomsFolder[game.Players.LocalPlayer.Name.."'s Room"].PocketKeypad.Buttons["3"].ClickDetector)
wait(.5)
fireclickdetector(game.Workspace.RoomsFolder[game.Players.LocalPlayer.Name.."'s Room"].PocketKeypad.Buttons.Enter.ClickDetector)
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
