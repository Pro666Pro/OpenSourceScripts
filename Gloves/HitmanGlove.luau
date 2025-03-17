
-- This script not tested and it may not work lol

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
if not game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2148934270) then
repeat task.wait()
for i,v in ipairs(game.Players:GetPlayers()) do
if v and v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("Head") and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Character:FindFirstChild("LureMark") == nil and v.Character:FindFirstChild("DeathMark") == nil and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.Head:FindFirstChild("UnoReverseCard") == nil and v.Character.Humanoid.Health ~= 0 then
repeat task.wait()
if game.Players.LocalPlayer.Character:FindFirstChild("entered") and not game.Players.LocalPlayer.leaderstats.Glove.Value == "Track" then
game.Players.LocalPlayer.Reset:FireServer()
wait(5)
end
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
EquipGlove("Track")
EnterPortal("Teleport1")
end
if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.leaderstats.Glove.Value == "Track" then
if game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool") then
game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool").Parent = game.Players.LocalPlayer.Character
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(30,30,30)
task.wait(.8)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
task.wait(.4)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer(v.Character)
task.wait(.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
task.wait(.4)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Baseplate"].CFrame * CFrame.new(0,20,0)
if game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool") then
game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool").Parent = game.Players.LocalPlayer.Character
end
task.wait(.4)
repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Glove.Transparency == 0
end
until v and v.Character and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Character.Humanoid.Health == 0
end
end
until game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2148934270)
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
