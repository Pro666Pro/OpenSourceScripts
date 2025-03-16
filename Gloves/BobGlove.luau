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
  
if game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2125950512) then
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "You got bob",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
else
EquipGlove("God's Hand")
game:GetService("ReplicatedStorage").TimestopJump:FireServer()
game:GetService("ReplicatedStorage").Timestopchoir:FireServer()
game:GetService("ReplicatedStorage").Timestop:FireServer()
task.wait(5.2)
EquipGlove("Replica")
EnterPortal("Teleport1")
for i = 1, 150000 do
game:GetService("ReplicatedStorage").Duplicate:FireServer(unpack({[1] = true}))
end
wait(3.5)
local PlaceID = game.PlaceId -- This is serverhop to small server
local v0={};local v1="";local v2=os.date("!*t").hour;local v3=false;local v4=pcall(function() v0=game:GetService("HttpService"):JSONDecode(readfile("SmallServerServerHop-Nexer1234.json"));end);if  not v4 then table.insert(v0,v2);writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));end function TPReturner() local v5;if (v1=="") then v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100" ));else v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100&cursor="   .. v1 ));end local v6="";if (v5.nextPageCursor and (v5.nextPageCursor~="null") and (v5.nextPageCursor~=nil)) then v1=v5.nextPageCursor;end local v7=0;for v8,v9 in pairs(v5.data) do local v10=true;v6=tostring(v9.id);if (tonumber(v9.maxPlayers)>tonumber(v9.playing)) then for v12,v13 in pairs(v0) do if (v7~=0) then if (v6==tostring(v13)) then v10=false;end elseif (tonumber(v2)~=tonumber(v13)) then local v14=pcall(function() delfile("SmallServerServerHop-Nexer1234.json");v0={};table.insert(v0,v2);end);end v7=v7 + 1 ;end if (v10==true) then table.insert(v0,v6);wait();pcall(function() writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));wait();game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID,v6,game.Players.LocalPlayer);end);wait(4);end end end end function Teleport() while wait() do pcall(function() TPReturner();if (v1~="") then TPReturner();end end);end end
task.wait()
while task.wait() do Teleport() end
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
