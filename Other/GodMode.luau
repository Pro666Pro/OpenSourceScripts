-- Fe Godmode Open Source Don't Skid
-- btw ez to make

function EnterPortal(portal, time)
    portal = portal or "Teleport1"
    time = time or 0.8
    task.wait()
    repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") 
    task.wait()
    if workspace.Lobby:FindFirstChild(portal) and workspace.Lobby[portal]:FindFirstChildWhichIsA("Script") and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
        old = workspace.Lobby[portal].CFrame
        workspace.Lobby[portal].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("entered")
        workspace.Lobby[portal].CFrame = old
        task.wait(time)
    end
end
EnterPortal()
local tool = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") or game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool")
tool.Parent = game:GetService("LogService")
game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health = 0
task.wait(5)
for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
if v and v.Name == "Component" and v:FindFirstChild("PlayButtons") then
v:FindFirstChild("PlayButtons").Visible = false
end
end
game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = workspace.Origo.CFrame
tool.Parent = game.Players.LocalPlayer.Backpack
