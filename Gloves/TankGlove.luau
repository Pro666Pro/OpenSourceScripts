if not game.IsLoaded then
game.Loaded:Wait()
end

_G.EquipGloveMethod = 1
function EquipGlove(glove, time)
    glove = glove or "Default"
    time = time or 0.4
    task.wait()
    repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("leaderstats") and game.Players.LocalPlayer.leaderstats:FindFirstChild("Glove")
    task.wait()
    if _G.EquipGloveMethod == 1 then
    if workspace.Lobby:FindFirstChild(glove) and workspace.Lobby[glove]:FindFirstChildWhichIsA("ClickDetector") then
        if fireclickdetector or fireclickdetector() then
            fireclickdetector(workspace.Lobby[glove].ClickDetector)
            repeat task.wait() until game.Players.LocalPlayer.leaderstats.Glove.Value == glove
            task.wait(time)
        end
    end
    elseif _G.EquipGloveMethod == 2 then
    if workspace.Lobby:FindFirstChild(glove) then
        for i,v in pairs(game.ReplicatedStorage._NETWORK:GetChildren()) do
            if v and v.Name:find("{") or v.Name:match("{") and v:IsA("RemoteEvent") then
		            if game.Players.LocalPlayer.leaderstats.Glove.Value == glove then
                break
                end
                v:FireServer(unpack({[1]=glove;}))
                task.wait(time + .15)
	        end
        end
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
        old = workspace.Lobby[portal].CFrame
        workspace.Lobby[portal].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("entered")
        workspace.Lobby[portal].CFrame = old
        task.wait(time)
    end
end
function CheckGlove(glove)
    glove = glove or "Default"
    task.wait()
    repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("_unlockedGloves")
    task.wait()
    if game.Players.LocalPlayer._unlockedGloves:FindFirstChild(glove) then
        return game.Players.LocalPlayer._unlockedGloves:FindFirstChild(glove).Value
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
if CheckGlove("Shotgun") ~= true or CheckGlove("Pillow") ~= true then return end
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
EquipGlove("Pillow")
game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack({[1]=CFrame.new(17894.3867, -20.5577297, -3562.97974, 0.999158919, -1.34026186e-08, -0.04100601, 1.42693359e-08, 1, 2.08436735e-08, 0.04100601, -2.14112692e-08, 0.999158919);}))
for i = 1, 200 do
game:GetService("ReplicatedStorage").Events.PillowEvent:FireServer("AddPillow")
end
task.wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17894.791, -23.6096096, -3577.8042, -0.999188364, 4.7269662e-08, 0.040281646, 4.80706674e-08, 1, 1.89165021e-08, -0.040281646, 2.08375148e-08, -0.999188364)
task.wait(3)
EquipGlove("Shotgun")
repeat task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17894.5547, -20.7577286, -3547.35376, 0.999844074, 3.9351038e-09, -0.0176601317, -3.07407322e-09, 1, 4.87827485e-08, 0.0176601317, -4.87208531e-08, 0.999844074)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer("explosive")
until workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s PillowFort") == nil
else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Use in lobby",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
end
