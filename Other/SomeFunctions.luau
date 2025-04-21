--[[
Main Configuration & Functions

FirePrompt(Instance) - Fires proximity prompt
Example: FirePrompt(Workspace.Part.ProximityPrompt)

RequireService(Service) - Requires service
Example: RequireService(game:GetService("Workspace"))

BlockInstance(Instance) - Blocks Instance
Example: BlockInstance(Workspace.Part) or BlockInstance(ReplicatedStorage.Remote) and etc.

HasRoot() - Checks if player have humanoidrootpart
Example: if HasRoot() then { doing something } end

GetRoot() - Returns player humanoidrootpart
Example: GetRoot().CFrame = workspace.Part.CFrame

ScanChildren(Parent, Name) - Checks for children in parent
Example: ScanChildren(Workspace.cherry_storage, "Cherry ")

ScanDescendant(Parent, Name) - Same as ScanChildren(), but scans descendants
Example: ScanDescendant(Workspace, "Cherry ")

GloveValue() - Returns player current equipped glove
Example: if GloveValue() == "spin" then { doing something } end

SlapsValue() - Returns player current slaps
Example: if SlapsValue() >= 28000 then { doing something } end

Slap(args, mode) - Slaps something, first argument is arguments for slapping, and second argument is mode. Theres two modes: 1 and 2. 1 is slap with current equipped glove, 2 is slap with default glove
Example: Slap({[1]=workspace.Nexer.HumanoidRootPart;[2]=true}, 1)
 
HasGlove(GloveName) - Checks if player have glove
Example: if HasGlove("God's Hand") then { doing something } end

EquipGlove(GloveName, HowMuchTimeToWaitAfterEquipping) - Equips glove
Example: EquipGlove("Replica")

RandomGlove(UnderSlaps) - Returns Random Glove
Example: print(RandomGlove(50)) { It printed "Default" }

List of portals:
"Teleport1" - Normal Arena
"Teleport2" - Default Arena

EnterPortal(PortalName) - Enters Portal
Example: EnterPortal("Teleport2")

GetRandomPlayer() - Returns random player in arena
Example: GetRoot().CFrame = GetRandomPlayer().Character.HumanoidRootPart.CFrame

DisableDeathBarrier() - Disables collision with death barriers

EnableDeathBarrier() - Enables collision with death barriers

]]--
game = game or Ugc
BigNumber = 9e9 or math.huge or 500000
FirePrompt = function(instance) if instance and instance:IsA("ProximityPrompt") and fireproximityprompt then instance.HoldDuration = 0; instance.RequiresLineOfSight = false; instance.MaxActivationDistance = BigNumber; fireproximityprompt(instance) end end
RequireService = cloneref or function(clone) return clone end
BlockInstance = function(ez) ez.Name = "BlockedInstance_"..math.random(0,500000).."" ez.Parent = RequireService(game:GetService("LogService")) ez:Destroy() end
Workspace = RequireService(game:GetService("Workspace"))
ReplicatedStorage = RequireService(game:GetService("ReplicatedStorage"))
Players = RequireService(game:GetService("Players"))
LogService = RequireService(game:GetService("LogService"))
CoreGui = RequireService(game:GetService("CoreGui"))
HasRoot = function() if Players.LocalPlayer and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return true else return false end end
GetRoot = function() if Players.LocalPlayer and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") end end
ScanChildren = function(ServiceToScanIn, ScanName) if ServiceToScanIn and ScanName then for i,v in pairs(ServiceToScanIn:GetChildren()) do if v and v.Name:find(ScanName) or v.Name:match(ScanName) then return v end end end end
ScanDescendant = function(ServiceToScanIn, ScanName) if ServiceToScanIn and ScanName then for i,v in pairs(ServiceToScanIn:GetDescendants()) do if v and v.Name:find(ScanName) or v.Name:match(ScanName) then return v end end end end
GloveValue = function() if Players.LocalPlayer:FindFirstChild("leaderstats") and Players.LocalPlayer.leaderstats:FindFirstChild("Glove") then return Players.LocalPlayer.leaderstats.Glove.Value end end
SlapsValue = function() if Players.LocalPlayer:FindFirstChild("leaderstats") and Players.LocalPlayer.leaderstats:FindFirstChild("Slaps") then return Players.LocalPlayer.leaderstats.Slaps.Value end end
PlayerName = Players.LocalPlayer.Name
SlapRemotes = loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Other/SlapRemotesTable.luau'))()
SlapNames = loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Other/SlapRemotesNamesTable.luau'))()
Slap = function(args, mode) mode = mode or 1 if mode == 1 then if SlapRemotes[GloveValue()] ~= nil then SlapRemotes[GloveValue()]:FireServer(unpack(args)) else ReplicatedStorage:WaitForChild("GeneralHit"):FireServer(unpack(args)) end elseif mode == 2 then ReplicatedStorage:WaitForChild("b"):FireServer(unpack(args)) end end
SecretPlace = CFrame.new(17895, -20, -3561)
BallerPlace = Workspace.Ballerplate.CFrame * CFrame.new(0,10,0)
Baseplate = Workspace.Baseplate.CFrame * CFrame.new(0,10,0)
DisableDeathBarrier = function() if Workspace:FindFirstChild("DEATHBARRIER") then for i,v in pairs(Workspace.DEATHBARRIER:GetChildren()) do if v:IsA("BasePart") and v.Name == "BLOCK" then v.CanTouch = false end end Workspace.DEATHBARRIER.CanTouch = false Workspace.DEATHBARRIER2.CanTouch = false Workspace.dedBarrier.CanTouch = false Workspace.ArenaBarrier.CanTouch = false Workspace.AntiDefaultArena.CanTouch = false end end
EnableDeathBarrier = function() if Workspace:FindFirstChild("DEATHBARRIER") then for i,v in pairs(Workspace.DEATHBARRIER:GetChildren()) do if v:IsA("BasePart") and v.Name == "BLOCK" then v.CanTouch = true end end Workspace.DEATHBARRIER.CanTouch = true Workspace.DEATHBARRIER2.CanTouch = true Workspace.dedBarrier.CanTouch = true Workspace.ArenaBarrier.CanTouch = true Workspace.AntiDefaultArena.CanTouch = true end end
HasGlove = function(Glove) if Glove and Players.LocalPlayer:FindFirstChild("_unlockedGloves") and Players.LocalPlayer._unlockedGloves:FindFirstChild(Glove) then return Players.LocalPlayer._unlockedGloves:WaitForChild(Glove).Value end end
RandomGlove = function(undervalue) TotalGloves = 0 A = {} undervalue = undervalue or 1000000 if Workspace:FindFirstChild("Lobby") and undervalue then for i,v in pairs(Workspace.Lobby.GloveStands:GetChildren()) do if v and v:FindFirstChild("SlapsInfoPart") and v.SlapsInfoPart:FindFirstChild("SurfaceGui") and v.SlapsInfoPart.SurfaceGui:FindFirstChild("ImageLabel") and v.SlapsInfoPart.SurfaceGui:FindFirstChild("TextLabel") and v.SlapsInfoPart.SurfaceGui:FindFirstChild("TextLabel").Text ~= nil and tonumber(v.SlapsInfoPart.SurfaceGui:FindFirstChild("TextLabel").Text) then if tonumber(v.SlapsInfoPart.SurfaceGui:FindFirstChild("TextLabel").Text) < undervalue then table.insert(A, v.Name) TotalGloves = TotalGloves + 1 end end end if TotalGloves >= 2 then return A[math.random(1, TotalGloves)] end end end

