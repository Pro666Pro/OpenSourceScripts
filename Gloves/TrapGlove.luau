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
    repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("leaderstats") and game.Players.LocalPlayer.leaderstats:FindFirstChild("Glove")   task.wait()

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
	Duration = 36000,
        Button1 = "Ok"
})

if game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then

if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Use in lobby",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
else

EquipGlove("Brick")
EnterPortal("Teleport1")
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Baseplate"].CFrame * CFrame.new(0,10,0)
task.wait(1)
if getconnections then
for i,v in next, getconnections(game.Players.LocalPlayer.Idled) do
v:Disable() 
end
end
local Bricks = 0
local NotifyBrick = Instance.new("Message")
NotifyBrick.Text = "Total bricks placed: 0"
NotifyBrick.Name = "BrickCount"
NotifyBrick.Parent = game.CoreGui
repeat task.wait(5)
game:GetService("ReplicatedStorage").lbrick:FireServer()
Bricks = Bricks + 1
wait()
NotifyBrick.Text = "Total bricks placed: "..Bricks
until Bricks == 1000 or game.Players.LocalPlayer.Character.Humanoid.Health == 0
NotifyBrick.Text = "Congrats! You got trap!"
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
