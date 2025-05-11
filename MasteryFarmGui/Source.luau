--[[

   _____                   __                            ___________                            ________      .__ 
  /     \ _____    _______/  |_  ___________ ___.__.     \_   _____/____ _______  _____        /  _____/ __ __|__|
 /  \ /  \\__  \  /  ___/\   __\/ __ \_  __ <   |  |      |    __) \__  \\_  __ \/     \      /   \  ___|  |  \  |
/    Y    \/ __ \_\___ \  |  | \  ___/|  | \/\___  |      |     \   / __ \|  | \/  Y Y  \     \    \_\  \  |  /  |
\____|__  (____  /____  > |__|  \___  >__|   / ____|      \___  /  (____  /__|  |__|_|  /      \______  /____/|__|
        \/     \/     \/            \/       \/               \/        \/            \/              \/          




___.                                                  ____________  ________     _____    
\_ |__ ___.__.        ____   ____ ___  ___ __________/_   \_____  \ \_____  \   /  |  |   
 | __ <   |  |       /    \_/ __ \\  \/  // __ \_  __ \   |/  ____/   _(__  <  /   |  |_  
 | \_\ \___  |      |   |  \  ___/ >    <\  ___/|  | \/   /       \  /       \/    ^   /  
 |___  / ____|      |___|  /\___  >__/\_ \\___  >__|  |___\_______ \/______  /\____   |   
     \/\/                \/     \/      \/    \/                  \/       \/      |__| 



Mastery Farm Gui.

Owned by Nexer1234.

Everything is mine, i did not borrow or skid anything to make this script.
]]--

--[[
Using coregui, but if executor can't access coregui, workspace will be used
]]--
pcall(function()
    local host = game:GetService("CoreGui") or game:GetService("Workspace")
    HintGui = Instance.new("Hint")
    HintGui.Text = "Mastery Farm Gui Loading... ( Loading Script )"
    HintGui.Name = "HintGui"
    HintGui.Parent = host
end)

HintGui.Text = "Mastery Farm Gui Loading... ( Loading Variables & Functions )"
--[[
Global variables ( and some functions ).
]]--
_G.IsUserPremium = false -- This is responsible for whether the user has a premium or not, don't change it bucko 🤠
_G.IsUserFollowed = false -- This is responsible for whether the user is followed me or not, don't change it too
EnterPortal = function(a,b) a = a or "Teleport1"; b = b or 0.6; pcall(function() NEX:EnterPortal(a,b) end) end
EquipGlove = function(a,b) a = a or "Default"; b = b or 0.4; pcall(function() NEX:EquipGlove(a,b) end) end

game = game or Ugc -- game itself
--[[
Adding cloneref, only for requiring services
]]--
if not cloneref then
function cloneref(q)
if game:FindService(q.Name) or q.Parent == game or game:GetService(q.Name) then
return q
else
local a = q:Clone()
a.Parent = q.Parent
end
end
end

function FakeMastery(GloveName)
hookfunction(require(game.ReplicatedFirst.Dependencies.GloveMasteryClient).IsMasteredVersionEnabled, function(self, glove)
    return glove == GloveName
end)
end

--[[
Loading module-script. This is absolutely required, or else script will fcking explode! ( script won't work )
]]--
HintGui.Text = "Mastery Farm Gui Loading... ( Loading Modules )"
local success, error = pcall(function()
NEX = loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Modules/SlapBattlesModuleScript.lua'))()
end)
if not success then

ErrorMessage = error

pcall(function()
local host = game:GetService("CoreGui") or game:GetService("Workspace")
MessageGui = Instance.new("Message")
MessageGui.Text = "Your executor failed loading modules... Please try again!"
MessageGui.Name = "MessageGui"
MessageGui.Parent = host
end)

HintGui.Text = "Error Code: "..ErrorMessage..""
task.wait(5)
pcall(function()
MessageGui:Destroy()
HintGui:Destroy()
end)
return
end

--[[
Creating gethui function if it doesn't exists yet
]]--
pcall(function()
    local srvc = game:GetService("CoreGui") or game.CoreGui
    if getgenv then
        getgenv().gethui = function() return srvc end
    end
    _G.gethui = function() return srvc end
    gethui = function() return srvc end
end)



--[[
Bypassing anti-cheat.
]]--
HintGui.Text = "Mastery Farm Gui Loading... ( Loading Anti-Cheat Bypass )"
pcall(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/BypassAntiCheat/main/main.lua'))()
end)


-- notification function
function notify(title, content, time, mode)
time = time or 10
mode = mode or false
if mode == true then
img = 136186846844342
elseif mode == false then
img = 71508738660632
end
Rayfield:Notify({
	Title = title,
	Content = content,
	Duration = time,
	Image = img,
	Actions = {},
})
end

-- turn table to string. nexer edition 😎 ( ttostring --> tabletostring )
function ttostring(tbl)
    if type(tbl) == "table" then
        local result
        for i, v in ipairs(tbl) do
            result = tostring(v)
            if i < #tbl then
                 result = result .. ", "
            end
        end
        result = result
        return result
    else
        return tbl
    end
end



HintGui.Text = "Mastery Farm Gui Loading... ( Loading Components )"


-- Function that generates baseplate
function GenerateBaseplates()
if workspace:FindFirstChild("Baseplate") then
workspace:FindFirstChild("Baseplate"):Destroy()
end
if workspace:FindFirstChild("WormholeBaseplateFixed") then
workspace:FindFirstChild("WormholeBaseplateFixed"):Destroy()
end
if workspace:FindFirstChild("Baseplate") == nil then
local S = Instance.new("Part")
S.Name = "Baseplate"
S.Anchored = true
S.CanCollide = true
S.Transparency = 0
S.Position = Vector3.new(math.random(-20000,-10000),math.random(-20000,-10000),math.random(-20000,-10000))
S.Size = Vector3.new(2000, 10, 2000)
S.Parent = workspace
S.Color = Color3.new(math.random(0,255),math.random(0,255),math.random(0,255))
end
if workspace:FindFirstChild("WormholeBaseplate") == nil then
local grass = game.Workspace.Arena["island4"].Grass
local Baseplate = grass:Clone()
Baseplate.Position = Vector3.new(math.random(-20000,-10000),math.random(-20000,-10000),math.random(-20000,-10000))
Baseplate.Size = Vector3.new(1,1000,1000)
Baseplate.Parent = workspace
Baseplate.Name = "WormholeBaseplate"
Baseplate.Anchored = true
Baseplate.CanCollide = true
Baseplate.Transparency = 0
end
if workspace:FindFirstChild("Ballerplate") == nil then
local S = Instance.new("Part")
S.Name = "Ballerplate"
S.Anchored = true
S.CanCollide = true
S.Transparency = 0
S.Position = Vector3.new(-950,600,950)
S.Size = Vector3.new(20, 10, 20)
S.Parent = workspace
end
if workspace:FindFirstChild("BaseplateForCloudHideSpot1") == nil then
local SA = Instance.new("Part")
SA.Name = "BaseplateForCloudHideSpot1"
SA.Anchored = true
SA.CanCollide = true
SA.Transparency = 0
SA.Position = Vector3.new(-680,22,500)
SA.Size = Vector3.new(20, 10, 20)
SA.Parent = workspace
end
if workspace:FindFirstChild("BaseplateForCloudHideSpot2") == nil then
local Sf = Instance.new("Part")
Sf.Name = "BaseplateForCloudHideSpot2"
Sf.Anchored = true
Sf.CanCollide = true
Sf.Transparency = 0
Sf.Position = Vector3.new(730,128,-600)
Sf.Size = Vector3.new(20, 10, 20)
Sf.Parent = workspace
end
end

GenerateBaseplates()


-- Hooking TP ( For Flash Mastery )
local stop, start, lastpos, hc

function HookTP()
hc = game:GetService("RunService").Heartbeat:Connect(function()
if stop then return end 
lastpos = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RootPart.CFrame
end)
game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RootPart:GetPropertyChangedSignal("CFrame"):Connect(function()
if getgenv().HookingFlash == true and game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlashEffect") then
stop = true
game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RootPart.CFrame = lastpos
game:GetService("RunService").Heartbeat:Wait()
stop = false
end
if getgenv().SlapAfterTeleport == true then
for i,v in pairs(game.Players:GetPlayers()) do
if v and v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
if Magnitude <= 15 then
NEX:Slap({[1]=v.Character:FindFirstChild("HumanoidRootPart")})
end
end
end
end
end)

game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Died:Connect(function()
hc:Disconnect()
end)

end

game:GetService("Players").LocalPlayer.CharacterRemoving:Connect(function()
hc:Disconnect()
end)

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(character)
repeat game:GetService("RunService").Heartbeat:Wait() until character:FindFirstChildWhichIsA("Humanoid")
repeat game:GetService("RunService").Heartbeat:Wait() until character:FindFirstChildWhichIsA("Humanoid").RootPart
HookTP()
end)

HookTP()





--Booting up orion.
HintGui.Text = "Mastery Farm Gui Loading... ( Booting Up Library )"
OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/Pro666Pro/DraggableOrionLib/main/main.lua")))()




BigNumber = 9e9 or math.huge or 5000000
RequireService = cloneref or function(clone) return clone end
FirePrompt = function(instance) if instance and instance:IsA("ProximityPrompt") and fireproximityprompt then instance.HoldDuration = 0; instance.RequiresLineOfSight = false; instance.MaxActivationDistance = BigNumber; fireproximityprompt(instance) end end
BlockInstance = function(ez) ez.Name = "BlockedInstance_"..math.random(0,500000).."" ez.Parent = RequireService(game:GetService("LogService")) ez:Destroy() end
Workspace = RequireService(game:GetService("Workspace"))
ReplicatedStorage = RequireService(game:GetService("ReplicatedStorage"))
Players = RequireService(game:GetService("Players"))
LocalPlayer = Players.LocalPlayer
PlayerName = LocalPlayer.Name
LogService = RequireService(game:GetService("LogService"))
CoreGui = RequireService(game:GetService("CoreGui"))
ScanChildren = function(ServiceToScanIn, ScanName) if ServiceToScanIn and ScanName then for i,v in pairs(ServiceToScanIn:GetChildren()) do if v and v.Name:find(ScanName) or v.Name:match(ScanName) then return v end end end end
ScanDescendant = function(ServiceToScanIn, ScanName) if ServiceToScanIn and ScanName then for i,v in pairs(ServiceToScanIn:GetDescendants()) do if v and v.Name:find(ScanName) or v.Name:match(ScanName) then return v end end end end
SecretPlace = CFrame.new(17895, -20, -3561)
WormholeBaseplate = Workspace.WormholeBaseplate.CFrame * CFrame.new(0,10,0)
Baseplate = Workspace.Baseplate.CFrame * CFrame.new(0,10,0)
Ballerplate = Workspace.Ballerplate.CFrame * CFrame.new(0,10,0)
FirstCloudSpot = Workspace["BaseplateForCloudHideSpot1"].CFrame * CFrame.new(0,10,0)
SecondCloudSpot = Workspace["BaseplateForCloudHideSpot2"].CFrame * CFrame.new(0,10,0)

function randomplr()
local AllPlayers = Players:GetChildren()
local RandomPlayer = AllPlayers[math.random(1, #AllPlayers)]
repeat task.wait() RandomPlayer = AllPlayers[math.random(1, #AllPlayers)] until RandomPlayer and RandomPlayer ~= LocalPlayer and RandomPlayer.Character and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character:FindFirstChild("RobTransformed") == nil and RandomPlayer.Character:FindFirstChild("stevebody") == nil and RandomPlayer.Character:FindFirstChild("Ragdolled").Value == false and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid") and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and RandomPlayer.Character:FindFirstChild("Head") and RandomPlayer.Character.Head:FindFirstChild("ScreamParticles") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoReverseCard") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoDraw4Card") == nil and RandomPlayer.Character.Head.BrickColor ~= "New Yeller" and RandomPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character.HumanoidRootPart:FindFirstChild("BlackheartREAL") == nil and RandomPlayer.Character:FindFirstChild("Torso") and RandomPlayer.Character.Torso:FindFirstChild("BuddyBox") == nil and RandomPlayer.Character.HumanoidRootPart:FindFirstChild("BlockedShield") == nil and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and Players.LocalPlayer.Character:FindFirstChild("Ragdolled").Value == false and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and Players.LocalPlayer.Character:FindFirstChild("entered")
return RandomPlayer
end

--[[

All module-script functions!

NEX:HasCharacter(player) -- Checks if player have character

NEX:HasRoot(char) -- Checks if player have root part

NEX:HasHumanoid(char) -- Checks if player have humanoid

NEX:GetCharacter(player) -- Returns player character

NEX:GetRoot(char) -- Returns player root part

NEX:GetHumanoid(char) -- Returns player humanoid

NEX:SetCFrame(part, position, higher, height) -- Sets cframe of anything
Example: ModuleScript:SetCFrame(ModuleScript:GetRoot(ModuleScript:GetCharacter(Players.LocalPlayer)), CFrame.new(0,0,0), true, 50)

NEX:Kill(humanoid) -- Kills any entity except players but including you

NEX:Reset(waiting, time) -- Resets player

NEX.GetLeaderstats() -- Returns leaderstats folder

NEX.GetSlaps() -- Returns your current slaps value

NEX.GetGlove() -- Returns your current glove value

NEX:EquipGlove(glove, time) -- Equips glove

NEX:EnterPortal(portal, time) -- Enters portal
Example: ModuleScript:NEX:EnterPortal("Teleport1")

List of portals:
"Teleport1" = normal arena
"Teleport2" = default arena

NEX.RandomGlove() -- Returns random glove you have

NEX:HasGlove(glove) -- Checks if player have glove. Returns either false or true

NEX:Slap(args, mode) -- Slaps { literally }

Example: ModuleScript:NEX:Slap({[1]=Players.LocalPlayer.Character.HumanoidRootPart;[2]=true;})

NEX:SetDB(boolval) -- Sets death barrier mode ( false is disable and true is enable )

]]--



local HWIDList = loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/HWID_WhiteList/refs/heads/main/main.lua'))()
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

_G.Premium = _G.IsUserPremium
for i,v in pairs(HWIDList) do
  if v == HWID or game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId,1095975745) then
notify("Whitelisted!", "Thanks For Supporting!", 10, true)
      _G.IsUserPremium = true
      _G.Premium = _G.IsUserPremium
break
  end
end





HintGui.Text = "Mastery Farm Gui Loading... ( Loading Window )"
-- creating window
local Window = OrionLib:MakeWindow({
	IntroText = "Mastery Farm Gui ✨",
	IntroIcon = "rbxassetid://15315284749",
	Name = "Mastery Farm Gui ✨ - by nexer1234",
	HidePremium = false,
	SaveConfig = false,
	ConfigFolder = "MasteryFarm"
})



local Brick = Window:MakeTab({
	Name = "Brick",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Cloud = Window:MakeTab({
	Name = "Cloud",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Wormhole = Window:MakeTab({
	Name = "Wormhole",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Run = Window:MakeTab({
	Name = "Run",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Obby = Window:MakeTab({
	Name = "Obby",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local UltraInstinct = Window:MakeTab({
	Name = "Ultra Instinct",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Killstreak = Window:MakeTab({
	Name = "Killstreak",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Glovel = Window:MakeTab({
	Name = "Glovel",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Bus = Window:MakeTab({
	Name = "Bus",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local REDACTED = Window:MakeTab({
	Name = "[REDACTED]",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Bomb = Window:MakeTab({
	Name = "Bomb",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Rob = Window:MakeTab({
	Name = "Rob",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Spin = Window:MakeTab({
	Name = "Spin",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Fort = Window:MakeTab({
	Name = "Fort",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Engineer = Window:MakeTab({
	Name = "Engineer",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Flash = Window:MakeTab({
	Name = "Flash",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Booster = Window:MakeTab({
	Name = "Booster",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Space = Window:MakeTab({
	Name = "Space",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Shard = Window:MakeTab({
	Name = "Shard",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Phase = Window:MakeTab({
	Name = "Phase",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local MasteryHelper = Window:MakeTab({
	Name = "Mastery Helper",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local Other = Window:MakeTab({
	Name = "Other",
	Icon = "rbxthumb://type=Asset&id=71615493070800&w=150&h=150",
	PremiumOnly = false
})

local MasteryGamepass = MasteryHelper:AddSection({
	Name = "Mastery Helper Gamepass"
})

local MasteryHelperPlayer = MasteryHelper:AddSection({
	Name = "Choose Player Here"
})

local BrickHelper = MasteryHelper:AddSection({
	Name = "Brick Mastery"
})

local CloudHelper = MasteryHelper:AddSection({
	Name = "Cloud Mastery"
})

local WormholeHelper = MasteryHelper:AddSection({
	Name = "Wormhole Mastery"
})

local RunHelper = MasteryHelper:AddSection({
	Name = "Run Mastery"
})

local ObbyHelper = MasteryHelper:AddSection({
	Name = "Obby Mastery"
})

local KillstreakHelper = MasteryHelper:AddSection({
	Name = "Killstreak Mastery"
})

local UltraInstinctHelper = MasteryHelper:AddSection({
	Name = "Ultra Instinct Mastery"
})

local GlovelHelper = MasteryHelper:AddSection({
	Name = "Glovel Mastery"
})

local BusHelper = MasteryHelper:AddSection({
	Name = "Bus Mastery"
})

local REDACTEDHelper = MasteryHelper:AddSection({
	Name = "[REDACTED] Mastery"
})

local BombHelper = MasteryHelper:AddSection({
	Name = "Bomb Mastery"
})

local RobHelper = MasteryHelper:AddSection({
	Name = "Rob Mastery"
})

local FortHelper = MasteryHelper:AddSection({
	Name = "Fort Mastery"
})

local EngineerHelper = MasteryHelper:AddSection({
	Name = "Engineer Mastery"
})

local SpinHelper = MasteryHelper:AddSection({
	Name = "Spin Mastery"
})

local FlashHelper = MasteryHelper:AddSection({
	Name = "Flash Mastery"
})

local BoosterHelper = MasteryHelper:AddSection({
	Name = "Booster Mastery"
})

local SpaceHelper = MasteryHelper:AddSection({
	Name = "Space Mastery"
})

-- notification function
function Notify(title, content, time, mode)
time = time or 10
mode = mode or false
if mode == true then
img = "rbxassetid://136186846844342"
elseif mode == false then
img = "rbxassetid://71508738660632"
end
OrionLib:MakeNotification({
	Name = title,
	Content = content,
	Image = img,
	Time = time
})
end

Brick:AddButton({
	Name = "Enable fake brick mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Brick")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
})  

Brick:AddButton({
    Name = "Equip Brick",
    Callback = function()
NEX:EquipGlove("Brick")
    end
})

Brick:AddButton({
	Name = "Teleport to brick safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 20)
	 end
})   

_G.BrickMasterSpeed = "1x"
Brick:AddDropdown({
	Name = "Speed",
	Default = "1x",
	Options = {"1x", "2x", "3x"},
	Callback = function(Value)
_G.BrickMasterSpeed = Value
	end    
})

Brick:AddButton({
	Name = "Get Brick Master Badge",
	Callback = function()
if NEX:GetCharacter(LocalPlayer):FindFirstChild("entered") and NEX.GetLeaderstats().Glove.Value == "Brick" then

NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 20)

task.wait(5)

repeat
ReplicatedStorage.lbrick:FireServer()
LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text = LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text + 1
if _G.BrickMasterSpeed == "1x" then
task.wait(5)
elseif _G.BrickMasterSpeed == "2x" then
task.wait(3) -- Sorry it's not 2x :)
elseif _G.BrickMasterSpeed == "3x" then
task.wait(1.75)
end
until game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2127567042) or NEX:HasCharacter(LocalPlayer) and NEX:HasRoot(NEX:GetCharacter(LocalPlayer)) and NEX:HasHumanoid(NEX:GetCharacter(LocalPlayer)) and NEX:GetHumanoid(NEX:GetCharacter(LocalPlayer)).Health == 0

else
Notify("Error","You either didn't equip brick, or didn't entered arena.")
end
	 end
})    

_G.BrickSpamAbility = "E Button"
Brick:AddDropdown({
	Name = "Speed",
	Default = "E Button",
	Options = {"E Button", "Remote"},
	Callback = function(Value)
_G.BrickSpamAbility = Value
	end    
})

spamabilbrick = Brick:AddToggle({
	Name = "Spam brick ability { E }",
	Default = false,
	Callback = function(Value)
_G.spamabilbrick = Value
if _G.spamabilbrick == true then

if _G.BrickSpamAbility == "E Button" then

repeat task.wait(.05)
if NEX.GetLeaderstats().Glove.Value == "Brick" then
game:GetService("VirtualInputManager"):SendKeyEvent(true,"E",false,game:GetService("VirtualInputManager"))
end
until _G.spamabilbrick == false

elseif _G.BrickSpamAbility == "Remote" then

repeat task.wait()
if NEX.GetLeaderstats().Glove.Value == "Brick" then
ReplicatedStorage.lbrick:FireServer()
LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text = LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text + 1
task.wait(5)
end
until _G.spamabilbrick == false

end

end
	 end
})    

Brick:AddButton({
	Name = "Fling Brick { Make sure there's no other bricks users }",
	Callback = function()
if NEX:GetCharacter(LocalPlayer):FindFirstChild("entered") and NEX.GetLeaderstats().Glove.Value == "Brick" then

-- Destroying all previous bricks
for i,v in pairs(Workspace:GetChildren()) do
if v.Name == "Union" then
v:Destroy()
end
end

ReplicatedStorage.lbrick:FireServer()
LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text = LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text + 1
repeat task.wait(.05) until Workspace:FindFirstChild("Union")
task.wait(1)
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)),  Workspace:FindFirstChild("Union"), true, 15)


-- Credits To: Infinity Yield

local start = tick()
while tick() - start < 2 and game:GetService("RunService").Heartbeat:Wait() do 
local vel, movel = nil, 0.1
while not (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) do
game:GetService("RunService").Heartbeat:Wait()
end
vel = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
game:GetService("RunService").RenderStepped:Wait()
if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel
end
game:GetService("RunService").Stepped:Wait()
if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel + Vector3.new(0, movel, 0)
movel = movel * -1
end
end



else
Notify("Error","You either didn't equip brick, or didn't entered arena.")
end
	 end
})    

Cloud:AddButton({
	Name = "Enable fake cloud mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Cloud")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
})  

Cloud:AddButton({
    Name = "Equip Cloud",
    Callback = function()
NEX:EquipGlove("Cloud")
    end
})

Cloud:AddButton({
	Name = "Teleport to cloud safe spot",
	Callback = function()
if Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") and NEX:HasCharacter(LocalPlayer) and NEX:HasHumanoid(NEX:GetCharacter(LocalPlayer)) and NEX:GetHumanoid(NEX:GetCharacter(LocalPlayer)).Sit == true then
NEX:SetCFrame(Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat"), CFrame.new(272,13,194), false, 0)
else
Notify("Error","You didn't sit on cloud.")
end
	 end
})   

Cloud:AddButton({
	Name = "Teleport to cloud first hide spot",
	Callback = function()
if Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") and NEX:HasCharacter(LocalPlayer) and NEX:HasHumanoid(NEX:GetCharacter(LocalPlayer)) and NEX:GetHumanoid(NEX:GetCharacter(LocalPlayer)).Sit == true then
NEX:SetCFrame(Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat"), FirstCloudSpot, false, 0)
else
Notify("Error","You didn't sit on cloud.")
end
	 end
})   

Cloud:AddButton({
	Name = "Teleport to cloud second hide spot",
	Callback = function()
if Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") and NEX:HasCharacter(LocalPlayer) and NEX:HasHumanoid(NEX:GetCharacter(LocalPlayer)) and NEX:GetHumanoid(NEX:GetCharacter(LocalPlayer)).Sit == true then
NEX:SetCFrame(Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat"), SecondCloudSpot, false, 0)
else
Notify("Error","You didn't sit on cloud.")
end
	 end
})   


Cloud:AddParagraph("What does Breaking Cloud's Body Gyro do?","This will make cloud rotate very fast, and it'll farm travel task very fast too")

Cloud:AddButton({
	Name = "Break Cloud Body Gyro",
	Default = false,
	Callback = function(Value)
if Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("BodyGyro") then
Workspace[PlayerName.."_Cloud"]:FindFirstChild("BodyGyro").D = 0
end
	 end
})   

_G.CloudTravelSpeed = 10
Cloud:AddTextbox({
	Name = "Travel Speed",
	Default = "10",
	TextDisappear = false,
	Callback = function(Value)
_G.CloudTravelSpeed = tonumber(Value)
	end	  
})

travel = Cloud:AddToggle({
	Name = "Auto-Farm ''Travel'' Task",
	Default = false,
	Callback = function(Value)
_G.travel = Value
if _G.travel == true then
if Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") and NEX:HasCharacter(LocalPlayer) and NEX:HasHumanoid(NEX:GetCharacter(LocalPlayer)) and NEX:GetHumanoid(NEX:GetCharacter(LocalPlayer)).Sit == true then

repeat task.wait()

if Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") and NEX:HasCharacter(LocalPlayer) and NEX:HasHumanoid(NEX:GetCharacter(LocalPlayer)) and NEX:GetHumanoid(NEX:GetCharacter(LocalPlayer)).Sit == true then
game:GetService("TweenService"):Create(Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat"), TweenInfo.new(_G.CloudTravelSpeed), {CFrame = FirstCloudSpot}):Play()
task.wait(_G.CloudTravelSpeed)
game:GetService("TweenService"):Create(Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat"), TweenInfo.new(_G.CloudTravelSpeed), {CFrame = SecondCloudSpot}):Play()
end

until _G.travel == false

else
travel:Set(false)
Notify("Error","You didn't sit on cloud.")
end
end
	 end
})   

surviveintheSKIES = Cloud:AddButton({
	Name = "Auto-Farm ''Survive 200 Minutes'' Task | Rejoin to turn off",
	Callback = function()
game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = workspace.Origo.CFrame * CFrame.new(0,150,0)
NEX:EquipGlove("Cloud")
task.wait(.3)
ReplicatedStorage.CloudAbility:FireServer()
NEX:EquipGlove("Diamond")
NEX:EnterPortal()
repeat task.wait() until workspace:FindFirstChild(PlayerName.."_Cloud")
for i = 1, 10 do
if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit ~= true then
repeat task.wait() game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = workspace:FindFirstChild(PlayerName.."_Cloud").CFrame until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true
end
task.wait(.1)
end
ReplicatedStorage.Rockmode:FireServer()
	 end
})   


_G.CloudDeathFromAboveMethod = "Replica"
Cloud:AddDropdown({
	Name = "Method",
	Default = "Replica",
	Options = {"Replica", "Baller", "Blink", "Null"},
	Callback = function(Value)
_G.CloudDeathFromAboveMethod = Value
	end    
})

Cloud:AddParagraph("WARNING!!!","Make sure you bypassed anti-cheat!")

deathfromabove = Cloud:AddToggle({
	Name = "Auto-Farm ''Death From Above'' Task",
	Default = false,
	Callback = function(Value)
_G.deathfromabove = Value
if _G.deathfromabove == true then

NEX:SetDB(false)

repeat task.wait()

if _G.CloudDeathFromAboveMethod == "Replica" then
NEX.Spawn("Replica")
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), FirstCloudSpot, true, 10)
task.wait(.6)
if NEX.GetGlove() ~= "Cloud" then
NEX:EquipGlove("Cloud")
end
ReplicatedStorage:WaitForChild("CloudAbility"):FireServer()
repeat task.wait() until Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") or _G.deathfromabove == false
if _G.deathfromabove ~= false then
repeat task.wait()
if Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat").CFrame
end
NEX:GetHumanoid(NEX:GetCharacter(LocalPlayer)):ChangeState(Enum.HumanoidStateType.Jumping)
if Workspace:FindFirstChild("Å"..PlayerName) and Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") then
NEX:Slap({[1]=Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart")})
end
until Workspace:FindFirstChild("Å"..PlayerName) == nil or Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or Workspace:FindFirstChild(PlayerName.."_Cloud") == nil or Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") == nil or _G.deathfromabove == false
end


elseif _G.CloudDeathFromAboveMethod == "Baller" then
NEX.Spawn("Baller")
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), FirstCloudSpot, true, 10)
task.wait(.6)
if NEX.GetGlove() ~= "Cloud" then
NEX:EquipGlove("Cloud")
end
ReplicatedStorage:WaitForChild("CloudAbility"):FireServer()
repeat task.wait() until Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") or _G.deathfromabove == false
if _G.deathfromabove ~= false then
repeat task.wait()
if Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat").CFrame
end
NEX:GetHumanoid(NEX:GetCharacter(LocalPlayer)):ChangeState(Enum.HumanoidStateType.Jumping)
if Workspace:FindFirstChild("ÅBaller"..PlayerName) and Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") then
NEX:Slap({[1]=Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart")})
end
until Workspace:FindFirstChild("ÅBaller"..PlayerName) == nil or Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or Workspace:FindFirstChild(PlayerName.."_Cloud") == nil or Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") == nil or _G.deathfromabove == false
end

elseif _G.CloudDeathFromAboveMethod == "Blink" then
NEX.Spawn("Blink")
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), FirstCloudSpot, true, 10)
task.wait(.6)
if NEX.GetGlove() ~= "Cloud" then
NEX:EquipGlove("Cloud")
end
ReplicatedStorage:WaitForChild("CloudAbility"):FireServer()
repeat task.wait() until Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") or _G.deathfromabove == false
if _G.deathfromabove ~= false then
repeat task.wait()
if Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat").CFrame
end
NEX:GetHumanoid(NEX:GetCharacter(LocalPlayer)):ChangeState(Enum.HumanoidStateType.Jumping)
if Workspace:FindFirstChild("Blink_"..PlayerName) and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then
NEX:Slap({[1]=Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")})
end
until Workspace:FindFirstChild("Blink_"..PlayerName) == nil or Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or Workspace:FindFirstChild(PlayerName.."_Cloud") == nil or Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") == nil or _G.deathfromabove == false
end
LocalPlayer.Reset:FireServer()
task.wait(4.5)
if not NEX:HasRoot(NEX:GetCharacter(game:GetService("Players").LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(LocalPlayer))
end

elseif _G.CloudDeathFromAboveMethod == "Null" then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), FirstCloudSpot, true, 10)
task.wait(.6)
if NEX.GetGlove() ~= "Cloud" then
NEX:EquipGlove("Cloud")
end
ReplicatedStorage:WaitForChild("CloudAbility"):FireServer()
repeat task.wait() until Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") or _G.deathfromabove == false
if _G.deathfromabove ~= false then
repeat task.wait()
if Workspace:FindFirstChild("Imp") == nil then
repeat task.wait()
if NEX.GetGlove() ~= "Null" then
NEX:EquipGlove("Null")
end
ReplicatedStorage:WaitForChild("NullAbility"):FireServer()
until Workspace:FindFirstChild("Imp") and Workspace["Imp"]:FindFirstChild("Body")
end
if Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat").CFrame
end
if Workspace:FindFirstChild("Imp") and Workspace["Imp"]:FindFirstChild("Body") then
NEX:GetHumanoid(NEX:GetCharacter(LocalPlayer)):ChangeState(Enum.HumanoidStateType.Jumping)
end
if Workspace:FindFirstChild("Imp") and Workspace["Imp"]:FindFirstChild("Body") then
if NEX.GetGlove() ~= "Cloud" then
NEX:EquipGlove("Cloud")
end
NEX:Slap({[1]=Workspace["Imp"]:FindFirstChild("Body")})
end
until Workspace:FindFirstChild(PlayerName.."_Cloud") == nil or Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") == nil or _G.deathfromabove == false
end

end

until _G.deathfromabove == false

NEX:SetDB(true)


end
	 end
})   



cloudpickup = Cloud:AddToggle({
	Name = "Auto-Farm ''Pick Up People'' Task { People }",
	Default = false,
	Callback = function(Value)
_G.pickuppeople = Value

if _G.pickuppeople == true then
if Workspace:FindFirstChild(PlayerName.."_Cloud") and Workspace[PlayerName.."_Cloud"]:FindFirstChild("VehicleSeat") and NEX:HasCharacter(LocalPlayer) and NEX:HasHumanoid(NEX:GetCharacter(LocalPlayer)) and NEX:GetHumanoid(NEX:GetCharacter(LocalPlayer)).Sit == true then
repeat task.wait()

target = randomplr()
repeat task.wait()
target.Character:WaitForChild("HumanoidRootPart").CFrame = Workspace[PlayerName.."_Cloud"]:FindFirstChild("Seat").CFrame
until target.Character:FindFirstChildWhichIsA("Humanoid").Sit == true
task.wait(.1)
NEX:Slap({[1]=target.Character:WaitForChild("HumanoidRootPart")})
task.wait(.8)

until _G.pickuppeople == false
else
cloudpickup:Set(false)
Notify("Error","You didn't sit on cloud.")
end
end

	 end
})   

Wormhole:AddButton({
	Name = "Enable fake wormhole mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Wormhole")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
})  

Wormhole:AddButton({
    Name = "Equip Wormhole",
    Callback = function()
NEX:EquipGlove("Wormhole")
    end
})

Wormhole:AddButton({
	Name = "Teleport to wormhole safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), WormholeBaseplate, true, 10)
	 end
})   

_G.WormholeAmbushMethod = "People"
Wormhole:AddDropdown({
	Name = "Method",
	Default = "People",
	Options = {"People", "Replica", "Baller", "Blink", "Null"},
	Callback = function(Value)
_G.WormholeAmbushMethod = Value
	end    
})

ambushpeople = Wormhole:AddToggle({
	Name = "Auto-Farm ''Ambush'' & ''Teleport'' Tasks",
	Default = false,
	Callback = function(Value)
_G.ambushpeople = Value

if _G.ambushpeople == true then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 20)
NEX:SetDB(false)
repeat task.wait()

if _G.WormholeAmbushMethod == "People" then
if NEX.GetGlove() ~= "Wormhole" then
NEX:EquipGlove("Wormhole")
end
target = randomplr()
local start = tick()
while tick() - start < .9 do 
if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = target.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-5)
ReplicatedStorage.WormholeTP:FireServer(unpack({[1]=CFrame.new(0,0,0)}))
task.wait()
end
end
ReplicatedStorage.WormholeTP:FireServer(unpack({[1]=CFrame.new(0,0,0)}))
NEX:Slap({[1]=target.Character:WaitForChild("HumanoidRootPart")})
repeat task.wait() until target.Character and target.Character:FindFirstChild("Ragdolled") and target.Character:FindFirstChild("Ragdolled").Value == true

elseif _G.WormholeAmbushMethod == "Replica" then
NEX.Spawn("Replica")
if NEX.GetGlove() ~= "Wormhole" then
NEX:EquipGlove("Wormhole")
end
repeat task.wait() ReplicatedStorage.WormholeTP:FireServer(unpack({[1]=CFrame.new(0,0,0)})) if Workspace:FindFirstChild("Å"..PlayerName) and Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("Å"..PlayerName):WaitForChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Å"..PlayerName) == nil and Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.ambushpeople == false

elseif _G.WormholeAmbushMethod == "Baller" then
NEX.Spawn("Baller")
if NEX.GetGlove() ~= "Wormhole" then
NEX:EquipGlove("Wormhole")
end
repeat task.wait() ReplicatedStorage.WormholeTP:FireServer(unpack({[1]=CFrame.new(0,0,0)})) if Workspace:FindFirstChild("ÅBaller"..PlayerName) and Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("ÅBaller"..PlayerName):WaitForChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("ÅBaller"..PlayerName) == nil and Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.ambushpeople == false

elseif _G.WormholeAmbushMethod == "Blink" then
NEX.Spawn("Blink")
if NEX.GetGlove() ~= "Wormhole" then
NEX:EquipGlove("Wormhole")
end
repeat task.wait() ReplicatedStorage.WormholeTP:FireServer(unpack({[1]=CFrame.new(0,0,0)})) if Workspace:FindFirstChild("Blink_"..PlayerName) and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("Blink_"..PlayerName):WaitForChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Blink_"..PlayerName) == nil and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.ambushpeople == false
LocalPlayer.Reset:FireServer()
task.wait(4.5)
if not NEX:HasRoot(NEX:GetCharacter(game:GetService("Players").LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(LocalPlayer))
end

elseif _G.WormholeAmbushMethod == "Null" then
ReplicatedStorage.WormholeTP:FireServer(unpack({[1]=CFrame.new(0,0,0)}))
if Workspace:FindFirstChild("Imp") == nil then
if NEX.GetGlove() ~= "Null" then
NEX:EquipGlove("Null")
end
ReplicatedStorage.NullAbility:FireServer()
end
if Workspace:FindFirstChild("Imp") and Workspace["Imp"]:FindFirstChild("Body") then
if NEX.GetGlove() ~= "Wormhole" then
NEX:EquipGlove("Wormhole")
end
NEX:Slap({[1]=Workspace["Imp"]:WaitForChild("Body")})
end


end
until _G.ambushpeople == false
NEX:SetDB(true)
end
	 end
})   

teleport = Wormhole:AddToggle({
	Name = "Auto-Farm ''Teleport'' Task",
	Default = false,
	Callback = function(Value)
_G.teleport = Value
if _G.teleport == true then
repeat task.wait()
ReplicatedStorage.WormholeTP:FireServer(unpack({[1]=CFrame.new(0,0,0)}))
until _G.teleport == false
end
	 end
})   

placewormholes = Wormhole:AddToggle({
	Name = "Auto-Farm ''Place Wormholes'' Task",
	Default = false,
	Callback = function(Value)
_G.placewormholes = Value
if _G.placewormholes == true then
repeat task.wait()
ReplicatedStorage.WormholePlace:FireServer()
until _G.placewormholes == false
end
	 end
})   

placewormholesandteleport = Wormhole:AddToggle({
	Name = "Auto-Farm ''Place Wormholes'' & ''Teleport'' Tasks",
	Default = false,
	Callback = function(Value)
_G.placewormholesandteleport = Value
if _G.placewormholesandteleport == true then
repeat task.wait()
ReplicatedStorage.WormholePlace:FireServer()
ReplicatedStorage.WormholeTP:FireServer(unpack({[1]=CFrame.new(0,0,0)}))
until _G.placewormholesandteleport == false
end
	 end
})   

Run:AddButton({
	Name = "Enable fake run mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Run")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
})  

Run:AddButton({
    Name = "Equip Run",
    Callback = function()
NEX:EquipGlove("Run")
    end
})

Run:AddButton({
	Name = "Teleport to run safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})   

autokill = Run:AddToggle({
	Name = "Auto-Kill People In Labyrinth",
	Default = false,
	Callback = function(Value)
_G.autokill = Value
if _G.autokill == true then
repeat task.wait()

for i,v in pairs(game.Players:GetPlayers()) do
if v and v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("InLabyrinth") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChildWhichIsA("Humanoid") then
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Skull") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and game.Players.LocalPlayer.Character.Skull:FindFirstChild("Hitbox") then
repeat task.wait()
local success, response = pcall(function()
v.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.Skull.Hitbox.CFrame
end)
if success then v.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.Skull.Hitbox.CFrame; elseif not success then autokill:Set(false) task.wait() autokill:Set(true) end
until v.Character and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Character:FindFirstChildWhichIsA("Humanoid").Health == 0 or v.Character and v.Character:FindFirstChild("InLabyrinth") == nil or game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Skull") == nil
end
end
end

until _G.autokill == false
end
	 end
})   

relocate = Run:AddToggle({
	Name = "Auto-Farm ''Relocate'' Task",
	Default = false,
	Callback = function(Value)
_G.relocate = Value
if _G.relocate == true then
if NEX.GetGlove() == "Run" then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
repeat task.wait()

if NEX.GetGlove() == "Run" then
ReplicatedStorage.GeneralAbility:FireServer(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).Position)
task.wait(3.5)
end

until _G.relocate == false
else
Notify("Error","You didn't equip run glove.")
relocate:Set(false)
end
end
	 end
})   

Obby:AddButton({
	Name = "Enable fake obby mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Obby")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
})  

Obby:AddButton({
    Name = "Equip Obby",
    Callback = function()
NEX:EquipGlove("Obby")
    end
})

Obby:AddButton({
	Name = "Teleport to obby first hide spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), CFrame.new(241,-14,0), false, 0)
	 end
})   

Obby:AddButton({
	Name = "Teleport to obby second hide spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), CFrame.new(267,20,244), false, 0)
	 end
})   

_G.ObbySlapMethod = "People"
Obby:AddDropdown({
	Name = "Method",
	Default = "People",
	Options = {"People", "Replica", "Baller", "Blink", "Null"},
	Callback = function(Value)
_G.ObbySlapMethod = Value
	end    
})

obbyslaptask = Obby:AddToggle({
	Name = "Auto-Farm ''Slap'' Task",
	Default = false,
	Callback = function(Value)
_G.obbyslaptask = Value

if _G.obbyslaptask == true then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 20)
NEX:SetDB(false)
repeat task.wait()

if _G.ObbySlapMethod == "People" then
if NEX.GetGlove() ~= "Obby" then
NEX:EquipGlove("Obby")
end
target = randomplr()
local start = tick()
while tick() - start < .9 do 
if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = target.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-5)
task.wait()
end
end
NEX:Slap({[1]=target.Character:WaitForChild("HumanoidRootPart")})
repeat task.wait() until target.Character and target.Character:FindFirstChild("Ragdolled") and target.Character:FindFirstChild("Ragdolled").Value == true

elseif _G.ObbySlapMethod == "Replica" then
NEX.Spawn("Replica")
if NEX.GetGlove() ~= "Obby" then
NEX:EquipGlove("Obby")
end
repeat task.wait() if Workspace:FindFirstChild("Å"..PlayerName) and Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("Å"..PlayerName):WaitForChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Å"..PlayerName) == nil and Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.obbyslaptask == false

elseif _G.ObbySlapMethod == "Baller" then
NEX.Spawn("Baller")
if NEX.GetGlove() ~= "Obby" then
NEX:EquipGlove("Obby")
end
repeat task.wait() if Workspace:FindFirstChild("ÅBaller"..PlayerName) and Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("ÅBaller"..PlayerName):WaitForChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("ÅBaller"..PlayerName) == nil and Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.obbyslaptask == false

elseif _G.ObbySlapMethod == "Blink" then
NEX.Spawn("Blink")
if NEX.GetGlove() ~= "Obby" then
NEX:EquipGlove("Obby")
end
repeat task.wait() if Workspace:FindFirstChild("Blink_"..PlayerName) and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("Blink_"..PlayerName):WaitForChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Blink_"..PlayerName) == nil and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.obbyslaptask == false
LocalPlayer.Reset:FireServer()
task.wait(4.5)
if not NEX:HasRoot(NEX:GetCharacter(game:GetService("Players").LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(LocalPlayer))
end

elseif _G.ObbySlapMethod == "Null" then
if Workspace:FindFirstChild("Imp") == nil then
if NEX.GetGlove() ~= "Null" then
NEX:EquipGlove("Null")
end
ReplicatedStorage.NullAbility:FireServer()
end
if Workspace:FindFirstChild("Imp") and Workspace["Imp"]:FindFirstChild("Body") then
if NEX.GetGlove() ~= "Obby" then
NEX:EquipGlove("Obby")
end
NEX:Slap({[1]=Workspace["Imp"]:WaitForChild("Body")})
end


end
until _G.obbyslaptask == false
NEX:SetDB(true)
end
	 end
})   

_G.placeobbypartstype = 1
Obby:AddDropdown({
	Name = "''Place 2000 parts'' Position",
	Default = "Moai Island",
	Options = {"Moai Island", "Cannon Island"},
	Callback = function(Value)
if Value == "Moai Island" then
_G.placeobbypartstype = 1
elseif Value == "Cannon Island" then
_G.placeobbypartstype = 2
end
	end    
})

placealotofparts = Obby:AddToggle({
	Name = "Auto-Farm ''Place 2000 parts'' Task",
	Default = false,
	Callback = function(Value)
_G.placealotofparts = Value
if _G.placealotofparts == true then
if NEX.GetGlove() == "Obby" then
if _G.placeobbypartstype == 1 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(241,-14,0)
task.wait(.5)

repeat task.wait(5.003)
local args = {
    [1] = CFrame.new(247.42665100097656, -18.416065216064453, 5.722263813018799) * CFrame.Angles(0,0,0),
    [2] = math.random(1,2)
}
game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
until _G.placealotofparts == false

elseif _G.placeobbypartstype == 2 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(267,20,244)
task.wait(.5)

repeat task.wait(5.003)
local args = {
    [1] = CFrame.new(262.7769470214844, 10.753130912780762, 239.1548614501953, 0.7494950890541077, -1.9208705737128184e-08, 0.6620099544525146, 4.385903196180152e-08, 1, -2.0639298270452855e-08, -0.6620099544525146, 4.4504165686021224e-08, 0.7494950890541077),
    [2] = 1
}
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(unpack(args))
until _G.placealotofparts == false

end
else
Notify("Error","You didn't equip obby glove.")
placealotofparts:Set(false)
end
end
	 end
})   

Killstreak:AddButton({
	Name = "Enable fake killstreak mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Killstreak")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
})  

Killstreak:AddButton({
    Name = "Equip Killstreak",
    Callback = function()
NEX:EquipGlove("Killstreak")
    end
})

Killstreak:AddButton({
	Name = "Teleport to killstreak safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})   

_G.slaptypekillstreak = 1
Killstreak:AddDropdown({
	Name = "Slap Type",
	Default = "Slap only target",
	Options = {"Slap only target", "Slap everyone who's close enough"},
	Callback = function(Value)
if Value == "Slap everyone who's close enough" then
_G.slaptypekillstreak = 1
elseif Value == "Slap only target" then
_G.slaptypekillstreak = 2
end
	end    
})

_G.killtypeKillstreak = 1
Killstreak:AddDropdown({
	Name = "Target",
	Default = "Everyone",
	Options = {"Everyone", "Specific player"},
	Callback = function(Value)
if Value == "Everyone" then
_G.killtypeKillstreak = 1
elseif Value == "Specific player" then
_G.killtypeKillstreak = 2
end
	end    
})

_G.TargetAndKillKillstreak = "Nexer1234_AnotherAlt"
Killstreak:AddTextbox({
	Name = "Target Player",
	Default = "Nexer1234_AnotherAlt",
	TextDisappear = false,
	Callback = function(Value)
local plrname = Value
local playerfound, ChoosenPlayer
for i,v in pairs(game.Players:GetPlayers()) do
if string.sub(v.Name, 1, #plrname):lower() == plrname:lower() then
playerfound = v
break
end
end
_G.TargetAndKillKillstreak = playerfound.Name
	end	  
})

Killstreak:AddButton({
	Name = "Start Farming Kills | use in lobby, reset to stop",
	Callback = function()
NEX:EquipGlove("Ghost")
ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
wait(.5)
EquipGlove("Killstreak")
EnterPortal()
if _G.CM == nil then
_G.CM = 9e9
end
repeat
for _, plr in pairs(game.Players:GetPlayers()) do
if _G.killtypeKillstreak == 1 and plr ~= game.Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("entered") then
local Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
if Magnitude <= _G.CM then
if plr.Character:FindFirstChild("entered") == nil or plr.Character.Humanoid.Health == 0 then
_G.CM = 9e9
RP = nil
else
_G.CM = Magnitude
RP = plr
end
end
elseif _G.killtypeKillstreak == 2 and plr.Name == _G.TargetAndKillKillstreak and plr ~= game.Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("entered") then
local Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
if Magnitude <= _G.CM then
if plr.Character:FindFirstChild("entered") == nil or plr.Character.Humanoid.Health == 0 then
_G.CM = 9e9
RP = nil
else
_G.CM = Magnitude
RP = plr
end
end
end
end
if RP and _G.CM ~= 9e9 then
if RP.Character and RP.Character:FindFirstChild("entered") then
if game.Players.LocalPlayer.Character:FindFirstChild("entered") and RP.Character:FindFirstChild("entered") and RP.Character:FindFirstChild("HumanoidRootPart") and RP.Character.Ragdolled.Value == false then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = RP.Character:FindFirstChild("Head").CFrame
task.wait(.5)
if _G.slaptypekillstreak == 1 then
for _,ez in ipairs(game.Players:GetPlayers()) do
if ez and ez ~= game.Players.LocalPlayer and ez.Character and ez.Character.HumanoidRootPart then
NEX:Slap({[1]=ez.Character:WaitForChild("Head")})
end
end
elseif _G.slaptypekillstreak == 2 then
NEX:Slap({[1]=RP.Character:WaitForChild("Head")})
end
task.wait(.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["Baseplate"].CFrame * CFrame.new(0,10,0)
end
end
end
task.wait(0.3)
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
	 end
})

UltraInstinct:AddButton({
	Name = "Enable fake ultra instinct mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Ultra Instinct")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
})  

UltraInstinct:AddButton({
    Name = "Equip Ultra Instinct",
    Callback = function()
NEX:EquipGlove("Ultra Instinct")
    end
})

UltraInstinct:AddButton({
	Name = "Teleport to ultra instinct safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})   

_G.TeleportAfterDodge = false
UltraInstinct:AddToggle({
	Name = "Teleport to player after dodge?",
	Default = false,
	Callback = function(Value)
_G.TeleportAfterDodge = Value
	 end
})   

slapafterdodge = UltraInstinct:AddToggle({
	Name = "Auto-Slap After Dodge",
	Default = false,
	Callback = function(Value)
_G.slapafterdodge = Value
if _G.slapafterdodge == true then
if NEX.GetGlove() == "Ultra Instinct" then
repeat task.wait()
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer:FindFirstChild("leaderstats") and game.Players.LocalPlayer.leaderstats:FindFirstChild("Glove") and game.Players.LocalPlayer.leaderstats.Glove.Value == "Ultra Instinct" then
if workspace:FindFirstChild("InstinctPoof") and game.Players.LocalPlayer.Character:FindFirstChild("LastSlappedBy") then
if _G.TeleportAfterDodge == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[game.Players.LocalPlayer.Character.LastSlappedBy.Value].Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-5)
task.wait(.6)
end
game.ReplicatedStorage.GeneralHit:FireServer(game.Players[game.Players.LocalPlayer.Character.LastSlappedBy.Value].Character.HumanoidRootPart)
repeat task.wait() if workspace:FindFirstChild("InstinctPoof") then workspace:FindFirstChild("InstinctPoof"):Destroy() end until workspace:FindFirstChild("InstinctPoof") == nil
end
end
until _G.slapafterdodge == false
else
Notify("Error","You didn't equip ultra instinct glove.")
slapafterdodge:Set(false)
end
end
	 end
})   

Glovel:AddButton({
	Name = "Enable fake glovel mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Glovel")

else
OrionLib:MakeNotification({Name = "Warning",Content = "Your executor doesn't support hookfunction or require. Mastery wasn't enabled.",Image = "rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time = 5})
end
	 end
})  

Glovel:AddButton({
    Name = "Spoof glovel hit { hookmetamethod }",
    Callback = function()
if hookmetamethod and getnamecallmethod then
Notify("Success","Activated Spoof.", 10, true)
local Namecall
Namecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    if method == "FireServer" and tostring(self) == "GeneralHit" and game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("leaderstats") and game.Players.LocalPlayer.leaderstats:FindFirstChild("Glove") and game.Players.LocalPlayer.leaderstats.Glove.Value == "Glovel" then
        local args = {...}
        for i, arg in ipairs(args) do
            if arg == false then
                args[i] = true
            end
        end
        return Namecall(self, unpack(args))
    end
    return Namecall(self, ...)
end)
else
Notify("Error","Your executor doesn't support hookmetamethod or getnamecallmethod! Spoof wasn't enabled.")
end
    end
})

Glovel:AddButton({
    Name = "Spoof glovel hit { air part }",
    Callback = function()
local Spoof = Instance.new("Part")
Spoof.Name = "GlovelSpoofer"
Spoof.Transparency = .5
Spoof.CanCollide = true
Spoof.CanTouch = true
Spoof.Anchored = true
Spoof.Material = Enum.Material.Air
Spoof.Size = Vector3.new(10,.2,10)
Spoof.Parent = workspace
Notify("Success","Activated Spoof.", 10, true)
while task.wait(4) do
if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").StateChanged:Connect(function(_, newState)
if NEX.GetGlove() == "Glovel" and newState == Enum.HumanoidStateType.Freefall or newState == Enum.HumanoidStateType.Jumping or newState == Enum.HumanoidStateType.Ragdoll or LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and LocalPlayer.Character.Ragdolled.Value == true then
Spoof.CanCollide = false
else
Spoof.CanCollide = true
end
end)
game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").AnimationPlayed:Connect(function(anim)
if NEX.GetGlove() == "Glovel" and anim.Name == "Slap" and Workspace:FindFirstChild("GlovelSpoofer") then
local time = tick()
while tick() - time < 0.5 do
task.wait()
if NEX:HasRoot(NEX:GetCharacter(LocalPlayer)) then
Spoof.CFrame = LocalPlayer.Character["HumanoidRootPart"].CFrame * CFrame.new(0,-3.095,0)
end
end
Spoof.CFrame = CFrame.new(0,50,0)
end
end)
end
end
    end
})


Glovel:AddButton({
    Name = "Equip Glovel",
    Callback = function()
NEX:EquipGlove("Glovel")
    end
})

Glovel:AddButton({
	Name = "Teleport to glovel safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})   


Glovel:AddButton({
    Name = "Dig",
    Callback = function()
ReplicatedStorage:WaitForChild("GlovelFunc"):InvokeServer()
    end
})

Glovel:AddButton({
    Name = "Insta-Complete ''Dig'' Task",
    Callback = function()
local scrs = [[
ReplicatedStorage:WaitForChild("GlovelFunc"):InvokeServer()
]]
for i = 1,500 do
loadstring(scrs)()
end
    end
})

autodig = Glovel:AddToggle({
	Name = "Auto-Farm ''Dig'' Task",
	Default = false,
	Callback = function(Value)
_G.autodig = Value
if _G.autodig == true then
if NEX.GetGlove() == "Glovel" then
repeat task.wait(.05)

game:GetService("ReplicatedStorage").GlovelFunc:InvokeServer()

until _G.autodig == false
else
Notify("Error","You didn't equip glovel glove.")
autodig:Set(false)
end

end
	 end
})   

_G.ObbyCriticalHitsMethod = "People"
Glovel:AddDropdown({
	Name = "Method",
	Default = "People",
	Options = {"People", "Replica", "Baller", "Blink", "Null"},
	Callback = function(Value)
_G.ObbyCriticalHitsMethod = Value
	end    
})

glovelcrithitstask = Glovel:AddToggle({
	Name = "Auto-Farm ''Critical Hits'' Tasks",
	Default = false,
	Callback = function(Value)
_G.glovelcrithitstask = Value

if _G.glovelcrithitstask == true then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 20)
NEX:SetDB(false)
repeat task.wait()

if _G.ObbyCriticalHitsMethod == "People" then
if NEX.GetGlove() ~= "Glovel" then
NEX:EquipGlove("Glovel")
end
target = randomplr()
local start = tick()
while tick() - start < .9 do 
if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = target.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-5)
task.wait()
end
end
NEX:Slap({[1]=target.Character:WaitForChild("HumanoidRootPart")})
repeat task.wait() until target.Character and target.Character:FindFirstChild("Ragdolled") and target.Character:FindFirstChild("Ragdolled").Value == true

elseif _G.ObbyCriticalHitsMethod == "Replica" then
NEX.Spawn("Replica")
if NEX.GetGlove() ~= "Glovel" then
NEX:EquipGlove("Glovel")
end
repeat task.wait() if Workspace:FindFirstChild("Å"..PlayerName) and Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("Å"..PlayerName):WaitForChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Å"..PlayerName) == nil and Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.glovelcrithitstask == false

elseif _G.ObbyCriticalHitsMethod == "Baller" then
NEX.Spawn("Baller")
if NEX.GetGlove() ~= "Glovel" then
NEX:EquipGlove("Glovel")
end
repeat task.wait() if Workspace:FindFirstChild("ÅBaller"..PlayerName) and Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("ÅBaller"..PlayerName):WaitForChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("ÅBaller"..PlayerName) == nil and Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.glovelcrithitstask == false

elseif _G.ObbyCriticalHitsMethod == "Blink" then
NEX.Spawn("Blink")
if NEX.GetGlove() ~= "Glovel" then
NEX:EquipGlove("Glovel")
end
repeat task.wait() if Workspace:FindFirstChild("Blink_"..PlayerName) and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("Blink_"..PlayerName):WaitForChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Blink_"..PlayerName) == nil and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.glovelcrithitstask == false
LocalPlayer.Reset:FireServer()
task.wait(4.5)
if not NEX:HasRoot(NEX:GetCharacter(game:GetService("Players").LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(LocalPlayer))
end

elseif _G.ObbyCriticalHitsMethod == "Null" then
if Workspace:FindFirstChild("Imp") == nil then
if NEX.GetGlove() ~= "Null" then
NEX:EquipGlove("Null")
end
ReplicatedStorage.NullAbility:FireServer()
end
if Workspace:FindFirstChild("Imp") and Workspace["Imp"]:FindFirstChild("Body") then
if NEX.GetGlove() ~= "Glovel" then
NEX:EquipGlove("Glovel")
end
NEX:Slap({[1]=Workspace["Imp"]:WaitForChild("Body")})
end


end
until _G.glovelcrithitstask == false
NEX:SetDB(true)
end
	 end
})   

Bus:AddButton({
	Name = "Enable fake bus mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("bus")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
})  

Bus:AddButton({
    Name = "Equip Bus",
    Callback = function()
NEX:EquipGlove("bus")
    end
})

Bus:AddButton({
	Name = "Teleport to bus safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})  

_G.BusSlapMethod = "People"
Bus:AddDropdown({
	Name = "Method",
	Default = "People",
	Options = {"People", "Replica", "Baller", "Blink", "Null"},
	Callback = function(Value)
_G.BusSlapMethod = Value
	end    
})

Busslaptask = Bus:AddToggle({
	Name = "Auto-Farm ''Slap'' Task",
	Default = false,
	Callback = function(Value)
_G.Busslaptask = Value

if _G.Busslaptask == true then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 20)
NEX:SetDB(false)
repeat task.wait()

if _G.BusSlapMethod == "People" then
if NEX.GetGlove() ~= "bus" then
NEX:EquipGlove("bus")
end
target = randomplr()
local start = tick()
while tick() - start < .9 do 
if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = target.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-5)
task.wait()
end
end
NEX:Slap({[1]=target.Character:WaitForChild("HumanoidRootPart")})
repeat task.wait() until target.Character and target.Character:FindFirstChild("Ragdolled") and target.Character:FindFirstChild("Ragdolled").Value == true

elseif _G.BusSlapMethod == "Replica" then
NEX.Spawn("Replica")
if NEX.GetGlove() ~= "bus" then
NEX:EquipGlove("bus")
end
repeat task.wait() if Workspace:FindFirstChild("Å"..PlayerName) and Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("Å"..PlayerName):WaitForChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Å"..PlayerName) == nil and Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.Busslaptask == false

elseif _G.BusSlapMethod == "Baller" then
NEX.Spawn("Baller")
if NEX.GetGlove() ~= "bus" then
NEX:EquipGlove("bus")
end
repeat task.wait() if Workspace:FindFirstChild("ÅBaller"..PlayerName) and Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("ÅBaller"..PlayerName):WaitForChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("ÅBaller"..PlayerName) == nil and Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.Busslaptask == false

elseif _G.BusSlapMethod == "Blink" then
NEX.Spawn("Blink")
if NEX.GetGlove() ~= "bus" then
NEX:EquipGlove("bus")
end
repeat task.wait() if Workspace:FindFirstChild("Blink_"..PlayerName) and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("Blink_"..PlayerName):WaitForChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Blink_"..PlayerName) == nil and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.Busslaptask == false
LocalPlayer.Reset:FireServer()
task.wait(4.5)
if not NEX:HasRoot(NEX:GetCharacter(game:GetService("Players").LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(LocalPlayer))
end

elseif _G.BusSlapMethod == "Null" then
if Workspace:FindFirstChild("Imp") == nil then
if NEX.GetGlove() ~= "Null" then
NEX:EquipGlove("Null")
end
ReplicatedStorage.NullAbility:FireServer()
end
if Workspace:FindFirstChild("Imp") and Workspace["Imp"]:FindFirstChild("Body") then
if NEX.GetGlove() ~= "bus" then
NEX:EquipGlove("bus")
end
NEX:Slap({[1]=Workspace["Imp"]:WaitForChild("Body")})
end


end
until _G.Busslaptask == false
NEX:SetDB(true)
end
	 end
})   

hitskibiditoiletswithbus = Bus:AddToggle({
	Name = "Auto-Farm ''Hit People With Bus'' Task",
	Default = false,
	Callback = function(Value)
_G.hitskibiditoiletswithbus = Value
if _G.hitskibiditoiletswithbus == true then
if NEX.GetGlove() == "bus" then
repeat task.wait()

if NEX.GetGlove() ~= "bus" then
NEX:EquipGlove("bus")
end
target = randomplr()
if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = target.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0,10,0)
end
task.wait(.6)
ReplicatedStorage.busmoment:FireServer()
local start = tick()
while tick() - start < 5.5 do 
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = CFrame.new(0,100,0)
end

until _G.hitskibiditoiletswithbus == false
else
Notify("Error","You didn't equip bus glove.")
hitskibiditoiletswithbus:Set(false)
end
end
	 end
})   

Bus:AddToggle({
	Name = "Auto-Spam bus ability",
	Default = false,
	Callback = function(Value)
_G.busmoment = Value
if _G.busmoment == true then
repeat task.wait()
ReplicatedStorage.busmoment:FireServer()
task.wait(5.5)
until _G.busmoment == false
end
	 end
})   

REDACTED:AddButton({
	Name = "Enable fake [REDACTED] mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("[REDACTED]")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
})  

REDACTED:AddButton({
    Name = "Equip [REDACTED]",
    Callback = function()
NEX:EquipGlove("[REDACTED]")
    end
})

REDACTED:AddButton({
	Name = "Teleport to [REDACTED] safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})   

well = REDACTED:AddToggle({
	Name = "Auto-Farm ''Spawn Portal'' Task",
	Default = false,
	Callback = function(Value)
_G.well = Value
if _G.well == true then
if NEX.GetGlove() == "[REDACTED]" then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
task.wait(.6)
repeat task.wait()
ReplicatedStorage.Well:FireServer()
task.wait(5.5)
until _G.well == false
else
Notify("Error","You didn't equip [REDACTED] glove.")
well:Set(false)
end
end
	 end
})  

Bomb:AddButton({
	Name = "Enable fake bomb mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Bomb")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
})  

Bomb:AddButton({
    Name = "Equip Bomb",
    Callback = function()
NEX:EquipGlove("Bomb")
    end
}) 

Bomb:AddButton({
	Name = "Teleport to bomb safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})  

Bomb:AddButton({
    Name = "Throw 5000 bombs",
    Callback = function()
if NEX.GetGlove() == "Bomb" then
for i = 1, 5000 do
ReplicatedStorage.BombThrow:FireServer("Ebutton")
end
else
Notify("Error","You didn't equip bomb glove.")
end
    end
}) 

_G.bombsnipemethodlol = 1
Bomb:AddDropdown({
	Name = "Snipe Method",
	Default = "Button Click",
	Options = {"Button Click", "Remote Fire"},
	Callback = function(Value)
if Value == "Button Click" then
_G.bombsnipemethodlol = 1
elseif Value == "Remote Fire" then
_G.bombsnipemethodlol = 2
end
	end    
})

BombFarm = Bomb:AddToggle({
	Name = "Auto-Farm ''Snipe'' & ''Throw'' Tasks",
	Default = false,
	Callback = function(Value)
_G.BombFarm = Value
if _G.BombFarm == true then
if NEX.GetGlove() == "Bomb" then
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
NEX:EnterPortal()
end

if _G.bombsnipemethodlol == 1 then

repeat task.wait()
repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart
repeat task.wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Baseplate"].CFrame * CFrame.new(0,200,0) game:GetService("VirtualInputManager"):SendKeyEvent(true,"E",false,game:GetService("VirtualInputManager")) until workspace:FindFirstChild(game.Players.LocalPlayer.Name.."_bømb")
task.wait(.2)
repeat task.wait() if workspace:FindFirstChild(game.Players.LocalPlayer.Name.."_bømb") then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild(game.Players.LocalPlayer.Name.."_bømb").CFrame end until workspace:FindFirstChild(game.Players.LocalPlayer.Name.."_bømb") == nil
task.wait()
repeat task.wait() until game.Players.LocalPlayer.Character.Ragdolled.Value == true
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
task.wait(10.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
until _G.BombFarm == false

elseif _G.bombsnipemethodlol == 2 then

repeat task.wait()
repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart
game.ReplicatedStorage.BombThrow:FireServer("Ebutton")
repeat task.wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Baseplate"].CFrame * CFrame.new(0,200,0) until workspace:FindFirstChild(game.Players.LocalPlayer.Name.."_bømb")
local start = tick()
while tick() - start < 9 do
if workspace:FindFirstChild(game.Players.LocalPlayer.Name.."_bømb") then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild(game.Players.LocalPlayer.Name.."_bømb").CFrame end
task.wait()
end
game.ReplicatedStorage.BombThrow:FireServer("Ebutton")
repeat task.wait() until game.Players.LocalPlayer.Character.Ragdolled.Value == true
if game.Players.LocalPlayer.Character.Ragdolled.Value == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
repeat
task.wait()
until game.Players.LocalPlayer.Character.Ragdolled.Value == false
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end
until _G.BombFarm == false

end

else
Notify("Error","You didn't equip bomb glove.")
BombFarm:Set(false)
end
end
	 end
})  

_G.bombknockmethodlol = 1
Bomb:AddDropdown({
	Name = "Knock Method",
	Default = "Explode & Die",
	Options = {"Explode & Die", "Explode Mid-Air"},
	Callback = function(Value)
if Value == "Explode & Die" then
_G.bombknockmethodlol = 1
elseif Value == "Explode Mid-Air" then
_G.bombknockmethodlol = 2
end
	end    
})

BombFarm = Bomb:AddToggle({
	Name = "Auto-Farm ''Knock'' & ''Throw'' Tasks",
	Default = false,
	Callback = function(Value)
_G.BombFarm = Value
if _G.BombFarm == true then
if NEX.GetGlove() == "Bomb" then

if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
EnterPortal()
end

if _G.bombknockmethodlol == 1 then
repeat task.wait()
repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Baseplate"].CFrame * CFrame.new(0,20,0)
task.wait(.6)
for i = 1, 2 do
game.ReplicatedStorage.BombThrow:FireServer("Ebutton")
task.wait(.05)
end
repeat task.wait() until game.Players.LocalPlayer.Character.Ragdolled.Value == true
task.wait(.1)
old = workspace.DEATHBARRIER.CFrame
task.wait()
repeat task.wait()
workspace.DEATHBARRIER.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
task.wait()
workspace.DEATHBARRIER.CFrame = old
task.wait(4.5)
until _G.BombFarm == false

elseif _G.bombknockmethodlol == 2 then
repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Baseplate"].CFrame * CFrame.new(0,500,0)
task.wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
task.wait(.7)
for i = 1, 2 do
game.ReplicatedStorage.BombThrow:FireServer("Ebutton")
task.wait(.05)
end
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
repeat task.wait(6.1)
for i = 1, 2 do
game.ReplicatedStorage.BombThrow:FireServer("Ebutton")
task.wait(.05)
end
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
until _G.BombFarm == false

end

else
Notify("Error","You didn't equip bomb glove.")
BombFarm:Set(false)
end
end
	 end
})  

Rob:AddButton({
	Name = "Enable fake rob mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("rob")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
})  

Rob:AddButton({
    Name = "Equip Rob",
    Callback = function()
NEX:EquipGlove("rob")
    end
})
Rob:AddButton({
	Name = "Teleport to rob safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})  
Rob:AddButton({
	Name = "Create blackhole",
	Callback = function()
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2125950512) and game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2147429609) then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,100,0)
wait(0.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
wait(1)
NEX:EquipGlove("rob")
wait(.5)
ReplicatedStorage.rob:FireServer(true)
wait(5)
NEX:EquipGlove("bob")
wait(.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
ReplicatedStorage.bob:FireServer()
else
Notify("Error","You either didn't used in lobby, or don't have rob or bob.")
end
	 end
})  

uncliprob = Rob:AddToggle({
	Name = "Rob clip { Always Turn On to Prevent Bugs }",
	Default = false,
	Callback = function(Value)
_G.uncliprob = Value
if _G.uncliprob == true then
repeat task.wait(.005)
if Workspace:FindFirstChild("rob_"..game.Players.LocalPlayer.Name) then
for i,v in pairs(Workspace:GetChildren()) do
if v and v.Name == "rob_"..LocalPlayer.Name.."" and v:FindFirstChildWhichIsA("BasePart") and v:FindFirstChildWhichIsA("BasePart").CanCollide == false then
v:FindFirstChildWhichIsA("BasePart").CanCollide = true
end
end
end
until _G.uncliprob == false
end
	 end
})   

Rob:AddSlider({
	Name = "Walkspeed",
	Min = 20,
	Max = 10000,
	Default = 20,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "WalkSpeed",
	Callback = function(Value)
_G.WalkSpeedLooped = Value
	end    
})

loopwalksp = Rob:AddToggle({
	Name = "Loop change walkspeed",
	Default = false,
	Callback = function(Value)
_G.loopwalksp = Value
if _G.loopwalksp == true then
repeat task.wait()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.WalkSpeedLooped
until _G.loopwalksp == false
end
	 end
})   

_G.RobAbsorbMethod = "People"
Rob:AddDropdown({
	Name = "Method",
	Default = "People",
	Options = {"People", "Replica", "Baller", "Blink"},
	Callback = function(Value)
_G.RobAbsorbMethod = Value
	end    
})

robabsorbtask = Rob:AddToggle({
	Name = "Auto-Farm ''Slap'' Task",
	Default = false,
	Callback = function(Value)
_G.robabsorbtask = Value
if _G.robabsorbtask == true then
repeat task.wait()

if _G.RobAbsorbMethod == "People" then
if NEX.GetGlove() ~= "rob" then
NEX:EquipGlove("rob")
end
game:GetService("ReplicatedStorage").rob:FireServer(true)
task.wait(3.55)
target = randomplr()
for i = 1,50 do
if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
target.Character:WaitForChild("HumanoidRootPart").CFrame = NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame
end
end

elseif _G.RobAbsorbMethod == "Replica" then
NEX.Spawn("Replica")
if NEX.GetGlove() ~= "rob" then
NEX:EquipGlove("rob")
end
ReplicatedStorage.rob:FireServer(true)
task.wait(3.55)
for i = 1,50 do
if Workspace:FindFirstChild("Å"..PlayerName) and Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") then
Workspace:FindFirstChild("Å"..PlayerName):WaitForChild("HumanoidRootPart").CFrame = NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame
end
end

elseif _G.RobAbsorbMethod == "Baller" then
NEX.Spawn("Baller")
if NEX.GetGlove() ~= "rob" then
NEX:EquipGlove("rob")
end
ReplicatedStorage.rob:FireServer(true)
task.wait(3.55)
for i = 1,50 do
if Workspace:FindFirstChild("ÅBaller"..PlayerName) and Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") then
Workspace:FindFirstChild("ÅBaller"..PlayerName):WaitForChild("HumanoidRootPart").CFrame = NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame
end
end

elseif _G.RobAbsorbMethod == "Blink" then
NEX.Spawn("Blink")
if NEX.GetGlove() ~= "rob" then
NEX:EquipGlove("rob")
end
ReplicatedStorage.rob:FireServer(true)
task.wait(3.55)
for i = 1,50 do
if Workspace:FindFirstChild("Blink_"..PlayerName) and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then
Workspace:FindFirstChild("Blink_"..PlayerName):WaitForChild("HumanoidRootPart").CFrame = NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame
end
end
task.wait(.5)
LocalPlayer.Reset:FireServer()
task.wait(4.5)
if not NEX:HasRoot(NEX:GetCharacter(LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(LocalPlayer))
end

end
until _G.robabsorbtask == false
end
	 end
})   

Spin:AddButton({
	Name = "Enable fake spin mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("spin")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
})  

Spin:AddButton({
    Name = "Equip Spin",
    Callback = function()
NEX:EquipGlove("spin")
    end
})
Spin:AddButton({
	Name = "Teleport to spin safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
}) 

Fort:AddButton({
	Name = "Enable fake fort mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Fort")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
})  

Fort:AddButton({
    Name = "Equip Fort",
    Callback = function()
NEX:EquipGlove("Fort")
    end
})

Fort:AddButton({
	Name = "Teleport to fort safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})  

Fort:AddButton({
	Name = "Auto-Get ''Cranking 90's'' badge",
	Callback = function()
if NEX.GetGlove() == "Fort" then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/PlankGlove.luau"))()
else
Notify("Error","You didn't equip fort glove.")
end
	 end
})  

fortez = Fort:AddToggle({
	Name = "Auto-Farm ''Build'' Task",
	Default = false,
	Callback = function(Value)
_G.fortez = Value
if _G.fortez == true then
if NEX.GetGlove() == "Fort" then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
repeat task.wait()
game:GetService("ReplicatedStorage").Fortlol:FireServer()
task.wait(4.5)
until _G.fortez == false
else
Notify("Error","You didn't equip fort glove.")
fortez:Set(false)
end
end
	 end
})  

_G.smashtypefort = 1
Fort:AddDropdown({
	Name = "Smash type",
	Default = "Self Knockback",
	Options = {"Self Knockback", "ZZZZZZZ"},
	Callback = function(Value)
if Value == "Self Knockback" then
_G.smashtypefort = 1
elseif Value == "ZZZZZZZ" then
_G.smashtypefort = 2
end
	end    
})

fortezs = Fort:AddToggle({
	Name = "Auto-Farm ''Build'' & ''Smash'' Task",
	Default = false,
	Callback = function(Value)
_G.fortezs = Value
if _G.fortezs == true then
if game.Players.LocalPlayer.leaderstats.Glove.Value == "Fort" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Baseplate.CFrame * CFrame.new(0,10,0)
task.wait(.5)


if _G.smashtypefort == 1 then
repeat task.wait(2.3)
for i,v in ipairs(workspace:GetChildren()) do
if v.Name == "Part" and v:FindFirstChild("brownsmoke") then
v.Name = "ThisIsProbablyNotMyFort"
end
end
task.wait()
ReplicatedStorage.Fortlol:FireServer()
task.wait(1.3)
ReplicatedStorage.SelfKnockback:FireServer({["Force"] = 1,["Direction"] = Vector3.new(0,0,-10)})
task.wait(.5)
for i,v in ipairs(Workspace:GetChildren()) do
if v.Name == "Part" and v:FindFirstChild("brownsmoke") then
v.CanCollide = false
task.wait()
v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end
end
until _G.fortezs == false
elseif _G.smashtypefort == 2 then
NEX:EquipGlove("ZZZZZZZ")
ReplicatedStorage.ZZZZZZZSleep:FireServer()
task.wait(.5)
EquipGlove("Fort")
repeat task.wait(2)
for i,v in ipairs(workspace:GetChildren()) do
if v.Name == "Part" and v:FindFirstChild("brownsmoke") then
v.Name = "ThisIsProbablyNotMyFort"
end
end
task.wait()
ReplicatedStorage.Fortlol:FireServer()
task.wait(2)
for i,v in ipairs(workspace:GetChildren()) do
if v.Name == "Part" and v:FindFirstChild("brownsmoke") then
v.CanCollide = false
task.wait()
v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end
end
until _G.fortezs == false
EquipGlove("ZZZZZZZ")
ReplicatedStorage.ZZZZZZZSleep:FireServer()
task.wait(.5)
NEX:EquipGlove("Fort")
end
else
Notify("Error","You didn't equip fort glove.")
fortezs:Set(false)
end
end
	 end
})  

Engineer:AddButton({
	Name = "Enable fake engineer mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Engineer")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
})  

Engineer:AddButton({
    Name = "Equip Engineer",
    Callback = function()
NEX:EquipGlove("Engineer")
    end
})
Engineer:AddButton({
	Name = "Teleport to engineer first safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})  
Engineer:AddButton({
	Name = "Teleport to engineer second safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), CFrame.new(17935,-125,-3593), true, 10)
	 end
})  

sentry = Engineer:AddToggle({
	Name = "Auto-Farm ''Place Turret'' Task",
	Default = false,
	Callback = function(Value)
_G.sentry = Value
if _G.sentry == true then
if NEX.GetGlove() == "Engineer" then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
task.wait(.4)
local Spin = Instance.new("BodyAngularVelocity")
Spin.Name = "Spin"
Spin.Parent = NEX:GetRoot(NEX:GetCharacter(LocalPlayer))
Spin.MaxTorque = Vector3.new(0, math.huge, 0)
Spin.AngularVelocity = Vector3.new(0,10,0)
repeat task.wait()
ReplicatedStorage.Sentry:FireServer()
task.wait(6.5)
until _G.sentry == false
Spin:Destroy()
else
Notify("Error","You didn't equip engineer glove.")
sentry:Set(false)
end
end
	 end
})  

sentryp = Engineer:AddToggle({
	Name = "Auto-Slap People",
	Default = false,
	Callback = function(Value)
_G.sentryp = Value
if _G.sentryp == true then
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
local Spin = Instance.new("BodyAngularVelocity")
Spin.Name = "Spin"
Spin.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
Spin.MaxTorque = Vector3.new(0, math.huge, 0)
Spin.AngularVelocity = Vector3.new(0,10,0)
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
task.wait(.6)
repeat task.wait()

if NEX.GetGlove() ~= "Engineer" then
NEX:EquipGlove("Engineer")
end
ReplicatedStorage.Sentry:FireServer()
repeat task.wait() until Workspace:FindFirstChild("Turret") and Workspace.Turret:FindFirstChild("HingePart") and Workspace.Turret.HingePart:FindFirstChild("Glove")
task.wait()
if Workspace:FindFirstChild("Turret") and Workspace.Turret:FindFirstChild("HingePart") and Workspace.Turret.HingePart:FindFirstChild("Glove") then
TurretPlace = Workspace.Turret.HingePart:FindFirstChild("Glove").CFrame
end
local starttime = tick()
while tick() - starttime < 1 do
for i,v in pairs(Players:GetPlayers()) do
if v and v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Character:FindFirstChildWhichIsA("Humanoid").Sit == false and v.Character:FindFirstChild("rock") == nil and v.Character:FindFirstChild("stevebody") == nil then
v.Character.HumanoidRootPart.CFrame = TurretPlace
end
end
task.wait()
end
for i,v in pairs(Players:GetPlayers()) do
if v and v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Character:FindFirstChildWhichIsA("Humanoid").Sit == false and v.Character:FindFirstChild("rock") == nil and v.Character:FindFirstChild("stevebody") == nil then
v.Character.HumanoidRootPart.CFrame = CFrame.new(0,0,0)
end
end
task.wait(5)

until sentryp == false
end
	 end
})  


Flash:AddButton({
	Name = "Enable fake flash mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Flash")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
}) 

getgenv().HookingFlash = false
Flash:AddToggle({
	Name = "Spoof flash teleport { Your position won't be changed }",
	Default = false,
	Callback = function(Value)
getgenv().HookingFlash = Value
	 end
})   

getgenv().SlapAfterTeleport = false
Flash:AddToggle({
	Name = "Slap After Teleport?",
	Default = false,
	Callback = function(Value)
getgenv().SlapAfterTeleport = Value
	 end
})   

Flash:AddButton({
    Name = "Equip Flash",
    Callback = function()
NEX:EquipGlove("Flash")
    end
}) 

Flash:AddButton({
	Name = "Teleport to flash safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})  

Flash:AddButton({
    Name = "Teleport 5000 times",
    Callback = function()
if NEX.GetGlove() == "Flash" then
for i = 1, 5000 do
ReplicatedStorage.FlashTeleport:FireServer()
end
else
Notify("Error","You didn't equip flash glove.")
end
    end
})


_G.FlashAmbushMethod = "People"
Flash:AddDropdown({
	Name = "Method",
	Default = "People",
	Options = {"People", "Replica", "Baller", "Blink", "Null"},
	Callback = function(Value)
_G.FlashAmbushMethod = Value
	end    
})

CanAbilityF = true
function CheckAbilityCD()
if CanAbilityF == false then
return false
else
CanAbilityF = false
task.delay(5.8, function()
CanAbilityF = true
end)
return true
end
end

CanSlapF = true
function CheckSlapCD(time)
local a = time or .3
if CanSlapF == false then
return false
else
CanSlapF = false
task.delay(a, function()
CanSlapF = true
end)
return true
end
end

flashambushtask = Flash:AddToggle({
	Name = "Auto-Farm ''Ambush'' Task",
	Default = false,
	Callback = function(Value)
_G.flashambushtask = Value

if _G.flashambushtask == true then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 20)
NEX:SetDB(false)
repeat task.wait()

if _G.FlashAmbushMethod == "People" then
if NEX.GetGlove() ~= "Flash" then
NEX:EquipGlove("Flash")
end
ReplicatedStorage.FlashTeleport:FireServer()
target = randomplr()
local start = tick()
while tick() - start < 1.1 do 
if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = target.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-5)
if CheckSlapCD() then
NEX:Slap({[1]=target.Character:WaitForChild("HumanoidRootPart")})
end
task.wait()
end
end
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
task.wait(5)

elseif _G.FlashAmbushMethod == "Replica" then
NEX.Spawn("Replica")
if NEX.GetGlove() ~= "Flash" then
NEX:EquipGlove("Flash")
end
repeat task.wait()
if CheckAbilityCD() then
ReplicatedStorage.FlashTeleport:FireServer()
task.delay(1.1, function()
if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlashEffect") then
LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlashEffect"):Destroy()
end
end)
end
if Workspace:FindFirstChild("Å"..PlayerName) and Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlashEffect") then
NEX:Slap({[1]=Workspace:FindFirstChild("Å"..PlayerName):WaitForChild("HumanoidRootPart")})
end
until Workspace:FindFirstChild("Å"..PlayerName) == nil and Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.flashambushtask == false

elseif _G.FlashAmbushMethod == "Baller" then
NEX.Spawn("Baller")
if NEX.GetGlove() ~= "Flash" then
NEX:EquipGlove("Flash")
end
repeat task.wait()
if CheckAbilityCD() then
ReplicatedStorage.FlashTeleport:FireServer()
task.delay(1.1, function()
if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlashEffect") then
LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlashEffect"):Destroy()
end
end)
end
if Workspace:FindFirstChild("ÅBaller"..PlayerName) and Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlashEffect") then
NEX:Slap({[1]=Workspace:FindFirstChild("ÅBaller"..PlayerName):WaitForChild("HumanoidRootPart")})
end
until Workspace:FindFirstChild("ÅBaller"..PlayerName) == nil and Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.flashambushtask == false

elseif _G.FlashAmbushMethod == "Blink" then
NEX.Spawn("Blink")
if NEX.GetGlove() ~= "Flash" then
NEX:EquipGlove("Flash")
end
repeat task.wait()
if CheckAbilityCD() then
ReplicatedStorage.FlashTeleport:FireServer()
task.delay(1.1, function()
if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlashEffect") then
LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlashEffect"):Destroy()
end
end)
end
if Workspace:FindFirstChild("Blink_"..PlayerName) and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlashEffect") then
NEX:Slap({[1]=Workspace:FindFirstChild("Blink_"..PlayerName):WaitForChild("HumanoidRootPart")})
end
until Workspace:FindFirstChild("Blink_"..PlayerName) == nil and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.flashambushtask == false
LocalPlayer.Reset:FireServer()
task.wait(4.5)
if not NEX:HasRoot(NEX:GetCharacter(LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(LocalPlayer))
end

elseif _G.FlashAmbushMethod == "Null" then
if Workspace:FindFirstChild("Imp") == nil then
if NEX.GetGlove() ~= "Null" then
NEX:EquipGlove("Null")
end
ReplicatedStorage.NullAbility:FireServer()
end
if CheckAbilityCD() then
if NEX.GetGlove() ~= "Flash" then
NEX:EquipGlove("Flash")
end
ReplicatedStorage.FlashTeleport:FireServer()
task.delay(1.1, function()
if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlashEffect") then
LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlashEffect"):Destroy()
end
end)
end
if Workspace:FindFirstChild("Imp") and Workspace["Imp"]:FindFirstChild("Body") and LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlashEffect") then
if NEX.GetGlove() ~= "Flash" then
NEX:EquipGlove("Flash")
end
NEX:Slap({[1]=Workspace["Imp"]:WaitForChild("Body")})
end


end
until _G.flashambushtask == false
NEX:SetDB(true)
end
	 end
})   


Booster:AddButton({
	Name = "Enable fake booster mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Booster")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
}) 

Booster:AddButton({
    Name = "Equip Booster",
    Callback = function()
NEX:EquipGlove("Booster")
    end
}) 

Booster:AddButton({
	Name = "Teleport to booster safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})  



_G.BoosterAttachMethod = "People"
Booster:AddDropdown({
	Name = "Method",
	Default = "People",
	Options = {"People", "Replica", "Baller", "Blink"},
	Callback = function(Value)
_G.BoosterAttachMethod = Value
	end    
})

BoosterAttachtask = Booster:AddToggle({
	Name = "Auto-Farm ''Slap'' Task",
	Default = false,
	Callback = function(Value)
_G.BoosterAttachtask = Value

if _G.BoosterAttachtask == true then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 20)
NEX:SetDB(false)
repeat task.wait()

if _G.BoosterAttachMethod == "People" then
if NEX.GetGlove() ~= "Booster" then
NEX:EquipGlove("Booster")
end
target = randomplr()
local start = tick()
while tick() - start < .9 do 
if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = target.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-5)
task.wait()
end
end
NEX:Slap({[1]=target.Character:WaitForChild("HumanoidRootPart")})
repeat task.wait() until target.Character and target.Character:FindFirstChild("Ragdolled") and target.Character:FindFirstChild("Ragdolled").Value == true
repeat task.wait() NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = target.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-5) until target.Character and target.Character:FindFirstChild("Ragdolled") and target.Character:FindFirstChild("Ragdolled").Value == false
NEX:Slap({[1]=target.Character:WaitForChild("HumanoidRootPart")})


elseif _G.BoosterAttachMethod == "Replica" then
NEX.Spawn("Replica")
if NEX.GetGlove() ~= "Booster" then
NEX:EquipGlove("Booster")
end
if Workspace:FindFirstChild("Å"..PlayerName) and Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("Å"..PlayerName):WaitForChild("HumanoidRootPart")}) end
task.wait(.8)
if Workspace:FindFirstChild("Å"..PlayerName) and Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("Å"..PlayerName):WaitForChild("HumanoidRootPart")}) end
task.wait(.5)
Workspace:FindFirstChild("Å"..PlayerName):Destroy()
repeat task.wait() until Workspace:FindFirstChild("Å"..PlayerName) == nil or Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.BoosterAttachtask == false

elseif _G.BoosterAttachMethod == "Baller" then
NEX.Spawn("Baller")
if NEX.GetGlove() ~= "Booster" then
NEX:EquipGlove("Booster")
end
if Workspace:FindFirstChild("ÅBaller"..PlayerName) and Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("ÅBaller"..PlayerName):WaitForChild("HumanoidRootPart")}) end
task.wait(.8)
if Workspace:FindFirstChild("ÅBaller"..PlayerName) and Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("ÅBaller"..PlayerName):WaitForChild("HumanoidRootPart")}) end
task.wait(.5)
Workspace:FindFirstChild("ÅBaller"..PlayerName):Destroy()
repeat task.wait() until Workspace:FindFirstChild("ÅBaller"..PlayerName) == nil or Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.BoosterAttachtask == false

elseif _G.BoosterAttachMethod == "Blink" then
NEX.Spawn("Blink")
if NEX.GetGlove() ~= "Booster" then
NEX:EquipGlove("Booster")
end
if Workspace:FindFirstChild("Blink_"..PlayerName) and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("Blink_"..PlayerName):WaitForChild("HumanoidRootPart")}) end
task.wait(.8)
if Workspace:FindFirstChild("Blink_"..PlayerName) and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("Blink_"..PlayerName):WaitForChild("HumanoidRootPart")}) end
task.wait(.5)
Workspace:FindFirstChild("Blink_"..PlayerName):Destroy()
repeat task.wait() until Workspace:FindFirstChild("Blink_"..PlayerName) == nil or Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.BoosterAttachtask == false
LocalPlayer.Reset:FireServer()
task.wait(4.5)
if not NEX:HasRoot(NEX:GetCharacter(game:GetService("Players").LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(LocalPlayer))
end


end
until _G.BoosterAttachtask == false
NEX:SetDB(true)
end
	 end
})   


Space:AddButton({
	Name = "Enable fake space mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Space")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
}) 

Space:AddButton({
    Name = "Equip Space",
    Callback = function()
EquipGlove("Space")
    end
}) 

Space:AddButton({
	Name = "Teleport to space safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})  

Space:AddToggle({
	Name = "Auto-Farm ''Defy Gravity'' Task",
	Default = false,
	Callback = function(Value)
_G.DefyGravity = Value
if _G.DefyGravity == true then
repeat task.wait()
game:GetService("ReplicatedStorage").ZeroGSound:FireServer()
until _G.DefyGravity == false
end
	 end
})   

Space:AddButton({
	Name = "Fire yourself from cannon to slapple",
	Callback = function()
if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.leaderstats.Glove.Value == "Space" then

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(226,48,168)
task.wait(1.5)
for i,v in ipairs(workspace:GetDescendants()) do
if v.ClassName == "ProximityPrompt" and v.Name == "JumpInPrompt" then
if v.HoldDuration ~= 0 then
v.HoldDuration = 0
end
if v.RequiresLineOfSight ~= false then
v.RequiresLineOfSight = false
end
if v.MaxActivationDistance ~= math.huge then
v.MaxActivationDistance = math.huge
end
v.Enabled = true
fireproximityprompt(v)
end
end
task.wait(1.3)
game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,0,true,game:GetService("VirtualInputManager"),false)
task.wait()
game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,0,false,game:GetService("VirtualInputManager"),false)
task.wait(.7)
if game.Players.LocalPlayer.Backpack:FindFirstChild("Space") then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Space"])
end
game:GetService("ReplicatedStorage").ZeroGSound:FireServer()
task.wait(.5)
local start = tick()
while tick() - start < 3 do
task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-390,48,-14)
end

else
Notify("Error","Your either didn't entered arena, or didn't equipped space glove.")
end
	 end
})  

_G.SpaceAmbushMethod = "People"
Space:AddDropdown({
	Name = "Method",
	Default = "People",
	Options = {"People"},
	Callback = function(Value)
_G.SpaceAmbushMethod = Value
	end    
})

SpaceAmbushtask = Space:AddToggle({
	Name = "Auto-Farm ''Slap'' Task",
	Default = false,
	Callback = function(Value)
_G.SpaceAmbushtask = Value

if _G.SpaceAmbushtask == true then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 20)
NEX:SetDB(false)
repeat task.wait()

if _G.SpaceAmbushMethod == "People" then
if NEX.GetGlove() ~= "Space" then
NEX:EquipGlove("Space")
end
ReplicatedStorage.ZeroGSound:FireServer()
target = randomplr()
local start = tick()
while tick() - start < 3.5 do 
if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = target.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-5)
task.wait()
end
end
local start = tick()
while tick() - start < 3 do 
if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = target.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-5)
if CheckSlapCD(.9) then
NEX:Slap({[1]=target.Character:WaitForChild("HumanoidRootPart")})
end
task.wait()
end
end


end
until _G.SpaceAmbushtask == false
NEX:SetDB(true)
end
	 end
})   



Shard:AddButton({
	Name = "Enable fake shard mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Shard")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
}) 

Shard:AddButton({
    Name = "Equip Shard",
    Callback = function()
NEX:EquipGlove("Shard")
    end
}) 

Shard:AddButton({
	Name = "Teleport to shard safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})  

Shard:AddParagraph("Warning!","Baller is very risky, and null may be buggy.")

Shard:AddDropdown({
	Name = "Method",
	Default = "Blink",
	Options = {"Blink", "Replica", "Baller", "Null"},
	Callback = function(Value)
_G.shardmasteryfarmtype = Value
	end    
})

Shardmasteryslapslapblink = Shard:AddToggle({
	Name = "Auto-Farm ''Debuff'' Task",
	Default = false,
	Callback = function(Value)
_G.Shardmasteryslapslapblink = Value
if _G.Shardmasteryslapslapblink == true then
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.leaderstats.Glove.Value == "Shard" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Baseplate.CFrame * CFrame.new(0,10,0)
repeat task.wait()

if _G.shardmasteryfarmtype == "Blink" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Baseplate.CFrame * CFrame.new(0,10,0)
EquipGlove("Blink")
game:GetService("ReplicatedStorage").Blink:FireServer("OutOfBody", {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default})
EquipGlove("Shard")
repeat task.wait()
if workspace:FindFirstChild("Blink_"..game.Players.LocalPlayer.Name) and workspace["Blink_"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart") then
game.ReplicatedStorage.ShardHIT:FireServer(workspace["Blink_"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart"),true)
end
until workspace:FindFirstChild("Blink_"..game.Players.LocalPlayer.Name) == nil or _G.Shardmasteryslapslapblink == false
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)


elseif _G.shardmasteryfarmtype == "Null" then
if workspace:FindFirstChild("Imp") and workspace.Imp:FindFirstChild("Body") then
if game.Players.LocalPlayer.leaderstats.Glove.Value ~= "Shard" then
EquipGlove("Shard")
end
for i,v in pairs(workspace:GetChildren()) do
if v and v.Name == "Imp" and v:FindFirstChild("Body") then
game.ReplicatedStorage.ShardHIT:FireServer(v:FindFirstChild("Body"),true)
end
end
else
if game.Players.LocalPlayer.leaderstats.Glove.Value ~= "Null" then
EquipGlove("Null")
end
game.ReplicatedStorage.NullAbility:FireServer()
end

elseif _G.shardmasteryfarmtype == "Replica" then
EquipGlove("Replica")
EnterPortal("Teleport2")
task.wait()
repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17895,-20,-3561)
task.wait(.8)
game:GetService("ReplicatedStorage").Duplicate:FireServer(true)
task.wait(.5)
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Baseplate.CFrame * CFrame.new(0,10,0)
EquipGlove("Shard")
repeat task.wait()
if workspace:FindFirstChild("Å"..game.Players.LocalPlayer.Name) and workspace["Å"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart") then
game.ReplicatedStorage.ShardHIT:FireServer(workspace["Å"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart"),true)
end
until workspace:FindFirstChild("Å"..game.Players.LocalPlayer.Name) == nil or _G.Shardmasteryslapslapblink == false
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)


elseif _G.shardmasteryfarmtype == "Baller" then
EquipGlove("Baller")
EnterPortal("Teleport2")
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
task.wait(.5)
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Baseplate.CFrame * CFrame.new(0,10,0)
EquipGlove("Shard")
repeat task.wait()
if workspace:FindFirstChild("ÅBaller"..game.Players.LocalPlayer.Name) and workspace["ÅBaller"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart") then
game.ReplicatedStorage.ShardHIT:FireServer(workspace["ÅBaller"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart"),true)
end
until workspace:FindFirstChild("ÅBaller"..game.Players.LocalPlayer.Name) == nil or _G.Shardmasteryslapslapblink == false
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)


end
until _G.Shardmasteryslapslapblink == false
else
OrionLib:MakeNotification({Name = "Warning",Content = "Use in lobby / Didn't equip shard glove",Image = "rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time = 5})
Shardmasteryslapslapblink:Set(false)
end
end
	 end
}) 

Shardmasteryhitblink = Shard:AddToggle({
	Name = "Auto-Farm ''Hit'' Task",
	Default = false,
	Callback = function(Value)
_G.Shardmasteryhitblink = Value
if _G.Shardmasteryhitblink == true then
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.leaderstats.Glove.Value == "Shard" then
_G.CanUseShard = true
_G.CanUseShardWithEquip = true
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Baseplate.CFrame * CFrame.new(0,10,0)
repeat task.wait()

if _G.shardmasteryfarmtype == "Blink" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Baseplate.CFrame * CFrame.new(0,10,0)
EquipGlove("Blink")
game:GetService("ReplicatedStorage").Blink:FireServer("OutOfBody", {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default})
EquipGlove("Shard")
repeat task.wait()
if workspace:FindFirstChild("Blink_"..game.Players.LocalPlayer.Name) and workspace["Blink_"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart") then
workspace["Blink_"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-20)
if _G.CanUseShard == true then
game:GetService("ReplicatedStorage").Shards:FireServer()
_G.CanUseShard = false
task.delay(4.5, function()
_G.CanUseShard = true
end)
end
end
until workspace:FindFirstChild("Blink_"..game.Players.LocalPlayer.Name) == nil or _G.Shardmasteryhitblink == false
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)


elseif _G.shardmasteryfarmtype == "Null" then
if workspace:FindFirstChild("Imp") and workspace.Imp:FindFirstChild("HumanoidRootPart") then
if _G.CanUseShardWithEquip == true then
EquipGlove("Shard")
game:GetService("ReplicatedStorage").Shards:FireServer()
_G.CanUseShardWithEquip = false
task.delay(4.5, function()
_G.CanUseShardWithEquip = true
end)
end
for i,v in pairs(workspace:GetChildren()) do
if v and v.Name == "Imp" and v:FindFirstChild("HumanoidRootPart") then
v:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-20)
end
end
else
if game.Players.LocalPlayer.leaderstats.Glove.Value ~= "Null" then
EquipGlove("Null")
end
game.ReplicatedStorage.NullAbility:FireServer()
end

elseif _G.shardmasteryfarmtype == "Replica" then
EquipGlove("Replica")
EnterPortal("Teleport2")
task.wait()
repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17895,-20,-3561)
task.wait(.8)
game:GetService("ReplicatedStorage").Duplicate:FireServer(true)
task.wait(.5)
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17895,-20,-3561)
EquipGlove("Shard")
repeat task.wait()
if workspace:FindFirstChild("Å"..game.Players.LocalPlayer.Name) and workspace["Å"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart") then
workspace["Å"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-20)
if _G.CanUseShard == true then
game:GetService("ReplicatedStorage").Shards:FireServer()
_G.CanUseShard = false
task.delay(4.5, function()
_G.CanUseShard = true
end)
end
end
until workspace:FindFirstChild("Å"..game.Players.LocalPlayer.Name) == nil or _G.Shardmasteryhitblink == false
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)


elseif _G.shardmasteryfarmtype == "Baller" then
EquipGlove("Baller")
EnterPortal("Teleport2")
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
task.wait(.5)
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(124,370,-0)
EquipGlove("Shard")
repeat task.wait()
if workspace:FindFirstChild("ÅBaller"..game.Players.LocalPlayer.Name) and workspace["ÅBaller"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart") then
workspace["ÅBaller"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-20)
if _G.CanUseShard == true then
game:GetService("ReplicatedStorage").Shards:FireServer()
_G.CanUseShard = false
task.delay(4.5, function()
_G.CanUseShard = true
end)
end
end
until workspace:FindFirstChild("ÅBaller"..game.Players.LocalPlayer.Name) == nil or _G.Shardmasteryhitblink == false
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)


end
until _G.Shardmasteryhitblink == false
else
OrionLib:MakeNotification({Name = "Warning",Content = "Use in lobby / Didn't equip shard glove",Image = "rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time = 5})
Shardmasteryhitblink:Set(false)
end
end
	 end
}) 

Shardmasteryhitsnipeblink = Shard:AddToggle({
	Name = "Auto-Farm ''Hit'' & ''Snipe'' Tasks",
	Default = false,
	Callback = function(Value)
_G.Shardmasteryhitsnipeblink = Value
if _G.Shardmasteryhitsnipeblink == true then
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.leaderstats.Glove.Value == "Shard" then
_G.CanUseShard = true
_G.CanUseShardWithEquip = true
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Baseplate.CFrame * CFrame.new(0,10,0)
repeat task.wait()

if _G.shardmasteryfarmtype == "Blink" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Baseplate.CFrame * CFrame.new(0,10,0)
EquipGlove("Blink")
game:GetService("ReplicatedStorage").Blink:FireServer("OutOfBody", {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default})
EquipGlove("Shard")
repeat task.wait()
if workspace:FindFirstChild("Blink_"..game.Players.LocalPlayer.Name) and workspace["Blink_"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart") then
workspace["Blink_"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-155)
if _G.CanUseShard == true then
game:GetService("ReplicatedStorage").Shards:FireServer()
_G.CanUseShard = false
task.delay(4.5, function()
_G.CanUseShard = true
end)
end
end
until workspace:FindFirstChild("Blink_"..game.Players.LocalPlayer.Name) == nil or _G.Shardmasteryhitsnipeblink == false
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)


elseif _G.shardmasteryfarmtype == "Null" then
if workspace:FindFirstChild("Imp") and workspace.Imp:FindFirstChild("HumanoidRootPart") then
if _G.CanUseShardWithEquip == true then
EquipGlove("Shard")
game:GetService("ReplicatedStorage").Shards:FireServer()
_G.CanUseShardWithEquip = false
task.delay(4.5, function()
_G.CanUseShardWithEquip = true
end)
end
for i,v in pairs(workspace:GetChildren()) do
if v and v.Name == "Imp" and v:FindFirstChild("HumanoidRootPart") then
v:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-155)
end
end
else
if game.Players.LocalPlayer.leaderstats.Glove.Value ~= "Null" then
EquipGlove("Null")
end
game.ReplicatedStorage.NullAbility:FireServer()
end

elseif _G.shardmasteryfarmtype == "Replica" then
EquipGlove("Replica")
EnterPortal("Teleport2")
task.wait()
repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17895,-20,-3561)
task.wait(.8)
game:GetService("ReplicatedStorage").Duplicate:FireServer(true)
task.wait(.5)
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17895,-20,-3561)
EquipGlove("Shard")
repeat task.wait()
if workspace:FindFirstChild("Å"..game.Players.LocalPlayer.Name) and workspace["Å"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart") then
workspace["Å"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-155)
if _G.CanUseShard == true then
game:GetService("ReplicatedStorage").Shards:FireServer()
_G.CanUseShard = false
task.delay(4.5, function()
_G.CanUseShard = true
end)
end
end
until workspace:FindFirstChild("Å"..game.Players.LocalPlayer.Name) == nil or _G.Shardmasteryhitsnipeblink == false
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)


elseif _G.shardmasteryfarmtype == "Baller" then
EquipGlove("Baller")
EnterPortal("Teleport2")
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
task.wait(.5)
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(124,370,-0)
EquipGlove("Shard")
repeat task.wait()
if workspace:FindFirstChild("ÅBaller"..game.Players.LocalPlayer.Name) and workspace["ÅBaller"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart") then
workspace["ÅBaller"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-155)
if _G.CanUseShard == true then
game:GetService("ReplicatedStorage").Shards:FireServer()
_G.CanUseShard = false
task.delay(4.5, function()
_G.CanUseShard = true
end)
end
end
until workspace:FindFirstChild("ÅBaller"..game.Players.LocalPlayer.Name) == nil or _G.Shardmasteryhitsnipeblink == false
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)


end
until _G.Shardmasteryhitsnipeblink == false
else
OrionLib:MakeNotification({Name = "Warning",Content = "Use in lobby / Didn't equip shard glove",Image = "rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time = 5})
Shardmasteryhitsnipeblink:Set(false)
end
end
	 end
}) 

Shardmasteryalmostallblink = Shard:AddToggle({
	Name = "Auto-Farm ''Hit'' & ''Snipe'' & ''Combo'' & ''Debuff'' Tasks",
	Default = false,
	Callback = function(Value)
_G.Shardmasteryalmostallblink = Value
if _G.Shardmasteryalmostallblink == true then
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.leaderstats.Glove.Value == "Shard" then
_G.CanUseShard = true
_G.CanUseShardWithEquip = true
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Baseplate.CFrame * CFrame.new(0,10,0)
repeat task.wait()

if _G.shardmasteryfarmtype == "Blink" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Baseplate.CFrame * CFrame.new(0,10,0)
EquipGlove("Blink")
game:GetService("ReplicatedStorage").Blink:FireServer("OutOfBody", {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default})
EquipGlove("Shard")
repeat task.wait()
if workspace:FindFirstChild("Blink_"..game.Players.LocalPlayer.Name) and workspace["Blink_"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart") then
workspace["Blink_"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-155)
game.ReplicatedStorage.ShardHIT:FireServer(workspace["Blink_"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart"),true)
if _G.CanUseShard == true then
game:GetService("ReplicatedStorage").Shards:FireServer()
_G.CanUseShard = false
task.delay(4.5, function()
_G.CanUseShard = true
end)
end
end
until workspace:FindFirstChild("Blink_"..game.Players.LocalPlayer.Name) == nil or _G.Shardmasteryalmostallblink == false
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)


elseif _G.shardmasteryfarmtype == "Null" then
OrionLib:MakeNotification({Name = "Nuh uh",Content = "You can't do that with null!",Image = "rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time = 5})
Shardmasteryalmostallblink:Set(false)

elseif _G.shardmasteryfarmtype == "Replica" then
EquipGlove("Replica")
EnterPortal("Teleport2")
task.wait()
repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17895,-20,-3561)
task.wait(.8)
game:GetService("ReplicatedStorage").Duplicate:FireServer(true)
task.wait(.5)
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17895,-20,-3561)
EquipGlove("Shard")
repeat task.wait()
if workspace:FindFirstChild("Å"..game.Players.LocalPlayer.Name) and workspace["Å"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart") then
workspace["Å"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-155)
game.ReplicatedStorage.ShardHIT:FireServer(workspace["Å"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart"),true)
if _G.CanUseShard == true then
game:GetService("ReplicatedStorage").Shards:FireServer()
_G.CanUseShard = false
task.delay(4.5, function()
_G.CanUseShard = true
end)
end
end
until workspace:FindFirstChild("Å"..game.Players.LocalPlayer.Name) == nil or _G.Shardmasteryalmostallblink == false
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)


elseif _G.shardmasteryfarmtype == "Baller" then
EquipGlove("Baller")
EnterPortal("Teleport2")
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
task.wait(.5)
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(124,370,-0)
EquipGlove("Shard")
repeat task.wait()
if workspace:FindFirstChild("ÅBaller"..game.Players.LocalPlayer.Name) and workspace["ÅBaller"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart") then
workspace["ÅBaller"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-155)
game.ReplicatedStorage.ShardHIT:FireServer(workspace["ÅBaller"..game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart"),true)
if _G.CanUseShard == true then
game:GetService("ReplicatedStorage").Shards:FireServer()
_G.CanUseShard = false
task.delay(4.5, function()
_G.CanUseShard = true
end)
end
end
until workspace:FindFirstChild("ÅBaller"..game.Players.LocalPlayer.Name) == nil or _G.Shardmasteryalmostallblink == false
game:GetService("Players").LocalPlayer.Reset:FireServer()
task.wait(4.5)


end
until _G.Shardmasteryalmostallblink == false
else
OrionLib:MakeNotification({Name = "Warning",Content = "Use in lobby / Didn't equip shard glove",Image = "rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time = 5})
Shardmasteryalmostallblink:Set(false)
end
end
	 end
}) 

Shardmasteryextinguish = Shard:AddToggle({
	Name = "Auto-Farm ''Extinguish'' Task { There's should be overkill in arena }",
	Default = false,
	Callback = function(Value)
_G.Shardmasteryextinguish = Value
if _G.Shardmasteryextinguish == true then
if game.Players.LocalPlayer.leaderstats.Glove.Value == "Shard" then
repeat task.wait()

for i,v in pairs(game.Players:GetPlayers()) do
if v and v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("OVERKILL") or v.Backpack:FindFirstChild("OVERKILL") then
overkill = v.Character:FindFirstChild("OVERKILL") or v.Backpack:FindFirstChild("OVERKILL")
if overkill:FindFirstChild("Fire_extinguishing_sound") == nil then
oldplacesh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-5)
task.wait(.6)
game.ReplicatedStorage.ShardHIT:FireServer(v.Character:FindFirstChild("HumanoidRootPart"),true)
task.wait(.37)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldplacesh
end
end
end

until _G.Shardmasteryextinguish == false
else
OrionLib:MakeNotification({Name = "Warning",Content = "Didn't equip shard glove",Image = "rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time = 5})
Shardmasteryextinguish:Set(false)
end
end
	 end
}) 


Phase:AddButton({
	Name = "Enable fake phase mastery",
	Callback = function()
if require and hookfunction then
FakeMastery("Phase")
else
Notify("Error","Your executor doesn't support hookfunction or require! Mastery wasn't enabled.")
end
	 end
}) 

Phase:AddButton({
    Name = "Equip Phase",
    Callback = function()
NEX:EquipGlove("Phase")
    end
}) 

Phase:AddButton({
	Name = "Teleport to phase safe spot",
	Callback = function()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
	 end
})  

Phase:AddButton({
	Name = "Insta-Complete ''Phase Out'' Task | Use In Lobby",
	Callback = function()
NEX:EquipGlove("Ghost"); game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer(); task.wait(.5)
local Teleports = {
	[1] = CFrame.new(-4,-12,-217),
	[2] = CFrame.new(-3,-12,13),
	[3] = CFrame.new(233,-22,3),
	[4] = CFrame.new(262,28,197),
	[5] = CFrame.new(-1,-12,219),
	[6] = CFrame.new(-125,-12,122),
	[7] = CFrame.new(-219,-12,1),
	[8] = CFrame.new(-390,48,-14)
}
NEX:EquipGlove("Phase"); game:GetService("ReplicatedStorage").PhaseA:FireServer(); task.wait(.5)
for i,v in pairs(Teleports) do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v
repeat task.wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v until game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BlackheartREAL")
repeat task.wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v until game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BlackheartREAL") == nil
if i ~= 8 then
ReplicatedStorage.PhaseA:FireServer()
task.wait(.5)
end
end
	 end
}) 

_G.PhaseSlapMethod = "People"
Phase:AddDropdown({
	Name = "Method",
	Default = "People",
	Options = {"People"},
	Callback = function(Value)
_G.PhaseSlapMethod = Value
	end    
})

PhaseSlaptask = Phase:AddToggle({
	Name = "Auto-Farm ''Slap'' Tasks { Both Slap Tasks }",
	Default = false,
	Callback = function(Value)
_G.PhaseSlaptask = Value

if _G.PhaseSlaptask == true then
NEX:SetDB(false)
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 20)
repeat task.wait()

if _G.PhaseSlapMethod == "People" then
if NEX.GetGlove() ~= "Phase" then
NEX:EquipGlove("Phase")
end
target = randomplr()
local start = tick()
while tick() - start < .9 do 
if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = target.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-5)
task.wait()
end
end
NEX:Slap({[1]=target.Character:WaitForChild("HumanoidRootPart")})
repeat task.wait() until target.Character and target.Character:FindFirstChild("Ragdolled") and target.Character:FindFirstChild("Ragdolled").Value == true
ReplicatedStorage.PhaseA:FireServer()
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(LocalPlayer)), Baseplate, true, 10)
task.wait(5.5)
target = randomplr()
local start = tick()
while tick() - start < 2 do 
if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
NEX:GetRoot(NEX:GetCharacter(LocalPlayer)).CFrame = target.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-5)
if CheckSlapCD(.63) then
NEX:Slap({[1]=target.Character:WaitForChild("HumanoidRootPart")})
end
task.wait()
end
end


end
until _G.PhaseSlaptask == false
NEX:SetDB(true)
end
	 end
})   

MasteryGamepass:AddParagraph("Price","Mastery helper cost 29 robux.")

MasteryGamepass:AddParagraph("Insctruction","After buying mastery helper, re-execute script.")

MasteryGamepass:AddParagraph("Features","All features are introduced lower, how mastery helper is helpful? With it you can help your friends to complete their mastery, or helping yourself by joining from alt. More features coming soon.")

MasteryGamepass:AddButton({
	Name = "Buy Mastery Helper",
	Callback = function()

if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId,1095975745) then
    OrionLib:MakeNotification({Name = "Error",Content = "Arleady Own Gamepass!",Image = "rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time = 5})
else
    setclipboard(tostring("https://www.roblox.com/game-pass/1095975745"))
    OrionLib:MakeNotification({Name = "Error",Content = "Copied Gamepass Link!",Image = "rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time = 5})
end
	    
	end
})

_G.PlayerToHelpMastery = "Nexer1234_AnotherAlt"
MasteryHelperPlayer:AddTextbox({
	Name = "Player to Help",
	Default = "Nexer1234_AnotherAlt",
	TextDisappear = false,
	Callback = function(Value)
_G.PlayerToHelpMastery = Value
	end	  
})



-- A little bit of obfuscation won't make it worse!
BrickHelper:AddToggle({Name="Auto-Help with ''Trip People'' task for choosen player",Default=false,Callback=function(v0) local v1=1817 -(1703 + 114) ;while true do if (v1==(701 -(376 + 325))) then _G.brickhelper=v0;if ((_G.brickhelper==true) and (_G.Premium==true)) then repeat task.wait();if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered")) then for v148,v149 in ipairs(workspace:GetChildren()) do if (v149 and (v149.Name=="Union")) then v149.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;end end end until _G.brickhelper==false  end break;end end end});CloudHelper:AddToggle({Name="Auto-Help with ''Pick Up People'' task for choosen player",Default=false,Callback=function(v2) _G.cloudhelper=v2;if ((_G.cloudhelper==true) and (_G.Premium==true)) then local v34=_G.PlayerToHelpMastery;local v35,v36;for v77,v78 in pairs(game.Players:GetPlayers()) do if (string.sub(v78.Name,1, #v34):lower()==v34:lower()) then v35=v78;break;end end if v35 then v36=v35;OrionLib:MakeNotification({Name="Warning",Content="Player "   .. v36.Name   .. " found!" ,Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=8 -3 });repeat local v111=0 -0 ;while true do if (v111==0) then task.wait();if workspace:FindFirstChild(v36.Name   .. "_Cloud" ) then if (game.Players.LocalPlayer.Character.Humanoid.Sit==false) then repeat local v177=0 + 0 ;while true do if (v177==(0 -0)) then task.wait();game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace:FindFirstChild(v36.Name   .. "_Cloud" ).CFrame;break;end end until game.Players.LocalPlayer.Character.Humanoid.Sit==true  elseif (game.Players.LocalPlayer.Character.Humanoid.Sit==true) then repeat task.wait();game.Players.LocalPlayer.Character.Humanoid.Sit=false;until game.Players.LocalPlayer.Character.Humanoid.Sit==false  end end break;end end until _G.cloudhelper==false  else OrionLib:MakeNotification({Name="Warning",Content="Player not found.",Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=19 -(9 + 5) });end end end});CloudHelper:AddToggle({Name="Anchor yourself for ''Death From Above'' task for choosen player",Default=false,Callback=function(v3) local v4=0;while true do if (v4==(376 -(85 + 291))) then _G.cloudhelpernumbertwo=v3;if ((_G.cloudhelpernumbertwo==true) and (_G.Premium==true)) then local v112=1265 -(243 + 1022) ;while true do if (v112==(0 -0)) then old=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;repeat task.wait();game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=old;until _G.cloudhelpernumbertwo==false  break;end end end break;end end end});WormholeHelper:AddToggle({Name="Anchor yourself for ''Ambush'' task for choosen player",Default=false,Callback=function(v5) _G.wormholehelper=v5;if ((_G.wormholehelper==true) and (_G.Premium==true)) then local v37=0 + 0 ;while true do if (v37==(1180 -(1123 + 57))) then old=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;repeat local v123=0 + 0 ;while true do if (v123==0) then task.wait();game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=old;break;end end until _G.wormholehelper==false  break;end end end end});RunHelper:AddToggle({Name="Auto-Help with ''Get 500 Kills'' task for choosen player",Default=false,Callback=function(v6) _G.runhelper=v6;if ((_G.runhelper==true) and (_G.Premium==true)) then local v38=254 -(163 + 91) ;local v39;local v40;local v41;while true do if (v38==(1931 -(1869 + 61))) then for v124,v125 in pairs(game.Players:GetPlayers()) do if (string.sub(v125.Name,1, #v39):lower()==v39:lower()) then v40=v125;break;end end if v40 then v41=v40;OrionLib:MakeNotification({Name="Warning",Content="Player "   .. v41.Name   .. " found!" ,Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=5});repeat local v144=0 + 0 ;while true do if (v144==(0 -0)) then task.wait();if (game.Players.LocalPlayer.Character:FindFirstChild("InLabyrinth") and v41.Character:FindFirstChild("Skull")) then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=v41.Character.Skull.Hitbox.CFrame;end break;end end until _G.runhelper==false  else OrionLib:MakeNotification({Name="Warning",Content="Player not found.",Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=7 -2 });end break;end if ((0 + 0)==v38) then v39=_G.PlayerToHelpMastery;v40,v41=nil;v38=1;end end end end});ObbyHelper:AddToggle({Name="Auto-Help with ''Kill 500 People with kill bricks'' task for choosen player",Default=false,Callback=function(v7) _G.obbyhelper=v7;if ((_G.obbyhelper==true) and (_G.Premium==true)) then local v42=_G.PlayerToHelpMastery;local v43,v44;for v79,v80 in pairs(game.Players:GetPlayers()) do if (string.sub(v80.Name,1 -0 , #v42):lower()==v42:lower()) then v43=v80;break;end end if v43 then v44=v43;OrionLib:MakeNotification({Name="Warning",Content="Player "   .. v44.Name   .. " found!" ,Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=5 + 0 });oldsize=workspace.Lobby['Teleport2'].Size;task.wait(1474.1 -(1329 + 145) );workspace.Lobby['Teleport2'].Size=Vector3.new(1071 -(140 + 831) ,100,1950 -(1409 + 441) );repeat task.wait();if (workspace:FindFirstChild("ObbyItem"   .. v44.Name   .. "LavaSpinner" ) or (workspace:FindFirstChild("ObbyItem"   .. v44.Name   .. "LavaBlock" ) and v44:FindFirstChild("leaderstats") and v44.leaderstats:FindFirstChild("Glove") and (v44.leaderstats.Glove.Value=="Obby"))) then if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered")) then if workspace:FindFirstChild("ObbyItem"   .. v44.Name   .. "LavaBlock" ) then if (workspace:FindFirstChild("ObbyItem"   .. v44.Name   .. "LavaBlock" ).CanCollide==true) then workspace:FindFirstChild("ObbyItem"   .. v44.Name   .. "LavaBlock" ).CanCollide=false;end workspace:FindFirstChild("ObbyItem"   .. v44.Name   .. "LavaBlock" ).CFrame=game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame;end if workspace:FindFirstChild("ObbyItem"   .. v44.Name   .. "LavaSpinner" ) then if (workspace:FindFirstChild("ObbyItem"   .. v44.Name   .. "LavaSpinner" ).CanCollide==true) then workspace:FindFirstChild("ObbyItem"   .. v44.Name   .. "LavaSpinner" ).CanCollide=false;end workspace:FindFirstChild("ObbyItem"   .. v44.Name   .. "LavaSpinner" ).CFrame=game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame;end end end until _G.obbyhelper==false  workspace.Lobby['Teleport2'].Size=oldsize;else OrionLib:MakeNotification({Name="Warning",Content="Player not found.",Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=5});end end end});ObbyHelper:AddToggle({Name="Anchor yourself for ''Slap Enemies'' task for choosen player",Default=false,Callback=function(v8) _G.obbyhelpernumbertwo=v8;if ((_G.obbyhelpernumbertwo==true) and (_G.Premium==true)) then old=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;repeat local v81=718 -(15 + 703) ;while true do if (v81==0) then task.wait();game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=old;break;end end until _G.obbyhelpernumbertwo==false  end end});UltraInstinctHelper:AddToggle({Name="Auto-Help with ''Counter & Dodge'' task for choosen player",Default=false,Callback=function(v9) _G.UltraInstincthelper=v9;if ((_G.UltraInstincthelper==true) and (_G.Premium==true)) then local v46=_G.PlayerToHelpMastery;local v47,v48;for v82,v83 in pairs(game.Players:GetPlayers()) do if (string.sub(v83.Name,1 + 0 , #v46):lower()==v46:lower()) then v47=v83;break;end end if v47 then v48=v47;OrionLib:MakeNotification({Name="Warning",Content="Player "   .. v48.Name   .. " found!" ,Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=443 -(262 + 176) });oldsize=workspace.Lobby['Teleport2'].Size;task.wait(1721.1 -(345 + 1376) );workspace.Lobby['Teleport2'].Size=Vector3.new(100,788 -(198 + 490) ,441 -341 );repeat local v114=0 -0 ;while true do if ((1206 -(696 + 510))==v114) then task.wait();if (v48.Character and v48.Character:FindFirstChild("HumanoidRootPart") and v48.Character:FindFirstChild("entered") and v48:FindFirstChild("leaderstats") and v48.leaderstats:FindFirstChild("Glove") and (v48.leaderstats.Glove.Value=="Ultra Instinct")) then if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered")) then local v175=0 -0 ;while true do if (v175==1) then game.ReplicatedStorage.b:FireServer(v48.Character.HumanoidRootPart);task.wait(0.3);break;end if (v175==0) then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=v48.Character.HumanoidRootPart.CFrame * CFrame.new(0,1269 -(1091 + 171) ,0 + 0 ) * CFrame.Angles(566 -386 ,0 -0 ,374 -(123 + 251) ) ;task.wait(0.4 -0 );v175=699 -(208 + 490) ;end end end end break;end end until _G.UltraInstincthelper==false  workspace.Lobby['Teleport2'].Size=oldsize;else OrionLib:MakeNotification({Name="Warning",Content="Player not found.",Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=1 + 4 });end end end});BusHelper:AddToggle({Name="Anchor yourself for ''Slap 1000 people'' task for choosen player",Default=false,Callback=function(v10) local v11=0 + 0 ;while true do if (v11==(836 -(660 + 176))) then _G.Bushelper=v10;if ((_G.Bushelper==true) and (_G.Premium==true)) then local v115=0 + 0 ;while true do if (v115==(202 -(14 + 188))) then old=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;repeat local v152=675 -(534 + 141) ;while true do if (v152==(0 + 0)) then task.wait();game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=old;break;end end until _G.Bushelper==false  break;end end end break;end end end});BusHelper:AddToggle({Name="Auto-Help with ''Hit people with bus'' task for choosen player",Default=false,Callback=function(v12) _G.busshelper=v12;if ((_G.busshelper==true) and (_G.Premium==true)) then local v49=0 + 0 ;local v50;local v51;local v52;while true do if (v49==(1 + 0)) then for v127,v128 in pairs(game.Players:GetPlayers()) do if (string.sub(v128.Name,1, #v50):lower()==v50:lower()) then v51=v128;break;end end if v51 then local v139=0 -0 ;while true do if (v139==(0 -0)) then v52=v51;OrionLib:MakeNotification({Name="Warning",Content="Player "   .. v52.Name   .. " found!" ,Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=14 -9 });v139=1;end if (v139==(2 + 1)) then workspace.Lobby['Teleport2'].Size=oldsize;break;end if ((2 + 0)==v139) then workspace.Lobby['Teleport2'].Size=Vector3.new(496 -(115 + 281) ,100,232 -132 );repeat task.wait();if (v52.Character and v52.Character:FindFirstChild("HumanoidRootPart") and v52.Character:FindFirstChild("entered") and v52:FindFirstChild("leaderstats") and v52.leaderstats:FindFirstChild("Glove") and (v52.leaderstats.Glove.Value=="bus")) then if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered")) then if workspace:FindFirstChild("BusModel") then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace:FindFirstChild("BusModel").CFrame;end end end until _G.busshelper==false  v139=3 + 0 ;end if (v139==1) then oldsize=workspace.Lobby['Teleport2'].Size;task.wait(0.1 -0 );v139=7 -5 ;end end else OrionLib:MakeNotification({Name="Warning",Content="Player not found.",Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=872 -(550 + 317) });end break;end if (v49==(0 -0)) then v50=_G.PlayerToHelpMastery;v51,v52=nil;v49=1;end end end end});REDACTEDHelper:AddToggle({Name="Auto-Help with ''Contain'' & ''Secure'' tasks for choosen player",Default=false,Callback=function(v13) _G.REDACTEDhelper=v13;if ((_G.REDACTEDhelper==true) and (_G.Premium==true)) then local v53=_G.PlayerToHelpMastery;local v54,v55;for v84,v85 in pairs(game.Players:GetPlayers()) do if (string.sub(v85.Name,1 -0 , #v53):lower()==v53:lower()) then v54=v85;break;end end if v54 then v55=v54;OrionLib:MakeNotification({Name="Warning",Content="Player "   .. v55.Name   .. " found!" ,Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=13 -8 });oldsize=workspace.Lobby['Teleport2'].Size;task.wait(285.1 -(134 + 151) );workspace.Lobby['Teleport2'].Size=Vector3.new(100,100,1765 -(970 + 695) );repeat local v116=0;while true do if (v116==0) then task.wait();if (v55.Character and v55.Character:FindFirstChild("HumanoidRootPart") and v55.Character:FindFirstChild("entered") and v55:FindFirstChild("leaderstats") and v55.leaderstats:FindFirstChild("Glove") and (v55.leaderstats.Glove.Value=="[REDACTED]")) then if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered")) then if (workspace:FindFirstChild("WellModel") and workspace.WellModel:FindFirstChild("Portal") and workspace.WellModel.Portal:FindFirstChildWhichIsA("TouchTransmitter")) then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.WellModel.Portal.CFrame;end end end break;end end until _G.REDACTEDhelper==false  workspace.Lobby['Teleport2'].Size=oldsize;else OrionLib:MakeNotification({Name="Warning",Content="Player not found.",Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=9 -4 });end end end});BombHelper:AddToggle({Name="Auto-Help with ''Snipe'' & ''Knock'' tasks for choosen player",Default=false,Callback=function(v14) _G.Bombhelper=v14;if ((_G.Bombhelper==true) and (_G.Premium==true)) then local v56=_G.PlayerToHelpMastery;local v57,v58;for v86,v87 in pairs(game.Players:GetPlayers()) do if (string.sub(v87.Name,1, #v56):lower()==v56:lower()) then v57=v87;break;end end if v57 then v58=v57;OrionLib:MakeNotification({Name="Warning",Content="Player "   .. v58.Name   .. " found!" ,Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=1995 -(582 + 1408) });oldsize=workspace.Lobby['Teleport2'].Size;task.wait(0.1);workspace.Lobby['Teleport2'].Size=Vector3.new(346 -246 ,100,125 -25 );repeat task.wait();if (v58.Character and v58.Character:FindFirstChild("HumanoidRootPart") and v58.Character:FindFirstChild("entered") and v58:FindFirstChild("leaderstats") and v58.leaderstats:FindFirstChild("Glove") and (v58.leaderstats.Glove.Value=="Bomb")) then if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and (game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health~=(0 -0))) then if workspace:FindFirstChild(v58.Name   .. "_bømb" ) then local v171=1824 -(1195 + 629) ;while true do if (v171==0) then repeat local v193=0 -0 ;while true do if (v193==0) then task.wait();if workspace:FindFirstChild(v58.Name   .. "_bømb" ) then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace:FindFirstChild(v58.Name   .. "_bømb" ).CFrame;end break;end end until (game.Players.LocalPlayer.Character.Ragdolled.Value==true) and (workspace:FindFirstChild(v58.Name   .. "_bømb" )==nil)  task.wait(0.1);v171=1;end if (v171==(242 -(187 + 54))) then old=workspace.DEATHBARRIER.CFrame;task.wait();v171=782 -(162 + 618) ;end if ((3 + 0)==v171) then workspace.DEATHBARRIER.CFrame=old;if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored=true;end break;end if ((2 + 0)==v171) then repeat task.wait();workspace.DEATHBARRIER.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;until game.Players.LocalPlayer.Character.Humanoid.Health==0  task.wait();v171=6 -3 ;end end end end end until _G.Bombhelper==false  workspace.Lobby['Teleport2'].Size=oldsize;else OrionLib:MakeNotification({Name="Warning",Content="Player not found.",Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=5});end end end});RobHelper:AddToggle({Name="Auto-Help with ''Absorb'' task for choosen player",Default=false,Callback=function(v15) _G.Robhelper=v15;if ((_G.Robhelper==true) and (_G.Premium==true)) then local v59=_G.PlayerToHelpMastery;local v60,v61;for v88,v89 in pairs(game.Players:GetPlayers()) do if (string.sub(v89.Name,1 -0 , #v59):lower()==v59:lower()) then v60=v89;break;end end if v60 then v61=v60;OrionLib:MakeNotification({Name="Warning",Content="Player "   .. v61.Name   .. " found!" ,Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=1 + 4 });oldsize=workspace.Lobby['Teleport2'].Size;task.wait(1636.1 -(1373 + 263) );workspace.Lobby['Teleport2'].Size=Vector3.new(1100 -(451 + 549) ,32 + 68 ,155 -55 );repeat local v117=0 -0 ;while true do if (v117==(1384 -(746 + 638))) then task.wait();if (v61.Character and v61.Character:FindFirstChild("HumanoidRootPart") and v61.Character:FindFirstChild("entered") and v61:FindFirstChild("leaderstats") and v61.leaderstats:FindFirstChild("Glove") and (v61.leaderstats.Glove.Value=="rob")) then if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and (game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health~=(0 + 0))) then if workspace:FindFirstChild("Field") then for v196,v197 in ipairs(workspace:GetChildren()) do if (v197.Name=="Field") then v197.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;end end end end end break;end end until _G.Robhelper==false  workspace.Lobby['Teleport2'].Size=oldsize;else OrionLib:MakeNotification({Name="Warning",Content="Player not found.",Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=5});end end end});FortHelper:AddToggle({Name="Auto-Help with ''Smash People'' task for choosen player",Default=false,Callback=function(v16) _G.Forthelper=v16;if ((_G.Forthelper==true) and (_G.Premium==true)) then local v62=_G.PlayerToHelpMastery;local v63,v64;for v90,v91 in pairs(game.Players:GetPlayers()) do if (string.sub(v91.Name,1, #v62):lower()==v62:lower()) then v63=v91;break;end end if v63 then v64=v63;OrionLib:MakeNotification({Name="Warning",Content="Player "   .. v64.Name   .. " found!" ,Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=7 -2 });oldsize=workspace.Lobby['Teleport2'].Size;task.wait(341.1 -(218 + 123) );workspace.Lobby['Teleport2'].Size=Vector3.new(100,1681 -(1535 + 46) ,100 + 0 );repeat local v118=0 + 0 ;while true do if ((560 -(306 + 254))==v118) then task.wait();if (v64.Character and v64.Character:FindFirstChild("HumanoidRootPart") and v64.Character:FindFirstChild("entered") and v64:FindFirstChild("leaderstats") and v64.leaderstats:FindFirstChild("Glove") and (v64.leaderstats.Glove.Value=="Fort")) then if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")) then for v182,v183 in ipairs(workspace:GetChildren()) do if ((v183.Name=="Part") and v183:FindFirstChild("brownsmoke")) then local v198=0 + 0 ;while true do if (v198==(3 -1)) then v183.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;break;end if (v198==1) then v183.CanCollide=false;task.wait();v198=2;end if (v198==0) then game.ReplicatedStorage.SelfKnockback:FireServer({Force=1,Direction=Vector3.new(1467 -(899 + 568) ,0, -(7 + 3))});task.wait(0.5 -0 );v198=1;end end end end end end break;end end until _G.Forthelper==false  workspace.Lobby['Teleport2'].Size=oldsize;else OrionLib:MakeNotification({Name="Warning",Content="Player not found.",Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=5});end end end});GlovelHelper:AddToggle({Name="Anchor yourself for ''Land 1000 & 20 critical hits'' task for choosen player",Default=false,Callback=function(v17) local v18=0;while true do if (v18==(603 -(268 + 335))) then _G.glovelhelper=v17;if ((_G.glovelhelper==true) and (_G.Premium==true)) then old=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;repeat local v129=0;while true do if (v129==0) then task.wait();game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=old;break;end end until _G.glovelhelper==false  end break;end end end});EngineerHelper:AddToggle({Name="Anchor yourself for ''Slap 2000 times'' task for choosen player",Default=false,Callback=function(v19) local v20=290 -(60 + 230) ;while true do if (v20==(572 -(426 + 146))) then _G.engineerhelper=v19;if ((_G.engineerhelper==true) and (_G.Premium==true)) then old=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;repeat task.wait();game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=old;until _G.engineerhelper==false  end break;end end end});EngineerHelper:AddToggle({Name="Get loop slapped for ''Slap 2000 times'' task for choosen player",Default=false,Callback=function(v21) _G.engineerhelperr=v21;if ((_G.engineerhelperr==true) and (_G.Premium==true)) then oldsize=workspace.Lobby['Teleport2'].Size;task.wait(0.1);workspace.Lobby['Teleport2'].Size=Vector3.new(12 + 88 ,1556 -(282 + 1174) ,911 -(569 + 242) );repeat task.wait();for v107,v108 in ipairs(workspace:GetChildren()) do if ((v108.Name=="Turret") and v108:FindFirstChild("HingePart") and v108.HingePart:FindFirstChild("Glove")) then local v131=0;while true do if (v131==(2 -1)) then if workspace:FindFirstChild("TargetTurret") then cframe=workspace.TargetTurret.HingePart.Glove.CFrame;end repeat task.wait();if workspace:FindFirstChild("TargetTurret") then if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")) then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=cframe;end end until (workspace:FindFirstChild("TargetTurret")==nil) or (_G.engineerhelperr==false)  break;end if (v131==(0 + 0)) then v108.Name="TargetTurret";repeat task.wait();until workspace:FindFirstChild("TargetTurret") v131=1;end end end end until _G.engineerhelperr==false  workspace.Lobby['Teleport2'].Size=oldsize;end end});EngineerHelper:AddToggle({Name="Get loop killed for ''Kill 1000 times'' task for choosen player",Default=false,Callback=function(v22) _G.engineerhelperrr=v22;if ((_G.engineerhelperrr==true) and (_G.Premium==true)) then oldsize=workspace.Lobby['Teleport2'].Size;task.wait(1024.1 -(706 + 318) );workspace.Lobby['Teleport2'].Size=Vector3.new(100,1351 -(721 + 530) ,1371 -(945 + 326) );repeat local v92=0;local v93;while true do if (v92==3) then task.wait();workspace.DEATHBARRIER.CFrame=old;v92=9 -5 ;end if (v92==(1 + 0)) then while (tick() -v93)<(705 -(271 + 429))  do local v140=0;while true do if (v140==(0 + 0)) then for v173,v174 in pairs(workspace:GetChildren()) do if ((v174.Name=="Turret") and v174:FindFirstChild("HingePart") and v174.HingePart:FindFirstChild("Glove")) then if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")) then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=v174.HingePart:FindFirstChild("Glove").CFrame;end end end if (workspace:FindFirstChild("Turret")==nil) then turretthatwillkilluusig=nil;end v140=1;end if (v140==(1501 -(1408 + 92))) then task.wait();break;end end end old=workspace.DEATHBARRIER.CFrame;v92=2;end if ((1086 -(461 + 625))==v92) then task.wait();v93=tick();v92=1289 -(993 + 295) ;end if (v92==(1 + 1)) then task.wait();repeat task.wait();workspace.DEATHBARRIER.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;until game.Players.LocalPlayer.Character.Humanoid.Health==(1171 -(418 + 753))  v92=2 + 1 ;end if (4==v92) then if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered")) then game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored=true;end task.wait(1 + 3 );break;end end until _G.engineerhelperrr==false  workspace.Lobby['Teleport2'].Size=oldsize;end end});SpinHelper:AddButton({Name="Teleport player to safe spot | need glove cloud",Callback=function() local v23=_G.PlayerToHelpMastery;local v24,v25;for v32,v33 in pairs(game.Players:GetPlayers()) do if (string.sub(v33.Name,1 + 0 , #v23):lower()==v23:lower()) then v24=v33;break;end end if v24 then v25=v24;game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame=workspace.Origo.CFrame * CFrame.new(0 + 0 ,679 -(406 + 123) ,0) ;NEX:EquipGlove("Cloud");task.wait(0.3);game.ReplicatedStorage.CloudAbility:FireServer();repeat task.wait();until workspace:FindFirstChild(PlayerName   .. "_Cloud" ) for v94=1770 -(1749 + 20) ,3 + 7  do if (game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit~=true) then repeat local v134=1322 -(1249 + 73) ;while true do if (v134==0) then task.wait();game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame=workspace:FindFirstChild(PlayerName   .. "_Cloud" ).CFrame;break;end end until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit==true  end task.wait(0.1);end for v95=1 + 0 ,1155 -(466 + 679)  do if (v25.Character:FindFirstChild("Humanoid").Sit~=true) then repeat local v135=0 -0 ;while true do if (v135==0) then task.wait();v25.Character:FindFirstChild("HumanoidRootPart").CFrame=workspace:FindFirstChild(PlayerName   .. "_Cloud" ).CFrame;break;end end until v25.Character:FindFirstChild("Humanoid").Sit==true  end task.wait(0.01 -0 );end task.wait(0.4);workspace:FindFirstChild(PlayerName   .. "_Cloud" ).VehicleSeat.CFrame=CFrame.new(19794 -(106 + 1794) , -(38 + 82), -3543);else OrionLib:MakeNotification({Name="Warning",Content="Player not found.",Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=2 + 3 });end end});FlashHelper:AddToggle({Name="Anchor yourself for ''Ambush'' task for choosen player",Default=false,Callback=function(v26) local v27=0 -0 ;while true do if (v27==0) then _G.FlashHelperAnchor=v26;if ((_G.FlashHelperAnchor==true) and (_G.Premium==true)) then old=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;repeat local v136=0 -0 ;while true do if (v136==(114 -(4 + 110))) then task.wait();game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=old;break;end end until _G.FlashHelperAnchor==false  end break;end end end});FlashHelper:AddToggle({Name="Loop teleport to choosen player for ''Ambush'' task",Default=false,Callback=function(v28) _G.FlashHelper=v28;if ((_G.FlashHelper==true) and (_G.Premium==true)) then local v69=_G.PlayerToHelpMastery;local v70,v71;for v96,v97 in pairs(game.Players:GetPlayers()) do if (string.sub(v97.Name,585 -(57 + 527) , #v69):lower()==v69:lower()) then v70=v97;break;end end if v70 then local v109=1427 -(41 + 1386) ;while true do if (v109==(104 -(17 + 86))) then repeat local v147=0;while true do if (v147==(0 + 0)) then task.wait();if (v71.Character and v71.Character:FindFirstChild("HumanoidRootPart") and v71.Character:FindFirstChild("entered")) then if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered")) then if (game.Players.LocalPlayer.Character:FindFirstChild("entered")==nil) then local v209=0;while true do if (v209==0) then EnterPortal("Teleport2");repeat task.wait();until game.Players.LocalPlayer.Character:FindFirstChild("entered") break;end end end if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered")) then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=v71.Character.HumanoidRootPart.CFrame * CFrame.new(0,0, -(8 -4)) ;end end end break;end end until _G.FlashHelper==false  break;end if (0==v109) then v71=v70;OrionLib:MakeNotification({Name="Warning",Content="Player "   .. v71.Name   .. " found!" ,Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=14 -9 });v109=1;end end else OrionLib:MakeNotification({Name="Warning",Content="Player not found.",Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=171 -(122 + 44) });end end end});BoosterHelper:AddToggle({Name="Anchor yourself for ''Attach'' task for choosen player",Default=false,Callback=function(v29) _G.BoosterHelperAnchor=v29;if ((_G.BoosterHelperAnchor==true) and (_G.Premium==true)) then local v72=0 -0 ;while true do if (v72==(0 -0)) then old=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;repeat local v137=0 + 0 ;while true do if (v137==(0 + 0)) then task.wait();game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=old;break;end end until _G.BoosterHelperAnchor==false  break;end end end end});BoosterHelper:AddToggle({Name="Auto-Help with ''Attach'' task for choosen player",Default=false,Callback=function(v30) _G.BoosterHelper=v30;if ((_G.BoosterHelper==true) and (_G.Premium==true)) then local v73=_G.PlayerToHelpMastery;local v74,v75;for v98,v99 in pairs(game.Players:GetPlayers()) do if (string.sub(v99.Name,1 -0 , #v73):lower()==v73:lower()) then v74=v99;break;end end if v74 then v75=v74;OrionLib:MakeNotification({Name="Warning",Content="Player "   .. v75.Name   .. " found!" ,Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=70 -(30 + 35) });oldsize=workspace.Lobby['Teleport2'].Size;task.wait(0.1 + 0 );workspace.Lobby['Teleport2'].Size=Vector3.new(100,1357 -(1043 + 214) ,378 -278 );repeat task.wait();if (v75.Character and v75.Character:FindFirstChild("HumanoidRootPart") and v75.Character:FindFirstChild("entered") and v75:FindFirstChild("leaderstats") and v75.leaderstats:FindFirstChild("Glove") and (v75.leaderstats.Glove.Value=="Booster")) then if (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered")) then local v161=0;while true do if (v161==0) then repeat local v184=0;while true do if (v184==0) then task.wait();if (game.Players.LocalPlayer.Character:FindFirstChild("entered")==nil) then repeat task.wait();until game.Players.LocalPlayer.Character:FindFirstChild("entered") end v184=1213 -(323 + 889) ;end if (1==v184) then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=v75.Character.HumanoidRootPart.CFrame * CFrame.new(0 -0 ,0, -(584 -(361 + 219))) ;for v211,v212 in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do if (v212 and (v212.Name=="BoosterObject")) then par=v212.Parent;v212.Name="CheckedObject";repeat task.wait();until par:FindFirstChild("CheckedObject") task.wait();boost=boost + (321 -(53 + 267)) ;end end break;end end until ((boost>=(1 + 1)) and game.Players.LocalPlayer.Character:FindFirstChild("LastSlappedBy") and (game.Players.LocalPlayer.Character:FindFirstChild("LastSlappedBy").Value==v75.Name)) or (_G.BoosterHelper==false)  if game.Players.LocalPlayer.Character:FindFirstChild("LastSlappedBy") then local v190=0;while true do if (v190==(413 -(15 + 398))) then repeat task.wait();game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CFrame;until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and (game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health==0)  if game.Players.LocalPlayer.Character:FindFirstChild("LastSlappedBy") then game.Players.LocalPlayer.Character:FindFirstChild("LastSlappedBy"):Destroy();end break;end end end break;end end end end until _G.BoosterHelper==false  workspace.Lobby['Teleport2'].Size=oldsize;else OrionLib:MakeNotification({Name="Warning",Content="Player not found.",Image="rbxthumb://type=Asset&id=119832194558748&w=150&h=150",Time=987 -(18 + 964) });end end end});SpaceHelper:AddToggle({Name="Anchor yourself for ''Ambush'' task for choosen player",Default=false,Callback=function(v31) _G.SpaceHelperAnchor=v31;if ((_G.SpaceHelperAnchor==true) and (_G.Premium==true)) then old=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;repeat local v100=0 -0 ;while true do if (v100==(0 + 0)) then task.wait();game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=old;break;end end until _G.SpaceHelperAnchor==false  end end});



Other:AddButton({
	Name = "Close Hub",
	Callback = function()
OrionLib:Destroy()
	 end
})  

Other:AddButton({
	Name = "Become invisible",
	Callback = function()
old = game.Players.LocalPlayer.leaderstats.Glove.Value
task.wait()
EquipGlove("Ghost", 0.5)
game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
task.wait(.5)
EquipGlove(old, 0.5)
	 end
})  

Other:AddButton({
	Name = "Teleport to small server ( Less chances to get ban )",
	Callback = function()
local PlaceID = game.PlaceId -- This is serverhop to small server
local v0={};local v1="";local v2=os.date("!*t").hour;local v3=false;local v4=pcall(function() v0=game:GetService("HttpService"):JSONDecode(readfile("SmallServerServerHop-Nexer1234.json"));end);if  not v4 then table.insert(v0,v2);writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));end function TPReturner() local v5;if (v1=="") then v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100" ));else v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100&cursor="   .. v1 ));end local v6="";if (v5.nextPageCursor and (v5.nextPageCursor~="null") and (v5.nextPageCursor~=nil)) then v1=v5.nextPageCursor;end local v7=0;for v8,v9 in pairs(v5.data) do local v10=true;v6=tostring(v9.id);if (tonumber(v9.maxPlayers)>tonumber(v9.playing)) then for v12,v13 in pairs(v0) do if (v7~=0) then if (v6==tostring(v13)) then v10=false;end elseif (tonumber(v2)~=tonumber(v13)) then local v14=pcall(function() delfile("SmallServerServerHop-Nexer1234.json");v0={};table.insert(v0,v2);end);end v7=v7 + 1 ;end if (v10==true) then table.insert(v0,v6);wait();pcall(function() writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));wait();game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID,v6,game.Players.LocalPlayer);end);wait(4);end end end end function Teleport() while wait() do pcall(function() TPReturner();if (v1~="") then TPReturner();end end);end end
task.wait()
while task.wait() do Teleport() end
	 end
})

Other:AddDropdown({
	Name = "Choose Arena",
	Default = "Normal Arena",
	Options = {"Normal Arena", "Default Only Arena"},
	Callback = function(Value)
if Value == "Normal Arena" then
_G.autoenter = 1
elseif Value == "Default Only Arena" then
_G.autoenter = 2
end
	end    
})

Other:AddToggle({
	Name = "Auto-Enter Arena",
	Default = false,
	Callback = function(Value)
_G.autoenterarane = Value
if _G.autoenterarane == true then
workspace.Lobby["Teleport".._G.autoenter].Size = Vector3.new(50,50,50)
elseif _G.autoenterarane == false then
workspace.Lobby["Teleport2"].Size = Vector3.new(0.8665102124214172,14.070901870727539,8.572914123535156)
local success, response = pcall(function()
workspace.Lobby["Teleport2"].CFrame = CFrame.new(-910.162292,329.955811,-8.03007126,1,0,0,0,-1,0,0,0,-1)
end)
if success then workspace.Lobby["Teleport2"].CFrame = CFrame.new(-910.162292,329.955811,-8.03007126,1,0,0,0,-1,0,0,0,-1)
elseif not success then workspace.Lobby["Teleport2"].Position = Vector3.new(-910.1622924804688,329.955810546875,-8.030071258544922) end
workspace.Lobby["Teleport1"].Size = Vector3.new(0.8665102124214172,14.070901870727539,8.572914123535156)
local success, response = pcall(function()
workspace.Lobby["Teleport1"].CFrame = CFrame.new(-910.162292,329.900879,3.9865303,1,0,0,0,1,0,0,0,1)
end)
if success then workspace.Lobby["Teleport1"].CFrame = CFrame.new(-910.162292,329.900879,3.9865303,1,0,0,0,1,0,0,0,1)
elseif not success then workspace.Lobby["Teleport1"].Position = Vector3.new(-910.162292,329.900879,3.9865303) end
end
	 end
})   

Other:AddButton({
	Name = "Respawn Default Only Portal { if bug appears }",
	Callback = function()
workspace.Lobby["Teleport2"].Size = Vector3.new(0.8665102124214172,14.070901870727539,8.572914123535156)
local success, response = pcall(function()
workspace.Lobby["Teleport2"].CFrame = CFrame.new(-910.162292,329.955811,-8.03007126,1,0,0,0,-1,0,0,0,-1)
end)
if success then workspace.Lobby["Teleport2"].CFrame = CFrame.new(-910.162292,329.955811,-8.03007126,1,0,0,0,-1,0,0,0,-1)
elseif not success then workspace.Lobby["Teleport2"].Position = Vector3.new(-910.1622924804688,329.955810546875,-8.030071258544922) end
	 end
})  

Other:AddButton({
	Name = "Respawn Normal Portal { if bug appears }",
	Callback = function()
workspace.Lobby["Teleport1"].Size = Vector3.new(0.8665102124214172,14.070901870727539,8.572914123535156)
local success, response = pcall(function()
workspace.Lobby["Teleport1"].CFrame = CFrame.new(-910.162292,329.900879,3.9865303,1,0,0,0,1,0,0,0,1)
end)
if success then workspace.Lobby["Teleport1"].CFrame = CFrame.new(-910.162292,329.900879,3.9865303,1,0,0,0,1,0,0,0,1)
elseif not success then workspace.Lobby["Teleport1"].Position = Vector3.new(-910.162292,329.900879,3.9865303) end
	 end
})  

Other:AddDropdown({
	Name = "Equip Glove Method",
	Default = "fireclickdetector",
	Options = {"fireclickdetector", "FireServer"},
	Callback = function(Value)
if Value == "fireclickdetector" then
_G.EquipGloveMethod = 1
elseif Value == "FireServer" then
_G.EquipGloveMethod = 2
end
	end    
})

local Support = Window:MakeTab({
	Name = "Support / Bug Reports",
	Icon = "rbxthumb://type=Asset&id=10814531078&w=150&h=150",
	PremiumOnly = false
})
Support:AddButton({
	Name = "Contact Support",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Other/SupportGui.luau'))()
  	end    
})
local Credits = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxthumb://type=Asset&id=6479819635&w=150&h=150",
	PremiumOnly = false
})
Credits:AddParagraph("Credits","Created by: Nexer1234. Draggable Orion Lib: GiangHub/ArticleHub")

Credits:AddButton({
	Name = "Copy Youtube Channel",
	Callback = function()
			 setclipboard(tostring("https://www.youtube.com/@nexer1234"))
			 Notify("Success","Copied the link!", 10, true)
	 end
})	

Credits:AddButton({
	Name = "Copy Discord Server",
	Callback = function()
			 setclipboard(tostring("https://discord.gg/s2VCjQUxBc"))
			 Notify("Success","Copied the link!", 10, true)
	 end
})

OrionLib:Init()

pcall(function()
HintGui:Destroy()
end)

--loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/UI/MoreButtons.luau"))()