_G.EquipGloveMethod = 1
function EquipGlove(glove, time)
    glove = glove or "Default"
    time = time or 0.4
    task.wait()
    repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("leaderstats") and game.Players.LocalPlayer.leaderstats:FindFirstChild("Glove")
    task.wait()
    if _G.EquipGloveMethod == 1 then
    if workspace:FindFirstChild("Lobby") and workspace.Lobby:FindFirstChild(glove) and workspace.Lobby[glove]:FindFirstChildWhichIsA("ClickDetector") then
        if fireclickdetector or fireclickdetector() then
            fireclickdetector(workspace.Lobby[glove].ClickDetector)
            repeat task.wait() until game.Players.LocalPlayer.leaderstats.Glove.Value == glove
            task.wait(time)
        end
    end
    elseif _G.EquipGloveMethod == 2 then
    if workspace:FindFirstChild("Lobby") and workspace.Lobby:FindFirstChild(glove) then
        for i,v in pairs(game.ReplicatedStorage._NETWORK:GetChildren()) do
		if game.Players.LocalPlayer.leaderstats.Glove.Value == glove then
                break
                end
		if v and v.Name:find("{") or v.Name:match("{") and v:IsA("RemoteEvent") then
                v:FireServer(unpack({[1]=glove;}))
		elseif v and v.Name:find("{") or v.Name:match("{") and v:IsA("RemoteFunction") then
		v:InvokeServer(unpack({[1]=glove;}))
		end
                task.wait(time + .15)
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
    if workspace:FindFirstChild("Lobby") and workspace.Lobby:FindFirstChild(portal) and workspace.Lobby[portal]:FindFirstChildWhichIsA("Script") and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
        old = workspace.Lobby[portal].CFrame
        workspace.Lobby[portal].CanCollide = false
        workspace.Lobby[portal].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("entered")
        workspace.Lobby[portal].CFrame = old
        workspace.Lobby[portal].CanCollide = true
        task.wait(time)
    end
end
function GetRandomPlayer()
local AllPlayers = Players:GetChildren()
local RandomPlayer = AllPlayers[math.random(1, #AllPlayers)]
repeat RandomPlayer = AllPlayers[math.random(1, #AllPlayers)] until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("Ragdolled").Value == false and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid") and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and RandomPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character:FindFirstChild("stevebody") == nil
return RandomPlayer
end
