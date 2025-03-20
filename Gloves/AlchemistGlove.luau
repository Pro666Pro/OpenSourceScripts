
-- This script not tested and it may not work lol

if not game.IsLoaded then
game.Loaded:Wait()
end


if workspace:FindFirstChild("Baseplate") == nil then

local S = Instance.new("Part")

S.Name = "Baseplate"

S.Anchored = true

S.CanCollide = true

S.Transparency = 0

S.Position = Vector3.new(-10000, -10000, -10000)

S.Size = Vector3.new(1000, 10, 1000)

S.Parent = workspace

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

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})


-- Credits, message is not squished up cuz it looks bad
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Credits to Nexer1234_AnotherAlt",
	Text = "Made by @nexer1234 ( youtube & discord )",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000
})

if game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then
if not game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2153473254) then
repeat task.wait()
for i,v in ipairs(game.Players:GetPlayers()) do
if v and v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("Head") and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Character:FindFirstChild("LureMark") == nil and v.Character:FindFirstChild("DeathMark") == nil and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.Head:FindFirstChild("UnoReverseCard") == nil and v.Character.Humanoid.Health ~= 0 then
repeat task.wait()
if game.Players.LocalPlayer.Character:FindFirstChild("entered") and not game.Players.LocalPlayer.leaderstats.Glove.Value == "Plague" then
game.Players.LocalPlayer.Reset:FireServer()
wait(5)
end
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
EquipGlove("Ghost")
game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
task.wait(.2)
EquipGlove("Plague")
EnterPortal("Teleport1")
end
if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.leaderstats.Glove.Value == "Plague" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,10,0)
task.wait(0.6)
game.ReplicatedStorage.PlagueHit:FireServer(v.Character:WaitForChild("HumanoidRootPart"),true)
task.wait(0.2)
if game.Players.LocalPlayer.Character.Ragdolled.Value == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
repeat
task.wait()
until game.Players.LocalPlayer.Character.Ragdolled.Value == false
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Baseplate"].CFrame * CFrame.new(0,15,0)
Instance.new("Message",game.CoreGui).Text = "Waiting for player to die..."
repeat task.wait() until v and v.Character and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Character.Humanoid.Health == 0
game.CoreGui:FindFirstChildWhichIsA("Message"):Destroy()
end
until v and v.Character and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Character.Humanoid.Health == 0
end
end
until game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2153473254)
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
