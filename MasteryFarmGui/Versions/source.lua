--[[
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
_G.IsUserPremium = true -- This is responsible for whether the user has a premium or not, don't change it bucko 🤠
_G.IsUserFollowed = false -- This is responsible for whether the user is followed me or not, don't change it too
EnterPortal = function(a,b) a = a or "Teleport1"; b = b or 0.6; NEX:EnterPortal(a,b) end
EquipGlove = function(a,b) a = a or "Default"; b = b or 0.4; NEX:EquipGlove(a,b) end

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

local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then v19=v0(v3(v30,1,1));return "";else local v83=v2(v0(v30,16));if v19 then local v89=v5(v83,v19);v19=nil;return v89;else return v83;end end end);local function v20(v31,v32,v33) if v33 then local v84=(v31/((5 -3)^(v32-(2 -1))))%(((4 -1) -1)^(((v33-(1 + 0)) -(v32-((3 -1) -1))) + (1066 -(68 + 997)))) ;return v84-(v84%(1271 -(226 + 1044))) ;else local v85=619 -((735 -(67 + 113)) + 64) ;local v86;while true do if (v85==(931 -(857 + 74))) then v86=(570 -(367 + 201))^(v32-((681 + 247) -(214 + 713))) ;return (((v31%(v86 + v86))>=v86) and ((2351 -1393) -(892 + 65))) or (0 + 0) ;end end end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35=0 + 0 ;local v36;local v37;while true do if (v35==(3 -2)) then return (v37 * (1208 -(802 + 150))) + v36 ;end if (v35==(0 -0)) then v36,v37=v1(v16,v18,v18 + 2 );v18=v18 + ((1000 -(915 + 82)) -1) ;v35=1 + 0 ;end end end local function v23() local v38,v39,v40,v41=v1(v16,v18,v18 + 3 );v18=v18 + (11 -7) ;return (v41 * ((22173252 -12399750) + 7003714)) + (v40 * ((188533 -102345) -(3591 + 17061))) + (v39 * (1443 -(1069 + 118))) + v38 ;end local function v24() local v42=0;local v43;local v44;local v45;local v46;local v47;local v48;while true do if (v42==3) then if (v47==0) then if (v46==(0 -0)) then return v48 * (0 + 0 + 0) ;else local v98=791 -(368 + 423) ;while true do if (v98==(0 -(885 -(261 + 624)))) then v47=19 -((1433 -(630 + 793)) + (26 -18)) ;v45=0 -0 ;break;end end end elseif (v47==2047) then return ((v46==(442 -(416 + 26))) and (v48 * ((3 -(3 -1))/(0 + 0)))) or (v48 * NaN) ;end return v8(v48,v47-(1809 -786) ) * (v45 + (v46/((440 -(145 + 293))^(482 -(44 + (1466 -(1020 + 60))))))) ;end if (v42==(1486 -(998 + 488))) then v43=v23();v44=v23();v42=1 + 0 ;end if (v42==(2 + 0)) then v47=v20(v44,793 -(201 + 571) ,1169 -(116 + 403 + 619) );v48=((v20(v44,133 -101 )==(3 -2)) and  -(1 + 0)) or (3 -(1749 -(760 + 987))) ;v42=3;end if (v42==(3 -2)) then v45=1;v46=(v20(v44,860 -(814 + 45) ,49 -29 ) * (2^(2 + 30))) + v43 ;v42=2;end end end local function v25(v49) local v50;if  not v49 then v49=v23();if (v49==(1913 -(1789 + 124))) then return "";end end v50=v3(v16,v18,(v18 + v49) -(767 -(745 + 21)) );v18=v18 + v49 ;local v51={};for v66=1 + 0 , #v50 do v51[v66]=v2(v1(v3(v50,v66,v66)));end return v6(v51);end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v52=(function() return 0;end)();local v53=(function() return;end)();local v54=(function() return;end)();local v55=(function() return;end)();local v56=(function() return;end)();local v57=(function() return;end)();local v58=(function() return;end)();local v59=(function() return;end)();while true do local v68=(function() return 0;end)();while true do if (1~=v68) then else if (1==v52) then local v97=(function() return 0;end)();while true do if (v97==0) then v57=(function() return {v54,v55,nil,v56};end)();v58=(function() return v23();end)();v97=(function() return 1 + 0 ;end)();end if (v97==1) then v59=(function() return {};end)();for v101= #"]",v58 do local v102=(function() return 0 -0 ;end)();local v103=(function() return;end)();local v104=(function() return;end)();local v105=(function() return;end)();while true do if (v102==(0 -0)) then v103=(function() return 603 -(268 + 335) ;end)();v104=(function() return nil;end)();v102=(function() return 3 -2 ;end)();end if (v102==(291 -(60 + 230))) then v105=(function() return nil;end)();while true do if ((868 -(550 + 317))~=v103) then else if (v104== #"}") then v105=(function() return v21()~=(0 -0) ;end)();elseif (v104==2) then v105=(function() return v24();end)();elseif (v104== #"nil") then v105=(function() return v25();end)();end v59[v101]=(function() return v105;end)();break;end if ((0 -0)~=v103) then else local v120=(function() return 572 -(426 + 146) ;end)();local v121=(function() return;end)();while true do if (v120==(0 -0)) then v121=(function() return 0;end)();while true do if ((1 + 0)~=v121) then else v103=(function() return 1;end)();break;end if (v121==(285 -(134 + 151))) then v104=(function() return v21();end)();v105=(function() return nil;end)();v121=(function() return 1;end)();end end break;end end end end break;end end end v97=(function() return 813 -(569 + 242) ;end)();end if (v97~=2) then else v52=(function() return 2;end)();break;end end end break;end if (v68~=(0 -0)) then else local v90=(function() return 0 + 0 ;end)();while true do if ((1666 -(970 + 695))==v90) then v68=(function() return 1 -0 ;end)();break;end if (v90==(1271 -(945 + 326))) then if (v52==(1990 -(582 + 1408))) then local v99=(function() return 0 -0 ;end)();while true do if ((701 -(271 + 429))==v99) then v55=(function() return {};end)();v56=(function() return {};end)();v99=(function() return 2 -0 ;end)();end if (v99~=(7 -5)) then else v52=(function() return 1825 -(1195 + 629) ;end)();break;end if (v99==(0 -0)) then v53=(function() return function(v110,v111,v112) local v113=(function() return 0 + 0 ;end)();local v114=(function() return;end)();while true do if (v113==(241 -(187 + 54))) then v114=(function() return 780 -(162 + 618) ;end)();while true do if (v114==(1086 -(461 + 625))) then local v125=(function() return 1288 -(993 + 295) ;end)();while true do if ((0 + 0)==v125) then v110[v111-#"|" ]=(function() return v112();end)();return v110,v111,v112;end end end end break;end end end;end)();v54=(function() return {};end)();v99=(function() return 1 + 0 ;end)();end end end if (v52==(1173 -(418 + 753))) then v57[ #"91("]=(function() return v21();end)();for v106= #"<",v23() do local v107=(function() return 0 + 0 ;end)();local v108=(function() return;end)();while true do if (v107==0) then v108=(function() return v21();end)();if (v20(v108, #"|", #" ")~=(0 -0)) then else local v115=(function() return 0 -0 ;end)();local v116=(function() return;end)();local v117=(function() return;end)();local v118=(function() return;end)();while true do if (v115==(1 + 0)) then local v122=(function() return 1636 -(1373 + 263) ;end)();while true do if (v122~=(1 + 0)) then else v115=(function() return 1002 -(451 + 549) ;end)();break;end if (v122==0) then v118=(function() return {v22(),v22(),nil,nil};end)();if (v116==0) then local v3066=(function() return 529 -(406 + 123) ;end)();local v3067=(function() return;end)();while true do if (v3066==0) then v3067=(function() return 0;end)();while true do if (v3067==0) then v118[ #"91("]=(function() return v22();end)();v118[ #"0836"]=(function() return v22();end)();break;end end break;end end elseif (v116== #"{") then v118[ #"xxx"]=(function() return v23();end)();elseif (v116==2) then v118[ #"nil"]=(function() return v23() -((2 -0)^(26 -10)) ;end)();elseif (v116~= #"-19") then else local v5282=(function() return 0;end)();local v5283=(function() return;end)();while true do if ((1384 -(746 + 638))==v5282) then v5283=(function() return 0 + 0 ;end)();while true do if (v5283~=0) then else v118[ #"xnx"]=(function() return v23() -((1147 -(466 + 679))^(38 -22)) ;end)();v118[ #".dev"]=(function() return v22();end)();break;end end break;end end end v122=(function() return 1 -0 ;end)();end end end if (v115==(5 -3)) then if (v20(v117, #" ", #":")~= #"[") then else v118[343 -(218 + 123) ]=(function() return v59[v118[1902 -(106 + 1794) ]];end)();end if (v20(v117,1 + 1 ,1583 -(1535 + 46) )~= #"~") then else v118[ #"19("]=(function() return v59[v118[ #"asd"]];end)();end v115=(function() return 1 + 2 ;end)();end if (v115==(3 + 0)) then if (v20(v117, #"asd", #"19(")== #"/") then v118[ #"0313"]=(function() return v59[v118[ #"0313"]];end)();end v54[v106]=(function() return v118;end)();break;end if (v115~=(0 + 0)) then else local v124=(function() return 0;end)();while true do if (v124~=(0 -0)) then else v116=(function() return v20(v108,562 -(306 + 254) , #"gha");end)();v117=(function() return v20(v108, #"http",120 -(4 + 110) );end)();v124=(function() return 1 + 0 ;end)();end if (v124==(1 -0)) then v115=(function() return 104 -(17 + 86) ;end)();break;end end end end end break;end end end for v109= #":",v23() do v55,v109,v28=(function() return v53(v55,v109,v28);end)();end return v57;end v90=(function() return 1;end)();end end end end end end local function v29(v60,v61,v62) local v63=v60[(1585 -(549 + 1035)) + 0 ];local v64=v60[3 -1 ];local v65=v60[8 -5 ];return function(...) local v69=v63;local v70=v64;local v71=v65;local v72=v27;local v73=167 -(122 + 44) ;local v74= -(1 -0);local v75={};local v76={...};local v77=v12("#",...) -((6 -3) -2) ;local v78={};local v79={};for v87=0 + 0 ,v77 do if ((v87>=v71) or (3425<=1424)) then v75[v87-v71 ]=v76[v87 + 1 + 0 + 0 ];else v79[v87]=v76[v87 + (1 -0) ];end end local v80=(v77-v71) + (66 -(30 + 35)) ;local v81;local v82;while true do local v88=0 + 0 + 0 ;while true do if ((2879<4329) and ((v88==(1258 -(1043 + 214))) or (4481<=241))) then if (v82<=(495 -364)) then if (v82<=65) then if (v82<=((2205 -(546 + 415)) -(323 + 889))) then if (v82<=(40 -25)) then if (v82<=(587 -((1385 -(175 + 849)) + 219))) then if ((v82<=((1987 -(734 + 930)) -(53 + (1682 -(1093 + 322))))) or (452>4800)) then if ((2082==2082) and (3886>892) and (v82<=(1 + 0))) then if (v82==0) then v79[v81[415 -(15 + 398) ]]=v62[v81[985 -(18 + 964) ]];v73=v73 + (3 -(7 -5)) ;v81=v69[v73];v79[v81[1303 -(1256 + 45) ]][v81[2 + 1 ]]=v79[v81[3 + 1 ]];v73=v73 + (851 -(20 + 830)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[129 -(116 + (1855 -(66 + 1779))) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[1 + 2 ]][v81[742 -((2315 -(920 + 853)) + 196) ]];v73=v73 + 1 ;v81=v69[v73];if ((v79[v81[3 -1 ]]==v81[4]) or (1768>=4498)) then v73=v73 + 1 + 0 ;else v73=v81[(60 -(6 + 52)) + 1 ];end else local v138=0 + 0 ;local v139;while true do if (8==v138) then v73=v73 + (2 -1) ;v81=v69[v73];v139=v81[2];v79[v139]=v79[v139](v13(v79,v139 + (2 -1) ,v81[1554 -(1126 + 425) ]));v73=v73 + 1 ;v81=v69[v73];v138=414 -(118 + 287) ;end if ((v138==(23 -17)) or (2390==4110)) then v73=v73 + (1122 -(118 + 1003)) ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[5 -2 ]][v81[14 -10 ]];v73=v73 + (378 -(142 + 235)) ;v81=v69[v73];v79[v81[9 -7 ]]=v81[3];v138=7;end if (((3287<=3421) and (v138==7)) or (457>=607)) then v73=v73 + (2 -1) + 0 ;v81=v69[v73];v79[v81[979 -(553 + 424) ]]=v81[5 -2 ];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v81[3 + 0 ];v138=5 + 3 ;end if ((2311==2311) and ((2 + 1)==v138)) then v81=v69[v73];v79[v81[2 + 0 ]]=v81[6 -3 ];v73=v73 + (2 -1) ;v81=v69[v73];v139=v81[2];v79[v139](v79[v139 + (2 -1) ]);v138=2 + 2 ;end if (v138==(9 -7)) then v81=v69[v73];v79[v81[755 -(239 + 514) ]]=v62[v81[(7 -5) + 1 ]];v73=v73 + (1330 -(797 + 532)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3]][v81[2 + 2 + 0 ]];v73=v73 + ((2 + 0) -1) ;v138=3;end if ((v138==1) or (3564<3441) or (1327<=1049)) then v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[1206 -(373 + 829) ]];v73=v73 + 1 ;v81=v69[v73];v62[v81[734 -(476 + 255) ]]=v79[v81[(1219 -(11 + 76)) -(369 + 761) ]];v73=v73 + 1 + 0 ;v138=2;end if ((v138==(9 -4)) or (1518<1170)) then v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[240 -(64 + 174) ]]=v79[v81[1 + 2 ]][v81[5 -1 ]];v73=v73 + ((907 -570) -(144 + (1014 -(560 + 262)))) ;v81=v69[v73];v79[v81[218 -((52 -10) + 174) ]]=v62[v81[3 + 0 ]];v138=5 + 1 ;end if ((v138==9) or (3670<=1427)) then v79[v81[2]][v81[2 + (1858 -(12 + 1845)) ]]=v79[v81[1508 -(363 + 1141) ]];break;end if (v138==(1580 -(1183 + 397))) then v139=nil;v79[v81[(5 + 0) -(1320 -(1278 + 39)) ]]=v79[v81[(9 -6) + 0 ]][v81[3 + 1 ]];v73=v73 + ((1253 + 723) -(1913 + 62)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[4]];v73=v73 + 1 + 0 ;v138=2 -(1 -0) ;end if ((1937 -(565 + 1368))==v138) then v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[1663 -(1477 + 184) ]]=v62[v81[3 -0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[858 -(564 + 292) ]]=v79[v81[4 -1 ]][v81[11 -7 ]];v138=(1222 -913) -(244 + 60) ;end end end elseif ((4679>3340) and (v82>(2 + 0))) then local v140=476 -(41 + 435) ;while true do if (v140==1) then v73=v73 + 1 ;v81=v69[v73];v79[v81[1003 -(632 + 306 + 63) ]]=v62[v81[3 + 0 ]];v73=v73 + (1126 -(936 + 189)) ;v140=1 + 1 ;end if ((v140==2) or (4161<=3954)) then v81=v69[v73];v79[v81[(681 + 934) -(1565 + (1584 -(385 + 1151))) ]]=v79[v81[2 + 1 ]][v81[1142 -(782 + 356) ]];v73=v73 + 1 ;v81=v69[v73];v140=3;end if ((1844<4146) and (v140==(270 -(176 + 91)))) then if ((405>244) and ((v79[v81[2]]==v81[10 -6 ]) or (264>=3522))) then v73=v73 + 1 ;else v73=v81[4 -1 ];end break;end if ((v140==(1092 -((2425 -(240 + 1210)) + 117))) or (2855==4370)) then v79[v81[2]]=v62[v81[(3543 -(816 + 849)) -(157 + 1718) ]];v73=v73 + 1 + (1854 -(99 + 1755)) ;v81=v69[v73];v79[v81[6 -4 ]][v81[10 -7 ]]=v79[v81[1022 -(697 + 321) ]];v140=2 -1 ;end end else local v141;local v142;local v143;v79[v81[3 -1 ]]=v62[v81[6 -3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v143=v81[(3 -0) -(785 -(424 + 360)) ];v142=v79[v81[7 -(1378 -(41 + 1333)) ]];v79[v143 + (1228 -(322 + 905)) ]=v142;v79[v143]=v142[v81[4]];v73=v73 + (612 -(602 + 9)) ;v81=v69[v73];v79[v81[2]]={};v73=v73 + (1190 -(449 + 740)) ;v81=v69[v73];v79[v81[874 -(826 + 46) ]][v81[(1495 -(161 + 384)) -(245 + 702) ]]=v81[12 -8 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[(932 -(355 + 576)) + 1 ]]=v81[1901 -(260 + 1638) ];v73=v73 + (441 -(382 + 58)) ;v81=v69[v73];v79[v81[2]]=v79[v81[9 -6 ]][v81[4 + 0 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[5 -3 ]]=v81[690 -(348 + 339) ];v73=v73 + (1206 -(902 + 303)) ;v81=v69[v73];v142=v81[5 -2 ];v141=v79[v142];for v2972=v142 + (4 -3) ,v81[9 -5 ] do v141=v141   .. v79[v2972] ;end v79[v81[1 + 1 ]]=v141;v73=v73 + 1 ;v81=v69[v73];v79[v81[1692 -(1121 + 569) ]][v81[3]]=v79[v81[218 -(22 + 192) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[685 -(483 + 200) ]][v81[3]]=v81[(7196 -5729) -((1872 -(285 + 183)) + 59) ];v73=v73 + 1 ;v81=v69[v73];v79[v81[(12 -7) -3 ]][v81[3 -0 ]]=v81[769 -(468 + 297) ];v73=v73 + (563 -(334 + 101 + 127)) ;v81=v69[v73];v143=v81[(1976 -(928 + 1042)) -4 ];v79[v143](v13(v79,v143 + (1577 -(545 + 1031)) ,v81[6 -3 ]));v73=v73 + ((2 -1) -0) ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[3]];v73=v73 + (237 -(141 + 95)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[7 -4 ]][v81[9 -5 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[1 + 2 ]][v81[10 -6 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[2 + 1 ]][v81[5 -(3 -2) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v62[v81[166 -(92 + 71) ]]=v79[v81[1 + 1 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[767 -((988 -414) + 191) ]]=v62[v81[3 + 0 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[852 -((1179 -(345 + 580)) + 595) ]][v81[4]];v73=v73 + (127 -(55 + 71)) ;v81=v69[v73];v79[v81[2]]=v81[6 -3 ];v73=v73 + (1 -(0 + 0)) ;v81=v69[v73];v143=v81[1792 -(573 + 1217) ];v79[v143](v79[v143 + (2 -1) ]);v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]=v62[v81[3]];v73=v73 + 1 ;v81=v69[v73];v79[v81[941 -(714 + 225) ]]=v79[v81[8 -5 ]][v81[5 -1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[(311 -(136 + 173)) -0 ]]=v79[v81[3]][v81[4]];v73=v73 + (807 -(118 + (2591 -(1448 + 455)))) ;v81=v69[v73];v79[v81[50 -((69 -44) + 23) ]]=v62[v81[1 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1888 -(927 + 959) ]]=v79[v81[3]][v81[(6 + 7) -9 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[734 -(16 + 716) ]]=v81[3];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[99 -(11 + 86) ]]=v81[(4 + 2) -3 ];v73=v73 + (286 -(175 + 110)) ;v81=v69[v73];v79[v81[4 -2 ]]=v81[(31 -17) -11 ];v73=v73 + (1797 -(503 + 1293)) ;v81=v69[v73];v143=v81[5 -3 ];v79[v143]=v79[v143](v13(v79,v143 + 1 + 0 ,v81[1064 -(810 + 251) ]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]][v81[3]]=v79[v81[4 + 0 ]];end elseif ((4551>=2382) and (v82<=(538 -(43 + 490)))) then if ((1143==1143) and (v82==4)) then local v199=733 -(711 + 22) ;local v200;local v201;while true do if ((23 -17)==v199) then if v79[v81[861 -(240 + 619) ]] then v73=v73 + 1 + 0 ;else v73=v81[3];end break;end if ((4371>=913) and (v199==0)) then v200=nil;v201=nil;v79[v81[2]]=v79[v81[3]][v81[4]];v73=v73 + ((1562 -(1137 + 424)) -0) ;v199=1928 -(372 + 1555) ;end if ((1924>=313) and (v199==(1 + 2))) then v200=v79[v81[3]];v79[v201 + ((2126 -(174 + 207)) -(1344 + 109 + 291)) ]=v200;v79[v201]=v200[v81[4]];v73=v73 + (406 -(255 + 150)) ;v199=4 + 0 + 0 ;end if ((v199==(3 + 2)) or (1887>2345)) then v201=v81[8 -6 ];v79[v201]=v79[v201](v13(v79,v201 + (3 -2) ,v81[3]));v73=v73 + (1740 -(404 + 1335)) ;v81=v69[v73];v199=412 -(183 + 223) ;end if (v199==(1 -0)) then v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[2 + 1 ]][v81[341 -(10 + 327) ]];v73=v73 + 1 ;v81=v69[v73];v199=2 + 0 ;end if (v199==(340 -(118 + 220))) then v79[v81[1 + 1 + 0 ]]=v79[v81[3]][v81[453 -((179 -(65 + 6)) + 341) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v201=v81[8 -6 ];v199=1496 -(711 + 782) ;end if ((7 -(1314 -(1041 + 270)))==v199) then v81=v69[v73];v79[v81[2]]=v81[3];v73=v73 + 1 ;v81=v69[v73];v199=474 -(270 + 199) ;end end else local v202;local v203;local v204;v79[v81[2]]=v79[v81[1 + 2 ]][v81[1823 -(580 + (2173 -934)) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[(3 + 2) -3 ]]=v79[v81[9 -6 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[1713 -(222 + 1488) ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 + 0 ]]=v79[v81[7 -4 ]][v81[3 + 1 ]];v73=v73 + (1168 -(525 + 120 + 522)) ;v81=v69[v73];v79[v81[2]]=v62[v81[(3315 -(1023 + 499)) -((1837 -827) + 780) ]];v73=v73 + (3 -2) + 0 ;v81=v69[v73];v204=v81[9 -7 ];v203=v79[v81[8 -5 ]];v79[v204 + (1837 -(1045 + 791)) ]=v203;v79[v204]=v203[v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[3]][v81[5 -1 ]];v73=v73 + (506 -(351 + 154)) ;v81=v69[v73];v79[v81[1576 -(1281 + 178 + 115) ]]=v81[269 -(28 + 238) ];v73=v73 + (2 -1) ;v81=v69[v73];v203=v81[1562 -(1381 + 178) ];v202=v79[v203];for v2973=v203 + 1 + 0 ,v81[4 + 0 ] do v202=v202   .. v79[v2973] ;end v79[v81[1 + 1 ]]=v202;v73=v73 + (3 -2) ;v81=v69[v73];v204=v81[(5 -3) + 0 ];v79[v204]=v79[v204](v13(v79,v204 + ((13 + 458) -(381 + 89)) ,v81[3 + 0 ]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[4 -1 ]][v81[1160 -(1074 + 82) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]][v81[3]]=v79[v81[(1606 + 182) -(214 + 1570) ]];v73=v73 + 1 ;v81=v69[v73];v73=v81[1458 -(990 + 465) ];end elseif ((v82==(3 + 3)) or (4904<=1346)) then local v231;v79[v81[1 + 1 ]]=v79[v81[3 + 0 ]][v81[4]];v73=v73 + ((2 + 1) -2) ;v81=v69[v73];v79[v81[1728 -(1668 + 58) ]]=v79[v81[629 -(512 + 114) ]][v81[10 -6 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[6 -4 ]]=v79[v81[2 + (808 -(134 + 673)) ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[(1060 -(810 + 247)) + 0 ]][v81[13 -9 ]];v73=v73 + (1995 -(109 + 1885)) ;v81=v69[v73];v79[v81[1471 -(1269 + 200) ]]=v79[v81[3]][v81[4]];v73=v73 + ((1461 -(753 + 707)) -0) ;v81=v69[v73];v79[v81[817 -(98 + 717) ]]=v79[v81[3]][v81[830 -(802 + 24) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[3 -0 ]][v81[1 + 3 ]];v73=v73 + 1 + (0 -0) ;v81=v69[v73];v79[v81[2]]=v62[v81[1 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[603 -(462 + 138) ]][v81[13 -9 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[3];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 + 0 ]]=v81[3 + 0 + 0 ];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1435 -(797 + 636) ]]=v81[3];v73=v73 + (4 -3) ;v81=v69[v73];v231=v81[1621 -(1427 + 192) ];v79[v231]=v79[v231](v13(v79,v231 + 1 ,v81[3]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[6 -3 ]] * v79[v81[13 -9 ]] ;v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[3]];v73=v73 + (327 -(192 + 134)) ;v81=v69[v73];v79[v81[1278 -(316 + (1620 -(642 + 18))) ]]=v79[v81[2 + 1 ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[3 + 0 ];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[553 -(83 + 468) ]]=v81[3];v73=v73 + (1807 -(1202 + 604)) ;v81=v69[v73];v79[v81[2]]=v81[3];v73=v73 + (4 -3) ;v81=v69[v73];v231=v81[2];v79[v231]=v79[v231](v13(v79,v231 + (1 -0) ,v81[8 -(983 -(155 + 823)) ]));v73=v73 + (326 -(45 + 280)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3 + 0 ]] * v79[v81[4 + 0 + 0 ]] ;v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]][v81[1 + 2 ]]=v79[v81[(5 + 1) -2 ]];v73=v73 + (1912 -(340 + 1571)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[1775 -(1733 + 39) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[(950 + 86) -(125 + 909) ]]=v79[v81[1951 -(1096 + 852) ]][v81[2 + 2 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[515 -(409 + 103) ];v73=v73 + (237 -(26 + 20 + 190)) ;v81=v69[v73];v231=v81[97 -(51 + 44) ];v79[v231](v79[v231 + 1 + 0 ]);v73=v73 + (1454 -(799 + 654)) ;v81=v69[v73];v79[v81[1319 -(1114 + (442 -239)) ]]=v81[729 -((787 -559) + 498) ];v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[2 + 1 ];else v79[v81[665 -(174 + 489) ]]=v79[v81[7 -(4 -0) ]][v81[(2542 -(527 + 106)) -(830 + 1075) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[527 -(303 + 221) ]][v81[4]];v73=v73 + ((2174 -904) -(231 + 1038)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3 + 0 ]][v81[1166 -(171 + 991) ]];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[3]][v81[9 -5 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[6 -4 ]]=v79[v81[8 -5 ]][v81[5 -1 ]];v73=v73 + (3 -2) ;v81=v69[v73];if (v79[v81[2]]==v81[1252 -(28 + 83 + 1137) ]) then v73=v73 + (159 -(91 + 67)) ;else v73=v81[3];end end elseif (v82<=(32 -21)) then if (v82<=9) then if (((3926>=1297) and (v82>(2 + 6))) or (1376>=2443)) then local v284;local v285;v79[v81[2]]=v79[v81[3]][v81[527 -(423 + 100) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[7 -4 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[773 -(272 + 54 + 445) ]]=v79[v81[13 -(8 + 2) ]][v81[8 -4 ]];v73=v73 + (2 -1) ;v81=v69[v73];v285=v81[713 -(530 + 181) ];v284=v79[v81[884 -(28 + 586 + (905 -638)) ]];v79[v285 + (33 -(19 + 13)) ]=v284;v79[v285]=v284[v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[4 -2 ]]=v81[3];v73=v73 + (2 -(1 + 0)) ;v81=v69[v73];v285=v81[1 + 1 ];v79[v285]=v79[v285](v13(v79,v285 + (1 -0) ,v81[3]));v73=v73 + 1 ;v81=v69[v73];if (v79[v81[3 -1 ]] or (4403==1131)) then v73=v73 + (1813 -(1293 + 519)) ;else v73=v81[3];end else local v300;local v301;local v300,v302;local v303;local v304;v79[v81[2]]=v79[v81[5 -2 ]][v81[9 -5 ]];v73=v73 + (1 -0) ;v81=v69[v73];for v2974=v81[8 -6 ],v81[6 -(736 -(589 + 144)) ] do v79[v2974]=nil;end v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 + 0 ]]=v62[v81[1 + 2 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[3]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[531 -(179 + 349) ]][v81[3 + 1 ]];v73=v73 + ((4663 -3566) -(709 + 387)) ;v81=v69[v73];v304=v81[1860 -(673 + 1185) ];v303=v79[v81[8 -(13 -8) ]];v79[v304 + (3 -2) ]=v303;v79[v304]=v303[v81[6 -2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v304=v81[2 + 0 ];v300,v302=v72(v79[v304](v79[v304 + (1 -0) ]));v74=(v302 + v304) -(1 + 0 + 0) ;v301=0 -0 ;for v2976=v304,v74 do local v2977=0 + 0 ;while true do if (v2977==0) then v301=v301 + 1 ;v79[v2976]=v300[v301];break;end end end v73=v73 + (1 -0) ;v81=v69[v73];v304=v81[2];v300={v79[v304](v13(v79,v304 + (1881 -(446 + 1434)) ,v74))};v301=1283 -(1040 + 243) ;for v2978=v304,v81[11 -7 ] do local v2979=1847 -(559 + 1288) ;while true do if (v2979==(1931 -(609 + 1322))) then v301=v301 + 1 ;v79[v2978]=v300[v301];break;end end end v73=v73 + 1 ;v81=v69[v73];v73=v81[457 -(9 + 4 + 441) ];end elseif (v82>(37 -27)) then local v321;local v322;v79[v81[5 -3 ]]=v79[v81[14 -(21 -10) ]][v81[1 + 3 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2]]=v79[v81[2 + 1 ]][v81[2 + 2 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[4 -1 ]][v81[3 + 1 ]];v73=v73 + 1 + 0 + 0 ;v81=v69[v73];v322=v81[2 + 0 ];v321=v79[v81[3 + 0 ]];v79[v322 + 1 ]=v321;v79[v322]=v321[v81[4 + 0 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[(293 + 142) -(153 + 280) ]]=v81[3];v73=v73 + (2 -1) ;v81=v69[v73];v322=v81[2 + 0 ];v79[v322]=v79[v322](v13(v79,v322 + 1 + 0 ,v81[2 + 1 ]));v73=v73 + 1 + 0 ;v81=v69[v73];v322=v81[2 + 0 ];v321=v79[v81[3]];v79[v322 + 1 + 0 ]=v321;v79[v322]=v321[v81[5 -1 ]];v73=v73 + 1 ;v81=v69[v73];v322=v81[2 + 0 ];v79[v322](v79[v322 + (668 -(89 + 578)) ]);v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[5 -2 ];else local v341=1049 -(572 + 477) ;while true do if ((2738<3964) and (v341==(0 + 0))) then v79[v81[2 + 0 + 0 ]]=v62[v81[1 + 2 ]];v73=v73 + ((573 -(242 + 244)) -(84 + 2)) ;v81=v69[v73];v79[v81[2 -0 ]][v81[3 + (407 -(303 + 104)) ]]=v79[v81[846 -(497 + 345) ]];v341=1 + 0 ;end if (v341==((3 -2) + 0)) then v73=v73 + 1 ;v81=v69[v73];v79[v81[(593 + 742) -(605 + 728) ]]=v62[v81[3 + 0 ]];v73=v73 + (1 -0) ;v341=1 + 1 ;end if (2==v341) then v81=v69[v73];v79[v81[7 -5 ]]=v79[v81[3 + 0 ]][v81[(653 -(411 + 232)) -6 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v341=492 -(457 + 32) ;end if ((v341==(2 + 0 + 1 + 0)) or (3655==466)) then if (v79[v81[1404 -(832 + 570) ]]==v81[4 + 0 ]) then v73=v73 + 1 + 0 ;else v73=v81[(29 -19) -7 ];end break;end end end elseif (v82<=(7 + 6)) then if ((2936>2896) and (v82>(808 -(588 + 208)))) then v79[v81[5 -(6 -3) ]]=v79[v81[1803 -(884 + 916) ]][v81[8 -4 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[656 -(232 + 421) ]][v81[4]];v73=v73 + (1890 -(1569 + 320)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[1 + 3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[6 -4 ]]=v79[v81[3]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[607 -(316 + 289) ]]=v79[v81[7 -4 ]][v81[1 + 3 ]];v73=v73 + 1 ;v81=v69[v73];v62[v81[1456 -(666 + 787) ]]=v79[v81[2]];else local v353;local v354;v79[v81[2]]=v79[v81[3]][v81[429 -(360 + 48 + 17) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[256 -(79 + 54 + 121) ]]=v79[v81[(11 -7) -1 ]][v81[4 + (481 -(164 + 317)) ]];v73=v73 + ((101 -(65 + 34)) -1) ;v81=v69[v73];v79[v81[(7 -4) -1 ]]=v81[(532 + 370) -(503 + 396) ];v73=v73 + (182 -(92 + 89)) ;v81=v69[v73];v79[v81[3 -1 ]]= #v79[v81[2 + 1 ]];v73=v73 + 1 + (318 -(61 + 257)) ;v81=v69[v73];v354=v81[7 -(1884 -(398 + 1481)) ];v79[v354]=v79[v354](v13(v79,v354 + 1 + 0 ,v81[6 -3 ]));v73=v73 + (1 -0) + 0 ;v81=v69[v73];v354=v81[1 + 1 ];v353=v79[v81[8 -5 ]];v79[v354 + 1 + 0 ]=v353;v79[v354]=v353[v81[5 -1 ]];v73=v73 + (1245 -(485 + 759)) ;v81=v69[v73];v354=v81[2];v79[v354]=v79[v354](v79[v354 + (2 -1) ]);v73=v73 + 1 ;v81=v69[v73];v354=v81[1191 -(442 + 747) ];v353=v79[v81[1138 -((1906 -1074) + 218 + 85) ]];v79[v354 + ((1693 -746) -(88 + 858)) ]=v353;v79[v354]=v353[v81[690 -(338 + 348) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v354=v81[2];v79[v354]=v79[v354](v79[v354 + 1 + 0 ]);v73=v73 + (1379 -(401 + 977)) + (0 -0) ;v81=v69[v73];if ((1366<=1574) and (v79[v81[791 -(766 + 23) ]]==v79[v81[19 -15 ]])) then v73=v73 + (1 -0) ;else v73=v81[7 -(4 + 0) ];end end elseif ((v82>(59 -(17 + 28))) or (4583<1701)) then local v374=0 -(185 -(27 + 158)) ;local v375;local v376;local v377;while true do if ((v374==(1076 -(1036 + 37))) or (3373>4683)) then v376=v81[3 + 0 ];v375=v79[v376];for v5080=v376 + (1 -(0 -0)) ,v81[4 + 0 ] do v375=v375   .. v79[v5080] ;end v79[v81[2]]=v375;v73=v73 + (1481 -(641 + 839)) ;v81=v69[v73];v374=917 -(910 + 3) ;end if (v374==((2 + 10) -7)) then v81=v69[v73];v79[v81[1686 -(1466 + 218) ]]=v79[v81[2 + 1 + 0 ]][v81[1152 -(556 + 592) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[811 -(329 + 479) ]][v81[858 -(174 + 680) ]];v73=v73 + 1 ;v374=20 -14 ;end if (v374==(3 -1)) then v79[v81[1 + 1 + (1293 -(372 + 921)) ]]=v79[v81[742 -(396 + 343) ]][v81[1 + 3 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1479 -(29 + 1448) ]]=v81[3];v73=v73 + (1390 -(135 + 1254)) ;v81=v69[v73];v374=11 -8 ;end if ((0 -0)==v374) then v375=nil;v376=nil;v377=nil;v377=v81[2];v376=v79[v81[3]];v79[v377 + 1 ]=v376;v374=1;end if (v374==1) then v79[v377]=v376[v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[3];v73=v73 + (1528 -(389 + 1138)) ;v81=v69[v73];v374=2;end if ((1770>=111) and (v374==7)) then v79[v377 + (575 -(102 + 472)) ]=v376;v79[v377]=v376[v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[3];v73=v73 + (1546 -(320 + 1225)) ;v374=14 -6 ;end if ((6 + 0 + (486 -(350 + 133)))==v374) then v73=v73 + 1 ;v81=v69[v73];v79[v81[1466 -(157 + 1307) ]][v81[1862 -(821 + 1038) ]]=v79[v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v73=v81[1 + 2 ];break;end if ((102<=4146) and (v374==((10 + 0) -4))) then v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[7 -(2 + 2) ]][v81[(259 + 771) -(834 + 192) ]];v73=v73 + 1 ;v81=v69[v73];v377=v81[1 + 1 ];v376=v79[v81[1 + 2 ]];v374=1 + 6 ;end if (v374==8) then v81=v69[v73];v377=v81[2];v79[v377]=v79[v377](v13(v79,v377 + 1 ,v81[3]));v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[306 -(300 + 4) ]]=v79[v81[(1539 -(1432 + 106)) + 2 ]][v81[10 -6 ]];v374=371 -(112 + 250) ;end if ((v374==(2 + 2)) or (58>=3897)) then v377=v81[2];v79[v377]=v79[v377](v13(v79,v377 + 1 ,v81[3]));v73=v73 + 1 ;v81=v69[v73];v79[v81[4 -2 ]]=v62[v81[2 + 1 + 0 ]];v73=v73 + 1 + 0 ;v374=4 + 1 ;end end else local v378=0 + 0 ;while true do if ((v378==(3 + 0)) or (1311>3873)) then v62[v81[1417 -((1549 -548) + 299 + 114) ]]=v79[v81[4 -2 ]];break;end if ((3425>3372) and (v378==(884 -(244 + 638)))) then v81=v69[v73];v79[v81[695 -(627 + 66) ]]=v79[v81[8 -5 ]][v81[606 -((1958 -(1075 + 371)) + 90) ]];v73=v73 + (1907 -(1665 + 241)) ;v81=v69[v73];v378=720 -((1429 -1056) + 344) ;end if ((v378==(0 -0)) or (1901<=346) or (1928==244)) then v79[v81[1 + 0 + (3 -2) ]]=v79[v81[3]][v81[2 + 2 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[1102 -(35 + 1064) ]][v81[3 + 1 ]];v378=2 -1 ;end if ((v378==(1 + 0)) or (2761<2024)) then v73=v73 + (1237 -(298 + 938)) ;v81=v69[v73];v79[v81[1261 -(233 + 1026) ]]=v79[v81[1669 -(636 + 1030) ]][v81[3 + 1 ]];v73=v73 + 1 + 0 ;v378=2 + 0 ;end end end elseif ((v82<=(7 + 0 + 16)) or (1122>=4510)) then if ((3192<=4601) and (v82<=(2 + 17))) then if (v82<=17) then if (v82>16) then local v379=221 -(55 + 166) ;local v380;local v381;local v382;while true do if (v379==(0 + 0)) then v380=nil;v381=nil;v382=nil;v382=v81[1 + 1 ];v379=3 -2 ;end if (v379==(301 -(36 + 261))) then v73=v73 + (1 -0) ;v81=v69[v73];v381=v81[1550 -(234 + 1313) ];v380=v79[v381];v379=5;end if ((v379==2) or (990<=878)) then v81=v69[v73];v79[v81[1370 -(34 + 1334) ]]=v81[2 + 1 ];v73=v73 + 1 + 0 ;v81=v69[v73];v379=1286 -(1035 + 248) ;end if ((v379==(27 -(20 + 1))) or (381==2994)) then v382=v81[(3 -1) + 0 ];v79[v382]=v79[v382](v13(v79,v382 + (320 -(134 + 185)) ,v81[1136 -(549 + 584) ]));v73=v73 + (686 -(314 + 371)) ;v81=v69[v73];v379=24 -17 ;end if (v379==(969 -(478 + 490))) then v381=v79[v81[3]];v79[v382 + 1 + 0 ]=v381;v79[v382]=v381[v81[1176 -(786 + 386) ]];v73=v73 + (3 -2) ;v379=1381 -(1055 + 324) ;end if (v379==(1347 -(1093 + 247))) then if v79[v81[2 + 0 ]] then v73=v73 + 1 + 0 ;else v73=v81[(4 + 7) -8 ];end break;end if ((v379==(16 -11)) or (3414<=656)) then for v5081=v381 + ((910 -(597 + 311)) -1) ,v81[9 -5 ] do v380=v380   .. v79[v5081] ;end v79[v81[1 + 1 ]]=v380;v73=v73 + (3 -2) ;v81=v69[v73];v379=20 -14 ;end if (v379==3) then v79[v81[2 + 0 ]]=v79[v81[7 -4 ]][v81[692 -(364 + 324) ]];v73=v73 + (2 -(28 -(13 + 14))) ;v81=v69[v73];v79[v81[4 -2 ]]=v81[3];v379=4;end end else local v383=0 + 0 ;local v384;local v385;while true do if (v383==(4 -(1 + 2))) then v79[v384 + (1 -(1053 -(713 + 340))) ]=v385;v79[v384]=v385[v81[11 -7 ]];break;end if ((v383==((3161 -1893) -(1249 + 19))) or (2302<=1348)) then v384=v81[2];v385=v79[v81[3 + 0 ]];v383=1;end end end elseif ((v82>(70 -52)) or (3334<=2630)) then v79[v81[1088 -(686 + 400) ]]=v79[v81[3 + 0 ]][v81[(197 + 36) -(73 + 156) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[813 -(721 + 90) ]]=v79[v81[1 + (4 -2) ]][v81[4]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[472 -(184 + 40 + 246) ]]=v79[v81[4 -1 ]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v79[v81[1 + 2 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[5 -2 ]][v81[12 -8 ]];v73=v73 + (514 -(203 + 310)) ;v81=v69[v73];v79[v81[1995 -(1238 + 755) ]][v81[1 + 2 ]]=v79[v81[(1889 -(265 + 86)) -((2215 -1506) + 825) ]];else local v399;local v400;v79[v81[2]]=v79[v81[4 -1 ]][v81[5 -(1 + 0) ]];v73=v73 + (865 -(196 + 668)) ;v81=v69[v73];v79[v81[7 -5 ]]=v79[v81[5 -2 ]][v81[837 -(171 + 662) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[95 -((875 -(747 + 124)) + 89) ]]=v79[v81[3]][v81[13 -9 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v400=v81[8 -6 ];v399=v79[v81[2 + (1457 -(692 + 764)) ]];v79[v400 + (1487 -(35 + 1451)) ]=v399;v79[v400]=v399[v81[4]];v73=v73 + (1454 -(28 + 1425)) ;v81=v69[v73];v79[v81[1995 -(941 + 1052) ]]=v81[3 + 0 ];v73=v73 + (1515 -(822 + 692)) ;v81=v69[v73];v400=v81[2];v79[v400]=v79[v400](v13(v79,v400 + (1 -0) ,v81[2 + 1 ]));v73=v73 + 1 ;v81=v69[v73];if (v79[v81[2]] or (2567==4464) or (3899<=3236)) then v73=v73 + 1 ;else v73=v81[300 -(45 + 252) ];end end elseif ((v82<=(21 + 0)) or (174>=1944)) then if (v82>(7 + 13)) then local v416;local v417;v79[v81[4 -2 ]]=v79[v81[436 -(114 + 319) ]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[3]][v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[3]][v81[8 -4 ]];v73=v73 + (1964 -(556 + 1407)) ;v81=v69[v73];v417=v81[2];v416=v79[v81[3]];v79[v417 + (1207 -(741 + 465)) ]=v416;v79[v417]=v416[v81[469 -(170 + 295) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v81[2 + 1 ];v73=v73 + 1 ;v81=v69[v73];v417=v81[2 + 0 ];v79[v417]=v79[v417](v13(v79,v417 + (2 -1) ,v81[3 + 0 ]));v73=v73 + 1 + 0 ;v81=v69[v73];if v79[v81[2 + 0 ]] then v73=v73 + 1 ;else v73=v81[1233 -(957 + 273) ];end else local v432=0 + 0 ;while true do if (v432==0) then v79[v81[1 + 1 ]]=v79[v81[3]][v81[15 -11 ]];v73=v73 + (2 -1) ;v81=v69[v73];v432=2 -1 ;end if ((547<=3293) and (v432==(14 -11))) then v79[v81[1782 -(389 + 1391) ]]=v79[v81[2 + 1 ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v432=4;end if ((1109<2884) and (v432==(1 + 3))) then v79[v81[4 -2 ]]=v79[v81[954 -(783 + 168) ]][v81[13 -9 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v432=5;end if ((v432==(313 -(309 + 2))) or (637==2753)) then v79[v81[5 -3 ]]=v79[v81[1215 -(1090 + 122) ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v432=9 -6 ;end if (v432==1) then v79[v81[2 + 0 ]]=v79[v81[1121 -(628 + 490) ]][v81[1 + 3 ]];v73=v73 + (2 -1) ;v81=v69[v73];v432=2;end if (v432==(22 -17)) then if ((1584>=1138) and (v79[v81[776 -(431 + 343) ]]==v81[4])) then v73=v73 + (1 -0) ;else v73=v81[8 -5 ];end break;end end end elseif ((2267<=2775) and (4068<4208) and (v82>(18 + 4))) then local v433=0 + 0 ;local v434;local v435;while true do if (v433==(1698 -(556 + 1139))) then v434=v79[v81[18 -(6 + 9) ]];v79[v435 + 1 ]=v434;v79[v435]=v434[v81[1 + 3 ]];v73=v73 + 1 ;v433=3 + 1 ;end if (((4864==4864) and (v433==4)) or (4721<3847)) then v81=v69[v73];v79[v81[171 -(28 + 141) ]]=v81[2 + 1 ];v73=v73 + (1 -0) ;v81=v69[v73];v433=4 + 1 ;end if (v433==2) then v79[v81[1319 -(486 + 831) ]]=v79[v81[3]][v81[10 -6 ]];v73=v73 + (3 -2) ;v81=v69[v73];v435=v81[1 + 1 ];v433=3;end if ((676<=4471) and ((v433==(3 -2)) or (3636>=4493))) then v81=v69[v73];v79[v81[1265 -(668 + 595) ]]=v79[v81[3 + 0 ]][v81[1 + 3 ]];v73=v73 + (2 -1) ;v81=v69[v73];v433=292 -(23 + 267) ;end if ((1944 -(1129 + 815))==v433) then v434=nil;v435=nil;v79[v81[389 -(371 + 16) ]]=v79[v81[1753 -(1326 + 424) ]][v81[7 -3 ]];v73=v73 + (3 -2) ;v433=119 -(88 + 30) ;end if ((4558==4558) and ((776 -(720 + 51))==v433)) then v435=v81[4 -2 ];v79[v435]=v79[v435](v13(v79,v435 + (1777 -(421 + 1355)) ,v81[4 -1 ]));v73=v73 + 1 + 0 ;v81=v69[v73];v433=1089 -(286 + 797) ;end if ((3654>3073) and ((v433==6) or (951<837))) then if v79[v81[7 -5 ]] then v73=v73 + (1 -0) ;else v73=v81[442 -(397 + 42) ];end break;end end else local v436;local v437;v79[v81[2]]=v79[v81[3]][v81[2 + 2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[802 -(24 + 776) ]]=v79[v81[4 -1 ]][v81[789 -(222 + 563) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[193 -(23 + 167) ]][v81[4]];v73=v73 + (1799 -(690 + 1108)) ;v81=v69[v73];v437=v81[1 + 1 ];v436=v79[v81[3 + 0 ]];v79[v437 + (849 -(40 + 808)) ]=v436;v79[v437]=v436[v81[1 + 3 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[3];v73=v73 + 1 ;v81=v69[v73];v437=v81[2];v79[v437]=v79[v437](v13(v79,v437 + 1 + 0 ,v81[2 + 1 ]));v73=v73 + (572 -(47 + 524)) ;v81=v69[v73];if v79[v81[2 + 0 ]] then v73=v73 + (2 -1) ;else v73=v81[4 -1 ];end end elseif (v82<=(61 -34)) then if (v82<=25) then if (v82>24) then local v452;local v453;local v452,v454;local v455;local v456;v79[v81[1728 -(1165 + 561) ]]=v79[v81[1 + 2 ]][v81[12 -8 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[481 -(341 + 138) ]]=v79[v81[1 + 2 ]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[328 -(89 + 237) ]]=v79[v81[9 -6 ]][v81[8 -4 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[884 -(581 + 300) ]][v81[1224 -(855 + 365) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]=v79[v81[1 + 2 ]][v81[1239 -(1030 + 205) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[289 -(156 + 130) ]][v81[8 -4 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[1 + 2 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[71 -(10 + 59) ]]=v62[v81[1 + 2 ]];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[1165 -(671 + 492) ]]=v79[v81[3 + 0 ]][v81[1219 -(369 + 846) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[3 + 0 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[1947 -(1036 + 909) ]]=v81[3];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[4 -1 ];v73=v73 + (204 -(11 + 192)) ;v81=v69[v73];v456=v81[2 + 0 ];v79[v456]=v79[v456](v13(v79,v456 + (176 -(135 + 40)) ,v81[6 -3 ]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[4 -1 ]] * v79[v81[180 -(50 + 126) ]] ;v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1 + 1 ]][v81[1416 -(1233 + 180) ]]=v79[v81[4]];v73=v73 + (970 -(522 + 447)) ;v81=v69[v73];v79[v81[2]]=v62[v81[1424 -(107 + 1314) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[5 -3 ]]=v62[v81[2 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v456=v81[3 -1 ];v455=v79[v81[11 -8 ]];v79[v456 + (1911 -(716 + 1194)) ]=v455;v79[v456]=v455[v81[1 + 3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[505 -(74 + 429) ]]=v81[5 -2 ];v73=v73 + 1 + 0 ;v81=v69[v73];v456=v81[4 -2 ];v79[v456]=v79[v456](v13(v79,v456 + 1 + 0 ,v81[8 -5 ]));v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[435 -(279 + 154) ]]=v79[v81[781 -(454 + 324) ]][v81[4 + 0 ]];v73=v73 + (18 -(12 + 5)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[7 -4 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v456=v81[1095 -(277 + 816) ];v455=v79[v81[12 -9 ]];v79[v456 + (1184 -(1058 + 125)) ]=v455;v79[v456]=v455[v81[1 + 3 ]];v73=v73 + (976 -(815 + 160)) ;v81=v69[v73];v456=v81[2];v452,v454=v72(v79[v456](v79[v456 + (4 -3) ]));v74=(v454 + v456) -1 ;v453=0 -0 ;for v2980=v456,v74 do v453=v453 + 1 + 0 ;v79[v2980]=v452[v453];end v73=v73 + (2 -1) ;v81=v69[v73];v456=v81[1900 -(41 + 1857) ];v452={v79[v456](v13(v79,v456 + (2 -1) ,v74))};v453=0;for v2983=v456,v81[5 -1 ] do v453=v453 + (1183 -(229 + 953)) ;v79[v2983]=v452[v453];end v73=v73 + (1775 -(1111 + 663)) ;v81=v69[v73];v73=v81[1582 -(874 + 705) ];else local v503=0;local v504;local v505;local v506;local v507;local v508;while true do if (v503==(1 + 1)) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v62[v81[6 -3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[681 -(642 + 37) ]]=v79[v81[1 + 2 ]][v81[4]];v503=1 + 2 ;end if ((v503==(7 -4)) or (3896==2052)) then v73=v73 + (455 -(233 + 221)) ;v81=v69[v73];v508=v81[4 -2 ];v507=v79[v81[3 + 0 ]];v79[v508 + 1 ]=v507;v79[v508]=v507[v81[1545 -(718 + 823) ]];v503=3 + 1 ;end if ((4135>=3340) and (v503==0)) then v504=nil;v505=nil;v504,v506=nil;v507=nil;v508=nil;v79[v81[2]]=v79[v81[808 -(266 + 539) ]][v81[11 -7 ]];v503=1;end if ((2250==2250) and (1==v503)) then v73=v73 + (1226 -(636 + 589)) ;v81=v69[v73];for v5082=v81[4 -2 ],v81[5 -2 ] do v79[v5082]=nil;end v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[1018 -(657 + 358) ]];v503=4 -2 ;end if ((4849>1256) and (v503==(8 -4))) then v73=v73 + (1188 -(1151 + 36)) ;v81=v69[v73];v508=v81[2 + 0 ];v504,v506=v72(v79[v508](v79[v508 + 1 + 0 ]));v74=(v506 + v508) -1 ;v505=0 -0 ;v503=1837 -(1552 + 280) ;end if ((444<3383) and (2886>=2311) and (v503==(840 -(64 + 770)))) then for v5084=v508,v81[4] do v505=v505 + 1 + 0 ;v79[v5084]=v504[v505];end v73=v73 + (2 -1) ;v81=v69[v73];v73=v81[3];break;end if ((v503==(1 + 4)) or (1669==1734)) then for v5087=v508,v74 do local v5088=1243 -(157 + 1086) ;while true do if ((2235<2755) and (v5088==(0 -0))) then v505=v505 + (4 -3) ;v79[v5087]=v504[v505];break;end end end v73=v73 + 1 ;v81=v69[v73];v508=v81[2 -0 ];v504={v79[v508](v13(v79,v508 + (1 -0) ,v74))};v505=819 -(599 + 220) ;v503=6;end end end elseif (v82==(51 -25)) then local v509;local v510;v79[v81[1933 -(1813 + 118) ]]=v79[v81[3 + 0 ]][v81[1221 -(841 + 376) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[8 -5 ]][v81[863 -(464 + 395) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[840 -(467 + 370) ];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]]= #v79[v81[10 -7 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v510=v81[4 -2 ];v79[v510]=v79[v510](v13(v79,v510 + (521 -(150 + 370)) ,v81[1285 -(74 + 1208) ]));v73=v73 + (2 -1) ;v81=v69[v73];v510=v81[9 -7 ];v509=v79[v81[3 + 0 ]];v79[v510 + (391 -(14 + 376)) ]=v509;v79[v510]=v509[v81[6 -2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v510=v81[2 + 0 ];v79[v510]=v79[v510](v79[v510 + 1 + 0 ]);v73=v73 + (2 -1) ;v81=v69[v73];v510=v81[2 + 0 ];v509=v79[v81[81 -(23 + 55) ]];v79[v510 + (2 -1) ]=v509;v79[v510]=v509[v81[3 + 1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v510=v81[2 -0 ];v79[v510]=v79[v510](v79[v510 + 1 + 0 ]);v73=v73 + (902 -(652 + 249)) ;v81=v69[v73];if ((2921<=4522) and (v79[v81[5 -3 ]]==v79[v81[1872 -(708 + 1160) ]])) then v73=v73 + (2 -1) ;else v73=v81[3];end else local v529;local v530;local v529,v531;local v532;local v533;v79[v81[3 -1 ]]=v79[v81[30 -(10 + 17) ]][v81[1 + 3 ]];v73=v73 + 1 ;v81=v69[v73];for v2986=v81[1734 -(1400 + 332) ],v81[3] do v79[v2986]=nil;end v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v62[v81[3]];v73=v73 + (1909 -(242 + 1666)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[3]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[943 -(850 + 90) ]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v533=v81[1392 -(360 + 1030) ];v532=v79[v81[3]];v79[v533 + 1 + 0 ]=v532;v79[v533]=v532[v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v533=v81[2 -0 ];v529,v531=v72(v79[v533](v79[v533 + (1662 -(909 + 752)) ]));v74=(v531 + v533) -(1224 -(109 + 1114)) ;v530=0 -0 ;for v2988=v533,v74 do local v2989=0 + 0 ;while true do if (v2989==(242 -(6 + 236))) then v530=v530 + 1 + 0 ;v79[v2988]=v529[v530];break;end end end v73=v73 + 1 + 0 ;v81=v69[v73];v533=v81[2];v529={v79[v533](v13(v79,v533 + (1 -0) ,v74))};v530=1133 -(1076 + 57) ;for v2990=v533,v81[1 + 3 ] do local v2991=689 -(579 + 110) ;while true do if ((2822>2728) and ((0 + 0)==v2991)) then v530=v530 + 1 + 0 ;v79[v2990]=v529[v530];break;end end end v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[410 -(174 + 233) ];end elseif (v82<=29) then if (v82>28) then local v550;local v551;local v552;v552=v81[5 -3 ];v551=v79[v81[4 -1 ]];v79[v552 + 1 + 0 ]=v551;v79[v552]=v551[v81[4]];v73=v73 + (1175 -(663 + 511)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[1 + 2 ]][v81[12 -8 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[4 -2 ]]=v81[7 -4 ];v73=v73 + 1 + 0 ;v81=v69[v73];v551=v81[5 -2 ];v550=v79[v551];for v2992=v551 + 1 + 0 ,v81[1 + 3 ] do v550=v550   .. v79[v2992] ;end v79[v81[724 -(478 + 244) ]]=v550;v73=v73 + (518 -(440 + 77)) ;v81=v69[v73];v552=v81[1 + 1 ];v79[v552]=v79[v552](v13(v79,v552 + (3 -2) ,v81[3]));v73=v73 + 1 ;v81=v69[v73];if v79[v81[1558 -(655 + 901) ]] then v73=v73 + 1 + 0 ;else v73=v81[3];end else local v567=0;local v568;local v569;while true do if ((v567==(4 + 0)) or (751>=4160)) then v568=v79[v81[3]];v79[v569 + 1 + 0 ]=v568;v79[v569]=v568[v81[15 -11 ]];v567=5;end if (v567==(1451 -(695 + 750))) then v73=v73 + (3 -2) ;v81=v69[v73];v569=v81[2 -0 ];v567=28 -21 ;end if (v567==(353 -(285 + 66))) then v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1312 -(682 + 628) ]]=v79[v81[1 + 2 ]][v81[303 -(176 + 123) ]];v567=2 + 1 ;end if ((4 + 1)==v567) then v73=v73 + (270 -(239 + 30)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[3 + 0 ];v567=6;end if (v567==(4 -1)) then v73=v73 + 1 ;v81=v69[v73];v569=v81[5 -3 ];v567=319 -(306 + 9) ;end if (v567==(27 -19)) then if v79[v81[1 + 1 ]] then v73=v73 + 1 ;else v73=v81[3];end break;end if (v567==(5 + 2)) then v79[v569]=v79[v569](v13(v79,v569 + 1 + 0 ,v81[8 -5 ]));v73=v73 + (1376 -(1140 + 235)) ;v81=v69[v73];v567=6 + 2 ;end if ((1161>1131) and (v567==(1 + 0))) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[54 -(33 + 19) ]]=v79[v81[2 + 1 ]][v81[11 -7 ]];v567=1 + 1 ;end if ((v567==(0 -0)) or (4530<=3281)) then v568=nil;v569=nil;v79[v81[2]]=v79[v81[3 + 0 ]][v81[4]];v567=690 -(586 + 103) ;end end end elseif ((v82<=(3 + 27)) or (2393>=4654)) then local v570;local v571;local v572;v572=v81[5 -3 ];v571=v79[v81[1491 -(1309 + 179) ]];v79[v572 + (1 -0) ]=v571;v79[v572]=v571[v81[2 + 2 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[5 -2 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[5 -2 ]][v81[613 -(295 + 314) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1964 -(1300 + 662) ]]=v81[9 -6 ];v73=v73 + (1756 -(1178 + 577)) ;v81=v69[v73];v571=v81[2 + 1 ];v570=v79[v571];for v2993=v571 + 1 ,v81[11 -7 ] do v570=v570   .. v79[v2993] ;end v79[v81[1407 -(851 + 554) ]]=v570;v73=v73 + 1 + 0 ;v81=v69[v73];v572=v81[5 -3 ];v79[v572]=v79[v572](v13(v79,v572 + (1 -0) ,v81[3]));v73=v73 + (303 -(115 + 187)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3 + 0 ]][v81[15 -11 ]];v73=v73 + (1162 -(160 + 1001)) ;v81=v69[v73];if ((2151<=4313) and (v79[v81[2 + 0 ]]==v81[3 + 1 ])) then v73=v73 + (1 -0) ;else v73=v81[361 -(237 + 121) ];end elseif ((v82==(928 -(525 + 372))) or (1520>2525)) then local v3078=0 -0 ;local v3079;local v3080;while true do if (v3078==(0 -0)) then v3079=nil;v3080=nil;v79[v81[144 -(96 + 46) ]]=v79[v81[780 -(643 + 134) ]][v81[2 + 2 ]];v73=v73 + 1 ;v3078=2 -1 ;end if (v3078==(3 -2)) then v81=v69[v73];v79[v81[2]]=v79[v81[3 + 0 ]][v81[7 -3 ]];v73=v73 + 1 ;v81=v69[v73];v3078=3 -1 ;end if (v3078==(722 -(316 + 403))) then v3079=v79[v81[2 + 1 ]];v79[v3080 + (2 -1) ]=v3079;v79[v3080]=v3079[v81[2 + 2 ]];v73=v73 + 1 ;v3078=9 -5 ;end if ((3 + 1)==v3078) then v81=v69[v73];v79[v81[1 + 1 ]]=v81[10 -7 ];v73=v73 + (4 -3) ;v81=v69[v73];v3078=10 -5 ;end if (v3078==(1 + 1)) then v79[v81[3 -1 ]]=v79[v81[3]][v81[1 + 3 ]];v73=v73 + (2 -1) ;v81=v69[v73];v3080=v81[19 -(12 + 5) ];v3078=11 -8 ;end if (v3078==6) then v79[v81[3 -1 ]]=v79[v81[6 -3 ]][v81[9 -5 ]];v73=v73 + 1 + 0 ;v81=v69[v73];if ((4977==4977) and (v79[v81[1975 -(1656 + 317) ]]~=v81[4 + 0 ])) then v73=v73 + 1 + 0 ;else v73=v81[3];end break;end if ((v3078==(13 -8)) or (1765<586)) then v3080=v81[2];v79[v3080]=v79[v3080](v13(v79,v3080 + 1 ,v81[14 -11 ]));v73=v73 + (355 -(5 + 349)) ;v81=v69[v73];v3078=6;end end else local v3081;local v3082;v79[v81[9 -7 ]]=v79[v81[1274 -(266 + 1005) ]][v81[3 + 1 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[3]][v81[1700 -(561 + 1135) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[6 -4 ]]=v79[v81[1069 -(507 + 559) ]][v81[9 -5 ]];v73=v73 + (3 -2) ;v81=v69[v73];v3082=v81[390 -(212 + 176) ];v3081=v79[v81[908 -(250 + 655) ]];v79[v3082 + (2 -1) ]=v3081;v79[v3082]=v3081[v81[6 -2 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1958 -(1869 + 87) ]]=v81[3];v73=v73 + (3 -2) ;v81=v69[v73];v3082=v81[1903 -(484 + 1417) ];v79[v3082]=v79[v3082](v13(v79,v3082 + 1 ,v81[6 -3 ]));v73=v73 + (1 -0) ;v81=v69[v73];if v79[v81[775 -(48 + 725) ]] then v73=v73 + (1 -0) ;else v73=v81[7 -4 ];end end elseif ((909==909) and (v82<=(28 + 20))) then if ((2735>=533) and (v82<=(106 -66))) then if ((1931<2307) and (v82<=(11 + 25))) then if (v82<=(10 + 24)) then if (v82==(886 -(152 + 701))) then local v589=1311 -(430 + 881) ;local v590;local v591;while true do if ((3231<=4886) and (v589==(3 + 3))) then v79[v81[897 -(557 + 338) ]]={};v73=v73 + 1 + 0 ;v81=v69[v73];v589=7;end if (((10 -6)==v589) or (2584>3412) or (1195>=2741)) then v591=v81[6 -4 ];v590=v79[v81[7 -4 ]];v79[v591 + (2 -1) ]=v590;v589=806 -(499 + 302) ;end if ((437<=441) and (v589==(871 -(39 + 827)))) then v79[v591]=v590[v81[10 -6 ]];v73=v73 + (2 -1) ;v81=v69[v73];v589=23 -17 ;end if (v589==(10 -3)) then v79[v81[1 + 1 ]][v81[8 -5 ]]=v81[4];v73=v73 + 1 ;v81=v69[v73];v589=2 + 6 ;end if (v589==(1 -0)) then v73=v73 + 1 ;v81=v69[v73];v591=v81[2];v589=106 -(103 + 1) ;end if ((70<2783) and (v589==(562 -(475 + 79)))) then v79[v81[4 -2 ]][v81[3]]=v81[12 -8 ];break;end if ((v589==(1 + 2)) or (3044<1604) or (1691<560)) then v79[v81[2 + 0 ]]=v62[v81[1506 -(1395 + 108) ]];v73=v73 + (2 -1) ;v81=v69[v73];v589=4;end if (v589==(1206 -(7 + 1197))) then v79[v591](v13(v79,v591 + 1 + 0 ,v81[2 + 1 ]));v73=v73 + (320 -(27 + 292)) ;v81=v69[v73];v589=3;end if ((v589==0) or (2013<1819)) then v590=nil;v591=nil;v79[v81[2]][v81[3]]=v79[v81[11 -7 ]];v589=1;end end else local v592;local v593;v593=v81[2 -0 ];v592=v79[v81[12 -9 ]];v79[v593 + (1 -0) ]=v592;v79[v593]=v592[v81[6 -2 ]];v73=v73 + (140 -(43 + 96)) ;v81=v69[v73];v79[v81[2]]={};v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[3 -1 ]][v81[3 + 0 ]]=v81[4];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[3 -1 ]][v81[2 + 1 ]]=v81[4];v73=v73 + 1 ;v81=v69[v73];v79[v81[3 -1 ]][v81[3]]=v81[2 + 2 ];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1753 -(1414 + 337) ]][v81[3]]=v81[1944 -(1642 + 298) ];v73=v73 + (2 -1) ;v81=v69[v73];v593=v81[5 -3 ];v79[v593](v13(v79,v593 + (2 -1) ,v81[1 + 2 ]));end elseif ((v82>(28 + 7)) or (2433>=3395) or (2338<2231)) then local v609=0;local v610;local v611;while true do if (v609==7) then v79[v611]=v79[v611](v79[v611 + (973 -(357 + 615)) ]);v73=v73 + 1 ;v81=v69[v73];if (v79[v81[2 + 0 ]]==v79[v81[9 -5 ]]) then v73=v73 + 1 + 0 ;else v73=v81[6 -3 ];end break;end if ((0 + 0)==v609) then v610=nil;v611=nil;v79[v81[1 + 1 ]]=v79[v81[3]][v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v609=1302 -(384 + 917) ;end if (v609==(703 -(128 + 569))) then v79[v611 + (1544 -(1407 + 136)) ]=v610;v79[v611]=v610[v81[1891 -(687 + 1200) ]];v73=v73 + 1 ;v81=v69[v73];v611=v81[1712 -(556 + 1154) ];v609=24 -17 ;end if (v609==(98 -(9 + 86))) then v79[v611]=v79[v611](v13(v79,v611 + (422 -(275 + 146)) ,v81[1 + 2 ]));v73=v73 + (65 -(29 + 35)) ;v81=v69[v73];v611=v81[8 -6 ];v610=v79[v81[8 -5 ]];v609=4;end if (v609==(8 -6)) then v81=v69[v73];v79[v81[2 + 0 ]]= #v79[v81[1015 -(53 + 959) ]];v73=v73 + (409 -(312 + 96)) ;v81=v69[v73];v611=v81[3 -1 ];v609=288 -(147 + 138) ;end if ((4825<=4909) and (1396<=3878) and (v609==(904 -(813 + 86)))) then v79[v611]=v79[v611](v79[v611 + 1 + 0 ]);v73=v73 + 1 ;v81=v69[v73];v611=v81[3 -1 ];v610=v79[v81[495 -(18 + 474) ]];v609=6;end if ((2585<4473) and (v609==(2 + 2))) then v79[v611 + (3 -2) ]=v610;v79[v611]=v610[v81[4]];v73=v73 + 1 ;v81=v69[v73];v611=v81[2];v609=1091 -(860 + 226) ;end if (v609==(304 -(121 + 182))) then v79[v81[1 + 1 ]]=v79[v81[1243 -(988 + 252) ]][v81[1 + 3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1972 -(49 + 1921) ]]=v81[893 -(223 + 667) ];v73=v73 + (53 -(51 + 1)) ;v609=2 -0 ;end end else local v612;local v613;local v614;v79[v81[3 -1 ]]=v79[v81[3]][v81[1129 -(146 + 979) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]();v73=v73 + 1 ;v81=v69[v73];v79[v81[607 -(311 + 294) ]]=v62[v81[8 -5 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v614=v81[2];v613=v79[v81[1446 -(496 + 947) ]];v79[v614 + (1359 -(1233 + 125)) ]=v613;v79[v614]=v613[v81[2 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[1648 -(963 + 682) ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1506 -(504 + 1000) ]]=v81[3];v73=v73 + 1 + 0 ;v81=v69[v73];v613=v81[3 + 0 ];v612=v79[v613];for v2994=v613 + 1 + 0 ,v81[4] do v612=v612   .. v79[v2994] ;end v79[v81[2 -0 ]]=v612;v73=v73 + 1 ;v81=v69[v73];v614=v81[2 + 0 ];v79[v614]=v79[v614](v13(v79,v614 + 1 ,v81[2 + 1 ]));v73=v73 + (183 -(156 + 26)) ;v81=v69[v73];if v79[v81[2 + 0 ]] then v73=v73 + (1 -0) ;else v73=v81[167 -(149 + 15) ];end end elseif (v82<=(998 -(890 + 70))) then if (v82>(154 -(39 + 78))) then local v633;local v634;v79[v81[484 -(14 + 468) ]]=v79[v81[6 -3 ]][v81[11 -7 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[1 + 2 ]][v81[2 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[3 + 0 ]][v81[13 -9 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v634=v81[53 -(12 + 39) ];v633=v79[v81[3]];v79[v634 + 1 + 0 ]=v633;v79[v634]=v633[v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[6 -4 ]]=v81[1 + 2 ];v73=v73 + 1 + 0 ;v81=v69[v73];v634=v81[4 -2 ];v79[v634]=v79[v634](v13(v79,v634 + 1 + 0 ,v81[14 -11 ]));v73=v73 + (1711 -(1596 + 114)) ;v81=v69[v73];if (v79[v81[4 -2 ]] or (1338==1656)) then v73=v73 + (714 -(164 + 549)) ;else v73=v81[1441 -(1059 + 379) ];end else local v650;local v651;v79[v81[2]]=v79[v81[3 -0 ]][v81[3 + 1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[394 -(145 + 247) ]]();v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v62[v81[2 + 1 ]];v73=v73 + (2 -1) ;v81=v69[v73];v651=v81[1 + 1 ];v650=v79[v81[3 + 0 ]];v79[v651 + (1 -0) ]=v650;v79[v651]=v650[v81[724 -(254 + 466) ]];v73=v73 + (561 -(544 + 16)) ;v81=v69[v73];v79[v81[5 -3 ]]=v81[631 -(294 + 334) ];v73=v73 + (254 -(236 + 17)) ;v81=v69[v73];v651=v81[1 + 1 ];v79[v651]=v79[v651](v13(v79,v651 + 1 ,v81[3 + 0 ]));v73=v73 + 1 ;v81=v69[v73];if (v79[v81[7 -5 ]] or (4916==1527)) then v73=v73 + (4 -3) ;else v73=v81[3];end end elseif ((v82==39) or (3819<=11)) then local v663;local v664;v79[v81[2]][v81[3]]=v79[v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v664=v81[2 + 0 ];v79[v664](v13(v79,v664 + (795 -(413 + 381)) ,v81[3]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[3 -1 ]]=v62[v81[7 -4 ]];v73=v73 + 1 ;v81=v69[v73];v664=v81[2];v663=v79[v81[1973 -(582 + 1388) ]];v79[v664 + (1 -0) ]=v663;v79[v664]=v663[v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]={};v73=v73 + (365 -(326 + 38)) ;v81=v69[v73];v79[v81[5 -3 ]][v81[3 -0 ]]=v81[624 -(47 + 573) ];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[8 -6 ]][v81[4 -1 ]]=v81[4];else local v681=0;local v682;local v683;while true do if ((4376>3139) and ((v681==(1667 -(1269 + 395))) or (3502<=1744))) then v682=v79[v81[495 -(76 + 416) ]];v79[v683 + (444 -(319 + 124)) ]=v682;v79[v683]=v682[v81[4]];v73=v73 + (2 -1) ;v681=1011 -(564 + 443) ;end if ((v681==(10 -6)) or (4944<3377)) then v81=v69[v73];v79[v81[460 -(337 + 121) ]]=v81[8 -5 ];v73=v73 + (3 -2) ;v81=v69[v73];v681=1916 -(1261 + 650) ;end if (v681==(1 + 0)) then v81=v69[v73];v79[v81[2]]=v79[v81[3 -0 ]][v81[1821 -(772 + 1045) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v681=146 -(102 + 42) ;end if ((v681==0) or (4088==4976)) then v682=nil;v683=nil;v79[v81[2]]=v79[v81[1847 -(1524 + 320) ]][v81[1274 -(1049 + 221) ]];v73=v73 + (157 -(18 + 138)) ;v681=1;end if (v681==5) then v683=v81[2];v79[v683]=v79[v683](v13(v79,v683 + (2 -1) ,v81[1105 -(67 + 1035) ]));v73=v73 + (349 -(136 + 212)) ;v81=v69[v73];v681=25 -19 ;end if (v681==(2 + 0)) then v79[v81[2 + 0 ]]=v79[v81[1607 -(240 + 1364) ]][v81[1086 -(1050 + 32) ]];v73=v73 + (3 -2) ;v81=v69[v73];v683=v81[2];v681=2 + 1 ;end if ((v681==(1061 -(331 + 724))) or (223>1693)) then if v79[v81[2]] then v73=v73 + 1 + 0 ;else v73=v81[647 -(269 + 375) ];end break;end end end elseif (v82<=(769 -(267 + 458))) then if ((v82<=(14 + 28)) or (1702>=1828)) then if ((v82==41) or (3364>3573)) then local v684;local v685;v79[v81[3 -1 ]]=v79[v81[821 -(667 + 151) ]][v81[1501 -(1410 + 87) ]];v73=v73 + (1898 -(1504 + 393)) ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[7 -4 ]][v81[800 -(461 + 335) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1763 -(1730 + 31) ]]=v79[v81[1670 -(728 + 939) ]][v81[4]];v73=v73 + (3 -2) ;v81=v69[v73];v685=v81[3 -1 ];v684=v79[v81[3]];v79[v685 + (2 -1) ]=v684;v79[v685]=v684[v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1070 -(138 + 930) ]]=v81[3 + 0 ];v73=v73 + 1 + 0 ;v81=v69[v73];v685=v81[2 + 0 ];v79[v685]=v79[v685](v13(v79,v685 + 1 ,v81[12 -9 ]));v73=v73 + (1767 -(459 + 1307)) ;v81=v69[v73];v79[v81[2]]=v79[v81[1873 -(474 + 1396) ]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];if (v79[v81[2 + 0 ]]~=v81[1 + 3 ]) then v73=v73 + (2 -1) ;else v73=v81[1 + 2 ];end else local v703;local v704;v79[v81[6 -4 ]]=v79[v81[3]][v81[4]];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[593 -(562 + 29) ]]=v79[v81[3 + 0 ]][v81[1423 -(374 + 1045) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[3 + 0 ]][v81[12 -8 ]];v73=v73 + (639 -(448 + 190)) ;v81=v69[v73];v704=v81[1 + 1 ];v703=v79[v81[3]];v79[v704 + 1 + 0 ]=v703;v79[v704]=v703[v81[3 + 1 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[5 -3 ]]=v81[1497 -(1307 + 187) ];v73=v73 + (3 -2) ;v81=v69[v73];v704=v81[4 -2 ];v79[v704]=v79[v704](v13(v79,v704 + (2 -1) ,v81[686 -(232 + 451) ]));v73=v73 + 1 + 0 ;v81=v69[v73];if v79[v81[2 + 0 ]] then v73=v73 + (565 -(510 + 54)) ;else v73=v81[5 -2 ];end end elseif ((2793>875) and (v82==(79 -(13 + 23)))) then local v720=0 -0 ;local v721;local v722;while true do if ((676>=601) and (v720==(9 -2))) then v79[v722]=v79[v722](v13(v79,v722 + (1 -0) ,v81[1091 -(830 + 258) ]));v73=v73 + (3 -2) ;v81=v69[v73];v720=6 + 2 ;end if ((v720==(2 + 0)) or (3848<=605)) then v73=v73 + (1442 -(860 + 581)) ;v81=v69[v73];v79[v81[7 -5 ]]=v79[v81[3 + 0 ]][v81[245 -(237 + 4) ]];v720=3;end if ((v720==(6 -3)) or (2509>=4774) or (4026<=1866)) then v73=v73 + (2 -1) ;v81=v69[v73];v722=v81[2];v720=7 -3 ;end if ((3926>2465) and (v720==(5 + 0))) then v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[3];v720=22 -16 ;end if ((v720==4) or (1977>=3352)) then v721=v79[v81[2 + 1 ]];v79[v722 + 1 ]=v721;v79[v722]=v721[v81[4]];v720=3 + 2 ;end if (v720==(1434 -(85 + 1341))) then if ((2896==2896) and v79[v81[3 -1 ]]) then v73=v73 + (2 -1) ;else v73=v81[375 -(45 + 327) ];end break;end if (((0 -0)==v720) or (2287<=675)) then v721=nil;v722=nil;v79[v81[504 -(444 + 58) ]]=v79[v81[2 + 1 ]][v81[1 + 3 ]];v720=1 + 0 ;end if (v720==(17 -11)) then v73=v73 + (1733 -(64 + 1668)) ;v81=v69[v73];v722=v81[1975 -(1227 + 746) ];v720=21 -14 ;end if ((1007==1007) and (v720==(1 -0))) then v73=v73 + 1 ;v81=v69[v73];v79[v81[496 -(415 + 79) ]]=v79[v81[3]][v81[1 + 3 ]];v720=493 -(142 + 349) ;end end else local v723=0;while true do if ((189<851) and (v723==(1 + 1))) then v79[v81[2 -0 ]][v81[2 + 1 ]]=v79[v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v723=3;end if (v723==(19 -12)) then if ((3924==3924) and v79[v81[2]]) then v73=v73 + (1865 -(1710 + 154)) ;else v73=v81[321 -(200 + 118) ];end break;end if (((2 + 3)==v723) or (3438<3027)) then v79[v81[2 -0 ]]=v79[v81[4 -1 ]][v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v723=6;end if ((1 + 0)==v723) then v79[v81[1 + 1 ]]=v62[v81[3]];v73=v73 + (2 -1) ;v81=v69[v73];v723=1252 -(363 + 887) ;end if (((0 -0)==v723) or (1312>=3473)) then v79[v81[9 -7 ]]=v79[v81[1 + 2 ]][v81[9 -5 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v723=1665 -(674 + 990) ;end if ((v723==(2 + 4)) or (2618>=3792)) then v79[v81[1 + 1 ]]=v79[v81[3 -0 ]][v81[1059 -(507 + 548) ]];v73=v73 + (838 -(289 + 548)) ;v81=v69[v73];v723=1825 -(821 + 997) ;end if (((4481>2777) and (v723==4)) or (3412<2628)) then v79[v81[257 -(195 + 60) ]]=v79[v81[3]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v723=1506 -(251 + 1250) ;end if ((2163==2163) and (v723==3)) then v79[v81[5 -3 ]]=v62[v81[3]];v73=v73 + 1 ;v81=v69[v73];v723=4;end end end elseif ((1686==1686) and ((v82<=(32 + 14)) or (3502<561))) then if ((177<=734) and (v82==(1077 -(809 + 223)))) then v79[v81[2]]=v79[v81[3 -0 ]][v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]=v79[v81[9 -6 ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[2 + 1 ]][v81[621 -(14 + 603) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[131 -(118 + 11) ]]=v79[v81[1 + 2 ]][v81[4 + 0 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[952 -(551 + 398) ]][v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v62[v81[2 + 1 ]]=v79[v81[2 + 0 ]];else local v735;local v736;v79[v81[7 -5 ]]=v79[v81[6 -3 ]][v81[2 + 2 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[3]][v81[93 -(40 + 49) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[11 -8 ]][v81[494 -(99 + 391) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v736=v81[8 -6 ];v735=v79[v81[7 -4 ]];v79[v736 + 1 + 0 ]=v735;v79[v736]=v735[v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1606 -(1032 + 572) ]]=v81[420 -(203 + 214) ];v73=v73 + 1 ;v81=v69[v73];v736=v81[1819 -(568 + 1249) ];v79[v736]=v79[v736](v13(v79,v736 + 1 ,v81[3 + 0 ]));v73=v73 + (2 -1) ;v81=v69[v73];if v79[v81[7 -5 ]] then v73=v73 + (1307 -(913 + 393)) ;else v73=v81[8 -5 ];end end elseif (v82>(66 -19)) then v73=v81[413 -(269 + 141) ];else v79[v81[4 -2 ]]();end elseif (v82<=(2037 -(362 + 1619))) then if ((1097<2813) and (v82<=(1677 -(950 + 675)))) then if ((4511==4511) and (1971<4736) and (v82<=(20 + 30))) then if (v82==(1228 -(216 + 963))) then local v753=1287 -(485 + 802) ;local v754;while true do if ((935<=3218) and ((559 -(432 + 127))==v753)) then v754=v81[1075 -(1065 + 8) ];v79[v754]=v79[v754](v79[v754 + 1 + 0 ]);break;end end else v79[v81[1603 -(635 + 966) ]]=v79[v81[3 + 0 ]][v81[46 -(5 + 37) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[4 -1 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[3 -1 ]]=v62[v81[11 -8 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]][v81[5 -2 ]]=v79[v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v73=v81[3 + 0 ];end elseif (v82==(580 -(318 + 211))) then local v765=0 -0 ;while true do if ((v765==1) or (1658>2465)) then v73=v73 + (1588 -(963 + 624)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[849 -(518 + 328) ]][v81[8 -4 ]];v73=v73 + (1 -0) ;v765=319 -(301 + 16) ;end if (v765==(8 -5)) then v79[v81[5 -3 ]]=v79[v81[7 -4 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v62[v81[2 + 1 ]]=v79[v81[3 -1 ]];break;end if (v765==0) then v79[v81[2]]=v79[v81[2 + 1 ]][v81[1 + 3 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[1022 -(829 + 190) ]][v81[4]];v765=3 -2 ;end if (v765==(2 -0)) then v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[7 -4 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v765=3;end end else local v766;local v767;local v766,v768;local v769;local v770;v79[v81[2]]=v79[v81[1 + 2 ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];for v2995=v81[5 -3 ],v81[3] do v79[v2995]=nil;end v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[615 -(520 + 93) ]]=v62[v81[279 -(259 + 17) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v62[v81[3]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[2 + 1 ]][v81[13 -9 ]];v73=v73 + 1 ;v81=v69[v73];v770=v81[2];v769=v79[v81[3]];v79[v770 + 1 ]=v769;v79[v770]=v769[v81[595 -(396 + 195) ]];v73=v73 + 1 ;v81=v69[v73];v770=v81[5 -3 ];v766,v768=v72(v79[v770](v79[v770 + 1 ]));v74=(v768 + v770) -(1762 -(440 + 1321)) ;v767=1829 -(1059 + 770) ;for v2997=v770,v74 do v767=v767 + 1 ;v79[v2997]=v766[v767];end v73=v73 + 1 ;v81=v69[v73];v770=v81[9 -7 ];v766={v79[v770](v13(v79,v770 + 1 + 0 ,v74))};v767=1347 -(641 + 706) ;for v3000=v770,v81[2 + 2 ] do local v3001=0;while true do if (((440 -(249 + 191))==v3001) or (2770==3070) or (2370<=1728)) then v767=v767 + (4 -3) ;v79[v3000]=v766[v767];break;end end end v73=v73 + 1 ;v81=v69[v73];v73=v81[2 + 1 ];end elseif ((v82<=(208 -154)) or (3822<1995)) then if ((3999<=4106) and ((v82==(480 -(183 + 244))) or (4503>4624))) then local v786;local v787;local v788;v788=v81[2];v787=v79[v81[3]];v79[v788 + 1 + 0 ]=v787;v79[v788]=v787[v81[734 -(434 + 296) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[514 -(169 + 343) ]]=v81[3 + 0 ];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[3 + 0 ]][v81[11 -7 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1125 -(651 + 472) ]]=v81[3];v73=v73 + 1 + 0 ;v81=v69[v73];v787=v81[2 + 1 ];v786=v79[v787];for v3002=v787 + (1 -0) ,v81[487 -(397 + 86) ] do v786=v786   .. v79[v3002] ;end v79[v81[878 -(423 + 453) ]]=v786;v73=v73 + 1 + 0 ;v81=v69[v73];v788=v81[1 + 1 ];v79[v788]=v79[v788](v13(v79,v788 + 1 ,v81[3]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]][v81[3 + 0 ]]=v81[4];else v79[v81[2 + 0 ]]=v79[v81[1193 -(50 + 1140) ]][v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]();v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[599 -(157 + 439) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v79[v81[9 -6 ]][v81[11 -7 ]];v73=v73 + (919 -(782 + 136)) ;v81=v69[v73];v79[v81[857 -(112 + 743) ]]=v79[v81[1174 -(1026 + 145) ]][v81[1 + 3 ]];v73=v73 + (719 -(493 + 225)) ;v81=v69[v73];v79[v81[7 -5 ]]=v79[v81[2 + 1 ]][v81[10 -6 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[1 + 2 ]][v81[6 -2 ]];v73=v73 + (1596 -(210 + 1385)) ;v81=v69[v73];v79[v81[1691 -(1201 + 488) ]]=v62[v81[2 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 -0 ]][v81[5 -2 ]]=v79[v81[589 -(352 + 233) ]];v73=v73 + (2 -1) ;v81=v69[v73];v73=v81[2 + 1 ];end elseif ((v82>(156 -101)) or (4935<3062)) then local v824;local v825;local v826;v79[v81[576 -(489 + 85) ]]=v62[v81[1504 -(277 + 1224) ]];v73=v73 + (1494 -(663 + 830)) ;v81=v69[v73];v826=v81[2 + 0 ];v825=v79[v81[6 -3 ]];v79[v826 + (876 -(461 + 414)) ]=v825;v79[v826]=v825[v81[1 + 3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]={};v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]][v81[253 -(172 + 78) ]]=v81[6 -2 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[3 -0 ];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[4 -1 ]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[2 + 1 ];v73=v73 + 1 ;v81=v69[v73];v825=v81[3];v824=v79[v825];for v3003=v825 + 1 + 0 ,v81[15 -11 ] do v824=v824   .. v79[v3003] ;end v79[v81[4 -2 ]]=v824;v73=v73 + 1 ;v81=v69[v73];v79[v81[2]][v81[1 + 2 ]]=v79[v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[449 -(133 + 314) ]][v81[3]]=v81[1 + 3 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[215 -(199 + 14) ]][v81[10 -7 ]]=v81[4];v73=v73 + (1550 -(647 + 902)) ;v81=v69[v73];v826=v81[5 -3 ];v79[v826](v13(v79,v826 + (234 -(85 + 148)) ,v81[1292 -(426 + 863) ]));v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[1656 -(873 + 781) ]]=v62[v81[3 -0 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[11 -8 ]][v81[5 -1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[1950 -(414 + 1533) ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[557 -(443 + 112) ]]=v79[v81[1482 -(888 + 591) ]][v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v62[v81[1 + 2 ]]=v79[v81[7 -5 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[1 + 2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[5 -2 ]][v81[6 -2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1680 -(136 + 1542) ]]=v81[3];v73=v73 + 1 ;v81=v69[v73];v826=v81[6 -4 ];v79[v826](v79[v826 + 1 ]);v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v62[v81[3]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[489 -(68 + 418) ]][v81[10 -6 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v79[v81[3 + 0 ]][v81[1096 -(770 + 322) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[1 + 2 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[7 -4 ]][v81[14 -10 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]=v81[3];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[3];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v81[11 -8 ];v73=v73 + (1 -0) ;v81=v69[v73];v826=v81[1 + 1 ];v79[v826]=v79[v826](v13(v79,v826 + (4 -3) ,v81[3]));v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[1 + 1 ]][v81[14 -11 ]]=v79[v81[835 -(762 + 69) ]];else local v875=0 -0 ;local v876;local v877;local v878;local v879;local v880;while true do if (2==v875) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[7 -4 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[1 + 2 ]][v81[15 -11 ]];v875=160 -(8 + 149) ;end if ((1346<4253) and (v875==4)) then v73=v73 + (1321 -(1199 + 121)) ;v81=v69[v73];v880=v81[2];v876,v878=v72(v79[v880](v79[v880 + (1 -0) ]));v74=(v878 + v880) -(2 -1) ;v877=0 + 0 ;v875=17 -12 ;end if (v875==(2 -1)) then v73=v73 + 1 + 0 ;v81=v69[v73];for v5096=v81[1809 -(518 + 1289) ],v81[4 -1 ] do v79[v5096]=nil;end v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]=v62[v81[3 + 0 ]];v875=471 -(304 + 165) ;end if (v875==(5 + 0)) then for v5098=v880,v74 do local v5099=160 -(54 + 106) ;while true do if (v5099==(1969 -(1618 + 351))) then v877=v877 + 1 ;v79[v5098]=v876[v877];break;end end end v73=v73 + 1 + 0 ;v81=v69[v73];v880=v81[1018 -(10 + 1006) ];v876={v79[v880](v13(v79,v880 + 1 ,v74))};v877=0;v875=1 + 5 ;end if ((3658>=3108) and (v875==(9 -6))) then v73=v73 + (1034 -(912 + 121)) ;v81=v69[v73];v880=v81[1 + 1 ];v879=v79[v81[1292 -(1140 + 149) ]];v79[v880 + 1 + 0 ]=v879;v79[v880]=v879[v81[4]];v875=5 -1 ;end if (((2 + 4)==v875) or (4780==3748)) then for v5100=v880,v81[13 -9 ] do v877=v877 + (1 -0) ;v79[v5100]=v876[v877];end v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[10 -7 ];break;end if (((186 -(165 + 21))==v875) or (3004<=2477)) then v876=nil;v877=nil;v876,v878=nil;v879=nil;v880=nil;v79[v81[113 -(61 + 50) ]]=v79[v81[2 + 1 ]][v81[4]];v875=4 -3 ;end end end elseif (v82<=(120 -60)) then if ((723>701) and (v82<=58)) then if ((3180<4460) and (v82==(23 + 34))) then v79[v81[1462 -(1295 + 165) ]]=v79[v81[1 + 2 ]][v81[2 + 2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1399 -(819 + 578) ]]();v73=v73 + 1 ;v81=v69[v73];v79[v81[1404 -(331 + 1071) ]]=v62[v81[3]];v73=v73 + (744 -(588 + 155)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[1286 -(546 + 736) ]];v73=v73 + (1938 -(1834 + 103)) ;v81=v69[v73];v79[v81[2]]=v62[v81[3]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[5 -3 ]][v81[1769 -(1536 + 230) ]]=v79[v81[495 -(128 + 363) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[4 -2 ]]=v81[1 + 2 ];else local v892=0;while true do if (v892==(1 -0)) then v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[3 + 0 ]][v81[1013 -(615 + 394) ]];v73=v73 + 1 + 0 ;v892=2;end if (0==v892) then v79[v81[2]]=v79[v81[3 + 0 ]][v81[11 -7 ]];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[2]]=v79[v81[654 -(59 + 592) ]][v81[4]];v892=2 -1 ;end if ((3972>=141) and ((v892==(3 -1)) or (2298<1508))) then v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[174 -(70 + 101) ]][v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v892=3 + 0 ;end if ((v892==3) or (1588<=1110)) then v79[v81[2]]=v79[v81[7 -4 ]][v81[245 -(123 + 118) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v62[v81[1 + 2 ]]=v79[v81[1401 -(653 + 746) ]];break;end end end elseif ((v82>59) or (93>=1078)) then v79[v81[3 -1 ]]=v62[v81[4 -1 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1 + 1 ]][v81[2 + 1 ]]=v79[v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[1 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[3]][v81[4 + 0 ]];v73=v73 + 1 ;v81=v69[v73];if (v79[v81[3 -1 ]]==v81[1238 -(885 + 349) ]) then v73=v73 + 1 + 0 ;else v73=v81[8 -5 ];end else local v902;local v903;v79[v81[2]][v81[8 -5 ]]=v79[v81[972 -(915 + 53) ]];v73=v73 + (802 -(768 + 33)) ;v81=v69[v73];v903=v81[7 -5 ];v79[v903](v13(v79,v903 + (1 -0) ,v81[331 -(287 + 41) ]));v73=v73 + (848 -(638 + 209)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[1689 -(96 + 1590) ]];v73=v73 + 1 ;v81=v69[v73];v903=v81[1674 -(741 + 931) ];v902=v79[v81[2 + 1 ]];v79[v903 + 1 ]=v902;v79[v903]=v902[v81[11 -7 ]];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[1 + 1 ]]={};v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]][v81[3]]=v81[14 -10 ];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]][v81[12 -9 ]]=v81[4];end elseif ((4333>=3440) and (3290>=209) and (v82<=(56 + 6))) then if (v82>61) then local v920=494 -(64 + 430) ;while true do if (v920==(0 + 0)) then v79[v81[2]]=v62[v81[366 -(106 + 257) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v920=722 -(496 + 225) ;end if ((7 -3)==v920) then if (v79[v81[9 -7 ]]==v81[1662 -(256 + 1402) ]) then v73=v73 + (1900 -(30 + 1869)) ;else v73=v81[1372 -(213 + 1156) ];end break;end if ((v920==(189 -(96 + 92))) or (2235<1025)) then v79[v81[1 + 1 ]][v81[902 -(142 + 757) ]]=v79[v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v920=81 -(32 + 47) ;end if (v920==(1979 -(1053 + 924))) then v79[v81[2 + 0 ]]=v62[v81[4 -1 ]];v73=v73 + (1649 -(685 + 963)) ;v81=v69[v73];v920=5 -2 ;end if ((v920==3) or (459>3503)) then v79[v81[2 -0 ]]=v79[v81[1712 -(541 + 1168) ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v920=1601 -(645 + 952) ;end end else local v921;local v922;v922=v81[2];v921=v79[v81[841 -(669 + 169) ]];v79[v922 + (3 -2) ]=v921;v79[v922]=v921[v81[8 -4 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]={};v73=v73 + (766 -(181 + 584)) ;v81=v69[v73];v79[v81[1397 -(665 + 730) ]][v81[3]]=v81[11 -7 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[3 -1 ]][v81[1353 -(540 + 810) ]]=v81[4];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[5 -3 ]][v81[3]]=v81[4 + 0 ];v73=v73 + (204 -(166 + 37)) ;v81=v69[v73];v79[v81[1883 -(22 + 1859) ]][v81[1775 -(843 + 929) ]]=v81[4];v73=v73 + (263 -(30 + 232)) ;v81=v69[v73];v922=v81[5 -3 ];v79[v922](v13(v79,v922 + (778 -(55 + 722)) ,v81[3]));end elseif (v82<=(135 -72)) then local v938=1675 -(78 + 1597) ;local v939;local v940;local v941;while true do if ((v938==(2 + 3)) or (2383>3150)) then v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[3 + 0 ]];v73=v73 + (550 -(305 + 244)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3]][v81[109 -(95 + 10) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[6 -4 ]]=v81[3 -0 ];v938=6;end if ((4212>=608) and ((v938==(763 -(592 + 170))) or (1844>3761))) then v81=v69[v73];v941=v81[6 -4 ];v79[v941](v79[v941 + (2 -1) ]);v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[6 -3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v938=2;end if ((3145>1946) and (v938==(3 -1))) then v941=v81[509 -(353 + 154) ];v940=v79[v81[3 -0 ]];v79[v941 + (1 -0) ]=v940;v79[v941]=v940[v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[3]];v73=v73 + 1 + 0 ;v938=3 -0 ;end if ((4004>=2648) and (v938==(12 -5))) then v941=v81[4 -2 ];v79[v941]=v79[v941](v13(v79,v941 + (87 -(7 + 79)) ,v81[3]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[183 -(24 + 157) ]][v81[5 -2 ]]=v79[v81[8 -4 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[7 -4 ];break;end if (v938==(380 -(262 + 118))) then v939=nil;v940=nil;v941=nil;v79[v81[1085 -(1038 + 45) ]]=v79[v81[5 -2 ]][v81[234 -(19 + 211) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[115 -(88 + 25) ]]=v81[3];v73=v73 + (2 -1) ;v938=1 + 0 ;end if ((1531<=4695) and (v938==3)) then v81=v69[v73];v79[v81[2 + 0 ]]=v81[1039 -(1007 + 29) ];v73=v73 + 1 + 0 ;v81=v69[v73];v940=v81[7 -4 ];v939=v79[v940];for v5103=v940 + (4 -3) ,v81[1 + 3 ] do v939=v939   .. v79[v5103] ;end v79[v81[2]]=v939;v938=4;end if (v938==(815 -(340 + 471))) then v73=v73 + (2 -1) ;v81=v69[v73];v941=v81[591 -(276 + 313) ];v79[v941]=v79[v941](v13(v79,v941 + (2 -1) ,v81[3 + 0 ]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[3]][v81[1976 -(495 + 1477) ]];v73=v73 + (2 -1) ;v938=4 + 1 ;end if ((569<1192) and ((v938==(409 -(342 + 61))) or (359>4577))) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[167 -(4 + 161) ]]=v81[2 + 1 ];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[5 -3 ]]=v81[3];v73=v73 + 1 ;v81=v69[v73];v938=7;end end elseif (v82>(561 -(322 + 175))) then v79[v81[565 -(173 + 390) ]]=v79[v81[3]][v81[1 + 3 ]];v73=v73 + (315 -(203 + 111)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[3 + 0 ]][v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[709 -(57 + 649) ]];v73=v73 + (385 -(328 + 56)) ;v81=v69[v73];v79[v81[1 + 1 ]][v81[515 -(433 + 79) ]]=v79[v81[1 + 3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[9 -6 ];else local v3115=v81[2];local v3116,v3117=v72(v79[v3115](v79[v3115 + 1 ]));v74=(v3117 + v3115) -(4 -3) ;local v3118=0 + 0 ;for v3855=v3115,v74 do v3118=v3118 + 1 + 0 ;v79[v3855]=v3116[v3118];end end elseif (v82<=(1134 -(562 + 474))) then if ((1469>=269) and (v82<=81)) then if (v82<=73) then if (v82<=69) then if (v82<=(156 -89)) then if ((v82==66) or (4743<=2005)) then local v942;local v943;v79[v81[2]]=v79[v81[5 -2 ]][v81[909 -(76 + 829) ]];v73=v73 + (1674 -(1506 + 167)) ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[269 -(58 + 208) ]][v81[3 + 1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[2 + 1 ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v943=v81[7 -5 ];v942=v79[v81[340 -(258 + 79) ]];v79[v943 + 1 + 0 ]=v942;v79[v943]=v942[v81[8 -4 ]];v73=v73 + (1471 -(1219 + 251)) ;v81=v69[v73];v79[v81[1673 -(1231 + 440) ]]=v81[61 -(34 + 24) ];v73=v73 + 1 ;v81=v69[v73];v943=v81[2 + 0 ];v79[v943]=v79[v943](v13(v79,v943 + (1 -0) ,v81[2 + 1 ]));v73=v73 + 1 ;v81=v69[v73];if ((2242<3930) and (v79[v81[5 -3 ]]==v81[4])) then v73=v73 + 1 ;else v73=v81[3];end else v79[v81[2]]=v79[v81[3]][v81[4]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[3]][v81[13 -9 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1591 -(877 + 712) ]]=v79[v81[3]][v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[756 -(242 + 512) ]]=v79[v81[6 -3 ]][v81[631 -(92 + 535) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[1 + 2 ]][v81[14 -10 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v62[v81[3 + 0 ]]=v79[v81[1 + 1 ]];end elseif ((v82==68) or (465>3111)) then local v971=0 -0 ;local v972;local v973;while true do if ((v971==(4 -1)) or (2586<=1586)) then v972=v79[v81[1788 -(1476 + 309) ]];v79[v973 + (1285 -(299 + 985)) ]=v972;v79[v973]=v972[v81[1 + 3 ]];v73=v73 + (3 -2) ;v971=97 -(86 + 7) ;end if ((4972>=2283) and (v971==(8 -6))) then v79[v81[2]]=v79[v81[1 + 2 ]][v81[4]];v73=v73 + (881 -(672 + 208)) ;v81=v69[v73];v973=v81[2];v971=2 + 1 ;end if ((3177==3177) and ((138 -(14 + 118))==v971)) then if (v79[v81[2]] or (3656<2570)) then v73=v73 + (446 -(339 + 106)) ;else v73=v81[3 + 0 ];end break;end if ((1958>1564) and (v971==(3 + 2))) then v973=v81[1397 -(440 + 955) ];v79[v973]=v79[v973](v13(v79,v973 + 1 ,v81[3 + 0 ]));v73=v73 + (1 -0) ;v81=v69[v73];v971=6;end if ((3236==3236) and (v971==(0 + 0))) then v972=nil;v973=nil;v79[v81[4 -2 ]]=v79[v81[3 + 0 ]][v81[357 -(260 + 93) ]];v73=v73 + 1 ;v971=1 + 0 ;end if ((2702<4089) and (v971==4)) then v81=v69[v73];v79[v81[4 -2 ]]=v81[4 -1 ];v73=v73 + (1975 -(1181 + 793)) ;v81=v69[v73];v971=2 + 3 ;end if ((v971==(308 -(105 + 202))) or (4513<1909)) then v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[813 -(352 + 458) ]][v81[16 -12 ]];v73=v73 + 1 ;v81=v69[v73];v971=2;end end else local v974;v79[v81[4 -2 ]]=v79[v81[3 + 0 ]][v81[11 -7 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]();v73=v73 + (950 -(438 + 511)) ;v81=v69[v73];v79[v81[1385 -(1262 + 121) ]]=v62[v81[1071 -(728 + 340) ]];v73=v73 + (1791 -(816 + 974)) ;v81=v69[v73];v974=v81[5 -3 ];v79[v974]=v79[v974]();v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[341 -(163 + 176) ]]=v79[v81[8 -5 ]];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[2]]=v81[3];end elseif (v82<=71) then if (v82>(22 + 48)) then local v986=1810 -(1564 + 246) ;local v987;local v988;local v989;local v990;local v991;while true do if (v986==(351 -(124 + 221))) then v73=v73 + 1 + 0 ;v81=v69[v73];v991=v81[2];v987,v989=v72(v79[v991](v79[v991 + (452 -(115 + 336)) ]));v986=14 -7 ;end if (v986==(2 + 5)) then v74=(v989 + v991) -(47 -(45 + 1)) ;v988=0 + 0 ;for v5104=v991,v74 do local v5105=1990 -(1282 + 708) ;while true do if ((v5105==0) or (815>=3700)) then v988=v988 + 1 ;v79[v5104]=v987[v988];break;end end end v73=v73 + (1213 -(583 + 629)) ;v986=2 + 6 ;end if (((3040<=3483) and (v986==9)) or (3691<=33)) then for v5106=v991,v81[10 -6 ] do local v5107=0 + 0 ;while true do if (v5107==(1170 -(943 + 227))) then v988=v988 + 1 + 0 ;v79[v5106]=v987[v988];break;end end end v73=v73 + (1632 -(1539 + 92)) ;v81=v69[v73];v73=v81[3];break;end if (1==v986) then v991=nil;v79[v81[1948 -(706 + 1240) ]]=v79[v81[261 -(81 + 177) ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v986=5 -3 ;end if ((1598<=2068) and (v986==(265 -(212 + 45)))) then v81=v69[v73];v991=v81[6 -4 ];v987={v79[v991](v13(v79,v991 + 1 ,v74))};v988=0 + 0 ;v986=3 + 6 ;end if (v986==4) then v81=v69[v73];v79[v81[2]]=v79[v81[1670 -(586 + 1081) ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v986=516 -(348 + 163) ;end if ((v986==(2 + 0)) or (4011>=4123)) then for v5108=v81[282 -(215 + 65) ],v81[7 -4 ] do v79[v5108]=nil;end v73=v73 + (1860 -(1541 + 318)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[2 + 1 ]];v986=3 + 0 ;end if (v986==0) then v987=nil;v988=nil;v987,v989=nil;v990=nil;v986=1;end if (v986==(1755 -(1036 + 714))) then v991=v81[2];v990=v79[v81[2 + 1 ]];v79[v991 + 1 + 0 ]=v990;v79[v991]=v990[v81[4]];v986=6;end if (v986==(1283 -(883 + 397))) then v73=v73 + 1 ;v81=v69[v73];v79[v81[592 -(563 + 27) ]]=v62[v81[11 -8 ]];v73=v73 + 1 ;v986=1990 -(1369 + 617) ;end end else local v992=1487 -(85 + 1402) ;local v993;local v994;while true do if (v992==(3 + 4)) then v79[v994]=v79[v994](v79[v994 + (2 -1) ]);v73=v73 + (404 -(274 + 129)) ;v81=v69[v73];if (v79[v81[219 -(12 + 205) ]]==v79[v81[4 + 0 ]]) then v73=v73 + (3 -2) ;else v73=v81[3 + 0 ];end break;end if ((v992==(384 -(27 + 357))) or (565>=4410)) then v993=nil;v994=nil;v79[v81[2]]=v79[v81[483 -(91 + 389) ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v992=1;end if ((v992==6) or (1161<1140)) then v79[v994 + (298 -(90 + 207)) ]=v993;v79[v994]=v993[v81[1 + 3 ]];v73=v73 + (862 -(706 + 155)) ;v81=v69[v73];v994=v81[1797 -(730 + 1065) ];v992=1570 -(1339 + 224) ;end if (v992==(3 + 2)) then v79[v994]=v79[v994](v79[v994 + 1 + 0 ]);v73=v73 + (1 -0) ;v81=v69[v73];v994=v81[845 -(268 + 575) ];v993=v79[v81[1297 -(919 + 375) ]];v992=6;end if (v992==(5 -3)) then v81=v69[v73];v79[v81[973 -(180 + 791) ]]= #v79[v81[1808 -(323 + 1482) ]];v73=v73 + (1919 -(1177 + 741)) ;v81=v69[v73];v994=v81[1 + 1 ];v992=11 -8 ;end if ((1678<=2713) and (v992==1)) then v79[v81[1 + 1 ]]=v79[v81[6 -3 ]][v81[1 + 3 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[111 -(96 + 13) ]]=v81[1924 -(962 + 959) ];v73=v73 + (2 -1) ;v992=1 + 1 ;end if (((1355 -(461 + 890))==v992) or (2523<1675)) then v79[v994 + 1 ]=v993;v79[v994]=v993[v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v994=v81[7 -5 ];v992=248 -(19 + 224) ;end if (v992==3) then v79[v994]=v79[v994](v13(v79,v994 + 1 + 0 ,v81[201 -(37 + 161) ]));v73=v73 + 1 + 0 ;v81=v69[v73];v994=v81[1 + 1 ];v993=v79[v81[3]];v992=4;end end end elseif ((373<=4914) and (138<=4193) and (v82==72)) then v79[v81[2]]=v79[v81[3]][v81[4 + 0 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[64 -(60 + 1) ]][v81[927 -(826 + 97) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v62[v81[3 + 0 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[3 -1 ]][v81[688 -(375 + 310) ]]=v79[v81[2003 -(1864 + 135) ]];v73=v73 + (2 -1) ;v81=v69[v73];v73=v81[1 + 2 ];else local v1003;local v1004;local v1005;v79[v81[1 + 1 ]]=v79[v81[3]][v81[9 -5 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1133 -(314 + 817) ]]();v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[216 -(32 + 182) ]]=v62[v81[3 + 0 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[67 -(39 + 26) ]]=v79[v81[147 -(54 + 90) ]][v81[202 -(45 + 153) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[554 -(457 + 95) ]]=v79[v81[3 + 0 ]][v81[7 -3 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[7 -5 ]]=v79[v81[2 + 1 ]][v81[13 -9 ]];v73=v73 + (2 -1) ;v81=v69[v73];v1005=v81[750 -(485 + 263) ];v1004=v79[v81[3]];v79[v1005 + (708 -(575 + 132)) ]=v1004;v79[v1005]=v1004[v81[4]];v73=v73 + (862 -(750 + 111)) ;v81=v69[v73];v79[v81[1012 -(445 + 565) ]]=v81[3 + 0 ];v73=v73 + 1 ;v81=v69[v73];v1005=v81[2];v79[v1005]=v79[v1005](v13(v79,v1005 + 1 + 0 ,v81[5 -2 ]));v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v62[v81[2 + 1 ]];v73=v73 + (311 -(189 + 121)) ;v81=v69[v73];v1005=v81[1 + 1 ];v1004=v79[v81[1350 -(634 + 713) ]];v79[v1005 + 1 ]=v1004;v79[v1005]=v1004[v81[4]];v73=v73 + (539 -(493 + 45)) ;v81=v69[v73];v79[v81[970 -(493 + 475) ]]=v62[v81[1 + 2 ]];v73=v73 + (785 -(158 + 626)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[4 -1 ];v73=v73 + 1 ;v81=v69[v73];v1004=v81[3];v1003=v79[v1004];for v3004=v1004 + 1 + 0 ,v81[1 + 3 ] do v1003=v1003   .. v79[v3004] ;end v79[v81[1093 -(1035 + 56) ]]=v1003;v73=v73 + (960 -(114 + 845)) ;v81=v69[v73];v1005=v81[1 + 1 ];v79[v1005]=v79[v1005](v13(v79,v1005 + (2 -1) ,v81[3 + 0 ]));v73=v73 + (1050 -(179 + 870)) ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[881 -(827 + 51) ]][v81[10 -6 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[475 -(95 + 378) ]][v81[1 + 2 ]]=v79[v81[5 -1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[1014 -(334 + 677) ];end elseif ((v82<=(288 -211)) or (3824==4634) or (1053>=4765)) then if (v82<=(1131 -(1049 + 7))) then if ((2628<=3241) and (v82>(323 -249))) then v79[v81[3 -1 ]]=v79[v81[1 + 2 ]][v81[10 -6 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]();v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1422 -(1004 + 416) ]]=v62[v81[3]];v73=v73 + (1958 -(1621 + 336)) ;v81=v69[v73];v79[v81[2]]=v79[v81[1942 -(337 + 1602) ]][v81[1521 -(1014 + 503) ]];v73=v73 + (1016 -(446 + 569)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[8 -5 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[1 + 2 ]][v81[509 -(223 + 282) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[4 -1 ]][v81[4]];v73=v73 + (671 -(623 + 47)) ;v81=v69[v73];v79[v81[2]]=v62[v81[48 -(32 + 13) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]][v81[3 + 0 ]]=v79[v81[1805 -(1070 + 731) ]];v73=v73 + 1 ;v81=v69[v73];v73=v81[3 + 0 ];else local v1057=1404 -(1257 + 147) ;local v1058;local v1059;local v1060;local v1061;local v1062;while true do if ((v1057==5) or (1867==235)) then v1058,v1060=v72(v79[v1062](v79[v1062 + 1 ]));v74=(v1060 + v1062) -(1 + 0) ;v1059=0;for v5110=v1062,v74 do v1059=v1059 + (1 -0) ;v79[v5110]=v1058[v1059];end v73=v73 + (134 -(98 + 35)) ;v81=v69[v73];v1057=3 + 3 ;end if ((2==v1057) or (2761>2836)) then v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2]]=v62[v81[3]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[3 + 0 ]];v1057=3;end if (v1057==6) then v1062=v81[2];v1058={v79[v1062](v13(v79,v1062 + (558 -(395 + 162)) ,v74))};v1059=0 + 0 ;for v5113=v1062,v81[4] do v1059=v1059 + (1942 -(816 + 1125)) ;v79[v5113]=v1058[v1059];end v73=v73 + (1 -0) ;v81=v69[v73];v1057=1155 -(701 + 447) ;end if ((v1057==(5 -1)) or (1282>=2992)) then v1061=v79[v81[4 -1 ]];v79[v1062 + 1 ]=v1061;v79[v1062]=v1061[v81[1345 -(391 + 950) ]];v73=v73 + 1 ;v81=v69[v73];v1062=v81[5 -3 ];v1057=12 -7 ;end if ((0 -0)==v1057) then v1058=nil;v1059=nil;v1058,v1060=nil;v1061=nil;v1062=nil;v79[v81[2 + 0 ]]=v62[v81[2 + 1 ]];v1057=1;end if (v1057==(25 -18)) then v73=v81[1525 -(251 + 1271) ];break;end if ((v1057==(3 + 0)) or (4566==698)) then v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[4 -1 ]][v81[1263 -(1147 + 112) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1062=v81[3 -1 ];v1057=2 + 2 ;end if (((3308>=1968) and (v1057==(698 -(335 + 362)))) or (3541<=3166)) then v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[4 -1 ]][v81[10 -6 ]];v73=v73 + (3 -2) ;v81=v69[v73];for v5116=v81[9 -7 ],v81[3] do v79[v5116]=nil;end v1057=5 -3 ;end end end elseif (v82>(642 -(237 + 329))) then v79[v81[7 -5 ]]=v79[v81[2 + 1 ]][v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1126 -(408 + 716) ]]=v79[v81[11 -8 ]][v81[825 -(344 + 477) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1763 -(1188 + 573) ]]=v79[v81[7 -4 ]][v81[4 + 0 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[7 -4 ]][v81[4]];v73=v73 + (1530 -(508 + 1021)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[1169 -(228 + 938) ]][v81[689 -(332 + 353) ]];v73=v73 + (1 -0) ;v81=v69[v73];if (v79[v81[5 -3 ]]==v81[4]) then v73=v73 + 1 + 0 ;else v73=v81[2 + 1 ];end else v79[v81[2]]=v79[v81[11 -8 ]][v81[427 -(18 + 405) ]];v73=v73 + 1 + 0 ;v81=v69[v73];for v3005=v81[2],v81[2 + 1 ] do v79[v3005]=nil;end v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[980 -(194 + 784) ]]=v79[v81[1773 -(694 + 1076) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1906 -(122 + 1782) ]]=v79[v81[3]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[3 + 0 ];v73=v73 + 1 ;v81=v69[v73];v73=v81[3 + 0 ];end elseif ((v82<=(231 -152)) or (3135<106)) then if ((2635>2069) and (v82>(73 + 5))) then local v1083=1970 -(214 + 1756) ;while true do if (((3889<=4998) and (v1083==2)) or (4397<3778)) then v79[v81[9 -7 ]]=v62[v81[1 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[588 -(217 + 368) ]][v81[11 -7 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1083=3 + 0 ;end if (v1083==(1 + 0)) then v79[v81[891 -(844 + 45) ]]=v62[v81[3]];v73=v73 + (285 -(242 + 42)) ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[6 -3 ]][v81[1204 -(132 + 1068) ]];v73=v73 + 1 ;v81=v69[v73];v1083=2 -0 ;end if (((4933>=290) and ((1626 -(214 + 1409))==v1083)) or (4430==2016)) then v79[v81[2]]=v79[v81[3 + 0 ]][v81[1638 -(497 + 1137) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[942 -(9 + 931) ]]=v79[v81[3]][v81[293 -(181 + 108) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1083=9 -5 ;end if (((0 -0)==v1083) or (4893==696)) then v79[v81[1 + 1 ]]=v79[v81[3]][v81[3 + 1 ]];v73=v73 + (477 -(296 + 180)) ;v81=v69[v73];v79[v81[1405 -(1183 + 220) ]]();v73=v73 + (1266 -(1037 + 228)) ;v81=v69[v73];v1083=1 -0 ;end if ((v1083==(11 -7)) or (2502>4940)) then v79[v81[6 -4 ]]=v79[v81[737 -(527 + 207) ]][v81[531 -(187 + 340) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1872 -(1298 + 572) ]]=v79[v81[6 -3 ]][v81[174 -(144 + 26) ]];v73=v73 + (2 -1) ;v81=v69[v73];v1083=5;end if ((11 -6)==v1083) then v79[v81[1 + 1 ]][v81[8 -5 ]]=v79[v81[9 -5 ]];v73=v73 + (4 -3) ;v81=v69[v73];v73=v81[2 + 1 ];break;end end else v79[v81[2 -0 ]]=v62[v81[3 + 0 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]][v81[205 -(5 + 197) ]]=v79[v81[690 -(339 + 347) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[6 -4 ]]=v62[v81[379 -(365 + 11) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[11 -8 ]][v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];if (v79[v81[926 -(837 + 87) ]]==v81[4]) then v73=v73 + (1 -0) ;else v73=v81[1673 -(837 + 833) ];end end elseif (((1582<4899) and (v82>(18 + 62))) or (4356<=947)) then local v1093=1387 -(356 + 1031) ;local v1094;local v1095;while true do if ((v1093==5) or (3230<=1232)) then v1095=v81[1 + 1 ];v79[v1095]=v79[v1095](v13(v79,v1095 + (1647 -(73 + 1573)) ,v81[3]));v73=v73 + 1 ;v81=v69[v73];v1093=1394 -(1307 + 81) ;end if ((3876>=977) and ((238 -(7 + 227))==v1093)) then v81=v69[v73];v79[v81[2 -0 ]]=v81[3];v73=v73 + (167 -(90 + 76)) ;v81=v69[v73];v1093=5;end if ((1538<=3684) and ((v1093==(18 -12)) or (27>=4089))) then if v79[v81[1 + 1 ]] then v73=v73 + 1 + 0 ;else v73=v81[3 + 0 ];end break;end if ((3 -2)==v1093) then v81=v69[v73];v79[v81[262 -(197 + 63) ]]=v79[v81[3]][v81[1 + 3 ]];v73=v73 + 1 ;v81=v69[v73];v1093=1 + 1 ;end if (v1093==3) then v1094=v79[v81[2 + 1 ]];v79[v1095 + 1 + 0 ]=v1094;v79[v1095]=v1094[v81[4 -0 ]];v73=v73 + (1370 -(618 + 751)) ;v1093=3 + 1 ;end if (((1762>834) and (v1093==(1912 -(206 + 1704)))) or (998>3276)) then v79[v81[2]]=v79[v81[4 -1 ]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v1095=v81[1 + 1 ];v1093=1278 -(155 + 1120) ;end if ((3921>=1725) and (v1093==(1506 -(396 + 1110)))) then v1094=nil;v1095=nil;v79[v81[2]]=v79[v81[6 -3 ]][v81[2 + 2 ]];v73=v73 + 1 + 0 ;v1093=1 + 0 ;end end else local v1096=v81[3];local v1097=v79[v1096];for v3007=v1096 + 1 ,v81[980 -(230 + 746) ] do v1097=v1097   .. v79[v3007] ;end v79[v81[603 -(473 + 128) ]]=v1097;end elseif (v82<=(137 -(39 + 9))) then if (v82<=(351 -(38 + 228))) then if (v82<=83) then if (v82>(148 -66)) then v79[v81[475 -(106 + 367) ]]=v79[v81[1 + 2 ]][v81[1866 -(354 + 1508) ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2]]();v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[3 -0 ]];v73=v73 + (1245 -(334 + 910)) ;v81=v69[v73];v79[v81[897 -(92 + 803) ]]=v79[v81[2 + 1 ]][v81[1185 -(1035 + 146) ]];v73=v73 + (617 -(230 + 386)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[1513 -(353 + 1157) ]][v81[4]];v73=v73 + (1115 -(53 + 1061)) ;v81=v69[v73];v79[v81[1637 -(1568 + 67) ]]=v79[v81[2 + 1 ]][v81[1 + 3 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[7 -4 ]][v81[4 + 0 ]];v73=v73 + (1213 -(615 + 597)) ;v81=v69[v73];v79[v81[2]]=v62[v81[3]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]][v81[3 -0 ]]=v79[v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[2 + 1 ];else local v1116=0;while true do if (v1116==(1905 -(1056 + 843))) then v79[v81[3 -1 ]][v81[3]]=v79[v81[4]];v73=v73 + 1 ;v81=v69[v73];v73=v81[4 -1 ];break;end if ((4502>1181) and (v1116==(5 -3))) then v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[1979 -(286 + 1690) ]][v81[915 -(98 + 813) ]];v73=v73 + 1 ;v81=v69[v73];v1116=1 + 2 ;end if (v1116==(9 -5)) then v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[510 -(263 + 244) ]][v81[4 + 0 ]];v73=v73 + (1688 -(1502 + 185)) ;v1116=1 + 4 ;end if ((v1116==0) or (368<=224)) then v79[v81[9 -7 ]]=v79[v81[7 -4 ]][v81[1531 -(629 + 898) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]();v1116=2 -1 ;end if (v1116==5) then v81=v69[v73];v79[v81[367 -(12 + 353) ]]=v62[v81[1914 -(1680 + 231) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1116=6;end if (((2869>=2687) and (v1116==(2 + 1))) or (1265>1275)) then v79[v81[1151 -(212 + 937) ]]=v79[v81[2 + 1 ]][v81[1066 -(111 + 951) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[30 -(18 + 9) ]][v81[1 + 3 ]];v1116=4;end if (v1116==(535 -(31 + 503))) then v73=v73 + (1633 -(595 + 1037)) ;v81=v69[v73];v79[v81[1446 -(189 + 1255) ]]=v62[v81[3]];v73=v73 + 1 + 0 ;v1116=2;end end end elseif ((1495==1495) and (v82==(129 -45))) then local v1117;local v1118;v79[v81[1281 -(1170 + 109) ]]=v62[v81[1820 -(348 + 1469) ]];v73=v73 + (1290 -(1115 + 174)) ;v81=v69[v73];v1118=v81[2];v1117=v79[v81[7 -4 ]];v79[v1118 + (1015 -(85 + 929)) ]=v1117;v79[v1118]=v1117[v81[3 + 1 ]];v73=v73 + (1868 -(1151 + 716)) ;v81=v69[v73];v79[v81[1 + 1 ]]={};v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1706 -(95 + 1609) ]][v81[10 -7 ]]=v81[762 -(364 + 394) ];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]][v81[1 + 2 ]]=v81[1 + 3 ];elseif ((901<=3574) and (v79[v81[2 + 0 ]]<v81[3 + 1 ])) then v73=v73 + 1 ;else v73=v81[2 + 1 ];end elseif (v82<=(33 + 54)) then if ((191<=1841) and (v82>(80 + 6))) then v79[v81[1 + 1 ]]=v79[v81[959 -(719 + 237) ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[3]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[4 -2 ]]=v62[v81[8 -5 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1993 -(761 + 1230) ]][v81[196 -(80 + 113) ]]=v79[v81[3 + 1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[1 + 2 ];else local v1142;local v1143;v79[v81[7 -5 ]]=v79[v81[1 + 2 ]][v81[1 + 3 ]];v73=v73 + (1244 -(965 + 278)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[1733 -(1391 + 338) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[6 -3 ]][v81[2 + 2 ]];v73=v73 + (1409 -(496 + 912)) ;v81=v69[v73];v1143=v81[2];v1142=v79[v81[9 -6 ]];v79[v1143 + 1 + 0 ]=v1142;v79[v1143]=v1142[v81[6 -2 ]];v73=v73 + (1331 -(1190 + 140)) ;v81=v69[v73];v79[v81[2]]=v81[2 + 1 ];v73=v73 + (719 -(317 + 401)) ;v81=v69[v73];v1143=v81[951 -(303 + 646) ];v79[v1143]=v79[v1143](v13(v79,v1143 + (3 -2) ,v81[1735 -(1675 + 57) ]));v73=v73 + 1 + 0 ;v81=v69[v73];if (v79[v81[2]] or (3379>=4110)) then v73=v73 + (2 -1) ;else v73=v81[1 + 2 ];end end elseif ((v82==(1065 -(338 + 639))) or (2010<=784)) then local v1158;local v1159;local v1158,v1160;local v1161;local v1162;v79[v81[381 -(320 + 59) ]]=v79[v81[2 + 1 ]][v81[736 -(628 + 104) ]];v73=v73 + 1 ;v81=v69[v73];for v3008=v81[2],v81[3] do v79[v3008]=nil;end v73=v73 + 1 ;v81=v69[v73];v79[v81[2 -0 ]]=v62[v81[1894 -(439 + 1452) ]];v73=v73 + (1948 -(105 + 1842)) ;v81=v69[v73];v79[v81[9 -7 ]]=v62[v81[7 -4 ]];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[3]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v1162=v81[2 + 0 ];v1161=v79[v81[1167 -(274 + 890) ]];v79[v1162 + 1 + 0 ]=v1161;v79[v1162]=v1161[v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v1162=v81[1 + 1 ];v1158,v1160=v72(v79[v1162](v79[v1162 + 1 ]));v74=(v1160 + v1162) -(1 + 0) ;v1159=0 + 0 ;for v3010=v1162,v74 do v1159=v1159 + (1 -0) ;v79[v3010]=v1158[v1159];end v73=v73 + 1 ;v81=v69[v73];v1162=v81[821 -(731 + 88) ];v1158={v79[v1162](v13(v79,v1162 + 1 + 0 ,v74))};v1159=0;for v3013=v1162,v81[1 + 3 ] do local v3014=0;while true do if (((0 -0)==v3014) or (1023>2100)) then v1159=v1159 + (2 -1) ;v79[v3013]=v1158[v1159];break;end end end v73=v73 + (2 -1) ;v81=v69[v73];v73=v81[3];else local v1180=0 -0 ;local v1181;local v1182;while true do if (v1180==(0 + 0)) then v1181=nil;v1182=nil;v79[v81[1 + 1 ]]=v79[v81[3]][v81[1 + 3 ]];v73=v73 + 1 + 0 ;v1180=1;end if (v1180==(163 -(139 + 19))) then v1182=v81[1 + 1 ];v79[v1182]=v79[v1182](v13(v79,v1182 + (1994 -(1687 + 306)) ,v81[10 -7 ]));v73=v73 + 1 ;v81=v69[v73];v1180=1160 -(1018 + 136) ;end if (v1180==(1 + 0)) then v81=v69[v73];v79[v81[8 -6 ]]=v79[v81[818 -(117 + 698) ]][v81[485 -(305 + 176) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1180=2 + 0 ;end if ((4128==4128) and ((v1180==(6 -2)) or (3964<=3397))) then v81=v69[v73];v79[v81[2 + 0 ]]=v81[5 -2 ];v73=v73 + 1 ;v81=v69[v73];v1180=5;end if (v1180==(6 -3)) then v1181=v79[v81[3]];v79[v1182 + (1 -0) ]=v1181;v79[v1182]=v1181[v81[4]];v73=v73 + (261 -(159 + 101)) ;v1180=19 -15 ;end if ((v1180==(20 -14)) or (4898<=1719)) then if ((2012==2012) and v79[v81[1 + 1 ]]) then v73=v73 + (3 -2) ;else v73=v81[5 -2 ];end break;end if (v1180==(1 + 1)) then v79[v81[268 -(112 + 154) ]]=v79[v81[6 -3 ]][v81[4]];v73=v73 + (32 -(21 + 10)) ;v81=v69[v73];v1182=v81[1721 -(531 + 1188) ];v1180=3 + 0 ;end end end elseif (v82<=93) then if ((v82<=91) or (4042==1950) or (2217>=3036)) then if ((v82>(753 -(96 + 567))) or (1123>2031)) then local v1183;local v1184;v79[v81[2 -0 ]]=v79[v81[2 + 1 ]][v81[14 -10 ]];v73=v73 + (1696 -(867 + 828)) ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[10 -7 ]][v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v1184=v81[2];v1183=v79[v81[4 -1 ]];v79[v1184 + 1 + 0 ]=v1183;v79[v1184]=v1183[v81[6 -2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[773 -(134 + 637) ]]={};v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]][v81[3]]=v81[1161 -(775 + 382) ];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 -0 ]]=v62[v81[610 -(45 + 562) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[864 -(545 + 317) ]]=v79[v81[3 -0 ]][v81[1030 -(763 + 263) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1752 -(512 + 1238) ]]=v81[3];v73=v73 + 1 ;v81=v69[v73];v79[v81[1596 -(272 + 1322) ]]=v81[5 -2 ];v73=v73 + (1247 -(533 + 713)) ;v81=v69[v73];v79[v81[30 -(14 + 14) ]]=v81[828 -(499 + 326) ];v73=v73 + (1 -0) ;v81=v69[v73];v1184=v81[426 -(104 + 320) ];v79[v1184]=v79[v1184](v13(v79,v1184 + (1998 -(1929 + 68)) ,v81[1326 -(1206 + 117) ]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1594 -(683 + 909) ]][v81[3]]=v79[v81[4]];v73=v73 + 1 ;v81=v69[v73];v1184=v81[2];v79[v1184](v13(v79,v1184 + 1 ,v81[9 -6 ]));v73=v73 + 1 ;v81=v69[v73];v79[v81[3 -1 ]]=v62[v81[780 -(772 + 5) ]];v73=v73 + (1428 -(19 + 1408)) ;v81=v69[v73];v79[v81[2]]=v79[v81[291 -(134 + 154) ]][v81[6 -2 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[3 + 0 ];v73=v73 + (203 -(10 + 192)) ;v81=v69[v73];v1184=v81[49 -(13 + 34) ];v79[v1184](v79[v1184 + (1290 -(342 + 947)) ]);v73=v73 + 1 ;v81=v69[v73];v79[v81[8 -6 ]]=v81[1711 -(119 + 1589) ];v73=v73 + (2 -1) ;v81=v69[v73];v73=v81[3 -0 ];else local v1220;local v1221;local v1222;v79[v81[554 -(545 + 7) ]]=v62[v81[3]];v73=v73 + (2 -1) ;v81=v69[v73];v1222=v81[1 + 1 ];v1221=v79[v81[1706 -(494 + 1209) ]];v79[v1222 + (2 -1) ]=v1221;v79[v1222]=v1221[v81[4]];v73=v73 + (999 -(197 + 801)) ;v81=v69[v73];v79[v81[3 -1 ]]={};v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[956 -(919 + 35) ]][v81[3 + 0 ]]=v81[15 -11 ];v73=v73 + (468 -(369 + 98)) ;v81=v69[v73];v79[v81[1117 -(400 + 715) ]]=v81[3];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[1328 -(744 + 581) ]][v81[3 + 1 ]];v73=v73 + (1623 -(653 + 969)) ;v81=v69[v73];v79[v81[3 -1 ]]=v81[1634 -(12 + 1619) ];v73=v73 + (164 -(103 + 60)) ;v81=v69[v73];v1221=v81[14 -11 ];v1220=v79[v1221];for v3015=v1221 + (4 -3) ,v81[4] do v1220=v1220   .. v79[v3015] ;end v79[v81[9 -7 ]]=v1220;v73=v73 + (1663 -(710 + 952)) ;v81=v69[v73];v79[v81[1870 -(555 + 1313) ]][v81[3]]=v79[v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]][v81[3]]=v81[1472 -(1261 + 207) ];v73=v73 + (253 -(245 + 7)) ;v81=v69[v73];v79[v81[749 -(212 + 535) ]][v81[3]]=v81[19 -15 ];v73=v73 + (1477 -(905 + 571)) ;v81=v69[v73];v1222=v81[9 -7 ];v79[v1222](v13(v79,v1222 + 1 ,v81[3]));end elseif ((3074>474) and (2481==2481) and (v82>92)) then local v1249=0 -0 ;while true do if ((4215>=2017) and (v1249==(15 -11))) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1465 -(522 + 941) ]]=v79[v81[1514 -(292 + 1219) ]][v81[1116 -(787 + 325) ]];v73=v73 + (2 -1) ;v1249=5 + 0 ;end if ((1631<1772) and (v1249==(6 -3))) then v79[v81[2]]=v79[v81[537 -(424 + 110) ]][v81[3 + 1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[3]][v81[4]];v1249=316 -(33 + 279) ;end if (v1249==(1 + 1)) then v81=v69[v73];v79[v81[1355 -(1338 + 15) ]]=v79[v81[3]][v81[1427 -(528 + 895) ]];v73=v73 + 1 ;v81=v69[v73];v1249=2 + 1 ;end if ((v1249==(1930 -(1606 + 318))) or (618>3209)) then v79[v81[1821 -(298 + 1521) ]][v81[12 -9 ]]=v79[v81[314 -(154 + 156) ]];v73=v73 + (3 -2) ;v81=v69[v73];v73=v81[5 -2 ];break;end if (v1249==(1115 -(712 + 403))) then v79[v81[452 -(168 + 282) ]]=v79[v81[5 -2 ]][v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[1454 -(1242 + 209) ]][v81[683 -(20 + 659) ]];v1249=1;end if (v1249==(1 + 0)) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[4 -1 ]][v81[7 -3 ]];v73=v73 + (620 -(427 + 192)) ;v1249=4 -2 ;end if ((2962==2962) and (4386>=2411) and (v1249==(2 + 3))) then v81=v69[v73];v79[v81[1949 -(1427 + 520) ]]=v79[v81[2 + 1 ]][v81[15 -11 ]];v73=v73 + 1 ;v81=v69[v73];v1249=6 + 0 ;end end else local v1250=1232 -(712 + 520) ;while true do if (v1250==(14 -8)) then if v79[v81[1348 -(565 + 781) ]] then v73=v73 + (566 -(35 + 530)) ;else v73=v81[3];end break;end if (v1250==(0 + 0)) then v79[v81[6 -4 ]]=v79[v81[1381 -(1330 + 48) ]][v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v1250=1 + 0 ;end if ((v1250==(4 -1)) or (1349>3973)) then v79[v81[2]]=v79[v81[13 -10 ]][v81[1173 -(854 + 315) ]];v73=v73 + (3 -2) ;v81=v69[v73];v1250=2 + 2 ;end if (v1250==(48 -(31 + 13))) then v79[v81[2 -0 ]]=v79[v81[3]][v81[8 -4 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1250=5;end if ((v1250==(565 -(281 + 282))) or (1724>2727)) then v79[v81[5 -3 ]]=v62[v81[2 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v1250=952 -(216 + 733) ;end if (v1250==(1848 -(137 + 1710))) then v79[v81[5 -3 ]]();v73=v73 + (539 -(100 + 438)) ;v81=v69[v73];v1250=1367 -(205 + 1160) ;end if ((4 + 1)==v1250) then v79[v81[2 + 0 ]]=v79[v81[1308 -(535 + 770) ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v1250=1 + 5 ;end end end elseif (v82<=(53 + 42)) then if ((4920==4920) and (v82==(2088 -(211 + 1783)))) then local v1251;local v1252;v1252=v81[2];v1251=v79[v81[1 + 2 ]];v79[v1252 + (1430 -(1236 + 193)) ]=v1251;v79[v1252]=v1251[v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[912 -(793 + 117) ]]={};v73=v73 + (1893 -(1607 + 285)) ;v81=v69[v73];v79[v81[2]][v81[863 -(747 + 113) ]]=v81[1980 -(80 + 1896) ];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[2 -0 ]][v81[3 + 0 ]]=v81[9 -5 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]][v81[8 -5 ]]=v81[4];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]][v81[3]]=v81[2 + 2 ];v73=v73 + (2 -1) ;v81=v69[v73];v1252=v81[2];v79[v1252](v13(v79,v1252 + (455 -(246 + 208)) ,v81[1895 -(614 + 1278) ]));v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[317 -(249 + 65) ];else local v1269;local v1270;v79[v81[2]]=v79[v81[3]][v81[8 -4 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1277 -(726 + 549) ]]=v79[v81[3 + 0 ]][v81[1428 -(916 + 508) ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[326 -(140 + 183) ]][v81[3 + 1 ]];v73=v73 + (565 -(297 + 267)) ;v81=v69[v73];v1270=v81[2 + 0 ];v1269=v79[v81[345 -(37 + 305) ]];v79[v1270 + (1267 -(323 + 943)) ]=v1269;v79[v1270]=v1269[v81[2 + 2 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1537 -(394 + 1141) ]]=v81[2 + 1 ];v73=v73 + 1 + 0 ;v81=v69[v73];v1270=v81[2];v79[v1270]=v79[v1270](v13(v79,v1270 + 1 + 0 ,v81[3 -0 ]));v73=v73 + (1 -0) ;v81=v69[v73];if (((4555>3241) and v79[v81[2 + 0 ]]) or (2738<68)) then v73=v73 + 1 + 0 ;else v73=v81[3];end end elseif ((v82<=(625 -(87 + 442))) or (3145<=2098)) then local v1286;local v1287;local v1288;v79[v81[807 -(13 + 792) ]]=v79[v81[3]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]();v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[1869 -(1231 + 634) ]];v73=v73 + 1 ;v81=v69[v73];v1288=v81[2];v1287=v79[v81[1769 -(1362 + 404) ]];v79[v1288 + (2 -1) ]=v1287;v79[v1288]=v1287[v81[3 + 1 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1018 -(660 + 356) ]]=v81[4 -1 ];v73=v73 + 1 + 0 ;v81=v69[v73];v1288=v81[1952 -(1111 + 839) ];v79[v1288]=v79[v1288](v13(v79,v1288 + (952 -(496 + 455)) ,v81[701 -(66 + 632) ]));v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1138 -(441 + 695) ]]=v62[v81[3]];v73=v73 + (2 -1) ;v81=v69[v73];v1288=v81[3 -1 ];v1287=v79[v81[14 -11 ]];v79[v1288 + 1 + 0 ]=v1287;v79[v1288]=v1287[v81[1842 -(286 + 1552) ]];v73=v73 + (1278 -(1016 + 261)) ;v81=v69[v73];v79[v81[1322 -(708 + 612) ]]=v62[v81[8 -5 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[381 -(113 + 266) ]]=v81[3];v73=v73 + (1171 -(979 + 191)) ;v81=v69[v73];v1287=v81[5 -2 ];v1286=v79[v1287];for v3016=v1287 + 1 ,v81[1739 -(339 + 1396) ] do v1286=v1286   .. v79[v3016] ;end v79[v81[1 + 1 ]]=v1286;v73=v73 + 1 + 0 ;v81=v69[v73];v1288=v81[3 -1 ];v79[v1288]=v79[v1288](v13(v79,v1288 + 1 + 0 ,v81[3]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[349 -(187 + 160) ]]=v79[v81[6 -3 ]][v81[13 -9 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[6 -4 ]][v81[3]]=v79[v81[1 + 3 ]];v73=v73 + 1 ;v81=v69[v73];v73=v81[3];elseif ((4997>2856) and ((v82>(7 + 90)) or (1971==1842))) then if ( not v79[v81[3 -1 ]] or (3946<=3645)) then v73=v73 + (329 -(56 + 272)) ;else v73=v81[3];end else local v3125;local v3126;local v3127;v79[v81[2]]=v62[v81[2 + 1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v3127=v81[4 -2 ];v3126=v79[v81[2 + 1 ]];v79[v3127 + (641 -(455 + 185)) ]=v3126;v79[v3127]=v3126[v81[4]];v73=v73 + (789 -(757 + 31)) ;v81=v69[v73];v79[v81[2001 -(762 + 1237) ]]={};v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[271 -(265 + 4) ]][v81[7 -4 ]]=v81[3 + 1 ];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[5 -3 ]]=v81[1 + 2 ];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[5 -2 ]][v81[1738 -(1691 + 43) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[6 -4 ]]=v81[1 + 2 ];v73=v73 + (3 -2) ;v81=v69[v73];v3126=v81[179 -(127 + 49) ];v3125=v79[v3126];for v4086=v3126 + (1681 -(281 + 1399)) ,v81[1663 -(184 + 1475) ] do v3125=v3125   .. v79[v4086] ;end v79[v81[2 -0 ]]=v3125;v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[4 -2 ]][v81[2 + 1 ]]=v79[v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]][v81[1294 -(260 + 1031) ]]=v81[4];v73=v73 + 1 ;v81=v69[v73];v79[v81[1179 -(313 + 864) ]][v81[695 -(655 + 37) ]]=v81[4 + 0 ];v73=v73 + (1 -0) ;v81=v69[v73];v3127=v81[4 -2 ];v79[v3127](v13(v79,v3127 + 1 + 0 ,v81[3]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[3 -1 ]]=v62[v81[3]];v73=v73 + (771 -(383 + 387)) ;v81=v69[v73];v79[v81[2]]=v79[v81[1 + 2 ]][v81[1 + 3 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[9 -6 ]][v81[2 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[513 -(304 + 206) ]][v81[4]];v73=v73 + (226 -(182 + 43)) ;v81=v69[v73];v62[v81[778 -(264 + 511) ]]=v79[v81[1 + 1 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[983 -(128 + 853) ]]=v62[v81[1705 -(1635 + 67) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[2 + 1 ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[199 -(131 + 66) ]]=v81[10 -7 ];v73=v73 + (4 -3) ;v81=v69[v73];v3127=v81[2];v79[v3127](v79[v3127 + 1 + 0 ]);v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]=v62[v81[4 -1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1607 -(306 + 1299) ]]=v79[v81[3]][v81[2 + 2 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[791 -(671 + 118) ]]=v79[v81[11 -8 ]][v81[4]];v73=v73 + (77 -(73 + 3)) ;v81=v69[v73];v79[v81[5 -3 ]]=v62[v81[14 -11 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]=v79[v81[1758 -(1668 + 87) ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1901 -(296 + 1603) ]]=v81[3];v73=v73 + (107 -(79 + 27)) ;v81=v69[v73];v79[v81[2]]=v81[3 + 0 ];v73=v73 + (1008 -(700 + 307)) ;v81=v69[v73];v79[v81[2]]=v81[3];v73=v73 + 1 + 0 ;v81=v69[v73];v3127=v81[1801 -(1477 + 322) ];v79[v3127]=v79[v3127](v13(v79,v3127 + 1 + 0 ,v81[6 -3 ]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[6 -4 ]][v81[3 + 0 ]]=v79[v81[16 -12 ]];end elseif ((3680>43) and (4671>=3428) and (v82<=(300 -186))) then if (v82<=(51 + 55)) then if (v82<=102) then if ((3173==3173) and (v82<=(231 -131))) then if ((131<1594) and (v82>(157 -58))) then local v1319=0 -0 ;while true do if ((1131<4427) and (v1319==(1789 -(20 + 1766)))) then v79[v81[3 -1 ]]=v79[v81[3]][v81[813 -(88 + 721) ]];v73=v73 + 1 ;v81=v69[v73];v1319=4 + 0 ;end if ((2392<2571) and (v1319==(1 + 1))) then v79[v81[1 + 1 ]]=v62[v81[2 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v1319=7 -4 ;end if ((v1319==(7 -3)) or (821>2893) or (1726>=4888)) then if (v79[v81[2]]==v81[441 -(93 + 344) ]) then v73=v73 + 1 ;else v73=v81[3];end break;end if (v1319==(1213 -(960 + 253))) then v79[v81[1 + 1 ]]=v62[v81[8 -5 ]];v73=v73 + (2 -1) ;v81=v69[v73];v1319=1417 -(74 + 1342) ;end if ((185<1795) and (v1319==(1 + 0))) then v79[v81[2]][v81[477 -(33 + 441) ]]=v79[v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v1319=1421 -(64 + 1355) ;end end else local v1320=0 -0 ;local v1321;local v1322;while true do if ((v1320==6) or (4674==1162)) then v79[v81[13 -(5 + 6) ]]={};v73=v73 + 1 ;v81=v69[v73];v1320=2 + 5 ;end if (v1320==(0 + 0)) then v1321=nil;v1322=nil;v79[v81[448 -(369 + 77) ]][v81[1 + 2 ]]=v79[v81[742 -(438 + 300) ]];v1320=295 -(50 + 244) ;end if ((v1320==(1202 -(95 + 1106))) or (4807<3793)) then v73=v73 + 1 ;v81=v69[v73];v1322=v81[3 -1 ];v1320=9 -7 ;end if ((4492>=2710) and ((v1320==8) or (331>=3292))) then v79[v81[1898 -(1741 + 155) ]][v81[8 -5 ]]=v81[4];break;end if ((v1320==(7 -2)) or (3473<=283)) then v79[v1322]=v1321[v81[7 -3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1320=3 + 3 ;end if ((108<=3244) and ((2 + 1)==v1320)) then v79[v81[4 -2 ]]=v62[v81[7 -4 ]];v73=v73 + (1778 -(1263 + 514)) ;v81=v69[v73];v1320=501 -(73 + 424) ;end if ((v1320==7) or (99>2967)) then v79[v81[4 -2 ]][v81[311 -(93 + 215) ]]=v81[4];v73=v73 + (3 -2) ;v81=v69[v73];v1320=1943 -(1756 + 179) ;end if (v1320==(1681 -(550 + 1129))) then v79[v1322](v13(v79,v1322 + (108 -(57 + 50)) ,v81[632 -(30 + 599) ]));v73=v73 + 1 + 0 ;v81=v69[v73];v1320=3 -0 ;end if ((v1320==(922 -(794 + 124))) or (684>=4857)) then v1322=v81[1 + 1 ];v1321=v79[v81[1 + 2 ]];v79[v1322 + (1 -0) ]=v1321;v1320=1932 -(1299 + 628) ;end end end elseif (v82>(222 -121)) then local v1323=0 -0 ;while true do if ((6 + 0)==v1323) then v79[v81[5 -3 ]]=v79[v81[3]][v81[1449 -(335 + 1110) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1323=23 -16 ;end if (v1323==(4 -1)) then v79[v81[334 -(268 + 64) ]]=v79[v81[2 + 1 ]][v81[1282 -(243 + 1035) ]];v73=v73 + (2 -1) ;v81=v69[v73];v1323=4;end if ((2110<4879) and (v1323==(4 -3))) then v79[v81[8 -6 ]]();v73=v73 + 1 ;v81=v69[v73];v1323=2;end if (v1323==(3 + 1)) then v79[v81[2 + 0 ]]=v79[v81[3 -0 ]][v81[104 -(90 + 10) ]];v73=v73 + (805 -(209 + 595)) ;v81=v69[v73];v1323=810 -(603 + 202) ;end if (v1323==5) then v79[v81[2]]=v79[v81[2 + 1 ]][v81[12 -8 ]];v73=v73 + 1 ;v81=v69[v73];v1323=3 + 3 ;end if ((1590<=1748) and (v1323==(0 -0))) then v79[v81[1 + 1 ]]=v79[v81[8 -5 ]][v81[16 -12 ]];v73=v73 + (280 -(174 + 105)) ;v81=v69[v73];v1323=3 -2 ;end if ((430==430) and (v1323==(922 -(532 + 381)))) then v73=v81[3 + 0 ];break;end if ((1791<=4995) and (v1323==(841 -(137 + 702)))) then v79[v81[5 -3 ]]=v62[v81[3]];v73=v73 + 1 ;v81=v69[v73];v1323=3;end if (((605<745) and (v1323==7)) or (4472==2179)) then v79[v81[1 + 1 ]]=v62[v81[3]];v73=v73 + 1 ;v81=v69[v73];v1323=8;end if (v1323==(28 -20)) then v79[v81[1888 -(1819 + 67) ]][v81[2 + 1 ]]=v79[v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v1323=1366 -(259 + 1098) ;end end else local v1324=0;local v1325;local v1326;while true do if (v1324==(3 + 0)) then v79[v81[2]]=v62[v81[1 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1324=13 -9 ;end if ((v1324==(0 + 0)) or (275==1712)) then v1325=nil;v1326=nil;v79[v81[2 + 0 ]][v81[14 -11 ]]=v79[v81[4]];v1324=1707 -(667 + 1039) ;end if ((4339==4339) and (v1324==(1023 -(274 + 745)))) then v1326=v81[2 + 0 ];v1325=v79[v81[2 + 1 ]];v79[v1326 + 1 ]=v1325;v1324=5;end if ((4046>=691) and (v1324==7)) then v79[v81[432 -(288 + 142) ]][v81[1309 -(301 + 1005) ]]=v81[2 + 2 ];v73=v73 + (2 -1) ;v81=v69[v73];v1324=1881 -(674 + 1199) ;end if ((v1324==(8 + 0)) or (4189<=2148) or (148>4645)) then v79[v81[2 + 0 ]][v81[8 -5 ]]=v81[16 -12 ];break;end if (v1324==(1 + 4)) then v79[v1326]=v1325[v81[4]];v73=v73 + (446 -(92 + 353)) ;v81=v69[v73];v1324=6 + 0 ;end if ((1162<=4170) and (v1324==6)) then v79[v81[4 -2 ]]={};v73=v73 + (1 -0) ;v81=v69[v73];v1324=19 -12 ;end if (v1324==(1 + 0)) then v73=v73 + (1 -0) ;v81=v69[v73];v1326=v81[3 -1 ];v1324=8 -6 ;end if (v1324==2) then v79[v1326](v13(v79,v1326 + 1 + 0 ,v81[3]));v73=v73 + (1 -0) ;v81=v69[v73];v1324=3;end end end elseif ((1675>1604) and ((v82<=(369 -(34 + 231))) or (2766==4321))) then if ((546>417) and (v82>(1420 -(930 + 387)))) then local v1327;local v1328;v79[v81[2 + 0 ]]=v79[v81[2 + 1 ]][v81[10 -6 ]];v73=v73 + (698 -(389 + 308)) ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[6 -3 ]][v81[11 -7 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[3]][v81[326 -(125 + 197) ]];v73=v73 + (998 -(339 + 658)) ;v81=v69[v73];v1328=v81[4 -2 ];v1327=v79[v81[3]];v79[v1328 + 1 ]=v1327;v79[v1328]=v1327[v81[8 -4 ]];v73=v73 + (1349 -(743 + 605)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[1 + 2 ];v73=v73 + (3 -2) ;v81=v69[v73];v1328=v81[5 -3 ];v79[v1328]=v79[v1328](v13(v79,v1328 + 1 + 0 ,v81[3]));v73=v73 + (250 -(197 + 52)) ;v81=v69[v73];if ((2736>112) and (v79[v81[3 -1 ]] or (1276>2224))) then v73=v73 + (2 -1) ;else v73=v81[2 + 1 ];end else local v1343;local v1344;v79[v81[2 + 0 ]]=v79[v81[4 -1 ]][v81[13 -9 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1 + 1 ]]();v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1099 -(97 + 1000) ]]=v62[v81[10 -7 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1847 -(143 + 1702) ]]=v79[v81[5 -2 ]][v81[373 -(40 + 329) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[3 -0 ]][v81[1 + 3 ]];v73=v73 + (66 -(9 + 56)) ;v81=v69[v73];v79[v81[586 -(531 + 53) ]]=v79[v81[3]][v81[4 + 0 ]];v73=v73 + (774 -(89 + 684)) ;v81=v69[v73];v1344=v81[2 + 0 ];v1343=v79[v81[1 + 2 ]];v79[v1344 + 1 + 0 ]=v1343;v79[v1344]=v1343[v81[6 -2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[616 -(238 + 375) ];v73=v73 + 1 + 0 ;v81=v69[v73];v1344=v81[2 -0 ];v79[v1344]=v79[v1344](v13(v79,v1344 + 1 ,v81[3 + 0 ]));v73=v73 + (2 -1) ;v81=v69[v73];if v79[v81[5 -3 ]] then v73=v73 + (2 -1) ;else v73=v81[6 -3 ];end end elseif ((788==788) and (v82>(389 -284))) then local v1363;local v1364;v79[v81[2 -0 ]][v81[3 + 0 ]]=v79[v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v1364=v81[2];v79[v1364](v13(v79,v1364 + 1 ,v81[2 + 1 ]));v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v62[v81[465 -(428 + 34) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1364=v81[2];v1363=v79[v81[4 -1 ]];v79[v1364 + (2 -1) ]=v1363;v79[v1364]=v1363[v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]={};v73=v73 + 1 ;v81=v69[v73];v79[v81[2]][v81[3]]=v81[922 -(223 + 695) ];v73=v73 + 1 ;v81=v69[v73];v79[v81[6 -4 ]][v81[514 -(329 + 182) ]]=v81[1 + 3 ];else local v1379;local v1380;v79[v81[3 -1 ]]=v79[v81[1 + 2 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v1380=v81[2 + 0 ];v1379=v79[v81[6 -3 ]];v79[v1380 + (1 -0) ]=v1379;v79[v1380]=v1379[v81[1204 -(177 + 1023) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[6 -3 ];v73=v73 + (1466 -(120 + 1345)) ;v81=v69[v73];v1380=v81[339 -(8 + 329) ];v79[v1380]=v79[v1380](v13(v79,v1380 + 1 ,v81[128 -(19 + 106) ]));v73=v73 + (3 -2) ;v81=v69[v73];if ((3146==3146) and v79[v81[2 -0 ]]) then v73=v73 + 1 ;else v73=v81[3 + 0 ];end end elseif (v82<=(323 -213)) then if ((1442==1442) and (v82<=108)) then if (v82==107) then local v1392=0 -0 ;local v1393;local v1394;while true do if (v1392==1) then v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2]]=v79[v81[6 -3 ]][v81[2 + 2 ]];v1392=1505 -(957 + 546) ;end if ((3899==3899) and ((8 -6)==v1392)) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[2 + 1 ]][v81[2 + 2 ]];v1392=3;end if (v1392==(708 -(227 + 476))) then v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[3 -1 ]]=v81[3];v1392=8 -2 ;end if (v1392==4) then v1393=v79[v81[4 -1 ]];v79[v1394 + 1 ]=v1393;v79[v1394]=v1393[v81[5 -1 ]];v1392=959 -(166 + 788) ;end if (v1392==6) then v73=v73 + (987 -(21 + 965)) ;v81=v69[v73];v1394=v81[698 -(127 + 569) ];v1392=7;end if (v1392==(0 + 0)) then v1393=nil;v1394=nil;v79[v81[2]]=v79[v81[1 + 2 ]][v81[2 + 2 ]];v1392=1 -0 ;end if ((v1392==(5 + 2)) or (944>=2411)) then v79[v1394]=v79[v1394](v13(v79,v1394 + (2 -1) ,v81[2 + 1 ]));v73=v73 + 1 + 0 ;v81=v69[v73];v1392=1300 -(1162 + 130) ;end if ((v1392==3) or (3291>=3795)) then v73=v73 + 1 ;v81=v69[v73];v1394=v81[3 -1 ];v1392=4;end if (v1392==(6 + 2)) then if v79[v81[2]] then v73=v73 + (2 -1) ;else v73=v81[939 -(889 + 47) ];end break;end end elseif ((v81[2 + 0 ]<=v79[v81[1268 -(1153 + 111) ]]) or (4918==36)) then v73=v73 + 1 ;else v73=v81[3];end elseif ((1770>1599) and (v82>(143 -34))) then local v1395;local v1396;v79[v81[2 + 0 ]][v81[2 + 1 ]]=v79[v81[1 + 3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1396=v81[1 + 1 ];v79[v1396](v13(v79,v1396 + (1 -0) ,v81[3]));v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[99 -(23 + 73) ]];v73=v73 + (286 -(26 + 259)) ;v81=v69[v73];v1396=v81[1 + 1 ];v1395=v79[v81[3]];v79[v1396 + (1 -0) ]=v1395;v79[v1396]=v1395[v81[13 -9 ]];v73=v73 + (1630 -(1094 + 535)) ;v81=v69[v73];v79[v81[2]]={};v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1878 -(1554 + 322) ]][v81[1428 -(989 + 436) ]]=v81[1182 -(816 + 362) ];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]][v81[7 -4 ]]=v81[14 -10 ];else local v1412=0 -0 ;local v1413;local v1414;local v1415;while true do if (v1412==(6 -3)) then v79[v81[8 -6 ]]=v79[v81[1 + 2 ]][v81[767 -(86 + 677) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[1029 -(263 + 763) ];v73=v73 + 1 + 0 ;v81=v69[v73];v1412=862 -(649 + 209) ;end if (v1412==(22 -17)) then v1415=v81[733 -(643 + 88) ];v79[v1415]=v79[v1415](v13(v79,v1415 + 1 ,v81[3]));v73=v73 + (1770 -(54 + 1715)) ;v81=v69[v73];if (v79[v81[2]] or (1330>3597)) then v73=v73 + 1 ;else v73=v81[11 -8 ];end break;end if ((3361<4677) and (v1412==(0 -0))) then v1413=nil;v1414=nil;v1415=nil;v79[v81[3 -1 ]]=v79[v81[3]][v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1412=3 -2 ;end if (v1412==(1385 -(132 + 1251))) then v1415=v81[2];v1414=v79[v81[3]];v79[v1415 + 1 ]=v1414;v79[v1415]=v1414[v81[4 + 0 ]];v73=v73 + 1 ;v81=v69[v73];v1412=7 -4 ;end if ((1847<2343) and (v1412==(1 + 0))) then v79[v81[460 -(185 + 273) ]]();v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v62[v81[8 -5 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1412=1226 -(361 + 863) ;end if ((177<2560) and (v1412==(10 -6))) then v1414=v81[1330 -(443 + 884) ];v1413=v79[v1414];for v5121=v1414 + (2 -1) ,v81[1 + 3 ] do v1413=v1413   .. v79[v5121] ;end v79[v81[2 -0 ]]=v1413;v73=v73 + 1 ;v81=v69[v73];v1412=4 + 1 ;end end end elseif (v82<=(81 + 31)) then if ((v82>(260 -149)) or (3693<=1924)) then local v1416=v81[749 -(16 + 731) ];v79[v1416]=v79[v1416](v13(v79,v1416 + 1 + 0 ,v81[2 + 1 ]));else local v1418;local v1419;v1419=v81[2 + 0 ];v1418=v79[v81[3]];v79[v1419 + (761 -(527 + 233)) ]=v1418;v79[v1419]=v1418[v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[4 -2 ]]={};v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1787 -(1107 + 678) ]][v81[3 + 0 ]]=v81[4 + 0 ];v73=v73 + (51 -(4 + 46)) ;v81=v69[v73];v79[v81[7 -5 ]][v81[5 -2 ]]=v81[3 + 1 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[3 -1 ]][v81[4 -1 ]]=v81[1400 -(1262 + 134) ];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1 + 1 ]][v81[3 + 0 ]]=v81[799 -(383 + 412) ];v73=v73 + 1 + 0 ;v81=v69[v73];v1419=v81[1 + 1 ];v79[v1419](v13(v79,v1419 + 1 ,v81[3]));end elseif ((v82>(52 + 61)) or (3202<=131)) then local v1436;local v1437;local v1438;v79[v81[1 + 1 ]]=v62[v81[3 + 0 ]];v73=v73 + (1 -0) ;v81=v69[v73];v1438=v81[2 + 0 ];v1437=v79[v81[8 -5 ]];v79[v1438 + (1 -0) ]=v1437;v79[v1438]=v1437[v81[10 -6 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[709 -(667 + 40) ]]={};v73=v73 + 1 ;v81=v69[v73];v79[v81[1312 -(436 + 874) ]][v81[1609 -(762 + 844) ]]=v81[6 -2 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[4 -2 ]]=v81[1 + 2 ];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[478 -(209 + 267) ]]=v79[v81[5 -2 ]][v81[11 -7 ]];v73=v73 + (1712 -(1611 + 100)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[787 -(14 + 770) ];v73=v73 + (1785 -(1165 + 619)) ;v81=v69[v73];v1437=v81[4 -1 ];v1436=v79[v1437];for v3017=v1437 + 1 ,v81[4] do v1436=v1436   .. v79[v3017] ;end v79[v81[2]]=v1436;v73=v73 + (382 -(229 + 152)) ;v81=v69[v73];v79[v81[196 -(107 + 87) ]][v81[5 -2 ]]=v79[v81[2 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]][v81[14 -11 ]]=v81[15 -11 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]][v81[3 + 0 ]]=v81[18 -(13 + 1) ];v73=v73 + 1 ;v81=v69[v73];v1438=v81[2 + 0 ];v79[v1438](v13(v79,v1438 + 1 ,v81[2 + 1 ]));v73=v73 + (1059 -(987 + 71)) ;v81=v69[v73];v79[v81[5 -3 ]]=v62[v81[3 -0 ]];v73=v73 + (700 -(514 + 185)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[5 -2 ]][v81[15 -11 ]];v73=v73 + (1505 -(771 + 733)) ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[6 -3 ]][v81[1171 -(407 + 760) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[1 + 2 ]][v81[4 + 0 ]];v73=v73 + (1855 -(169 + 1685)) ;v81=v69[v73];v62[v81[1 + 2 ]]=v79[v81[393 -(41 + 350) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v62[v81[8 -5 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[7 -4 ]][v81[16 -12 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[890 -(790 + 97) ];v73=v73 + (4 -3) ;v81=v69[v73];v1438=v81[1 + 1 ];v79[v1438](v79[v1438 + 1 + 0 ]);v73=v73 + (246 -(235 + 10)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[5 -2 ]];v73=v73 + (1184 -(887 + 296)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[1049 -(512 + 533) ]];v73=v73 + (1425 -(662 + 762)) ;v81=v69[v73];v79[v81[679 -(334 + 343) ]]=v79[v81[10 -7 ]][v81[4]];v73=v73 + (490 -(198 + 291)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[3]];v73=v73 + (575 -(141 + 433)) ;v81=v69[v73];v79[v81[9 -7 ]]=v79[v81[2 + 1 ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[779 -(227 + 550) ]]=v81[7 -4 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v81[8 -5 ];v73=v73 + (104 -(72 + 31)) ;v81=v69[v73];v79[v81[350 -(89 + 259) ]]=v81[3 + 0 ];v73=v73 + 1 + 0 ;v81=v69[v73];v1438=v81[2];v79[v1438]=v79[v1438](v13(v79,v1438 + 1 + 0 ,v81[5 -2 ]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[3 -1 ]][v81[1406 -(1333 + 70) ]]=v79[v81[1836 -(701 + 1131) ]];else local v1492=127 -(55 + 72) ;local v1493;local v1494;local v1495;while true do if (v1492==(164 -(99 + 57))) then v1495=v81[2 -0 ];v79[v1495]=v79[v1495](v13(v79,v1495 + 1 ,v81[2 + 1 ]));v73=v73 + (1580 -(1243 + 336)) ;v1492=1338 -(774 + 555) ;end if (v1492==(0 + 0)) then v1493=nil;v1494=nil;v1495=nil;v1492=1;end if (v1492==(802 -(150 + 649))) then v79[v81[2 + 0 ]]=v81[4 -1 ];v73=v73 + 1 ;v81=v69[v73];v1492=7 -3 ;end if (6==v1492) then v1494=v81[1987 -(1122 + 862) ];v1493=v79[v1494];for v5122=v1494 + (1 -0) ,v81[1 + 3 ] do v1493=v1493   .. v79[v5122] ;end v1492=7;end if (9==v1492) then v81=v69[v73];if (((4856>2988) and v79[v81[3 -1 ]]) or (2990<230)) then v73=v73 + 1 + 0 ;else v73=v81[1 + 2 ];end break;end if (v1492==(747 -(549 + 194))) then v79[v81[2 + 0 ]]=v79[v81[11 -8 ]][v81[1 + 3 ]];v73=v73 + (1 -0) ;v81=v69[v73];v1492=5 + 0 ;end if (v1492==(7 -5)) then v79[v1495]=v1494[v81[4]];v73=v73 + (1704 -(453 + 1250)) ;v81=v69[v73];v1492=8 -5 ;end if (v1492==(7 + 0)) then v79[v81[2]]=v1493;v73=v73 + (576 -(203 + 372)) ;v81=v69[v73];v1492=8;end if (v1492==(1 + 0)) then v1495=v81[5 -3 ];v1494=v79[v81[1385 -(978 + 404) ]];v79[v1495 + (3 -2) ]=v1494;v1492=2 + 0 ;end if (v1492==(323 -(56 + 262))) then v79[v81[1 + 1 ]]=v81[117 -(108 + 6) ];v73=v73 + 1 + 0 ;v81=v69[v73];v1492=6 + 0 ;end end end elseif ((v82<=122) or (3856<=3144)) then if (v82<=(2070 -(653 + 1299))) then if ((2766<=4128) and (v82<=116)) then if ((v82>(101 + 14)) or (4742<=1605) or (4749<=4030)) then local v1496;local v1497;v79[v81[1 + 1 ]]=v79[v81[3]][v81[9 -5 ]];v73=v73 + (1923 -(1042 + 880)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[1005 -(16 + 986) ]][v81[4]];v73=v73 + (1219 -(700 + 518)) ;v81=v69[v73];v79[v81[6 -4 ]]=v79[v81[3 -0 ]][v81[1515 -(617 + 894) ]];v73=v73 + (1 -0) ;v81=v69[v73];v1497=v81[2];v1496=v79[v81[461 -(271 + 187) ]];v79[v1497 + (1585 -(731 + 853)) ]=v1496;v79[v1497]=v1496[v81[4]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2]]=v81[1524 -(199 + 1322) ];v73=v73 + (1 -0) ;v81=v69[v73];v1497=v81[2 + 0 ];v79[v1497]=v79[v1497](v13(v79,v1497 + 1 ,v81[1663 -(1291 + 369) ]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]][v81[2 + 1 ]]=v81[4];else local v1514=0 + 0 ;local v1515;local v1516;local v1517;while true do if (((1 + 3)==v1514) or (4100>=4772)) then v81=v69[v73];v79[v81[687 -(561 + 124) ]]=v79[v81[3]][v81[4 + 0 ]];v73=v73 + (854 -(25 + 828)) ;v81=v69[v73];v79[v81[4 -2 ]]=v81[4 -1 ];v1514=595 -(99 + 491) ;end if (((53 -(18 + 30))==v1514) or (1444>2130)) then v73=v73 + (2 -1) ;v81=v69[v73];v1516=v81[5 -2 ];v1515=v79[v1516];for v5123=v1516 + (1 -0) ,v81[2 + 2 ] do v1515=v1515   .. v79[v5123] ;end v1514=19 -13 ;end if ((3873>=1694) and ((733 -(501 + 231))==v1514)) then v81=v69[v73];v79[v81[2 + 0 ]]();v73=v73 + (1699 -(470 + 1228)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[3]];v1514=2;end if ((1873<=2114) and (v1514==(4 + 2))) then v79[v81[688 -(537 + 149) ]]=v1515;v73=v73 + (1 -0) ;v81=v69[v73];v1517=v81[2 + 0 ];v79[v1517]=v79[v1517](v13(v79,v1517 + (1 -0) ,v81[9 -6 ]));v1514=20 -13 ;end if ((4323>1772) and (v1514==(3 + 0))) then v79[v1517]=v1516[v81[2 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v81[3];v73=v73 + 1 + 0 ;v1514=3 + 1 ;end if ((v1514==(1 + 1)) or (3794<600)) then v73=v73 + 1 + 0 ;v81=v69[v73];v1517=v81[2 -0 ];v1516=v79[v81[2 + 1 ]];v79[v1517 + (580 -(134 + 445)) ]=v1516;v1514=5 -2 ;end if (v1514==(7 + 0)) then v73=v73 + 1 + 0 ;v81=v69[v73];if  not v79[v81[7 -5 ]] then v73=v73 + (261 -(36 + 224)) ;else v73=v81[1863 -(1033 + 827) ];end break;end if (v1514==(1846 -(1002 + 844))) then v1515=nil;v1516=nil;v1517=nil;v79[v81[2]]=v79[v81[1353 -(1126 + 224) ]][v81[1 + 3 ]];v73=v73 + 1 + 0 ;v1514=3 -2 ;end end end elseif ((v82>(181 -(48 + 16))) or (3109>4544)) then if ((2764>=1049) and (v79[v81[2 + 0 ]]==v79[v81[19 -15 ]])) then v73=v73 + (3 -2) ;else v73=v81[1 + 2 ];end else local v1518=1089 -(910 + 179) ;local v1519;local v1520;while true do if (6==v1518) then v79[v81[3 -1 ]]={};v73=v73 + (1 -0) ;v81=v69[v73];v1518=1386 -(933 + 446) ;end if ((v1518==(2 + 2)) or (1417>2882)) then v1520=v81[2];v1519=v79[v81[3]];v79[v1520 + (1525 -(248 + 1276)) ]=v1519;v1518=5;end if (v1518==2) then v79[v1520](v13(v79,v1520 + 1 + 0 ,v81[2 + 1 ]));v73=v73 + 1 ;v81=v69[v73];v1518=3;end if ((v1518==(9 -6)) or (3127>=4833)) then v79[v81[6 -4 ]]=v62[v81[3]];v73=v73 + 1 ;v81=v69[v73];v1518=1549 -(151 + 1394) ;end if ((v1518==(949 -(929 + 15))) or (3077>=4765)) then v79[v1520]=v1519[v81[2000 -(1173 + 823) ]];v73=v73 + (1 -0) ;v81=v69[v73];v1518=1782 -(482 + 1294) ;end if (v1518==(15 -7)) then v79[v81[1 + 1 ]][v81[1309 -(1125 + 181) ]]=v81[11 -7 ];break;end if ((2362>1430) and (v1518==(0 + 0))) then v1519=nil;v1520=nil;v79[v81[2 -0 ]][v81[1192 -(626 + 563) ]]=v79[v81[4]];v1518=1;end if ((v1518==7) or (1773>4114)) then v79[v81[2]][v81[1253 -(153 + 1097) ]]=v81[12 -8 ];v73=v73 + 1 + 0 ;v81=v69[v73];v1518=20 -12 ;end if ((3236>2109) and ((1 + 0)==v1518)) then v73=v73 + 1 + 0 ;v81=v69[v73];v1520=v81[1 + 1 ];v1518=2 + 0 ;end end end elseif ((3221>=1050) and (v82<=(105 + 15))) then if (v82>(1276 -(199 + 958))) then v79[v81[2 + 0 ]][v81[7 -4 ]]=v79[v81[8 -4 ]];else local v1523=1176 -(1169 + 7) ;local v1524;local v1525;local v1526;while true do if (v1523==5) then v81=v69[v73];v79[v81[1875 -(751 + 1122) ]]=v62[v81[1 + 2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[1 + 2 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[1184 -(589 + 592) ]][v81[7 -3 ]];v73=v73 + 1 ;v1523=2 + 4 ;end if ((v1523==(33 -(13 + 11))) or (1248<=648)) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[3]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1262 -(684 + 576) ]]=v79[v81[2 + 1 ]][v81[9 -5 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v81[3];v1523=5 + 5 ;end if (v1523==(1 + 2)) then v1525=v81[3];v1524=v79[v1525];for v5124=v1525 + (1 -0) ,v81[4] do v1524=v1524   .. v79[v5124] ;end v79[v81[2 + 0 ]]=v1524;v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]][v81[2 + 1 ]]=v79[v81[1 + 3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1523=1852 -(230 + 1618) ;end if (v1523==6) then v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3]][v81[2 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v62[v81[206 -(131 + 72) ]]=v79[v81[1 + 1 ]];v73=v73 + (205 -(144 + 60)) ;v81=v69[v73];v79[v81[2]]=v62[v81[12 -9 ]];v73=v73 + (1 -0) ;v1523=7;end if ((2038==2038) and (((4 + 7)==v1523) or (869==3455))) then v79[v1526]=v79[v1526](v13(v79,v1526 + (4 -3) ,v81[1 + 2 ]));v73=v73 + 1 ;v81=v69[v73];v79[v81[1924 -(523 + 1399) ]][v81[3 + 0 ]]=v79[v81[408 -(72 + 332) ]];break;end if ((4279>=1529) and (v1523==(980 -(269 + 707)))) then v79[v81[2]][v81[5 -2 ]]=v81[9 -5 ];v73=v73 + (131 -(123 + 7)) ;v81=v69[v73];v79[v81[2 + 0 ]][v81[3 + 0 ]]=v81[18 -14 ];v73=v73 + 1 ;v81=v69[v73];v1526=v81[4 -2 ];v79[v1526](v13(v79,v1526 + 1 ,v81[1091 -(38 + 1050) ]));v73=v73 + 1 + 0 ;v1523=2 + 3 ;end if (v1523==(2 + 0)) then v79[v81[825 -(426 + 397) ]]=v81[3];v73=v73 + (1407 -(751 + 655)) ;v81=v69[v73];v79[v81[2]]=v79[v81[5 -2 ]][v81[1 + 3 ]];v73=v73 + (1246 -(39 + 1206)) ;v81=v69[v73];v79[v81[5 -3 ]]=v81[844 -(566 + 275) ];v73=v73 + (936 -(167 + 768)) ;v81=v69[v73];v1523=2 + 1 ;end if ((1566==1566) and (v1523==(12 -4))) then v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v62[v81[1 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[3]][v81[19 -(8 + 7) ]];v73=v73 + (1684 -(1510 + 173)) ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[1 + 2 ]][v81[257 -(30 + 223) ]];v1523=1265 -(300 + 956) ;end if (v1523==(122 -(22 + 100))) then v1524=nil;v1525=nil;v1526=nil;v79[v81[4 -2 ]]=v62[v81[285 -(47 + 235) ]];v73=v73 + 1 ;v81=v69[v73];v1526=v81[6 -4 ];v1525=v79[v81[2 + 1 ]];v79[v1526 + (487 -(21 + 465)) ]=v1525;v1523=1 + 0 ;end if (((7 + 3)==v1523) or (3347>4186)) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]=v81[3];v73=v73 + (1218 -(553 + 664)) ;v81=v69[v73];v79[v81[2]]=v81[2 + 1 ];v73=v73 + (79 -(73 + 5)) ;v81=v69[v73];v1526=v81[2];v1523=11;end if (v1523==(1716 -(1128 + 587))) then v79[v1526]=v1525[v81[15 -11 ]];v73=v73 + (691 -(558 + 132)) ;v81=v69[v73];v79[v81[5 -3 ]]={};v73=v73 + 1 ;v81=v69[v73];v79[v81[5 -3 ]][v81[1 + 2 ]]=v81[4 + 0 ];v73=v73 + 1 + 0 ;v81=v69[v73];v1523=2 + 0 ;end if (v1523==(11 -4)) then v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[2 + 1 ]][v81[775 -(294 + 477) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[4 -2 ]]=v81[5 -2 ];v73=v73 + 1 + 0 ;v81=v69[v73];v1526=v81[2];v79[v1526](v79[v1526 + 1 + 0 ]);v1523=18 -10 ;end end end elseif (v82==(1103 -(97 + 885))) then local v1527;local v1528;v79[v81[2]][v81[3]]=v79[v81[2 + 2 ]];v73=v73 + (1 -0) ;v81=v69[v73];v1528=v81[2];v79[v1528](v13(v79,v1528 + (366 -(271 + 94)) ,v81[1606 -(777 + 826) ]));v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[1358 -(117 + 1238) ]];v73=v73 + (1716 -(686 + 1029)) ;v81=v69[v73];v1528=v81[1358 -(1074 + 282) ];v1527=v79[v81[1620 -(1359 + 258) ]];v79[v1528 + (2 -1) ]=v1527;v79[v1528]=v1527[v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1937 -(1730 + 205) ]]={};v73=v73 + (529 -(67 + 461)) ;v81=v69[v73];v79[v81[3 -1 ]][v81[4 -1 ]]=v81[4];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1 + 1 ]][v81[632 -(129 + 500) ]]=v81[1715 -(1157 + 554) ];else local v1545;local v1546;v1546=v81[2 -0 ];v1545=v79[v81[3]];v79[v1546 + (608 -(82 + 525)) ]=v1545;v79[v1546]=v1545[v81[4 + 0 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]={};v73=v73 + (1624 -(948 + 675)) ;v81=v69[v73];v79[v81[1 + 1 ]][v81[3 + 0 ]]=v81[11 -7 ];v73=v73 + (854 -(406 + 447)) ;v81=v69[v73];v79[v81[2]][v81[120 -(91 + 26) ]]=v81[13 -9 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]][v81[3]]=v81[4];v73=v73 + 1 ;v81=v69[v73];v79[v81[988 -(968 + 18) ]][v81[3 + 0 ]]=v81[4 + 0 ];v73=v73 + (1 -0) ;v81=v69[v73];v1546=v81[269 -(172 + 95) ];v79[v1546](v13(v79,v1546 + (3 -2) ,v81[3]));end elseif ((v82<=(391 -(260 + 5))) or (4275<3102)) then if (v82<=(337 -213)) then if (v82==(942 -(265 + 554))) then local v1563=v81[1573 -(1440 + 131) ];local v1564=v81[4];local v1565=v1563 + (5 -3) ;local v1566={v79[v1563](v79[v1563 + (254 -(133 + 120)) ],v79[v1565])};for v3018=1,v1564 do v79[v1565 + v3018 ]=v1566[v3018];end local v1567=v1566[1 -0 ];if (v1567 or (4551>4979)) then local v3183=1956 -(809 + 1147) ;while true do if (v3183==(497 -(178 + 319))) then v79[v1565]=v1567;v73=v81[3];break;end end else v73=v73 + (1 -0) ;end else local v1568;local v1569;local v1570;v1570=v81[2];v1569=v79[v81[3]];v79[v1570 + 1 + 0 ]=v1569;v79[v1570]=v1569[v81[1274 -(1255 + 15) ]];v73=v73 + (1543 -(1221 + 321)) ;v81=v69[v73];v79[v81[5 -3 ]]=v81[3];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[7 -5 ]]=v79[v81[11 -8 ]][v81[2 + 2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[6 -3 ];v73=v73 + (408 -(204 + 203)) ;v81=v69[v73];v1569=v81[81 -(48 + 30) ];v1568=v79[v1569];for v3021=v1569 + 1 + 0 ,v81[1968 -(1472 + 492) ] do v1568=v1568   .. v79[v3021] ;end v79[v81[2]]=v1568;v73=v73 + (2 -1) ;v81=v69[v73];v1570=v81[2 + 0 ];v79[v1570]=v79[v1570](v13(v79,v1570 + (612 -(258 + 353)) ,v81[3]));v73=v73 + (1995 -(1382 + 612)) ;v81=v69[v73];v79[v81[2 + 0 ]][v81[1 + 2 ]]=v81[1 + 3 ];end elseif (v82>(368 -243)) then local v1589=0 + 0 ;local v1590;local v1591;while true do if (v1589==(123 -(35 + 84))) then v1591=v81[2];v1590=v79[v81[218 -(75 + 140) ]];v79[v1591 + (3 -2) ]=v1590;v1589=1804 -(923 + 876) ;end if (v1589==(7 -4)) then v79[v81[814 -(284 + 528) ]]=v62[v81[1022 -(867 + 152) ]];v73=v73 + (1107 -(709 + 397)) ;v81=v69[v73];v1589=14 -10 ;end if (v1589==(43 -(21 + 15))) then v79[v81[2]][v81[4 -1 ]]=v81[4];v73=v73 + (1 -0) ;v81=v69[v73];v1589=2 + 6 ;end if ((v1589==(2 -1)) or (4571<2094) or (4053<2114)) then v73=v73 + (2 -1) ;v81=v69[v73];v1591=v81[2];v1589=1 + 1 ;end if ((v1589==(141 -(97 + 38))) or (1264>=2757)) then v79[v81[2]]={};v73=v73 + (81 -(52 + 28)) ;v81=v69[v73];v1589=4 + 3 ;end if (v1589==0) then v1590=nil;v1591=nil;v79[v81[851 -(59 + 790) ]][v81[3]]=v79[v81[4 + 0 ]];v1589=1;end if (v1589==2) then v79[v1591](v13(v79,v1591 + 1 + 0 ,v81[943 -(467 + 473) ]));v73=v73 + (4 -3) ;v81=v69[v73];v1589=7 -4 ;end if ((v1589==(19 -11)) or (1344==2504)) then v79[v81[4 -2 ]][v81[3]]=v81[2 + 2 ];break;end if (5==v1589) then v79[v1591]=v1590[v81[8 -4 ]];v73=v73 + (3 -2) ;v81=v69[v73];v1589=6;end end else v79[v81[2 -0 ]]=v79[v81[1 + 2 ]][v81[1 + 3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[239 -(58 + 179) ]]=v79[v81[7 -4 ]][v81[1257 -(677 + 576) ]];v73=v73 + 1 ;v81=v69[v73];v62[v81[3]]=v79[v81[1 + 1 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v62[v81[3]];v73=v73 + (221 -(88 + 132)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3 + 0 ]][v81[19 -15 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[6 -4 ]]();v73=v73 + (292 -(12 + 279)) ;v81=v69[v73];v79[v81[3 -1 ]]=v81[1 + 2 ];end elseif ((v82<=(1075 -(652 + 295))) or (1954<=1786)) then if ((4887>3310) and (v82==(9 + 118))) then v79[v81[2 + 0 ]]=v79[v81[992 -(848 + 141) ]][v81[744 -(372 + 368) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1132 -(542 + 588) ]]=v79[v81[3]][v81[822 -(6 + 812) ]];v73=v73 + (1706 -(1599 + 106)) ;v81=v69[v73];v79[v81[5 -3 ]]=v62[v81[2 + 1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[7 -5 ]][v81[5 -2 ]]=v79[v81[1 + 3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[3 + 0 ];else local v1613=0 + 0 ;local v1614;local v1615;while true do if ((3044==3044) and ((1 + 3)==v1613)) then v79[v1615 + 1 + 0 ]=v1614;v79[v1615]=v1614[v81[1933 -(1690 + 239) ]];v73=v73 + 1 ;v81=v69[v73];v1615=v81[6 -4 ];v1613=4 + 1 ;end if ((v1613==(10 -5)) or (4429<=1549)) then v79[v1615]=v79[v1615](v79[v1615 + (2 -1) ]);v73=v73 + 1 + 0 ;v81=v69[v73];v1615=v81[7 -5 ];v1614=v79[v81[1871 -(1736 + 132) ]];v1613=4 + 2 ;end if (v1613==(22 -15)) then v79[v1615]=v79[v1615](v79[v1615 + (4 -3) ]);v73=v73 + 1 + 0 ;v81=v69[v73];if ((v79[v81[34 -(27 + 5) ]]==v79[v81[1 + 3 ]]) or (1387>2843) or (3523>3890)) then v73=v73 + 1 + 0 ;else v73=v81[2 + 1 ];end break;end if (v1613==(1 + 0)) then v79[v81[2 + 0 ]]=v79[v81[3]][v81[1121 -(771 + 346) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v81[1637 -(1577 + 57) ];v73=v73 + (1 -0) ;v1613=1082 -(684 + 396) ;end if ((v1613==(5 -3)) or (1788>2231)) then v81=v69[v73];v79[v81[2]]= #v79[v81[1199 -(700 + 496) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1615=v81[2];v1613=3;end if (v1613==(255 -(65 + 187))) then v79[v1615]=v79[v1615](v13(v79,v1615 + (940 -(827 + 112)) ,v81[3]));v73=v73 + 1 + 0 ;v81=v69[v73];v1615=v81[4 -2 ];v1614=v79[v81[7 -4 ]];v1613=4;end if ((3735>=3277) and ((v1613==(0 -0)) or (3442<2478))) then v1614=nil;v1615=nil;v79[v81[1 + 1 ]]=v79[v81[1 + 2 ]][v81[1200 -(551 + 645) ]];v73=v73 + (344 -(166 + 177)) ;v81=v69[v73];v1613=1;end if ((1485<2177) and (v1613==(1862 -(1361 + 495)))) then v79[v1615 + 1 ]=v1614;v79[v1615]=v1614[v81[10 -6 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1615=v81[4 -2 ];v1613=6 + 1 ;end end end elseif ((344<2641) and (v82<=129)) then v79[v81[226 -(148 + 76) ]]=v79[v81[3]] -v79[v81[14 -10 ]] ;elseif (v82==130) then local v3184;local v3185;v79[v81[5 -3 ]]=v79[v81[2 + 1 ]][v81[1746 -(735 + 1007) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[281 -(111 + 168) ]]=v79[v81[2 + 1 ]][v81[1 + 3 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[3 + 0 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]]= #v79[v81[12 -9 ]];v73=v73 + 1 ;v81=v69[v73];v3185=v81[2 + 0 ];v79[v3185]=v79[v3185](v13(v79,v3185 + (933 -(147 + 785)) ,v81[3]));v73=v73 + (667 -(483 + 183)) ;v81=v69[v73];v3185=v81[5 -3 ];v3184=v79[v81[3]];v79[v3185 + 1 ]=v3184;v79[v3185]=v3184[v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v3185=v81[1913 -(1790 + 121) ];v79[v3185]=v79[v3185](v79[v3185 + (3 -2) ]);v73=v73 + (1540 -(259 + 1280)) ;v81=v69[v73];v3185=v81[1586 -(160 + 1424) ];v3184=v79[v81[3 + 0 ]];v79[v3185 + 1 + 0 ]=v3184;v79[v3185]=v3184[v81[4]];v73=v73 + (771 -(479 + 291)) ;v81=v69[v73];v3185=v81[3 -1 ];v79[v3185]=v79[v3185](v79[v3185 + (972 -(569 + 402)) ]);v73=v73 + 1 ;v81=v69[v73];if (v79[v81[1307 -(635 + 670) ]]==v79[v81[4]]) then v73=v73 + 1 ;else v73=v81[3];end else local v3204=0;local v3205;local v3206;while true do if ((v3204==(6 -3)) or (4899<1639)) then v3205=v79[v81[11 -8 ]];v79[v3206 + (599 -(42 + 556)) ]=v3205;v79[v3206]=v3205[v81[4]];v73=v73 + (1402 -(1246 + 155)) ;v3204=736 -(31 + 701) ;end if (v3204==(16 -11)) then v3206=v81[2];v79[v3206]=v79[v3206](v13(v79,v3206 + (500 -(393 + 106)) ,v81[3]));v73=v73 + 1 ;v81=v69[v73];v3204=6;end if ((708==708) and (v3204==(1177 -(727 + 444)))) then if v79[v81[5 -3 ]] then v73=v73 + 1 + 0 ;else v73=v81[656 -(269 + 384) ];end break;end if ((v3204==(1573 -(598 + 971))) or (2393>=2498)) then v81=v69[v73];v79[v81[1 + 1 ]]=v81[9 -6 ];v73=v73 + 1 ;v81=v69[v73];v3204=23 -18 ;end if ((3839>3508) and (v3204==(2 -1))) then v81=v69[v73];v79[v81[2]]=v79[v81[1448 -(800 + 645) ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v3204=1 + 1 ;end if ((1181>=970) and (v3204==2)) then v79[v81[792 -(687 + 103) ]]=v79[v81[1165 -(142 + 1020) ]][v81[9 -5 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v3206=v81[2];v3204=516 -(306 + 207) ;end if ((3951>37) and (v3204==(1404 -(112 + 1292)))) then v3205=nil;v3206=nil;v79[v81[2 + 0 ]]=v79[v81[955 -(587 + 365) ]][v81[1719 -(829 + 886) ]];v73=v73 + (2 -1) ;v3204=1 + 0 ;end end end elseif ((3280<4278) and (v82<=(781 -584))) then if ((v82<=(521 -357)) or (512<212)) then if ((3642>1657) and (v82<=147)) then if (v82<=139) then if (v82<=(132 + 3)) then if (v82<=(60 + 73)) then if ((2645==2645) and (v82==(224 -92))) then local v1617;local v1618;v1618=v81[979 -(613 + 364) ];v1617=v79[v81[3 + 0 ]];v79[v1618 + 1 + 0 ]=v1617;v79[v1618]=v1617[v81[1 + 3 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]=v81[10 -7 ];v73=v73 + (2 -1) ;v81=v69[v73];v1618=v81[2];v79[v1618]=v79[v1618](v13(v79,v1618 + 1 + 0 ,v81[1942 -(1467 + 472) ]));v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[1551 -(1077 + 470) ]];v73=v73 + 1 + 0 ;v81=v69[v73];if ((1942>628) and (v79[v81[2]]==v81[2 + 2 ])) then v73=v73 + (4 -3) ;else v73=v81[432 -(12 + 417) ];end else v79[v81[4 -2 ]]=v62[v81[3 + 0 ]];end elseif (v82>(177 -43)) then local v1631=0;local v1632;local v1633;local v1634;while true do if ((v1631==(0 -0)) or (3822<1480)) then v1632=nil;v1633=nil;v1634=nil;v1634=v81[2];v1631=1 -0 ;end if ((3505>227) and (v1631==(2 + 2))) then v1632=v79[v1633];for v5126=v1633 + 1 + 0 ,v81[4] do v1632=v1632   .. v79[v5126] ;end v79[v81[1 + 1 ]]=v1632;v73=v73 + (2 -1) ;v1631=1110 -(924 + 181) ;end if (6==v1631) then v81=v69[v73];if ((3985>2256) and (v79[v81[799 -(263 + 534) ]]==v81[1 + 3 ])) then v73=v73 + 1 + 0 ;else v73=v81[5 -2 ];end break;end if (v1631==(14 -9)) then v81=v69[v73];v1634=v81[2];v79[v1634]=v79[v1634](v13(v79,v1634 + 1 ,v81[2 + 1 ]));v73=v73 + (708 -(562 + 145)) ;v1631=2 + 4 ;end if ((2 + 1)==v1631) then v79[v81[1 + 1 ]]=v81[3];v73=v73 + 1 + 0 ;v81=v69[v73];v1633=v81[1 + 2 ];v1631=4;end if ((3897>1030) and (2==v1631)) then v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[3 + 0 ]][v81[18 -14 ]];v73=v73 + 1 ;v81=v69[v73];v1631=2 + 1 ;end if (v1631==1) then v1633=v79[v81[3]];v79[v1634 + 1 + 0 ]=v1633;v79[v1634]=v1633[v81[1880 -(1459 + 417) ]];v73=v73 + (287 -(194 + 92)) ;v1631=1387 -(1057 + 328) ;end end else local v1635=0;local v1636;local v1637;while true do if ((2698==2698) and (v1635==(25 -16))) then v73=v81[14 -11 ];break;end if ((2253<2710) and (1==v1635)) then v1636=v79[v81[3]];v79[v1637 + (533 -(5 + 527)) ]=v1636;v79[v1637]=v1636[v81[4 + 0 ]];v1635=782 -(342 + 438) ;end if ((4420>499) and (v1635==(2 + 2))) then v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]][v81[3]]=v81[4];v1635=5;end if (v1635==(3 + 0)) then v73=v73 + 1 ;v81=v69[v73];v79[v81[3 -1 ]][v81[3]]=v81[1 + 3 ];v1635=1 + 3 ;end if ((v1635==(15 -7)) or (4401>=4528)) then v79[v1637](v13(v79,v1637 + (1 -0) ,v81[15 -(6 + 6) ]));v73=v73 + (2 -1) ;v81=v69[v73];v1635=24 -15 ;end if ((v1635==(1 + 1)) or (2612<375)) then v73=v73 + (1254 -(206 + 1047)) ;v81=v69[v73];v79[v81[1114 -(470 + 642) ]]={};v1635=3;end if ((0 + 0)==v1635) then v1636=nil;v1637=nil;v1637=v81[1069 -(552 + 515) ];v1635=1 + 0 ;end if (v1635==6) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]][v81[3 + 0 ]]=v81[3 + 1 ];v1635=4 + 3 ;end if ((v1635==(5 + 2)) or (3054<=1692)) then v73=v73 + (1052 -(701 + 350)) ;v81=v69[v73];v1637=v81[2 + 0 ];v1635=5 + 3 ;end if (v1635==5) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]][v81[9 -6 ]]=v81[3 + 1 ];v1635=14 -8 ;end end end elseif (v82<=(16 + 121)) then if (v82==(108 + 28)) then v79[v81[7 -5 ]]= #v79[v81[1349 -(281 + 1065) ]];else local v1639;local v1640;v1640=v81[2];v1639=v79[v81[13 -10 ]];v79[v1640 + 1 ]=v1639;v79[v1640]=v1639[v81[14 -10 ]];v73=v73 + (1212 -(1114 + 97)) ;v81=v69[v73];v79[v81[2]]=v81[3 -0 ];v73=v73 + (1914 -(279 + 1634)) ;v81=v69[v73];v1640=v81[1282 -(1213 + 67) ];v79[v1640](v13(v79,v1640 + (192 -(65 + 126)) ,v81[3]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1087 -(189 + 896) ]]=v62[v81[1 + 2 ]];v73=v73 + (1964 -(1872 + 91)) ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[3]][v81[4 + 0 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[2 + 1 ];v73=v73 + (3 -2) ;v81=v69[v73];v1640=v81[78 -(22 + 54) ];v79[v1640](v79[v1640 + (2 -1) ]);v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[11 -8 ];end elseif ((53<3895) and (2571==2571) and (v82>138)) then local v1659=v81[1536 -(553 + 981) ];local v1660=v79[v1659];local v1661=v79[v1659 + 2 + 0 ];if (v1661>0) then if (v1660>v79[v1659 + 1 + 0 ]) then v73=v81[3 + 0 ];else v79[v1659 + (8 -5) ]=v1660;end elseif ((4334==4334) and (v1660<v79[v1659 + 1 ])) then v73=v81[3 -0 ];else v79[v1659 + (1900 -(1320 + 577)) ]=v1660;end else v79[v81[851 -(667 + 182) ]]=v79[v81[1291 -(1115 + 173) ]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]();v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v62[v81[1758 -(1375 + 380) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[28 -(12 + 14) ]]=v79[v81[6 -3 ]][v81[8 -4 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[4 -1 ]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[733 -(354 + 377) ]]=v79[v81[14 -11 ]][v81[10 -6 ]];v73=v73 + (1983 -(263 + 1719)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[362 -(335 + 24) ]][v81[955 -(882 + 69) ]];v73=v73 + (1687 -(657 + 1029)) ;v81=v69[v73];v79[v81[2]]=v62[v81[1203 -(685 + 515) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1640 -(745 + 893) ]][v81[1 + 2 ]]=v79[v81[776 -(274 + 498) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[2 + 1 ];end elseif ((v82<=(1749 -(1035 + 571))) or (1256==148)) then if ((3300==3300) and (v82<=(58 + 83))) then if (v82>(56 + 84)) then local v1679;local v1680;v79[v81[7 -5 ]]=v79[v81[3]][v81[11 -7 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[2 + 1 ]][v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v1680=v81[226 -(109 + 115) ];v1679=v79[v81[1402 -(1047 + 352) ]];v79[v1680 + 1 ]=v1679;v79[v1680]=v1679[v81[1769 -(852 + 913) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[1348 -(384 + 961) ];v73=v73 + (2 -1) ;v81=v69[v73];v1680=v81[5 -3 ];v79[v1680]=v79[v1680](v13(v79,v1680 + (3 -2) ,v81[595 -(591 + 1) ]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1472 -(218 + 1252) ]]=v79[v81[3 + 0 ]][v81[360 -(321 + 35) ]];v73=v73 + (395 -(239 + 155)) ;v81=v69[v73];if ((161<=3506) and (v79[v81[2 + 0 ]]==v81[46 -(41 + 1) ])) then v73=v73 + (201 -(80 + 120)) ;else v73=v81[3];end else local v1697;local v1698;v1698=v81[2 + 0 ];v1697=v79[v81[3]];v79[v1698 + (1 -0) ]=v1697;v79[v1698]=v1697[v81[1 + 3 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]={};v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[4 -2 ]][v81[12 -9 ]]=v81[4];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1 + 1 ]][v81[1 + 2 ]]=v81[1 + 3 ];v73=v73 + (1227 -(165 + 1061)) ;v81=v69[v73];v79[v81[2 + 0 ]][v81[3 + 0 ]]=v81[1647 -(596 + 1047) ];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]][v81[1 + 2 ]]=v81[4 + 0 ];v73=v73 + (1 -0) ;v81=v69[v73];v1698=v81[2 + 0 ];v79[v1698](v13(v79,v1698 + 1 ,v81[740 -(185 + 552) ]));end elseif (v82>(73 + 69)) then local v1714;local v1715;v79[v81[603 -(507 + 94) ]]=v79[v81[13 -10 ]][v81[2 + 2 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1739 -(569 + 1168) ]]=v79[v81[5 -2 ]][v81[7 -3 ]];v73=v73 + (352 -(118 + 233)) ;v81=v69[v73];v79[v81[346 -(279 + 65) ]]=v79[v81[3]][v81[6 -2 ]];v73=v73 + (1 -0) ;v81=v69[v73];v1715=v81[2];v1714=v79[v81[6 -3 ]];v79[v1715 + 1 ]=v1714;v79[v1715]=v1714[v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1820 -(1414 + 404) ]]=v81[759 -(347 + 409) ];v73=v73 + 1 + 0 ;v81=v69[v73];v1715=v81[2 + 0 ];v79[v1715]=v79[v1715](v13(v79,v1715 + 1 + 0 ,v81[3]));v73=v73 + 1 ;v81=v69[v73];if v79[v81[1 + 1 ]] then v73=v73 + 1 ;else v73=v81[1581 -(420 + 1158) ];end else local v1731;local v1732;local v1731,v1733;local v1734;local v1735;v79[v81[4 -2 ]]=v62[v81[614 -(406 + 205) ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3]][v81[4 + 0 ]];v73=v73 + (2 -1) ;v81=v69[v73];v1735=v81[63 -(28 + 33) ];v1734=v79[v81[3]];v79[v1735 + 1 + 0 ]=v1734;v79[v1735]=v1734[v81[1011 -(858 + 149) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1735=v81[2 -0 ];v1731,v1733=v72(v79[v1735](v79[v1735 + 1 ]));v74=(v1733 + v1735) -(1508 -(829 + 678)) ;v1732=0 + 0 ;for v3022=v1735,v74 do v1732=v1732 + (1217 -(143 + 1073)) ;v79[v3022]=v1731[v1732];end v73=v73 + (1816 -(898 + 917)) ;v81=v69[v73];v1735=v81[3 -1 ];v1731={v79[v1735](v13(v79,v1735 + 1 ,v74))};v1732=1469 -(882 + 587) ;for v3025=v1735,v81[4 + 0 ] do v1732=v1732 + 1 + 0 ;v79[v3025]=v1731[v1732];end v73=v73 + 1 ;v81=v69[v73];v73=v81[267 -(140 + 124) ];end elseif (v82<=(137 + 8)) then if ((577<2065) and (v82>(1679 -(1105 + 430)))) then v79[v81[5 -3 ]]=v62[v81[10 -7 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[3 -1 ]][v81[3]]=v79[v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[2 + 1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[1994 -(1047 + 944) ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];if (((185<3387) and (v79[v81[1304 -(206 + 1096) ]]==v81[198 -(30 + 164) ])) or (3235>4994)) then v73=v73 + (4 -3) ;else v73=v81[1 + 2 ];end else v79[v81[2]]=v29(v70[v81[1477 -(1383 + 91) ]],nil,v62);end elseif (v82==146) then v79[v81[7 -5 ]]=v79[v81[5 -2 ]][v81[4]];v73=v73 + (1661 -(1174 + 486)) ;v81=v69[v73];v79[v81[429 -(172 + 255) ]]=v79[v81[9 -6 ]][v81[9 -5 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1530 -(594 + 934) ]]=v79[v81[571 -(211 + 357) ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3]][v81[6 -2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1416 -(159 + 1255) ]]=v79[v81[3 + 0 ]][v81[781 -(24 + 753) ]];v73=v73 + 1 ;v81=v69[v73];v62[v81[2 + 1 ]]=v79[v81[2 -0 ]];else v79[v81[2]]=v81[1135 -(898 + 234) ];end elseif ((1739>=651) and (v82<=155)) then if (v82<=(686 -(333 + 202))) then if (v82<=149) then if (v82==148) then local v1774=v81[1 + 1 ];v79[v1774](v79[v1774 + 1 + 0 ]);else v79[v81[3 -1 ]]=v79[v81[1282 -(1018 + 261) ]][v81[9 -5 ]];v73=v73 + (132 -(93 + 38)) ;v81=v69[v73];v79[v81[2]]();v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[1 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[3]][v81[4]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2]]=v62[v81[8 -5 ]];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[1 + 2 ]][v81[5 -1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[423 -(14 + 406) ]][v81[7 -3 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[1632 -(20 + 1610) ]]=v79[v81[2 + 1 ]][v81[10 -6 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]=v79[v81[520 -(243 + 274) ]][v81[1626 -(1437 + 185) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[11 -8 ]][v81[4 + 0 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]][v81[819 -(326 + 490) ]]=v79[v81[3 + 1 ]];v73=v73 + (204 -(181 + 22)) ;v81=v69[v73];v73=v81[3];end elseif ((v82==150) or (87>4265)) then local v1794=75 -(35 + 40) ;while true do if ((23 -17)==v1794) then v79[v81[2]]=v79[v81[3 -0 ]][v81[1 + 3 ]];v73=v73 + (879 -(297 + 581)) ;v81=v69[v73];v1794=1 + 6 ;end if ((8==v1794) or (276>1148)) then v79[v81[2]][v81[3 -0 ]]=v79[v81[12 -8 ]];v73=v73 + 1 ;v81=v69[v73];v1794=4 + 5 ;end if (v1794==3) then v79[v81[7 -5 ]]=v79[v81[3]][v81[17 -13 ]];v73=v73 + (1738 -(1505 + 232)) ;v81=v69[v73];v1794=1322 -(415 + 903) ;end if ((v1794==(5 -3)) or (3822<=1278)) then v79[v81[2 -0 ]]=v62[v81[720 -(155 + 562) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1794=120 -(71 + 46) ;end if ((90<2101) and (v1794==(7 -2))) then v79[v81[687 -(436 + 249) ]]=v79[v81[1624 -(56 + 1565) ]][v81[2 + 2 ]];v73=v73 + (985 -(80 + 904)) ;v81=v69[v73];v1794=1 + 5 ;end if (v1794==(809 -(595 + 205))) then v73=v81[6 -3 ];break;end if ((1727<=2987) and ((4==v1794) or (2068>=3864))) then v79[v81[4 -2 ]]=v79[v81[3]][v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v1794=5;end if (v1794==(3 + 4)) then v79[v81[6 -4 ]]=v62[v81[2 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v1794=8;end if (v1794==0) then v79[v81[667 -(400 + 265) ]]=v79[v81[3]][v81[7 -3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1794=2 -1 ;end if ((v1794==(1 + 0)) or (3520<1295)) then v79[v81[1673 -(962 + 709) ]]();v73=v73 + 1 + 0 ;v81=v69[v73];v1794=2;end end else local v1795;v79[v81[2 + 0 ]]=v79[v81[3 + 0 ]][v81[15 -11 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[4 -2 ]]=v81[784 -(636 + 145) ];v73=v73 + (296 -(282 + 13)) ;v81=v69[v73];v79[v81[1150 -(366 + 782) ]]=v81[92 -(10 + 79) ];v73=v73 + (1708 -(1297 + 410)) ;v81=v69[v73];v79[v81[6 -4 ]]=v81[3 + 0 ];v73=v73 + (279 -(262 + 16)) ;v81=v69[v73];v1795=v81[4 -2 ];v79[v1795]=v79[v1795](v13(v79,v1795 + 1 ,v81[3]));v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[2 + 1 ]] * v79[v81[1 + 3 ]] ;v73=v73 + (1851 -(1056 + 794)) ;v81=v69[v73];v79[v81[2]][v81[3]]=v79[v81[4]];v73=v73 + (1349 -(741 + 607)) ;v81=v69[v73];v79[v81[2]]=v81[1759 -(730 + 1026) ];v73=v73 + (1794 -(248 + 1545)) ;v81=v69[v73];v73=v81[995 -(191 + 801) ];end elseif (v82<=153) then if ((v82==(753 -601)) or (3583<=2054)) then local v1812;local v1813;v79[v81[562 -(478 + 82) ]]=v79[v81[1710 -(434 + 1273) ]][v81[11 -7 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[8 -6 ]]=v79[v81[576 -(349 + 224) ]][v81[868 -(275 + 589) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[6 -2 ]];v73=v73 + (1533 -(1064 + 468)) ;v81=v69[v73];v1813=v81[2 + 0 ];v1812=v79[v81[2 + 1 ]];v79[v1813 + 1 ]=v1812;v79[v1813]=v1812[v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[8 -6 ]]=v81[3];v73=v73 + (704 -(676 + 27)) ;v81=v69[v73];v1813=v81[5 -3 ];v79[v1813]=v79[v1813](v13(v79,v1813 + (1428 -(48 + 1379)) ,v81[3 + 0 ]));v73=v73 + 1 + 0 ;v81=v69[v73];if (v79[v81[2 -0 ]] or (1532<=1439)) then v73=v73 + 1 + 0 ;else v73=v81[3];end else local v1828;local v1829;local v1828,v1830;local v1831;local v1832;v79[v81[117 -(79 + 36) ]]=v62[v81[9 -6 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1832=v81[2 + 0 ];v1831=v79[v81[1 + 2 ]];v79[v1832 + 1 + 0 ]=v1831;v79[v1832]=v1831[v81[9 -5 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1832=v81[1 + 1 ];v1828,v1830=v72(v79[v1832](v79[v1832 + (1015 -(631 + 383)) ]));v74=(v1830 + v1832) -(1636 -(445 + 1190)) ;v1829=1425 -(810 + 615) ;for v3028=v1832,v74 do v1829=v1829 + (1295 -(819 + 475)) ;v79[v3028]=v1828[v1829];end v73=v73 + (1336 -(243 + 1092)) ;v81=v69[v73];v1832=v81[5 -3 ];v1828={v79[v1832](v13(v79,v1832 + 1 + 0 ,v74))};v1829=0 + 0 ;for v3031=v1832,v81[4 + 0 ] do local v3032=0;while true do if ((v3032==(0 -0)) or (2106>4142)) then v1829=v1829 + (2 -1) ;v79[v3031]=v1828[v1829];break;end end end v73=v73 + (525 -(119 + 405)) ;v81=v69[v73];v73=v81[6 -3 ];end elseif (v82>(543 -389)) then local v1844;v79[v81[611 -(352 + 257) ]]=v79[v81[1 + 2 ]][v81[1167 -(88 + 1075) ]];v73=v73 + (1072 -(477 + 594)) ;v81=v69[v73];v79[v81[2]]=v79[v81[726 -(328 + 395) ]][v81[508 -(164 + 340) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[4 -2 ]]=v62[v81[1232 -(1008 + 221) ]];v73=v73 + (1512 -(1025 + 486)) ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[8 -5 ]][v81[223 -(108 + 111) ]];v73=v73 + (99 -(82 + 16)) ;v81=v69[v73];v79[v81[1731 -(533 + 1196) ]]=v81[4 -1 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[214 -(161 + 51) ]]=v81[437 -(294 + 140) ];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[840 -(717 + 121) ]]=v81[4 -1 ];v73=v73 + 1 ;v81=v69[v73];v1844=v81[2 + 0 ];v79[v1844]=v79[v1844](v13(v79,v1844 + 1 + 0 ,v81[1713 -(1001 + 709) ]));v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]][v81[1123 -(242 + 878) ]]=v79[v81[1787 -(1395 + 388) ]];else v79[v81[1 + 1 ]]=v79[v81[3]][v81[3 + 1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[1950 -(1289 + 658) ]][v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[3 + 0 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[1979 -(337 + 1639) ]][v81[3 + 1 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[6 -3 ]][v81[1741 -(630 + 1107) ]];v73=v73 + 1 + 0 ;v81=v69[v73];if ((v79[v81[1 + 1 ]]==v81[5 -1 ]) or (4143<=2598)) then v73=v73 + 1 + 0 ;else v73=v81[3 + 0 ];end end elseif ((3783==3783) and (4970>=4040) and (v82<=(220 -(13 + 48)))) then if ((2635>=1172) and ((v82<=(856 -(658 + 41))) or (2427==565))) then if ((1236>1210) and (v82==(328 -172))) then for v3033=v81[1909 -(1591 + 316) ],v81[5 -2 ] do v79[v3033]=nil;end else local v1871;local v1872;v79[v81[1 + 1 ]]=v79[v81[3]][v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[6 -4 ]]=v79[v81[1279 -(1241 + 35) ]][v81[44 -(18 + 22) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[1305 -(697 + 605) ]][v81[2 + 2 ]];v73=v73 + (1 -0) ;v81=v69[v73];v1872=v81[331 -(188 + 141) ];v1871=v79[v81[12 -9 ]];v79[v1872 + (2 -1) ]=v1871;v79[v1872]=v1871[v81[4]];v73=v73 + (951 -(34 + 916)) ;v81=v69[v73];v79[v81[1739 -(357 + 1380) ]]=v81[3];v73=v73 + 1 + 0 ;v81=v69[v73];v1872=v81[1 + 1 ];v79[v1872]=v79[v1872](v13(v79,v1872 + 1 + 0 ,v81[1930 -(178 + 1749) ]));v73=v73 + (2 -1) ;v81=v69[v73];if (v79[v81[1417 -(142 + 1273) ]] or (802>=4184)) then v73=v73 + (594 -(284 + 309)) ;else v73=v81[3 + 0 ];end end elseif (v82>(848 -(622 + 68))) then local v1887;local v1888;v79[v81[2]]=v79[v81[3]][v81[3 + 1 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[2 + 1 ]][v81[1902 -(855 + 1043) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[6 -4 ]]=v81[9 -6 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[781 -(576 + 203) ]]= #v79[v81[7 -4 ]];v73=v73 + (1 -0) ;v81=v69[v73];v1888=v81[1986 -(709 + 1275) ];v79[v1888]=v79[v1888](v13(v79,v1888 + 1 ,v81[3 + 0 ]));v73=v73 + 1 ;v81=v69[v73];v1888=v81[6 -4 ];v1887=v79[v81[11 -8 ]];v79[v1888 + 1 ]=v1887;v79[v1888]=v1887[v81[122 -(31 + 87) ]];v73=v73 + 1 ;v81=v69[v73];v1888=v81[2];v79[v1888]=v79[v1888](v79[v1888 + (132 -(44 + 87)) ]);v73=v73 + 1 ;v81=v69[v73];v1888=v81[2];v1887=v79[v81[10 -7 ]];v79[v1888 + 1 + 0 ]=v1887;v79[v1888]=v1887[v81[8 -4 ]];v73=v73 + (2 -1) ;v81=v69[v73];v1888=v81[788 -(284 + 502) ];v79[v1888]=v79[v1888](v79[v1888 + 1 ]);v73=v73 + 1 ;v81=v69[v73];if ((3727>=1711) and (v79[v81[2 + 0 ]]==v79[v81[1190 -(124 + 1062) ]])) then v73=v73 + (1028 -(847 + 180)) ;else v73=v81[3 + 0 ];end else local v1908=0;local v1909;local v1910;while true do if ((4356==4356) and ((8 -6)==v1908)) then v73=v73 + 1 ;v81=v69[v73];v79[v81[1365 -(369 + 994) ]]={};v1908=966 -(583 + 380) ;end if (v1908==(1 + 2)) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]][v81[1976 -(1085 + 888) ]]=v81[9 -5 ];v1908=15 -11 ;end if ((v1908==1) or (314>3704) or (3071<1363)) then v1909=v79[v81[13 -10 ]];v79[v1910 + (1 -0) ]=v1909;v79[v1910]=v1909[v81[2 + 2 ]];v1908=2 + 0 ;end if (v1908==5) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]][v81[4 -1 ]]=v81[4 + 0 ];v1908=5 + 1 ;end if ((v1908==(7 + 0)) or (3168<=3021)) then v73=v73 + (215 -(153 + 61)) ;v81=v69[v73];v1910=v81[945 -(704 + 239) ];v1908=4 + 4 ;end if ((133<4122) and (v1908==(1390 -(740 + 646)))) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1924 -(1547 + 375) ]][v81[2 + 1 ]]=v81[4];v1908=408 -(211 + 192) ;end if ((27 -21)==v1908) then v73=v73 + 1 ;v81=v69[v73];v79[v81[2 -0 ]][v81[784 -(425 + 356) ]]=v81[1 + 3 ];v1908=17 -10 ;end if ((1599<=2378) and (v1908==(1566 -(83 + 1483)))) then v1909=nil;v1910=nil;v1910=v81[1274 -(123 + 1149) ];v1908=1;end if (v1908==(7 + 1)) then v79[v1910](v13(v79,v1910 + 1 + 0 ,v81[1583 -(908 + 672) ]));break;end end end elseif ((4651>216) and ((v82<=(674 -(206 + 307))) or (2188>=3658))) then if ((v82>160) or (4943==1011)) then local v1911;local v1912;v79[v81[2 + 0 ]]=v79[v81[65 -(18 + 44) ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[6 -3 ]][v81[1 + 3 ]];v73=v73 + (936 -(226 + 709)) ;v81=v69[v73];v79[v81[728 -(235 + 491) ]]=v79[v81[3]][v81[6 -2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1912=v81[1301 -(463 + 836) ];v1911=v79[v81[407 -(166 + 238) ]];v79[v1912 + (1 -0) ]=v1911;v79[v1912]=v1911[v81[4 + 0 ]];v73=v73 + (1442 -(1080 + 361)) ;v81=v69[v73];v79[v81[2]]=v81[4 -1 ];v73=v73 + 1 + 0 ;v81=v69[v73];v1912=v81[2];v79[v1912]=v79[v1912](v13(v79,v1912 + (1 -0) ,v81[3]));v73=v73 + 1 ;v81=v69[v73];if ((1991<2129) and (4399>3237) and v79[v81[302 -(254 + 46) ]]) then v73=v73 + 1 + 0 ;else v73=v81[2 + 1 ];end else local v1928=256 -(37 + 219) ;local v1929;local v1930;while true do if (v1928==(1900 -(1330 + 569))) then v1929=v79[v81[3]];v79[v1930 + 1 ]=v1929;v79[v1930]=v1929[v81[4]];v1928=2 -0 ;end if ((3378<3635) and (v1928==(11 -4))) then v73=v73 + (3 -2) ;v81=v69[v73];v1930=v81[2 -0 ];v1928=678 -(128 + 542) ;end if (((9 -4)==v1928) or (2305==4656)) then v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2]][v81[10 -7 ]]=v81[4];v1928=6;end if ((2 + 6)==v1928) then v79[v1930](v13(v79,v1930 + (3 -2) ,v81[3]));break;end if (v1928==0) then v1929=nil;v1930=nil;v1930=v81[2 + 0 ];v1928=1 + 0 ;end if (v1928==(11 -5)) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[814 -(96 + 716) ]][v81[3]]=v81[1611 -(85 + 1522) ];v1928=860 -(724 + 129) ;end if (v1928==(9 -6)) then v73=v73 + (374 -(83 + 290)) ;v81=v69[v73];v79[v81[2 -0 ]][v81[5 -2 ]]=v81[4 + 0 ];v1928=3 + 1 ;end if ((1 + 1)==v1928) then v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1 + 1 ]]={};v1928=6 -3 ;end if ((7 -3)==v1928) then v73=v73 + (448 -(190 + 257)) ;v81=v69[v73];v79[v81[2]][v81[3]]=v81[595 -(402 + 189) ];v1928=5;end end end elseif (v82<=162) then v79[v81[2 + 0 ]]=v62[v81[569 -(90 + 476) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[816 -(688 + 126) ]][v81[2 + 1 ]]=v79[v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[3]];v73=v73 + (500 -(34 + 465)) ;v81=v69[v73];v79[v81[8 -6 ]]=v79[v81[6 -3 ]][v81[3 + 1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];if ((v79[v81[5 -3 ]]==v81[4 + 0 ]) or (4213>4620)) then v73=v73 + (1 -0) ;else v73=v81[1810 -(587 + 1220) ];end elseif ((v82==(2055 -(1211 + 681))) or (1041>2665)) then local v3217;local v3218;v79[v81[79 -(64 + 13) ]]=v79[v81[658 -(121 + 534) ]][v81[807 -(622 + 181) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1671 -(296 + 1373) ]]=v79[v81[3]][v81[1 + 3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[3]][v81[1618 -(143 + 1471) ]];v73=v73 + (3 -2) ;v81=v69[v73];v3218=v81[1 + 1 ];v3217=v79[v81[7 -4 ]];v79[v3218 + (181 -(103 + 77)) ]=v3217;v79[v3218]=v3217[v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v81[3];v73=v73 + (1158 -(895 + 262)) ;v81=v69[v73];v3218=v81[2];v79[v3218]=v79[v3218](v13(v79,v3218 + (1 -0) ,v81[3]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1628 -(581 + 1045) ]]=v79[v81[1278 -(582 + 693) ]][v81[1190 -(454 + 732) ]];v73=v73 + (1 -0) ;v81=v69[v73];if ((1318<=2325) and ((v79[v81[2]]~=v81[2 + 2 ]) or (3864==1806))) then v73=v73 + 1 ;else v73=v81[4 -1 ];end else local v3236;local v3237;v79[v81[2]]=v79[v81[3]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v79[v81[653 -(367 + 283) ]][v81[72 -(7 + 61) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[3 -1 ]]=v81[1 + 2 ];v73=v73 + (679 -(332 + 346)) ;v81=v69[v73];v79[v81[3 -1 ]]= #v79[v81[3]];v73=v73 + 1 ;v81=v69[v73];v3237=v81[3 -1 ];v79[v3237]=v79[v3237](v13(v79,v3237 + (3 -2) ,v81[3 + 0 ]));v73=v73 + (1 -0) ;v81=v69[v73];v3237=v81[2 + 0 ];v3236=v79[v81[2 + 1 ]];v79[v3237 + (1 -0) ]=v3236;v79[v3237]=v3236[v81[9 -5 ]];v73=v73 + 1 ;v81=v69[v73];v3237=v81[1856 -(815 + 1039) ];v79[v3237]=v79[v3237](v79[v3237 + (777 -(336 + 440)) ]);v73=v73 + 1 + 0 ;v81=v69[v73];v3237=v81[1 + 1 ];v3236=v79[v81[7 -4 ]];v79[v3237 + (431 -(222 + 208)) ]=v3236;v79[v3237]=v3236[v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v3237=v81[832 -(652 + 178) ];v79[v3237]=v79[v3237](v79[v3237 + (1 -0) ]);v73=v73 + (2 -1) ;v81=v69[v73];if (v79[v81[2 + 0 ]]==v79[v81[9 -5 ]]) then v73=v73 + (395 -(259 + 135)) ;else v73=v81[3];end end elseif (v82<=(1640 -(1393 + 67))) then if ((v82<=(92 + 80)) or (2694<=1474)) then if (v82<=168) then if (v82<=(1614 -(1129 + 319))) then if (v82>165) then local v1940=0 + 0 ;local v1941;local v1942;while true do if (v1940==(6 -1)) then v79[v1942]=v1941[v81[416 -(137 + 275) ]];v73=v73 + (440 -(140 + 299)) ;v81=v69[v73];v1940=1107 -(421 + 680) ;end if (v1940==(19 -15)) then v1942=v81[5 -3 ];v1941=v79[v81[7 -4 ]];v79[v1942 + 1 + 0 ]=v1941;v1940=545 -(58 + 482) ;end if ((v1940==(679 -(310 + 369))) or (1871==2500)) then v1941=nil;v1942=nil;v79[v81[2 + 0 ]][v81[289 -(274 + 12) ]]=v79[v81[4 + 0 ]];v1940=1 + 0 ;end if ((2490>581) and (v1940==8)) then v79[v81[1764 -(681 + 1081) ]][v81[10 -7 ]]=v81[7 -3 ];break;end if (v1940==(15 -9)) then v79[v81[879 -(842 + 35) ]]={};v73=v73 + 1 ;v81=v69[v73];v1940=10 -3 ;end if (v1940==(1870 -(180 + 1687))) then v79[v81[2]]=v62[v81[6 -3 ]];v73=v73 + (972 -(269 + 702)) ;v81=v69[v73];v1940=818 -(776 + 38) ;end if ((v1940==7) or (3936<=1)) then v79[v81[1 + 1 ]][v81[5 -2 ]]=v81[4];v73=v73 + 1 + 0 ;v81=v69[v73];v1940=1 + 7 ;end if (v1940==(1 + 0)) then v73=v73 + 1 + 0 ;v81=v69[v73];v1942=v81[2];v1940=4 -2 ;end if (v1940==(2 + 0)) then v79[v1942](v13(v79,v1942 + 1 ,v81[3]));v73=v73 + (3 -2) ;v81=v69[v73];v1940=2 + 1 ;end end else local v1943=955 -(135 + 820) ;local v1944;local v1945;while true do if ((74<=3231) and (v1943==7)) then v79[v1945]=v79[v1945](v79[v1945 + (137 -(118 + 18)) ]);v73=v73 + 1 + 0 ;v81=v69[v73];if (v79[v81[9 -7 ]]==v79[v81[2 + 2 ]]) then v73=v73 + 1 + 0 ;else v73=v81[3];end break;end if ((2047<=2400) and (v1943==(1 + 2))) then v79[v1945]=v79[v1945](v13(v79,v1945 + 1 ,v81[3 + 0 ]));v73=v73 + (1294 -(741 + 552)) ;v81=v69[v73];v1945=v81[1 + 1 ];v1944=v79[v81[3 -0 ]];v1943=4;end if (v1943==(0 + 0)) then v1944=nil;v1945=nil;v79[v81[886 -(779 + 105) ]]=v79[v81[1784 -(1451 + 330) ]][v81[1873 -(1259 + 610) ]];v73=v73 + 1 ;v81=v69[v73];v1943=1;end if ((588<2579) and (v1943==(856 -(4 + 846)))) then v79[v1945 + (1858 -(1108 + 749)) ]=v1944;v79[v1945]=v1944[v81[1745 -(1301 + 440) ]];v73=v73 + 1 ;v81=v69[v73];v1945=v81[2 -0 ];v1943=5 + 2 ;end if (v1943==(1 + 1)) then v81=v69[v73];v79[v81[2]]= #v79[v81[3 + 0 ]];v73=v73 + (477 -(168 + 308)) ;v81=v69[v73];v1945=v81[3 -1 ];v1943=3;end if (v1943==(3 + 2)) then v79[v1945]=v79[v1945](v79[v1945 + (1348 -(469 + 878)) ]);v73=v73 + 1 + 0 ;v81=v69[v73];v1945=v81[7 -5 ];v1944=v79[v81[2 + 1 ]];v1943=2 + 4 ;end if ((2 -1)==v1943) then v79[v81[2 + 0 ]]=v79[v81[3]][v81[4]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[1842 -(1332 + 508) ]]=v81[1 + 2 ];v73=v73 + 1 + 0 ;v1943=2 + 0 ;end if (v1943==(1146 -(650 + 492))) then v79[v1945 + (807 -(689 + 117)) ]=v1944;v79[v1945]=v1944[v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v1945=v81[4 -2 ];v1943=5;end end end elseif ((3939<4238) and (v82==(2090 -(794 + 1129)))) then local v1946;local v1947;v79[v81[2 + 0 ]][v81[1 + 2 ]]=v79[v81[865 -(553 + 308) ]];v73=v73 + (1 -0) ;v81=v69[v73];v1947=v81[2 + 0 ];v79[v1947](v13(v79,v1947 + 1 + 0 ,v81[3]));v73=v73 + (1769 -(1764 + 4)) ;v81=v69[v73];v79[v81[519 -(121 + 396) ]]=v62[v81[557 -(498 + 56) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1947=v81[7 -5 ];v1946=v79[v81[3 + 0 ]];v79[v1947 + (2 -1) ]=v1946;v79[v1947]=v1946[v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1 + 1 ]]={};v73=v73 + 1 ;v81=v69[v73];v79[v81[4 -2 ]][v81[1619 -(316 + 1300) ]]=v81[176 -(78 + 94) ];v73=v73 + (1417 -(261 + 1155)) ;v81=v69[v73];v79[v81[1458 -(1040 + 416) ]][v81[3]]=v81[47 -(29 + 14) ];else local v1964;local v1965;v79[v81[3 -1 ]]=v79[v81[965 -(928 + 34) ]][v81[2 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3]][v81[14 -10 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2 -0 ]]=v81[513 -(69 + 441) ];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2 + 0 ]]= #v79[v81[6 -3 ]];v73=v73 + (1881 -(517 + 1363)) ;v81=v69[v73];v1965=v81[930 -(802 + 126) ];v79[v1965]=v79[v1965](v13(v79,v1965 + (1669 -(1660 + 8)) ,v81[3]));v73=v73 + (3 -2) ;v81=v69[v73];v1965=v81[183 -(38 + 143) ];v1964=v79[v81[8 -5 ]];v79[v1965 + 1 ]=v1964;v79[v1965]=v1964[v81[121 -(29 + 88) ]];v73=v73 + (1 -0) ;v81=v69[v73];v1965=v81[491 -(308 + 181) ];v79[v1965]=v79[v1965](v79[v1965 + 1 ]);v73=v73 + (1398 -(537 + 860)) ;v81=v69[v73];v1965=v81[1 + 1 ];v1964=v79[v81[1098 -(691 + 404) ]];v79[v1965 + (1955 -(870 + 1084)) ]=v1964;v79[v1965]=v1964[v81[133 -(47 + 82) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v1965=v81[2 + 0 ];v79[v1965]=v79[v1965](v79[v1965 + 1 ]);v73=v73 + 1 + 0 ;v81=v69[v73];if (v79[v81[6 -4 ]]==v79[v81[121 -(84 + 33) ]]) then v73=v73 + 1 + 0 ;else v73=v81[10 -7 ];end end elseif ((v82<=(21 + 149)) or (848>=3356)) then if (v82>(420 -251)) then local v1985=0 -0 ;while true do if (v1985==(4 -3)) then v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v62[v81[3 -0 ]];v73=v73 + 1 ;v1985=1222 -(87 + 1133) ;end if ((2714==2714) and ((v1985==(5 -3)) or (2601<=323))) then v81=v69[v73];v79[v81[1 + 1 ]][v81[3]]=v79[v81[4 + 0 ]];v73=v73 + 1 ;v81=v69[v73];v1985=670 -(205 + 462) ;end if ((4390>2641) and ((0 + 0)==v1985)) then v79[v81[2 -0 ]]=v79[v81[1384 -(1035 + 346) ]][v81[2 + 2 ]];v73=v73 + (1781 -(970 + 810)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3]][v81[11 -7 ]];v1985=1;end if ((v1985==(3 + 0)) or (4817==3179)) then v73=v81[3];break;end end else local v1986;local v1987;v79[v81[2 + 0 ]]=v79[v81[7 -4 ]][v81[15 -11 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1390 -(601 + 787) ]]=v79[v81[613 -(256 + 354) ]][v81[7 -3 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2]]=v79[v81[7 -4 ]][v81[8 -4 ]];v73=v73 + (1 -0) ;v81=v69[v73];v1987=v81[2];v1986=v79[v81[6 -3 ]];v79[v1987 + (2 -1) ]=v1986;v79[v1987]=v1986[v81[6 -2 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[574 -(259 + 313) ]]=v81[4 -1 ];v73=v73 + 1 + 0 ;v81=v69[v73];v1987=v81[1 + 1 ];v79[v1987]=v79[v1987](v13(v79,v1987 + 1 ,v81[3]));v73=v73 + 1 ;v81=v69[v73];if (v79[v81[2 + 0 ]] or (2312>=3152)) then v73=v73 + 1 ;else v73=v81[8 -5 ];end end elseif ((v82==171) or (3936<1851)) then local v2003=1338 -(413 + 925) ;local v2004;local v2005;while true do if (v2003==(1 + 0)) then v81=v69[v73];v2005=v81[2];v79[v2005](v13(v79,v2005 + 1 + 0 ,v81[3]));v73=v73 + 1 + 0 ;v2003=2;end if ((568<=4933) and ((v2003==(10 -7)) or (1166<135))) then v2005=v81[2 -0 ];v2004=v79[v81[2 + 1 ]];v79[v2005 + (2 -1) ]=v2004;v79[v2005]=v2004[v81[1948 -(1164 + 780) ]];v2003=1364 -(596 + 764) ;end if ((1324<2787) and (v2003==6)) then v79[v81[284 -(52 + 230) ]][v81[9 -6 ]]=v81[1570 -(806 + 760) ];break;end if ((2101<2971) and (1732<=4682) and (v2003==(5 -3))) then v81=v69[v73];v79[v81[2 -0 ]]=v62[v81[4 -1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v2003=1 + 2 ;end if (v2003==(18 -13)) then v81=v69[v73];v79[v81[2 -0 ]][v81[3]]=v81[1 + 3 ];v73=v73 + 1 + 0 ;v81=v69[v73];v2003=1971 -(1000 + 965) ;end if (v2003==(3 + 1)) then v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[5 -3 ]]={};v73=v73 + 1 + 0 ;v2003=1131 -(261 + 865) ;end if ((v2003==0) or (823>4233)) then v2004=nil;v2005=nil;v79[v81[5 -3 ]][v81[3]]=v79[v81[5 -1 ]];v73=v73 + 1 ;v2003=1 + 0 ;end end else local v2006;local v2007;v2007=v81[547 -(33 + 512) ];v2006=v79[v81[3]];v79[v2007 + (1837 -(1555 + 281)) ]=v2006;v79[v2007]=v2006[v81[8 -4 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]={};v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[5 -3 ]][v81[3 + 0 ]]=v81[43 -(34 + 5) ];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]][v81[3 + 0 ]]=v81[4];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]][v81[2 + 1 ]]=v81[2 + 2 ];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[4 -2 ]][v81[1224 -(999 + 222) ]]=v81[4];v73=v73 + 1 ;v81=v69[v73];v2007=v81[1 + 1 ];v79[v2007](v13(v79,v2007 + 1 + 0 ,v81[347 -(166 + 178) ]));end elseif (v82<=(54 + 122)) then if (v82<=(517 -343)) then if (v82==(1473 -(587 + 713))) then local v2023;local v2024;v79[v81[2 + 0 ]]=v79[v81[1125 -(11 + 1111) ]][v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]();v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v62[v81[6 -3 ]];v73=v73 + (1101 -(882 + 218)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3 + 0 ]][v81[966 -(115 + 847) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[1618 -(1231 + 384) ]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v79[v81[1699 -(1202 + 494) ]][v81[182 -(12 + 166) ]];v73=v73 + (2 -1) ;v81=v69[v73];v2024=v81[2 + 0 ];v2023=v79[v81[607 -(202 + 402) ]];v79[v2024 + 1 + 0 ]=v2023;v79[v2024]=v2023[v81[1002 -(936 + 62) ]];v73=v73 + (349 -(119 + 229)) ;v81=v69[v73];v79[v81[2]]=v81[7 -4 ];v73=v73 + 1 ;v81=v69[v73];v2024=v81[7 -5 ];v79[v2024]=v79[v2024](v13(v79,v2024 + 1 + 0 ,v81[6 -3 ]));v73=v73 + (1437 -(513 + 923)) ;v81=v69[v73];if (v79[v81[1779 -(507 + 1270) ]]==v81[4]) then v73=v73 + 1 + 0 ;else v73=v81[3];end else local v2041=0 -0 ;while true do if ((2811<=3180) and (v2041==(2 + 1))) then v79[v81[2]]=v62[v81[11 -8 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v79[v81[772 -(644 + 125) ]][v81[4]];v2041=3 + 1 ;end if ((1487>=1023) and (v2041==(1849 -(718 + 1129)))) then v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3]][v81[11 -7 ]];v73=v73 + (1410 -(564 + 845)) ;v81=v69[v73];v2041=8 -5 ;end if (v2041==(163 -(46 + 116))) then v73=v73 + (651 -(575 + 75)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[9 -5 ]];v73=v73 + (3 -2) ;v2041=6 -4 ;end if (v2041==(2 + 2)) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[3 + 0 ]][v81[674 -(224 + 446) ]];v73=v73 + 1 ;v2041=5;end if ((v2041==6) or (2520==1822)) then v79[v81[1 + 1 ]][v81[1 + 2 ]]=v79[v81[13 -9 ]];v73=v73 + (319 -(56 + 262)) ;v81=v69[v73];v73=v81[10 -7 ];break;end if (v2041==(706 -(666 + 35))) then v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[3]][v81[4]];v73=v73 + (1181 -(553 + 627)) ;v81=v69[v73];v2041=6;end if ((v2041==(1473 -(936 + 537))) or (1183<=729)) then v79[v81[1 + 1 ]]=v79[v81[1203 -(737 + 463) ]][v81[3 + 1 ]];v73=v73 + (668 -(424 + 243)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[4]];v2041=1 + 0 ;end end end elseif (v82>(649 -474)) then v79[v81[2]]=v79[v81[3]][v81[4]];v73=v73 + (1347 -(1213 + 133)) ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[2 + 1 ]][v81[4]];v73=v73 + (61 -(37 + 23)) ;v81=v69[v73];v79[v81[7 -5 ]]=v62[v81[1346 -(122 + 1221) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[244 -(139 + 103) ]][v81[1 + 2 ]]=v79[v81[2 + 2 ]];v73=v73 + (1 -0) ;v81=v69[v73];v73=v81[3];else local v2052;local v2053;local v2052,v2054;local v2055;local v2056;v79[v81[2 + 0 ]]=v62[v81[2 + 1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[109 -(9 + 97) ]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v2056=v81[2];v2055=v79[v81[2 + 1 ]];v79[v2056 + 1 + 0 ]=v2055;v79[v2056]=v2055[v81[4 + 0 ]];v73=v73 + 1 ;v81=v69[v73];v2056=v81[6 -4 ];v2052,v2054=v72(v79[v2056](v79[v2056 + (1076 -(657 + 418)) ]));v74=(v2054 + v2056) -(1981 -(448 + 1532)) ;v2053=253 -(110 + 143) ;for v3035=v2056,v74 do v2053=v2053 + 1 ;v79[v3035]=v2052[v2053];end v73=v73 + (2 -1) ;v81=v69[v73];v2056=v81[945 -(549 + 394) ];v2052={v79[v2056](v13(v79,v2056 + (1235 -(500 + 734)) ,v74))};v2053=0 + 0 ;for v3038=v2056,v81[1 + 3 ] do v2053=v2053 + 1 ;v79[v3038]=v2052[v2053];end v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[3];end elseif (v82<=(843 -(343 + 322))) then if (v82>(99 + 78)) then local v2070=0 + 0 ;while true do if (v2070==(0 + 0)) then v79[v81[6 -4 ]]=v79[v81[3]][v81[1135 -(297 + 834) ]];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[2]]=v79[v81[1 + 2 ]][v81[10 -6 ]];v2070=1 + 0 ;end if ((v2070==(3 + 0)) or (789==3914)) then v79[v81[788 -(494 + 292) ]]=v79[v81[1 + 2 ]][v81[4]];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[1634 -(888 + 744) ]][v81[3]]=v79[v81[1 + 3 ]];break;end if ((v2070==(686 -(206 + 479))) or (1546==4006)) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[1176 -(861 + 312) ]][v81[740 -(135 + 601) ]];v73=v73 + 1 ;v2070=2;end if ((1941==1941) and (v2070==(1144 -(1085 + 57)))) then v81=v69[v73];v79[v81[1927 -(224 + 1701) ]]=v79[v81[1 + 2 ]][v81[10 -6 ]];v73=v73 + 1 ;v81=v69[v73];v2070=3 + 0 ;end end else local v2071=0;local v2072;local v2073;local v2074;while true do if (v2071==(0 -0)) then v2072=nil;v2073=nil;v2074=nil;v79[v81[2]]=v62[v81[3 + 0 ]];v73=v73 + (747 -(730 + 16)) ;v81=v69[v73];v2071=1 + 0 ;end if ((1588 -(790 + 792))==v2071) then v79[v81[1083 -(474 + 607) ]][v81[533 -(129 + 401) ]]=v81[4];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]][v81[121 -(51 + 67) ]]=v81[4];v73=v73 + 1 + 0 ;v81=v69[v73];v2071=120 -(93 + 20) ;end if ((2986>=2600) and (v2071==(15 -11))) then v79[v81[22 -(12 + 8) ]]=v81[201 -(161 + 37) ];v73=v73 + 1 ;v81=v69[v73];v2073=v81[2 + 1 ];v2072=v79[v2073];for v5135=v2073 + 1 ,v81[1561 -(507 + 1050) ] do v2072=v2072   .. v79[v5135] ;end v2071=9 -4 ;end if ((1 -0)==v2071) then v2074=v81[2 + 0 ];v2073=v79[v81[1 + 2 ]];v79[v2074 + 1 + 0 ]=v2073;v79[v2074]=v2073[v81[2 + 2 ]];v73=v73 + (1 -0) ;v81=v69[v73];v2071=866 -(184 + 680) ;end if ((v2071==(2 + 0)) or (2843<432)) then v79[v81[5 -3 ]]={};v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[4 -2 ]][v81[5 -2 ]]=v81[2 + 2 ];v73=v73 + (1051 -(629 + 421)) ;v81=v69[v73];v2071=3;end if ((2413<4993) and (v2071==(3 + 0))) then v79[v81[2]]=v81[5 -2 ];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v79[v81[943 -(544 + 396) ]][v81[6 -2 ]];v73=v73 + (992 -(904 + 87)) ;v81=v69[v73];v2071=14 -10 ;end if ((v2071==8) or (3340<3127)) then v81=v69[v73];v73=v81[1477 -(1443 + 31) ];break;end if ((548<3415) and ((v2071==(15 -8)) or (3777==2709))) then v2074=v81[1815 -(1110 + 703) ];v79[v2074](v13(v79,v2074 + (2 -1) ,v81[2 + 1 ]));v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[5 -3 ]]=v81[3];v73=v73 + 1 ;v2071=211 -(78 + 125) ;end if ((1627<=3379) and ((15 -10)==v2071)) then v79[v81[3 -1 ]]=v2072;v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1826 -(1392 + 432) ]][v81[1 + 2 ]]=v79[v81[10 -6 ]];v73=v73 + 1 ;v81=v69[v73];v2071=6;end end end elseif (v82>(29 + 150)) then local v2075;local v2076;local v2077;v2077=v81[1404 -(963 + 439) ];v2076=v79[v81[3]];v79[v2077 + (2 -1) ]=v2076;v79[v2077]=v2076[v81[1329 -(76 + 1249) ]];v73=v73 + (1752 -(1165 + 586)) ;v81=v69[v73];v79[v81[1930 -(1916 + 12) ]]=v81[1259 -(604 + 652) ];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[5 -2 ]][v81[1 + 3 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 -0 ]]=v81[1 + 2 ];v73=v73 + (2 -1) ;v81=v69[v73];v2076=v81[3 -0 ];v2075=v79[v2076];for v3041=v2076 + (1 -0) ,v81[4 -0 ] do v2075=v2075   .. v79[v3041] ;end v79[v81[15 -(11 + 2) ]]=v2075;v73=v73 + (1443 -(64 + 1378)) ;v81=v69[v73];v2077=v81[4 -2 ];v79[v2077]=v79[v2077](v13(v79,v2077 + (1754 -(256 + 1497)) ,v81[3 -0 ]));v73=v73 + (878 -(562 + 315)) ;v81=v69[v73];v79[v81[7 -5 ]]=v79[v81[3]][v81[1192 -(577 + 611) ]];v73=v73 + 1 + 0 ;v81=v69[v73];if (v79[v81[5 -3 ]]==v81[6 -2 ]) then v73=v73 + 1 ;else v73=v81[74 -(58 + 13) ];end elseif (v81[2 + 0 ]==v79[v81[4]]) then v73=v73 + 1 + 0 ;else v73=v81[457 -(404 + 50) ];end elseif ((v82<=(224 -(6 + 30))) or (1931<=1682)) then if (v82<=184) then if ((v82<=(1515 -(770 + 563))) or (2954<945)) then if (v82==(150 + 31)) then v79[v81[1 + 1 ]]=v79[v81[173 -(25 + 145) ]][v81[3 + 1 ]];v73=v73 + (700 -(153 + 546)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[930 -(60 + 867) ]][v81[14 -10 ]];v73=v73 + (1284 -(309 + 974)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[7 -4 ]];v73=v73 + (1142 -(677 + 464)) ;v81=v69[v73];v79[v81[2]][v81[3]]=v79[v81[4]];v73=v73 + 1 ;v81=v69[v73];v73=v81[3];else local v2105;local v2106;v79[v81[824 -(567 + 255) ]][v81[4 -1 ]]=v79[v81[4 -0 ]];v73=v73 + 1 ;v81=v69[v73];v2106=v81[530 -(384 + 144) ];v79[v2106](v13(v79,v2106 + 1 ,v81[1224 -(1030 + 191) ]));v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v62[v81[3]];v73=v73 + (1 -0) ;v81=v69[v73];v2106=v81[1 + 1 ];v2105=v79[v81[860 -(326 + 531) ]];v79[v2106 + 1 ]=v2105;v79[v2106]=v2105[v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1 + 1 ]]={};v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[4 -2 ]][v81[1 + 2 ]]=v81[4 + 0 ];v73=v73 + (1622 -(1367 + 254)) ;v81=v69[v73];v79[v81[680 -(305 + 373) ]][v81[3 -0 ]]=v81[323 -(129 + 190) ];end elseif (((4397==4397) and (v82>(550 -367))) or (3385<1480)) then local v2123;local v2124;local v2125;v79[v81[3 -1 ]]=v79[v81[3 + 0 ]][v81[4 + 0 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[291 -(210 + 79) ]]();v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[4 -2 ]]=v62[v81[3]];v73=v73 + (673 -(32 + 640)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3]][v81[3 + 1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[1764 -(847 + 914) ]][v81[11 -7 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[527 -(163 + 361) ]][v81[889 -(162 + 723) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[403 -(258 + 143) ]]=v79[v81[12 -9 ]][v81[8 -4 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[7 -5 ]]=v62[v81[1694 -(486 + 1205) ]];v73=v73 + (166 -(92 + 73)) ;v81=v69[v73];v2125=v81[2 + 0 ];v2124=v79[v81[3 + 0 ]];v79[v2125 + (1 -0) ]=v2124;v79[v2125]=v2124[v81[276 -(68 + 204) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[4 -1 ]][v81[1 + 3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[9 -7 ]]=v81[2 + 1 ];v73=v73 + 1 + 0 ;v81=v69[v73];v2124=v81[3 + 0 ];v2123=v79[v2124];for v3042=v2124 + (317 -(20 + 296)) ,v81[3 + 1 ] do v2123=v2123   .. v79[v3042] ;end v79[v81[8 -6 ]]=v2123;v73=v73 + 1 ;v81=v69[v73];v2125=v81[6 -4 ];v79[v2125]=v79[v2125](v13(v79,v2125 + (1 -0) ,v81[2 + 1 ]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[2 + 1 ]][v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]][v81[7 -4 ]]=v79[v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v73=v81[2 + 1 ];else local v2156;local v2157;v79[v81[251 -(155 + 94) ]][v81[3 -0 ]]=v79[v81[4]];v73=v73 + (908 -(515 + 392)) ;v81=v69[v73];v2157=v81[2];v79[v2157](v13(v79,v2157 + (327 -(7 + 319)) ,v81[3]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v62[v81[1 + 2 ]];v73=v73 + (1498 -(292 + 1205)) ;v81=v69[v73];v2157=v81[2];v2156=v79[v81[55 -(13 + 39) ]];v79[v2157 + 1 ]=v2156;v79[v2157]=v2156[v81[4 + 0 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[7 -5 ]]={};v73=v73 + (1039 -(850 + 188)) ;v81=v69[v73];v79[v81[2]][v81[1039 -(822 + 214) ]]=v81[4];v73=v73 + 1 ;v81=v69[v73];v79[v81[1163 -(317 + 844) ]][v81[3 + 0 ]]=v81[2 + 2 ];end elseif ((1594<2430) and (v82<=(1376 -(508 + 682)))) then if (v82==(90 + 95)) then local v2173;v79[v81[1 + 1 ]]=v79[v81[548 -(127 + 418) ]][v81[10 -6 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[9 -7 ]]=v79[v81[3]][v81[6 -2 ]];v73=v73 + (1121 -(690 + 430)) ;v81=v69[v73];v79[v81[7 -5 ]]=v79[v81[2 + 1 ]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v62[v81[955 -(637 + 315) ]]=v79[v81[5 -3 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[6 -4 ]]=v62[v81[3 + 0 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[22 -(13 + 7) ]]=v79[v81[1 + 2 ]][v81[5 -1 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2 -0 ]]=v81[2 + 1 ];v73=v73 + 1 ;v81=v69[v73];v2173=v81[2 + 0 ];v79[v2173](v79[v2173 + 1 ]);v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v62[v81[354 -(44 + 307) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[799 -(127 + 670) ]]=v79[v81[3 + 0 ]][v81[588 -(375 + 209) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[1819 -(1673 + 143) ]][v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1451 -(836 + 613) ]]=v62[v81[6 -3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[1533 -(295 + 1235) ]][v81[544 -(328 + 212) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[4 -2 ]]=v81[922 -(517 + 402) ];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[5 -3 ]]=v81[1085 -(700 + 382) ];v73=v73 + (880 -(677 + 202)) ;v81=v69[v73];v79[v81[2 -0 ]]=v81[3];v73=v73 + 1 ;v81=v69[v73];v2173=v81[5 -3 ];v79[v2173]=v79[v2173](v13(v79,v2173 + 1 + 0 ,v81[756 -(360 + 393) ]));v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[1959 -(1231 + 726) ]][v81[4 -1 ]]=v79[v81[1914 -(173 + 1737) ]];else v79[v81[1949 -(441 + 1506) ]]=v79[v81[1 + 2 ]] * v79[v81[12 -8 ]] ;end elseif ((v82>187) or (2932<2754)) then local v2207=694 -(136 + 558) ;local v2208;local v2209;local v2210;while true do if ((v2207==1) or (3368<=1286)) then v81=v69[v73];v79[v81[1 + 1 ]]();v73=v73 + (1223 -(988 + 234)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[7 -4 ]];v2207=653 -(125 + 526) ;end if (v2207==5) then v2208=v79[v2209];for v5136=v2209 + (3 -2) ,v81[4 + 0 ] do v2208=v2208   .. v79[v5136] ;end v79[v81[5 -3 ]]=v2208;v73=v73 + (1127 -(290 + 836)) ;v81=v69[v73];v2207=3 + 3 ;end if ((4194>1714) and ((4==v2207) or (4317==1221))) then v81=v69[v73];v79[v81[2]]=v81[3];v73=v73 + (1 -0) ;v81=v69[v73];v2209=v81[3];v2207=5;end if ((3==v2207) or (2116>3593)) then v79[v2210]=v2209[v81[684 -(8 + 672) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1438 -(740 + 696) ]]=v62[v81[1049 -(353 + 693) ]];v73=v73 + 1 + 0 ;v2207=4;end if ((4596>=2411) and (v2207==(1495 -(35 + 1458)))) then v73=v73 + (1871 -(1821 + 49)) ;v81=v69[v73];v2210=v81[5 -3 ];v2209=v79[v81[1737 -(727 + 1007) ]];v79[v2210 + (168 -(165 + 2)) ]=v2209;v2207=1662 -(1028 + 631) ;end if (v2207==6) then v2210=v81[1617 -(311 + 1304) ];v79[v2210]=v79[v2210](v13(v79,v2210 + (2 -1) ,v81[1 + 2 ]));v73=v73 + 1 ;v81=v69[v73];if v79[v81[2]] then v73=v73 + 1 + 0 ;else v73=v81[582 -(512 + 67) ];end break;end if ((v2207==0) or (927>2213)) then v2208=nil;v2209=nil;v2210=nil;v79[v81[5 -3 ]]=v79[v81[3]][v81[1 + 3 ]];v73=v73 + 1 ;v2207=1;end end else v79[v81[2]]=v79[v81[3]][v81[2 + 2 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v79[v81[9 -6 ]][v81[1 + 3 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1791 -(395 + 1394) ]]=v79[v81[10 -7 ]][v81[3 + 1 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]=v79[v81[8 -5 ]][v81[471 -(143 + 324) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[1 + 2 ]][v81[11 -7 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v62[v81[3]]=v79[v81[1105 -(342 + 761) ]];end elseif (v82<=(134 + 58)) then if ((4620>=4034) and (v82<=(522 -332))) then if (v82==(75 + 114)) then local v2222;local v2223;v79[v81[2 -0 ]]=v79[v81[4 -1 ]][v81[3 + 1 ]];v73=v73 + (1158 -(889 + 268)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[1 + 2 ]][v81[10 -6 ]];v73=v73 + (298 -(196 + 101)) ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[8 -5 ]][v81[2 + 2 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[3]][v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[3]];v73=v73 + (1 -0) ;v81=v69[v73];v2223=v81[1585 -(431 + 1152) ];v2222=v79[v81[3]];v79[v2223 + 1 + 0 ]=v2222;v79[v2223]=v2222[v81[348 -(107 + 237) ]];v73=v73 + (1801 -(690 + 1110)) ;v81=v69[v73];v79[v81[2 -0 ]]=v81[1500 -(1374 + 123) ];v73=v73 + (2 -1) ;v81=v69[v73];v2223=v81[1 + 1 ];v79[v2223]=v79[v2223](v13(v79,v2223 + 1 + 0 ,v81[3]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1605 -(454 + 1149) ]]=v79[v81[5 -2 ]][v81[8 -4 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]][v81[2 + 1 ]]=v79[v81[4 + 0 ]];v73=v73 + (638 -(21 + 616)) ;v81=v69[v73];v73=v81[6 -3 ];else local v2245;local v2246;v79[v81[1 + 1 ]]=v79[v81[440 -(125 + 312) ]][v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[1111 -(266 + 842) ]][v81[642 -(395 + 243) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[1038 -(383 + 652) ]][v81[11 -7 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v2246=v81[2];v2245=v79[v81[2 + 1 ]];v79[v2246 + (644 -(114 + 529)) ]=v2245;v79[v2246]=v2245[v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1191 -(352 + 837) ]]=v81[3];v73=v73 + (4 -3) ;v81=v69[v73];v2246=v81[552 -(465 + 85) ];v79[v2246]=v79[v2246](v13(v79,v2246 + (532 -(366 + 165)) ,v81[1 + 2 ]));v73=v73 + (3 -2) ;v81=v69[v73];if v79[v81[6 -4 ]] then v73=v73 + 1 + 0 ;else v73=v81[1668 -(521 + 1144) ];end end elseif (v82==191) then local v2262;local v2263;v79[v81[3 -1 ]]=v79[v81[3]][v81[1 + 3 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[92 -(5 + 85) ]]();v73=v73 + 1 ;v81=v69[v73];v79[v81[1695 -(1547 + 146) ]]=v62[v81[9 -6 ]];v73=v73 + (318 -(272 + 45)) ;v81=v69[v73];v2263=v81[4 -2 ];v2262=v79[v81[2 + 1 ]];v79[v2263 + (1 -0) ]=v2262;v79[v2263]=v2262[v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[2 + 1 ];v73=v73 + 1 + 0 ;v81=v69[v73];v2263=v81[2];v79[v2263]=v79[v2263](v13(v79,v2263 + 1 ,v81[3]));v73=v73 + 1 + 0 ;v81=v69[v73];if v79[v81[1298 -(997 + 299) ]] then v73=v73 + 1 ;else v73=v81[1290 -(903 + 384) ];end else local v2277;local v2278;local v2279;v2279=v81[2];v2278=v79[v81[3]];v79[v2279 + 1 ]=v2278;v79[v2279]=v2278[v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[3 + 0 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[9 -6 ]][v81[2 + 2 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[3];v73=v73 + (590 -(313 + 276)) ;v81=v69[v73];v2278=v81[1 + 2 ];v2277=v79[v2278];for v3043=v2278 + (329 -(168 + 160)) ,v81[1460 -(1452 + 4) ] do v2277=v2277   .. v79[v3043] ;end v79[v81[2]]=v2277;v73=v73 + (4 -3) ;v81=v69[v73];v2279=v81[2];v79[v2279]=v79[v2279](v13(v79,v2279 + (421 -(338 + 82)) ,v81[576 -(133 + 440) ]));v73=v73 + 1 + 0 ;v81=v69[v73];if ((4823==4823) and v79[v81[2 -0 ]]) then v73=v73 + 1 ;else v73=v81[1 + 2 ];end end elseif (v82<=194) then if ((3661>373) and (v82>193)) then v79[v81[1 + 1 ]]={};else local v2296=0 + 0 ;local v2297;local v2298;while true do if (0==v2296) then v2297=nil;v2298=nil;v79[v81[1304 -(422 + 880) ]]=v79[v81[1983 -(365 + 1615) ]][v81[4 -0 ]];v73=v73 + (1353 -(479 + 873)) ;v81=v69[v73];v79[v81[2]]=v79[v81[1 + 2 ]][v81[10 -6 ]];v2296=2 -1 ;end if ((4573>87) and (v2296==(1 + 0))) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1504 -(832 + 670) ]]=v81[9 -6 ];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1249 -(707 + 540) ]]= #v79[v81[62 -(18 + 41) ]];v2296=2 + 0 ;end if ((22<1080) and (v2296==(4 + 1))) then v79[v2298 + (1221 -(554 + 666)) ]=v2297;v79[v2298]=v2297[v81[504 -(438 + 62) ]];v73=v73 + (1906 -(1497 + 408)) ;v81=v69[v73];v2298=v81[2 -0 ];v79[v2298]=v79[v2298](v79[v2298 + 1 + 0 ]);v2296=4 + 2 ;end if ((475>=105) and (v2296==(642 -(508 + 132)))) then v73=v73 + (3 -2) ;v81=v69[v73];v2298=v81[2 -0 ];v79[v2298]=v79[v2298](v13(v79,v2298 + (1208 -(49 + 1158)) ,v81[1 + 2 ]));v73=v73 + (1 -0) ;v81=v69[v73];v2296=2 + 1 ;end if ((v2296==(3 + 0)) or (4968<2969)) then v2298=v81[4 -2 ];v2297=v79[v81[2 + 1 ]];v79[v2298 + (1222 -(460 + 761)) ]=v2297;v79[v2298]=v2297[v81[10 -6 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v2296=1 + 3 ;end if ((v2296==(600 -(405 + 191))) or (572>2283)) then v2298=v81[1672 -(311 + 1359) ];v79[v2298]=v79[v2298](v79[v2298 + (2 -1) ]);v73=v73 + 1 + 0 ;v81=v69[v73];v2298=v81[2];v2297=v79[v81[1 + 2 ]];v2296=1 + 4 ;end if ((3391>1938) and (v2296==(1 + 5))) then v73=v73 + 1 + 0 ;v81=v69[v73];if ((v79[v81[2]]==v79[v81[6 -2 ]]) or (18>83)) then v73=v73 + 1 + 0 ;else v73=v81[4 -1 ];end break;end end end elseif (v82<=(33 + 162)) then if ((3498>=1152) and (v79[v81[3 -1 ]]~=v81[4 -0 ])) then v73=v73 + 1 ;else v73=v81[1523 -(1408 + 112) ];end elseif (v82>(1178 -(285 + 697))) then local v3265=0 -0 ;local v3266;local v3267;while true do if (v3265==(1261 -(737 + 523))) then v79[v81[8 -6 ]]=v79[v81[3]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[847 -(789 + 55) ]][v81[12 -8 ]];v73=v73 + 1 + 0 ;v3265=3 -1 ;end if (v3265==0) then v3266=nil;v3267=nil;v79[v81[3 -1 ]]=v79[v81[3 + 0 ]][v81[11 -7 ]];v73=v73 + (1883 -(1492 + 390)) ;v81=v69[v73];v3265=1 -0 ;end if ((v3265==(996 -(312 + 681))) or (2919>=4288)) then v73=v73 + (1912 -(1255 + 656)) ;v81=v69[v73];v79[v81[2]]=v81[1730 -(485 + 1242) ];v73=v73 + 1 + 0 ;v81=v69[v73];v3265=8 -4 ;end if (v3265==(5 -1)) then v3267=v81[2];v79[v3267]=v79[v3267](v13(v79,v3267 + (3 -2) ,v81[9 -6 ]));v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v79[v81[1 + 2 ]][v81[963 -(722 + 237) ]];v3265=14 -9 ;end if (v3265==(718 -(77 + 639))) then v81=v69[v73];v3267=v81[5 -3 ];v3266=v79[v81[3]];v79[v3267 + (4 -3) ]=v3266;v79[v3267]=v3266[v81[7 -3 ]];v3265=8 -5 ;end if ((2629==2629) and ((16 -10)==v3265)) then if (v79[v81[2 + 0 ]]~=v79[v81[1 + 3 ]]) then v73=v73 + (1360 -(888 + 471)) ;else v73=v81[1112 -(1034 + 75) ];end break;end if ((v3265==(1162 -(448 + 709))) or (4502<=4422)) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[10 -7 ]][v81[1859 -(1643 + 212) ]];v73=v73 + (481 -(320 + 160)) ;v81=v69[v73];v3265=6;end end else local v3268;local v3269;v79[v81[3 -1 ]]=v62[v81[3]];v73=v73 + 1 ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[1 + 2 ]][v81[7 -3 ]];v73=v73 + (137 -(114 + 22)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[1 + 3 ]];v73=v73 + (1060 -(89 + 970)) ;v81=v69[v73];v79[v81[1730 -(1083 + 645) ]]=v79[v81[169 -(50 + 116) ]][v81[1966 -(1058 + 904) ]];v73=v73 + 1 ;v81=v69[v73];v3269=v81[4 -2 ];v3268=v79[v81[11 -8 ]];v79[v3269 + (3 -2) ]=v3268;v79[v3269]=v3268[v81[11 -7 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[198 -(94 + 102) ]]=v81[3];v73=v73 + 1 + 0 ;v81=v69[v73];v3269=v81[2];v79[v3269]=v79[v3269](v13(v79,v3269 + (1265 -(735 + 529)) ,v81[1154 -(875 + 276) ]));v73=v73 + (980 -(461 + 518)) ;v81=v69[v73];v79[v81[2]]=v62[v81[3 + 0 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[783 -(656 + 125) ]]=v79[v81[7 -4 ]][v81[852 -(532 + 316) ]];v73=v73 + (255 -(150 + 104)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3]][v81[11 -7 ]];end elseif ((4199==4199) and (v82<=(2077 -(564 + 1283)))) then if ((1645==1645) and (v82<=(124 + 89))) then if ((2404<=3905) and (3274==3274) and (v82<=205)) then if ((v82<=(546 -345)) or (4003<=669)) then if ((v82<=(70 + 129)) or (4935<1262)) then if (v82>(17 + 181)) then local v2299;local v2300;v79[v81[7 -5 ]][v81[1551 -(330 + 1218) ]]=v79[v81[3 + 1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v2300=v81[2 + 0 ];v79[v2300](v13(v79,v2300 + 1 + 0 ,v81[3]));v73=v73 + 1 ;v81=v69[v73];v79[v81[2 -0 ]]=v62[v81[2 + 1 ]];v73=v73 + (4 -3) ;v81=v69[v73];v2300=v81[1 + 1 ];v2299=v79[v81[1572 -(511 + 1058) ]];v79[v2300 + (2 -1) ]=v2299;v79[v2300]=v2299[v81[4]];v73=v73 + (1499 -(1315 + 183)) ;v81=v69[v73];v79[v81[1 + 1 ]]={};v73=v73 + (543 -(233 + 309)) ;v81=v69[v73];v79[v81[2 -0 ]][v81[656 -(267 + 386) ]]=v81[4];v73=v73 + 1 ;v81=v69[v73];v79[v81[4 -2 ]][v81[3]]=v81[857 -(744 + 109) ];else v79[v81[1552 -(1271 + 279) ]]=v79[v81[7 -4 ]][v81[4]];v73=v73 + (1645 -(642 + 1002)) ;v81=v69[v73];for v3044=v81[1865 -(643 + 1220) ],v81[8 -5 ] do v79[v3044]=nil;end v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1419 -(1063 + 354) ]]=v79[v81[833 -(739 + 91) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1879 -(790 + 1087) ]]=v79[v81[3 + 0 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]=v81[9 -6 ];end elseif (v82>200) then local v2326=0 -0 ;local v2327;local v2328;while true do if ((v2326==5) or (3053==2743)) then v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2]][v81[10 -7 ]]=v81[4];v2326=6;end if ((v2326==(151 -(82 + 67))) or (3083<=1711)) then v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]={};v2326=3;end if (v2326==(7 -3)) then v73=v73 + (1986 -(1835 + 150)) ;v81=v69[v73];v79[v81[16 -(12 + 2) ]][v81[3]]=v81[1040 -(784 + 252) ];v2326=2 + 3 ;end if ((v2326==3) or (2276==2793)) then v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]][v81[1387 -(1134 + 250) ]]=v81[3 + 1 ];v2326=1 + 3 ;end if (v2326==(14 -6)) then v79[v2328](v13(v79,v2328 + 1 + 0 ,v81[3]));break;end if (v2326==0) then v2327=nil;v2328=nil;v2328=v81[2];v2326=2 -1 ;end if ((2024==2024) and ((v2326==(17 -10)) or (1065==341))) then v73=v73 + (1 -0) ;v81=v69[v73];v2328=v81[1983 -(1940 + 41) ];v2326=246 -(39 + 199) ;end if ((4615>1825) and (v2326==(1 + 0))) then v2327=v79[v81[5 -2 ]];v79[v2328 + 1 ]=v2327;v79[v2328]=v2327[v81[6 -2 ]];v2326=1931 -(313 + 1616) ;end if (v2326==(18 -12)) then v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[3 -1 ]][v81[3]]=v81[41 -(7 + 30) ];v2326=7;end end else v79[v81[2]]=v79[v81[1189 -(961 + 225) ]][v81[4]];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[2 + 0 ]]();v73=v73 + (841 -(281 + 559)) ;v81=v69[v73];v79[v81[5 -3 ]]=v62[v81[1 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[1 + 2 ]][v81[1444 -(102 + 1338) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[444 -(319 + 122) ]][v81[1 + 3 ]];v73=v73 + (997 -(45 + 951)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3 + 0 ]][v81[1 + 3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[1 + 2 ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v62[v81[2 + 1 ]];v73=v73 + (1376 -(684 + 691)) ;v81=v69[v73];v79[v81[1646 -(1161 + 483) ]]=v79[v81[969 -(245 + 721) ]][v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[44 -(31 + 11) ]]=v79[v81[10 -7 ]][v81[16 -12 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[838 -(179 + 657) ]]=v79[v81[3]][v81[331 -(150 + 177) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1207 -(142 + 1063) ]]=v79[v81[3]][v81[4]];v73=v73 + (1906 -(1346 + 559)) ;v81=v69[v73];v79[v81[1 + 1 ]][v81[8 -5 ]]=v79[v81[15 -11 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[1729 -(1695 + 31) ];end elseif (v82<=(57 + 146)) then if ((1544==1544) and (v82>(1639 -(1073 + 364)))) then v79[v81[819 -(405 + 412) ]]=v79[v81[652 -(518 + 131) ]] + v81[1306 -(667 + 635) ] ;else local v2353=0;local v2354;local v2355;while true do if ((3687<=3707) and (v2353==(1 + 3))) then v81=v69[v73];v79[v81[2 -0 ]]=v81[1913 -(1397 + 513) ];v73=v73 + (1 -0) ;v81=v69[v73];v2353=5;end if (v2353==(1081 -(454 + 621))) then if ((2508<=4286) and v79[v81[3 -1 ]]) then v73=v73 + 1 ;else v73=v81[1 + 2 ];end break;end if ((v2353==(2 -1)) or (2873==686)) then v81=v69[v73];v79[v81[600 -(417 + 181) ]]=v79[v81[3]][v81[6 -2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v2353=7 -5 ;end if ((3747>=1293) and (v2353==(9 -7))) then v79[v81[1122 -(995 + 125) ]]=v79[v81[7 -4 ]][v81[3 + 1 ]];v73=v73 + (2 -1) ;v81=v69[v73];v2355=v81[1327 -(754 + 571) ];v2353=1 + 2 ;end if ((v2353==5) or (4849==1774)) then v2355=v81[2];v79[v2355]=v79[v2355](v13(v79,v2355 + (2 -1) ,v81[2 + 1 ]));v73=v73 + 1 ;v81=v69[v73];v2353=20 -14 ;end if (((2 + 1)==v2353) or (3234==1629)) then v2354=v79[v81[3]];v79[v2355 + (3 -2) ]=v2354;v79[v2355]=v2354[v81[1 + 3 ]];v73=v73 + 1 ;v2353=1495 -(1141 + 350) ;end if ((0 + 0)==v2353) then v2354=nil;v2355=nil;v79[v81[1 + 1 ]]=v79[v81[8 -5 ]][v81[1 + 3 ]];v73=v73 + 1 ;v2353=2 -1 ;end end end elseif ((v82==204) or (4591<=3431)) then local v2356=0 + 0 ;local v2357;local v2358;while true do if ((v2356==5) or (886>=1307)) then v79[v2358]=v79[v2358](v13(v79,v2358 + 1 ,v81[3]));v73=v73 + (1870 -(513 + 1356)) ;v81=v69[v73];if v79[v81[2]] then v73=v73 + 1 ;else v73=v81[1939 -(196 + 1740) ];end break;end if ((3103>2910) and (v2356==3)) then v73=v73 + (1 -0) ;v81=v69[v73];v2358=v81[2 + 0 ];v2357=v79[v81[6 -3 ]];v79[v2358 + (1 -0) ]=v2357;v79[v2358]=v2357[v81[3 + 1 ]];v2356=9 -5 ;end if ((4579>4181) and (v2356==(1 + 0))) then v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1633 -(362 + 1269) ]]=v62[v81[3]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]=v79[v81[40 -(26 + 11) ]][v81[2 + 2 ]];v2356=1 + 1 ;end if (v2356==(1819 -(183 + 1636))) then v2357=nil;v2358=nil;v79[v81[2]]=v79[v81[2 + 1 ]][v81[3 + 1 ]];v73=v73 + (1231 -(1161 + 69)) ;v81=v69[v73];v79[v81[1380 -(672 + 706) ]]();v2356=1;end if ((v2356==(1 + 3)) or (4719==1512)) then v73=v73 + (106 -(82 + 23)) ;v81=v69[v73];v79[v81[1523 -(100 + 1421) ]]=v81[783 -(61 + 719) ];v73=v73 + (413 -(180 + 232)) ;v81=v69[v73];v2358=v81[2 + 0 ];v2356=8 -3 ;end if (v2356==(4 -2)) then v73=v73 + (1782 -(728 + 1053)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3]][v81[4]];v73=v73 + (560 -(427 + 132)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[968 -(786 + 179) ]][v81[1 + 3 ]];v2356=1 + 2 ;end end else v79[v81[2 -0 ]]=v79[v81[3 + 0 ]][v81[1928 -(1685 + 239) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[6 -3 ]][v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[3 + 0 ]][v81[1181 -(457 + 720) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[6 -4 ]]=v79[v81[724 -(124 + 597) ]][v81[19 -15 ]];v73=v73 + (565 -(414 + 150)) ;v81=v69[v73];v79[v81[2]]=v79[v81[14 -11 ]][v81[833 -(592 + 237) ]];v73=v73 + 1 + 0 ;v81=v69[v73];if (v79[v81[4 -2 ]]==v81[617 -(122 + 491) ]) then v73=v73 + (4 -3) ;else v73=v81[288 -(116 + 169) ];end end elseif (v82<=(803 -594)) then if (v82<=207) then if ((v82>(191 + 15)) or (753==1468)) then local v2370=0 + 0 ;local v2371;local v2372;local v2373;local v2374;local v2375;while true do if ((4 -1)==v2370) then v73=v73 + (1 -0) ;v81=v69[v73];v2375=v81[2];v2371,v2373=v72(v79[v2375](v79[v2375 + 1 + 0 ]));v2370=1234 -(477 + 753) ;end if (v2370==5) then v81=v69[v73];v2375=v81[1 + 1 ];v2371={v79[v2375](v13(v79,v2375 + 1 + 0 ,v74))};v2372=0;v2370=6 + 0 ;end if (v2370==(13 -9)) then v74=(v2373 + v2375) -(1 + 0) ;v2372=1377 -(649 + 728) ;for v5137=v2375,v74 do v2372=v2372 + (913 -(478 + 434)) ;v79[v5137]=v2371[v2372];end v73=v73 + (1 -0) ;v2370=6 -1 ;end if (v2370==(28 -22)) then for v5140=v2375,v81[4 + 0 ] do v2372=v2372 + (1561 -(1329 + 231)) ;v79[v5140]=v2371[v2372];end v73=v73 + (1 -0) ;v81=v69[v73];v73=v81[1913 -(1523 + 387) ];break;end if ((2768>1074) and ((3 -1)==v2370)) then v2375=v81[2 + 0 ];v2374=v79[v81[1310 -(1013 + 294) ]];v79[v2375 + 1 ]=v2374;v79[v2375]=v2374[v81[4]];v2370=1351 -(25 + 1323) ;end if ((v2370==(0 + 0)) or (4622<=3441)) then v2371=nil;v2372=nil;v2371,v2373=nil;v2374=nil;v2370=1931 -(611 + 1319) ;end if (v2370==1) then v2375=nil;v79[v81[2 + 0 ]]=v62[v81[3]];v73=v73 + (1 -0) ;v81=v69[v73];v2370=2 + 0 ;end end else local v2376;local v2377;v79[v81[2]][v81[1 + 2 ]]=v79[v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v2377=v81[3 -1 ];v79[v2377](v13(v79,v2377 + 1 + 0 ,v81[2 + 1 ]));v73=v73 + (817 -(353 + 463)) ;v81=v69[v73];v79[v81[3 -1 ]]=v62[v81[3 + 0 ]];v73=v73 + 1 ;v81=v69[v73];v2377=v81[1063 -(605 + 456) ];v2376=v79[v81[8 -5 ]];v79[v2377 + (785 -(122 + 662)) ]=v2376;v79[v2377]=v2376[v81[1496 -(1184 + 308) ]];v73=v73 + (1169 -(445 + 723)) ;v81=v69[v73];v79[v81[1642 -(1245 + 395) ]]={};v73=v73 + (1128 -(191 + 936)) ;v81=v69[v73];v79[v81[4 -2 ]][v81[4 -1 ]]=v81[1 + 3 ];v73=v73 + (259 -(90 + 168)) ;v81=v69[v73];v79[v81[173 -(87 + 84) ]][v81[5 -2 ]]=v81[716 -(176 + 536) ];end elseif (((2512==2512) and (v82>(154 + 54))) or (4880<4635)) then local v2394;local v2395;local v2394,v2396;local v2397;local v2398;v79[v81[1700 -(858 + 840) ]]=v79[v81[663 -(447 + 213) ]][v81[1464 -(1458 + 2) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]();v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v62[v81[14 -11 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[3]];v73=v73 + 1 + 0 ;v81=v69[v73];v2398=v81[5 -3 ];v2397=v79[v81[483 -(248 + 232) ]];v79[v2398 + (231 -(109 + 121)) ]=v2397;v79[v2398]=v2397[v81[1 + 3 ]];v73=v73 + (1405 -(1288 + 116)) ;v81=v69[v73];v2398=v81[2 + 0 ];v2394,v2396=v72(v79[v2398](v79[v2398 + (237 -(212 + 24)) ]));v74=(v2396 + v2398) -(1 + 0) ;v2395=0 + 0 ;for v3046=v2398,v74 do v2395=v2395 + (1708 -(1175 + 532)) ;v79[v3046]=v2394[v2395];end v73=v73 + 1 + 0 ;v81=v69[v73];v2398=v81[2 -0 ];v2394={v79[v2398](v13(v79,v2398 + 1 + 0 ,v74))};v2395=0;for v3049=v2398,v81[573 -(252 + 317) ] do v2395=v2395 + (1 -0) ;v79[v3049]=v2394[v2395];end v73=v73 + (804 -(738 + 65)) ;v81=v69[v73];v73=v81[560 -(410 + 147) ];else local v2414;local v2415;local v2416;v79[v81[902 -(272 + 628) ]]=v62[v81[3]];v73=v73 + (2 -1) ;v81=v69[v73];v2416=v81[5 -3 ];v2415=v79[v81[171 -(62 + 106) ]];v79[v2416 + (2 -1) ]=v2415;v79[v2416]=v2415[v81[698 -(167 + 527) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 -0 ]]={};v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]][v81[1069 -(326 + 740) ]]=v81[4];v73=v73 + 1 ;v81=v69[v73];v79[v81[78 -(68 + 8) ]]=v81[3];v73=v73 + 1 ;v81=v69[v73];v79[v81[1473 -(133 + 1338) ]]=v79[v81[3]][v81[10 -6 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v81[2 + 1 ];v73=v73 + (3 -2) ;v81=v69[v73];v2415=v81[2 + 1 ];v2414=v79[v2415];for v3052=v2415 + 1 + 0 ,v81[10 -6 ] do v2414=v2414   .. v79[v3052] ;end v79[v81[1989 -(1930 + 57) ]]=v2414;v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]][v81[3 + 0 ]]=v79[v81[4 + 0 ]];v73=v73 + (905 -(14 + 890)) ;v81=v69[v73];v79[v81[2]][v81[10 -7 ]]=v81[1 + 3 ];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2 + 0 ]][v81[13 -10 ]]=v81[13 -9 ];v73=v73 + 1 + 0 ;v81=v69[v73];v2416=v81[8 -6 ];v79[v2416](v13(v79,v2416 + 1 + 0 ,v81[1784 -(755 + 1026) ]));v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[9 -7 ]]=v62[v81[949 -(217 + 729) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[5 -2 ]][v81[11 -7 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[7 -5 ]]=v79[v81[1683 -(619 + 1061) ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[139 -(108 + 28) ]][v81[1931 -(191 + 1736) ]];v73=v73 + (764 -(757 + 6)) ;v81=v69[v73];v62[v81[3]]=v79[v81[2]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1257 -(337 + 918) ]]=v62[v81[6 -3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[2 + 2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[5 -3 ]]=v81[3];v73=v73 + 1 + 0 ;v81=v69[v73];v2416=v81[1678 -(754 + 922) ];v79[v2416](v79[v2416 + (635 -(487 + 147)) ]);v73=v73 + 1 ;v81=v69[v73];v79[v81[2 -0 ]]=v62[v81[3]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1571 -(825 + 744) ]]=v79[v81[3]][v81[1 + 3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[1 + 2 ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[251 -(150 + 99) ]]=v62[v81[3]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1505 -(1335 + 168) ]]=v79[v81[942 -(256 + 683) ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[320 -(33 + 285) ]]=v81[9 -6 ];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[4 -2 ]]=v81[1 + 2 ];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[949 -(776 + 171) ]]=v81[266 -(244 + 19) ];v73=v73 + 1 ;v81=v69[v73];v2416=v81[2 -0 ];v79[v2416]=v79[v2416](v13(v79,v2416 + 1 ,v81[409 -(8 + 398) ]));v73=v73 + 1 ;v81=v69[v73];v79[v81[2]][v81[519 -(228 + 288) ]]=v79[v81[4 -0 ]];end elseif ((4057>=2873) and (v82<=(393 -182))) then if (v82>(17 + 193)) then local v2471;local v2472;v79[v81[590 -(434 + 154) ]][v81[3]]=v79[v81[3 + 1 ]];v73=v73 + (2 -1) ;v81=v69[v73];v2472=v81[7 -5 ];v79[v2472](v13(v79,v2472 + (1 -0) ,v81[1 + 2 ]));v73=v73 + 1 ;v81=v69[v73];v79[v81[2 -0 ]]=v62[v81[3]];v73=v73 + 1 ;v81=v69[v73];v2472=v81[1 + 1 ];v2471=v79[v81[1 + 2 ]];v79[v2472 + 1 + 0 ]=v2471;v79[v2472]=v2471[v81[1669 -(810 + 855) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]={};v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]][v81[2 + 1 ]]=v81[11 -7 ];else local v2487;local v2488;local v2487,v2489;local v2490;local v2491;v79[v81[2]]=v79[v81[1617 -(463 + 1151) ]][v81[4 + 0 ]];v73=v73 + (1976 -(29 + 1946)) ;v81=v69[v73];for v3053=v81[1 + 1 ],v81[1 + 2 ] do v79[v3053]=nil;end v73=v73 + (516 -(337 + 178)) ;v81=v69[v73];v79[v81[66 -(4 + 60) ]]=v62[v81[3]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[1119 -(425 + 691) ]];v73=v73 + (1999 -(354 + 1644)) ;v81=v69[v73];v79[v81[843 -(499 + 342) ]]=v79[v81[2 + 1 ]][v81[164 -(65 + 95) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v2491=v81[1641 -(1403 + 236) ];v2490=v79[v81[3]];v79[v2491 + (1361 -(1117 + 243)) ]=v2490;v79[v2491]=v2490[v81[246 -(67 + 175) ]];v73=v73 + 1 ;v81=v69[v73];v2491=v81[1 + 1 ];v2487,v2489=v72(v79[v2491](v79[v2491 + (1 -0) ]));v74=(v2489 + v2491) -(732 -(387 + 344)) ;v2488=974 -(654 + 320) ;for v3055=v2491,v74 do v2488=v2488 + 1 ;v79[v3055]=v2487[v2488];end v73=v73 + (1 -0) ;v81=v69[v73];v2491=v81[433 -(276 + 155) ];v2487={v79[v2491](v13(v79,v2491 + 1 + 0 ,v74))};v2488=0 + 0 ;for v3058=v2491,v81[778 -(65 + 709) ] do v2488=v2488 + 1 + 0 ;v79[v3058]=v2487[v2488];end v73=v73 + (1745 -(884 + 860)) ;v81=v69[v73];v73=v81[3 -0 ];end elseif ((4140>1267) and (v82==(892 -(492 + 188)))) then if (v79[v81[2 + 0 ]]==v81[4]) then v73=v73 + 1 ;else v73=v81[10 -7 ];end else local v2509;local v2510;v79[v81[1 + 1 ]]=v79[v81[2 + 1 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[3]][v81[5 -1 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[1 + 2 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[6 -4 ]]= #v79[v81[1 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v2510=v81[4 -2 ];v79[v2510]=v79[v2510](v13(v79,v2510 + 1 ,v81[3]));v73=v73 + 1 + 0 ;v81=v69[v73];v2510=v81[1 + 1 ];v2509=v79[v81[3 -0 ]];v79[v2510 + (3 -2) ]=v2509;v79[v2510]=v2509[v81[5 -1 ]];v73=v73 + (1 -0) ;v81=v69[v73];v2510=v81[2];v79[v2510]=v79[v2510](v79[v2510 + (1252 -(1190 + 61)) ]);v73=v73 + 1 ;v81=v69[v73];v2510=v81[2 + 0 ];v2509=v79[v81[3]];v79[v2510 + 1 ]=v2509;v79[v2510]=v2509[v81[1697 -(1448 + 245) ]];v73=v73 + (1 -0) ;v81=v69[v73];v2510=v81[4 -2 ];v79[v2510]=v79[v2510](v79[v2510 + (2 -1) ]);v73=v73 + (2 -1) ;v81=v69[v73];if ((1574<=3202) and (v79[v81[2 -0 ]]==v79[v81[827 -(528 + 295) ]])) then v73=v73 + (1 -0) ;else v73=v81[3];end end elseif ((3012>=1963) and (v82<=(1568 -(1224 + 123)))) then if (v82<=(44 + 173)) then if (v82<=(852 -(97 + 540))) then if (v82==(2182 -(484 + 1484))) then local v2529;local v2530;v79[v81[1554 -(1398 + 154) ]]=v79[v81[3 + 0 ]][v81[9 -5 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[532 -(354 + 176) ]]=v79[v81[7 -4 ]][v81[1 + 3 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[2 + 1 ]][v81[1434 -(649 + 781) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[5 -2 ]][v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[779 -(126 + 651) ]]=v79[v81[3]][v81[8 -4 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v2530=v81[1 + 1 ];v2529=v79[v81[6 -3 ]];v79[v2530 + (2 -1) ]=v2529;v79[v2530]=v2529[v81[1 + 3 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v81[1032 -(179 + 850) ];v73=v73 + (785 -(34 + 750)) ;v81=v69[v73];v2530=v81[307 -(302 + 3) ];v79[v2530]=v79[v2530](v13(v79,v2530 + 1 + 0 ,v81[3 -0 ]));v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[7 -4 ]][v81[5 -1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[3 -1 ]][v81[2 + 1 ]]=v79[v81[6 -2 ]];else local v2553=0 + 0 ;local v2554;while true do if (v2553==0) then v2554=v81[2];v79[v2554](v13(v79,v2554 + (105 -(56 + 48)) ,v81[3 + 0 ]));break;end end end elseif (v82==(176 + 40)) then local v2555;local v2556;v79[v81[2 -0 ]]=v79[v81[85 -(7 + 75) ]][v81[1 + 3 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[257 -(170 + 85) ]]=v79[v81[352 -(288 + 61) ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[2 + 1 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v2556=v81[4 -2 ];v2555=v79[v81[3]];v79[v2556 + 1 ]=v2555;v79[v2556]=v2555[v81[741 -(330 + 407) ]];v73=v73 + (189 -(29 + 159)) ;v81=v69[v73];v79[v81[3 -1 ]]=v81[13 -10 ];v73=v73 + (1 -0) ;v81=v69[v73];v2556=v81[2];v79[v2556]=v79[v2556](v13(v79,v2556 + 1 + 0 ,v81[760 -(15 + 742) ]));v73=v73 + (451 -(414 + 36)) ;v81=v69[v73];if v79[v81[2]] then v73=v73 + (1507 -(745 + 761)) ;else v73=v81[2 + 1 ];end else local v2572=0;local v2573;local v2574;while true do if ((1 + 1)==v2572) then v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[4 -1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v2572=1082 -(126 + 953) ;end if ((v2572==(1706 -(759 + 941))) or (409>=2330)) then v79[v81[2 + 0 ]][v81[1607 -(896 + 708) ]]=v81[1 + 3 ];break;end if (v2572==(1578 -(555 + 1022))) then v81=v69[v73];v2574=v81[2];v79[v2574](v13(v79,v2574 + 1 ,v81[1 + 2 ]));v73=v73 + (142 -(14 + 127)) ;v2572=1 + 1 ;end if ((v2572==(800 -(141 + 654))) or (1958<=972)) then v81=v69[v73];v79[v81[2]][v81[934 -(156 + 775) ]]=v81[1594 -(167 + 1423) ];v73=v73 + (2 -1) ;v81=v69[v73];v2572=17 -11 ;end if (v2572==(3 + 0)) then v2574=v81[2];v2573=v79[v81[1 + 2 ]];v79[v2574 + (2 -1) ]=v2573;v79[v2574]=v2573[v81[3 + 1 ]];v2572=4;end if ((2411<3398) and (v2572==(1880 -(1625 + 255)))) then v2573=nil;v2574=nil;v79[v81[2]][v81[3 + 0 ]]=v79[v81[4]];v73=v73 + 1 + 0 ;v2572=1517 -(1026 + 490) ;end if ((v2572==(4 + 0)) or (1492<=1445)) then v73=v73 + (1735 -(16 + 1718)) ;v81=v69[v73];v79[v81[1 + 1 ]]={};v73=v73 + 1 + 0 ;v2572=14 -9 ;end end end elseif (v82<=(328 -109)) then if ((v82>(796 -(168 + 410))) or (2277>4033)) then local v2575;local v2576;v79[v81[1 + 1 ]]=v79[v81[13 -10 ]][v81[811 -(134 + 673) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[1911 -(1174 + 734) ]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[4 -1 ]][v81[9 -5 ]];v73=v73 + 1 ;v81=v69[v73];v2576=v81[2];v2575=v79[v81[10 -7 ]];v79[v2576 + 1 ]=v2575;v79[v2576]=v2575[v81[2 + 2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 -0 ]]=v81[1 + 2 ];v73=v73 + 1 ;v81=v69[v73];v2576=v81[2];v79[v2576]=v79[v2576](v13(v79,v2576 + 1 ,v81[11 -8 ]));v73=v73 + 1 + 0 ;v81=v69[v73];if (v79[v81[2]] or (1801==2601)) then v73=v73 + (3 -2) ;else v73=v81[3];end else v79[v81[2 -0 ]]=v79[v81[3 -0 ]][v81[1 + 3 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]();v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[5 -3 ]]=v62[v81[515 -(289 + 223) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[2 + 1 ]][v81[644 -(514 + 126) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3 -0 ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[9 -6 ]][v81[3 + 1 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[1 + 2 ]][v81[9 -5 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[3 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[610 -(4 + 604) ]][v81[3]]=v79[v81[12 -8 ]];v73=v73 + (3 -2) ;v81=v69[v73];v73=v81[13 -10 ];end elseif (v82==(218 + 2)) then local v2605=0;local v2606;local v2607;while true do if ((v2605==(1 + 1)) or (778>=1120)) then v2607=v81[7 -5 ];v2606=v79[v81[1448 -(344 + 1101) ]];v79[v2607 + 1 ]=v2606;v79[v2607]=v2606[v81[4]];v2605=7 -4 ;end if (((690==690) and (v2605==(10 -4))) or (2242>=2842)) then v79[v81[2]]=v62[v81[3 + 0 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2]]=v79[v81[13 -10 ]][v81[5 -1 ]];v2605=7 + 0 ;end if ((v2605==(302 -(57 + 244))) or (2201>3725)) then v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3]][v81[3 + 1 ]];v73=v73 + (2 -1) ;v81=v69[v73];v2605=2;end if ((2438>592) and (v2605==3)) then v73=v73 + (1964 -(883 + 1080)) ;v81=v69[v73];v79[v81[202 -(138 + 62) ]]=v79[v81[1 + 2 ]][v81[16 -12 ]];v73=v73 + (84 -(62 + 21)) ;v2605=4 + 0 ;end if (v2605==(1449 -(1036 + 413))) then v2606=nil;v2607=nil;v79[v81[3 -1 ]]=v79[v81[3]][v81[4]];v73=v73 + 1 ;v2605=1 + 0 ;end if ((v2605==8) or (710<460)) then v81=v69[v73];v2607=v81[2];v79[v2607](v79[v2607 + (2 -1) ]);v73=v73 + (3 -2) ;v2605=30 -21 ;end if ((v2605==4) or (822>=4397) or (4409<1868)) then v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[3]][v81[7 -3 ]];v73=v73 + (3 -2) ;v81=v69[v73];v2605=1477 -(649 + 823) ;end if (v2605==(14 -5)) then v81=v69[v73];v73=v81[1566 -(1202 + 361) ];break;end if (v2605==5) then v2607=v81[7 -5 ];v79[v2607](v13(v79,v2607 + 1 ,v81[5 -2 ]));v73=v73 + (1710 -(263 + 1446)) ;v81=v69[v73];v2605=5 + 1 ;end if ((4465>742) and ((v2605==(2 + 5)) or (2381==829))) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v81[1 + 2 ];v73=v73 + 1 ;v2605=751 -(387 + 356) ;end end else local v2608=0 -0 ;local v2609;local v2610;local v2611;while true do if ((4309>2374) and (v2608==(18 -13))) then v73=v73 + 1 ;v81=v69[v73];v2610=v81[3];v2609=v79[v2610];for v5143=v2610 + 1 + 0 ,v81[8 -4 ] do v2609=v2609   .. v79[v5143] ;end v2608=1722 -(646 + 1070) ;end if (v2608==(2 + 4)) then v79[v81[2 + 0 ]]=v2609;v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]][v81[3]]=v79[v81[14 -10 ]];v73=v73 + 1 + 0 ;v2608=16 -9 ;end if ((3006<=4062) and ((1104 -(288 + 809))==v2608)) then v81=v69[v73];v79[v81[1655 -(471 + 1182) ]][v81[1498 -(385 + 1110) ]]=v81[1613 -(1201 + 408) ];v73=v73 + (1848 -(747 + 1100)) ;v81=v69[v73];v79[v81[2 + 0 ]][v81[3]]=v81[4];v2608=619 -(269 + 342) ;end if ((v2608==(5 -1)) or (1740<=1353)) then v81=v69[v73];v79[v81[2]]=v79[v81[7 -4 ]][v81[350 -(263 + 83) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[6 -4 ]]=v81[3];v2608=826 -(659 + 162) ;end if (v2608==(2 -1)) then v81=v69[v73];v2611=v81[2];v2610=v79[v81[3]];v79[v2611 + 1 ]=v2610;v79[v2611]=v2610[v81[219 -(109 + 106) ]];v2608=2 -0 ;end if ((3655==3655) and (v2608==(1165 -(1157 + 8)))) then v2609=nil;v2610=nil;v2611=nil;v79[v81[2]]=v62[v81[514 -(179 + 332) ]];v73=v73 + (838 -(705 + 132)) ;v2608=1 + 0 ;end if (v2608==8) then v73=v73 + 1 + 0 ;v81=v69[v73];v2611=v81[1 + 1 ];v79[v2611](v13(v79,v2611 + (3 -2) ,v81[3 + 0 ]));break;end if (v2608==(45 -(17 + 26))) then v73=v73 + (1963 -(1866 + 96)) ;v81=v69[v73];v79[v81[1 + 1 ]]={};v73=v73 + (2 -1) ;v81=v69[v73];v2608=5 -2 ;end if ((3059==3059) and (1842<3479) and (v2608==(6 -3))) then v79[v81[7 -5 ]][v81[7 -4 ]]=v81[4];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[7 -5 ]]=v81[1134 -(725 + 406) ];v73=v73 + (2 -1) ;v2608=1 + 3 ;end end end elseif (v82<=225) then if ((v82<=(598 -(198 + 177))) or (4295<3919)) then if (v82==(614 -392)) then v79[v81[2]][v81[3]]=v81[6 -2 ];else local v2614=v81[2 + 0 ];local v2615={v79[v2614](v13(v79,v2614 + (3 -2) ,v74))};local v2616=0 + 0 ;for v3061=v2614,v81[4] do v2616=v2616 + 1 ;v79[v3061]=v2615[v2616];end end elseif ((v82>(7 + 217)) or (3467>4636)) then v79[v81[2 + 0 ]]=v79[v81[3 + 0 ]][v81[15 -11 ]];else v79[v81[2]]=v79[v81[1723 -(1082 + 638) ]][v81[1366 -(1322 + 40) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]=v79[v81[1651 -(435 + 1213) ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v62[v81[991 -(696 + 292) ]]=v79[v81[4 -2 ]];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[2]]=v81[13 -10 ];v73=v73 + (4 -3) ;v81=v69[v73];v73=v81[1468 -(731 + 734) ];end elseif (v82<=(1798 -(1286 + 285))) then if (v82==226) then local v2627=0 -0 ;while true do if ((414<=1748) and (v2627==2)) then v81=v69[v73];v79[v81[2]]=v79[v81[2 + 1 ]][v81[12 -8 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v2627=3;end if ((19 -13)==v2627) then v79[v81[1263 -(1048 + 213) ]][v81[5 -2 ]]=v79[v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[1 + 2 ];break;end if ((v2627==1) or (4268<4125)) then v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[1360 -(223 + 1134) ]];v73=v73 + (4 -3) ;v2627=2;end if (v2627==(1885 -(982 + 899))) then v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3 -0 ]][v81[2 + 2 ]];v73=v73 + 1 ;v2627=16 -11 ;end if ((4286>1709) and (v2627==(7 -2))) then v81=v69[v73];v79[v81[2]]=v62[v81[1486 -(310 + 1173) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v2627=20 -14 ;end if (v2627==(1454 -(968 + 483))) then v79[v81[2]]=v79[v81[227 -(37 + 187) ]][v81[1 + 3 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[497 -(204 + 290) ]][v81[845 -(680 + 161) ]];v2627=1 + 3 ;end if (v2627==(1068 -(979 + 89))) then v79[v81[2]]=v79[v81[3]][v81[1878 -(802 + 1072) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]();v2627=2 -1 ;end end else v79[v81[1 + 1 ]]=v79[v81[3 + 0 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[6 -3 ]][v81[1 + 3 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[6 -3 ]][v81[1998 -(1413 + 581) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[1218 -(630 + 584) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[6 -4 ]]=v62[v81[1131 -(184 + 944) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[955 -(927 + 26) ]][v81[8 -5 ]]=v79[v81[644 -(284 + 356) ]];v73=v73 + 1 ;v81=v69[v73];v73=v81[2 + 1 ];end elseif ((4116>3989) and (v82<=(521 -293))) then local v2641;local v2642;v79[v81[2 + 0 ]]=v79[v81[2 + 1 ]][v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1130 -(211 + 917) ]]=v79[v81[3 + 0 ]][v81[1799 -(1151 + 644) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[4 -1 ]][v81[1904 -(745 + 1155) ]];v73=v73 + (2 -1) ;v81=v69[v73];v2642=v81[316 -(27 + 287) ];v2641=v79[v81[4 -1 ]];v79[v2642 + (2 -1) ]=v2641;v79[v2642]=v2641[v81[9 -5 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[218 -(148 + 68) ]]=v81[1 + 2 ];v73=v73 + 1 + 0 ;v81=v69[v73];v2642=v81[2 + 0 ];v79[v2642]=v79[v2642](v13(v79,v2642 + 1 + 0 ,v81[2 + 1 ]));v73=v73 + 1 ;v81=v69[v73];if v79[v81[1176 -(1064 + 110) ]] then v73=v73 + (20 -(9 + 10)) ;else v73=v81[1 + 2 ];end elseif (v82>(2124 -(1219 + 676))) then local v3298;local v3299;v79[v81[1143 -(130 + 1011) ]]=v79[v81[3]][v81[1975 -(1639 + 332) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]();v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v62[v81[2 + 1 ]];v73=v73 + (249 -(229 + 19)) ;v81=v69[v73];v79[v81[2]]=v79[v81[126 -(21 + 102) ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1187 -(931 + 254) ]]=v79[v81[1 + 2 ]][v81[449 -(428 + 17) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[90 -(26 + 62) ]]=v79[v81[1083 -(173 + 907) ]][v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v3299=v81[133 -(71 + 60) ];v3298=v79[v81[7 -4 ]];v79[v3299 + (1229 -(774 + 454)) ]=v3298;v79[v3299]=v3298[v81[1606 -(849 + 753) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[5 -3 ]]=v81[6 -3 ];v73=v73 + (1217 -(861 + 355)) ;v81=v69[v73];v3299=v81[2 -0 ];v79[v3299]=v79[v3299](v13(v79,v3299 + 1 + 0 ,v81[8 -5 ]));v73=v73 + 1 ;v81=v69[v73];if v79[v81[2]] then v73=v73 + 1 + 0 ;else v73=v81[6 -3 ];end else v79[v81[1145 -(455 + 688) ]]=v79[v81[1347 -(481 + 863) ]][v81[2 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[1971 -(896 + 1072) ]][v81[4]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[6 -3 ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[790 -(50 + 738) ]]=v79[v81[3 + 0 ]][v81[10 -6 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1555 -(1128 + 425) ]]=v79[v81[1 + 2 ]][v81[460 -(398 + 58) ]];v73=v73 + (713 -(194 + 518)) ;v81=v69[v73];v79[v81[2]][v81[3]]=v79[v81[379 -(42 + 333) ]];v73=v73 + (1445 -(1308 + 136)) ;v81=v69[v73];v73=v81[3];end elseif (v82<=(132 + 115)) then if (v82<=(358 -(56 + 64))) then if ((v82<=234) or (4890<=1776)) then if (v82<=(928 -(251 + 445))) then if (v82>(84 + 147)) then local v2657;local v2658;v79[v81[2]][v81[3]]=v79[v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v2658=v81[2 + 0 ];v79[v2658](v13(v79,v2658 + (1570 -(999 + 570)) ,v81[4 -1 ]));v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[3 -1 ]]=v62[v81[1702 -(1476 + 223) ]];v73=v73 + (1837 -(597 + 1239)) ;v81=v69[v73];v2658=v81[6 -4 ];v2657=v79[v81[2 + 1 ]];v79[v2658 + 1 ]=v2657;v79[v2658]=v2657[v81[888 -(590 + 294) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[791 -(433 + 356) ]]={};v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]][v81[3]]=v81[1260 -(791 + 465) ];v73=v73 + (1115 -(1048 + 66)) ;v81=v69[v73];v79[v81[1 + 1 ]][v81[3]]=v81[16 -12 ];else local v2675=1997 -(666 + 1331) ;local v2676;local v2677;local v2678;while true do if ((2939>2019) and (v2675==(1900 -(854 + 1046)))) then v2676=v81[5 -3 ];v2677=v79[v2676 + 2 + 0 ];v2675=2 -1 ;end if ((v2675==2) or (4277<=2648) or (3600>4623)) then if ((v2677>(0 + 0)) or (1825>=2082)) then if ((4410>1585) and ((v2678<=v79[v2676 + 1 ]) or (4726<=1924))) then local v5276=96 -(61 + 35) ;while true do if (v5276==(0 -0)) then v73=v81[1 + 2 ];v79[v2676 + (1821 -(1591 + 227)) ]=v2678;break;end end end elseif (v2678>=v79[v2676 + (1 -0) ]) then v73=v81[3];v79[v2676 + (794 -(173 + 618)) ]=v2678;end break;end if (v2675==1) then v2678=v79[v2676] + v2677 ;v79[v2676]=v2678;v2675=2;end end end elseif ((v82>(1556 -(588 + 735))) or (4285==495)) then v79[v81[2]]=v79[v81[583 -(170 + 410) ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]();v73=v73 + 1 ;v81=v69[v73];v79[v81[4 -2 ]]=v62[v81[1 + 2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[555 -(362 + 190) ]][v81[852 -(529 + 319) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[6 -4 ]]=v79[v81[2 + 1 ]][v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[4]];v73=v73 + (1201 -(829 + 371)) ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[2 + 1 ]][v81[4]];v73=v73 + (1677 -(700 + 976)) ;v81=v69[v73];v79[v81[4 -2 ]][v81[4 -1 ]]=v81[4 + 0 ];v73=v73 + (1642 -(1137 + 504)) ;v81=v69[v73];v73=v81[10 -7 ];else local v2694=0 -0 ;local v2695;local v2696;while true do if (v2694==(8 -2)) then v79[v81[1 + 1 ]][v81[3 + 0 ]]=v81[1618 -(327 + 1287) ];break;end if ((242<=2400) and (9<3534) and (v2694==(1 -0))) then v81=v69[v73];v2696=v81[2 -0 ];v79[v2696](v13(v79,v2696 + 1 + 0 ,v81[8 -5 ]));v73=v73 + 1 ;v2694=1115 -(224 + 889) ;end if (v2694==(1225 -(574 + 646))) then v81=v69[v73];v79[v81[609 -(83 + 524) ]][v81[771 -(577 + 191) ]]=v81[3 + 1 ];v73=v73 + 1 ;v81=v69[v73];v2694=5 + 1 ;end if ((778<=1453) and (v2694==(803 -(248 + 551)))) then v73=v73 + (78 -(53 + 24)) ;v81=v69[v73];v79[v81[2]]={};v73=v73 + 1 ;v2694=138 -(12 + 121) ;end if ((2803>=1519) and ((v2694==(8 -5)) or (2777==4054))) then v2696=v81[3 -1 ];v2695=v79[v81[3]];v79[v2696 + (607 -(164 + 442)) ]=v2695;v79[v2696]=v2695[v81[4]];v2694=4;end if (v2694==(1 + 1)) then v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[8 -5 ]];v73=v73 + (2 -1) ;v81=v69[v73];v2694=3;end if (v2694==(0 + 0)) then v2695=nil;v2696=nil;v79[v81[2 + 0 ]][v81[6 -3 ]]=v79[v81[4 + 0 ]];v73=v73 + 1 ;v2694=1;end end end elseif ((2818==2818) and (v82<=(1483 -(585 + 662)))) then if (v82==(162 + 73)) then v79[v81[1 + 1 ]]=v79[v81[583 -(126 + 454) ]][v81[418 -(366 + 48) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[1686 -(1633 + 50) ]][v81[1105 -(892 + 209) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[5 -2 ]][v81[664 -(495 + 165) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[7 -4 ]][v81[2 + 2 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[1 + 2 ]][v81[586 -(431 + 151) ]];v73=v73 + (1 -0) ;v81=v69[v73];if ((v79[v81[17 -(10 + 5) ]]==v81[4]) or (2117==3859)) then v73=v73 + (423 -(403 + 19)) ;else v73=v81[1774 -(454 + 1317) ];end else v79[v81[1 + 1 ]]=v62[v81[1817 -(187 + 1627) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1954 -(832 + 1120) ]][v81[8 -5 ]]=v79[v81[1 + 3 ]];v73=v73 + (1097 -(1001 + 95)) ;v81=v69[v73];v79[v81[31 -(4 + 25) ]]=v62[v81[1164 -(904 + 257) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[3 -0 ]][v81[9 -5 ]];v73=v73 + 1 ;v81=v69[v73];if ((v79[v81[2]]==v81[18 -14 ]) or (1527==4996)) then v73=v73 + 1 + 0 ;else v73=v81[4 -1 ];end end elseif (v82>(2026 -(735 + 1054))) then local v2716;local v2717;v79[v81[1695 -(418 + 1275) ]]=v79[v81[2 + 1 ]][v81[11 -7 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[1476 -(784 + 688) ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[1252 -(374 + 875) ]][v81[9 -5 ]];v73=v73 + 1 ;v81=v69[v73];v2717=v81[2];v2716=v79[v81[983 -(304 + 676) ]];v79[v2717 + 1 ]=v2716;v79[v2717]=v2716[v81[2 + 2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v81[1361 -(517 + 841) ];v73=v73 + (867 -(356 + 510)) ;v81=v69[v73];v2717=v81[3 -1 ];v79[v2717]=v79[v2717](v13(v79,v2717 + (2 -1) ,v81[1212 -(306 + 903) ]));v73=v73 + 1 ;v81=v69[v73];if v79[v81[1105 -(70 + 1033) ]] then v73=v73 + (4 -3) ;else v73=v81[3];end else do return;end end elseif ((v82<=(159 + 83)) or (3051>=4725)) then if (v82<=(163 + 77)) then if (v82==(114 + 125)) then v79[v81[806 -(523 + 281) ]]=v79[v81[925 -(241 + 681) ]];else v62[v81[3]]=v79[v81[1100 -(358 + 740) ]];end elseif ((v82>(166 + 75)) or (110>=1610)) then local v2736=0 -0 ;local v2737;local v2738;local v2739;while true do if (v2736==(1041 -(1005 + 36))) then v2737=nil;v2738=nil;v2739=nil;v79[v81[2]]=v62[v81[3]];v73=v73 + 1 + 0 ;v2736=703 -(533 + 169) ;end if ((v2736==(1 + 0)) or (3813<=668)) then v81=v69[v73];v2739=v81[2 + 0 ];v2738=v79[v81[1 + 2 ]];v79[v2739 + 1 ]=v2738;v79[v2739]=v2738[v81[4]];v2736=1527 -(817 + 708) ;end if ((4 -2)==v2736) then v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]={};v73=v73 + 1 ;v81=v69[v73];v2736=1701 -(636 + 1062) ;end if ((3015==3015) and (v2736==(24 -18))) then v79[v81[2]]=v2737;v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1660 -(1130 + 528) ]][v81[3]]=v79[v81[13 -9 ]];v73=v73 + 1 + 0 ;v2736=150 -(115 + 28) ;end if ((3513>1547) and (v2736==(3 + 4))) then v81=v69[v73];v79[v81[2]][v81[3]]=v81[1385 -(1076 + 305) ];v73=v73 + (1770 -(1198 + 571)) ;v81=v69[v73];v79[v81[1519 -(629 + 888) ]][v81[6 -3 ]]=v81[2 + 2 ];v2736=12 -4 ;end if ((3562>=2625) and (v2736==(3 + 6))) then v81=v69[v73];v79[v81[171 -(113 + 56) ]]=v81[1256 -(521 + 732) ];break;end if (v2736==(8 -3)) then v73=v73 + 1 ;v81=v69[v73];v2738=v81[1541 -(99 + 1439) ];v2737=v79[v2738];for v5145=v2738 + 1 ,v81[3 + 1 ] do v2737=v2737   .. v79[v5145] ;end v2736=19 -13 ;end if (v2736==(15 -11)) then v81=v69[v73];v79[v81[410 -(39 + 369) ]]=v79[v81[1962 -(870 + 1089) ]][v81[799 -(564 + 231) ]];v73=v73 + (1922 -(1893 + 28)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[529 -(140 + 386) ];v2736=3 + 2 ;end if ((3084<=3547) and (v2736==8)) then v73=v73 + 1 ;v81=v69[v73];v2739=v81[1 + 1 ];v79[v2739](v13(v79,v2739 + 1 ,v81[2 + 1 ]));v73=v73 + (1917 -(485 + 1431)) ;v2736=21 -12 ;end if (v2736==(4 -1)) then v79[v81[1 + 1 ]][v81[3 + 0 ]]=v81[16 -12 ];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1183 -(945 + 236) ]]=v81[6 -3 ];v73=v73 + 1 ;v2736=4;end end else local v2740;local v2741;v79[v81[1 + 1 ]]=v79[v81[6 -3 ]][v81[9 -5 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[515 -(383 + 130) ]]=v79[v81[906 -(643 + 260) ]][v81[1451 -(109 + 1338) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[13 -10 ]][v81[748 -(338 + 406) ]];v73=v73 + (2 -1) ;v81=v69[v73];v2741=v81[2];v2740=v79[v81[478 -(20 + 455) ]];v79[v2741 + (4 -3) ]=v2740;v79[v2741]=v2740[v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v81[3 -0 ];v73=v73 + (76 -(39 + 36)) ;v81=v69[v73];v2741=v81[2 + 0 ];v79[v2741]=v79[v2741](v13(v79,v2741 + 1 + 0 ,v81[1709 -(609 + 1097) ]));v73=v73 + (659 -(543 + 115)) ;v81=v69[v73];if v79[v81[2 + 0 ]] then v73=v73 + (1 -0) ;else v73=v81[5 -2 ];end end elseif (v82<=(692 -448)) then if (v82>(1851 -(1559 + 49))) then local v2756=622 -(317 + 305) ;local v2757;local v2758;local v2759;local v2760;local v2761;while true do if (v2756==4) then v74=(v2759 + v2761) -1 ;v2758=0 -0 ;for v5146=v2761,v74 do v2758=v2758 + (4 -3) ;v79[v5146]=v2757[v2758];end v73=v73 + (828 -(509 + 318)) ;v2756=5;end if (v2756==(1820 -(384 + 1433))) then v73=v73 + 1 + 0 ;v81=v69[v73];v2761=v81[5 -3 ];v2757,v2759=v72(v79[v2761](v79[v2761 + 1 + 0 ]));v2756=17 -13 ;end if (v2756==(1534 -(198 + 1336))) then v2757=nil;v2758=nil;v2757,v2759=nil;v2760=nil;v2756=1 + 0 ;end if (v2756==6) then for v5149=v2761,v81[1409 -(1149 + 256) ] do v2758=v2758 + (2 -1) ;v79[v5149]=v2757[v2758];end v73=v73 + (1 -0) ;v81=v69[v73];v73=v81[1769 -(1280 + 486) ];break;end if (v2756==1) then v2761=nil;v79[v81[2]]=v62[v81[5 -2 ]];v73=v73 + 1 ;v81=v69[v73];v2756=2;end if ((v2756==5) or (4979==2870) or (539>1215)) then v81=v69[v73];v2761=v81[2 -0 ];v2757={v79[v2761](v13(v79,v2761 + (1609 -(786 + 822)) ,v74))};v2758=0;v2756=6;end if ((3782<4871) and ((v2756==(4 -2)) or (2187<1395))) then v2761=v81[2];v2760=v79[v81[1 + 2 ]];v79[v2761 + 1 + 0 ]=v2760;v79[v2761]=v2760[v81[4 + 0 ]];v2756=1463 -(1303 + 157) ;end end else local v2762=0 + 0 ;local v2763;while true do if (((1424 -(505 + 910))==v2762) or (2054<=699) or (924>=3985)) then v73=v73 + 1 ;v81=v69[v73];v73=v81[8 -5 ];break;end if (v2762==(873 -(548 + 320))) then v81=v69[v73];v79[v81[593 -(52 + 539) ]]=v79[v81[558 -(378 + 177) ]][v81[11 -7 ]];v73=v73 + (2 -1) ;v2762=4 + 2 ;end if (1==v2762) then v81=v69[v73];v79[v81[209 -(108 + 99) ]]=v79[v81[2 + 1 ]][v81[5 -1 ]];v73=v73 + 1 ;v2762=2;end if ((874<1579) and (v2762==3)) then v81=v69[v73];v62[v81[12 -9 ]]=v79[v81[2 + 0 ]];v73=v73 + (1 -0) ;v2762=3 + 1 ;end if (v2762==(6 + 2)) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[4 -2 ]]=v81[6 -3 ];v2762=4 + 5 ;end if (v2762==7) then v81=v69[v73];v2763=v81[3 -1 ];v79[v2763](v79[v2763 + 1 ]);v2762=3 + 5 ;end if ((4==v2762) or (1419<23)) then v81=v69[v73];v79[v81[9 -7 ]]=v62[v81[3 + 0 ]];v73=v73 + (840 -(823 + 16)) ;v2762=283 -(19 + 259) ;end if ((v2762==(1826 -(1780 + 40))) or (3006==1722)) then v81=v69[v73];v79[v81[4 -2 ]]=v81[7 -4 ];v73=v73 + 1 ;v2762=11 -4 ;end if (v2762==(3 -1)) then v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[12 -9 ]][v81[1 + 3 ]];v73=v73 + (3 -2) ;v2762=1 + 2 ;end if (v2762==0) then v2763=nil;v79[v81[4 -2 ]]=v79[v81[8 -5 ]][v81[1 + 3 ]];v73=v73 + (1181 -(825 + 355)) ;v2762=1;end end end elseif (v82<=245) then local v2764;v79[v81[862 -(846 + 14) ]]=v79[v81[3 + 0 ]][v81[4]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[374 -(237 + 133) ]];v73=v73 + (1187 -(624 + 562)) ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[4 -1 ]][v81[4 + 0 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[804 -(700 + 102) ]]=v79[v81[3]][v81[12 -8 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[7 -4 ]][v81[4 + 0 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v79[v81[7 -4 ]][v81[1 + 3 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1278 -(735 + 541) ]]=v79[v81[843 -(497 + 343) ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1785 -(995 + 788) ]]=v62[v81[9 -6 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[1 + 2 ]][v81[5 -1 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[200 -(37 + 161) ]]=v81[3];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[5 -3 ]]=v81[3 + 0 ];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[3];v73=v73 + 1 ;v81=v69[v73];v2764=v81[4 -2 ];v79[v2764]=v79[v2764](v13(v79,v2764 + (1273 -(357 + 915)) ,v81[678 -(50 + 625) ]));v73=v73 + (1881 -(1624 + 256)) ;v81=v69[v73];v79[v81[2]]=v79[v81[6 -3 ]] * v79[v81[4]] ;v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[1525 -(180 + 1343) ]][v81[3 + 0 ]]=v79[v81[1346 -(1057 + 285) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[6 -3 ];elseif ((v82==246) or (3390<2246)) then local v3336;local v3337;v79[v81[1405 -(135 + 1268) ]]=v79[v81[1424 -(1088 + 333) ]][v81[1686 -(1280 + 402) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[1 + 2 ]][v81[14 -10 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[3]][v81[4]];v73=v73 + (18 -(11 + 6)) ;v81=v69[v73];v3337=v81[2];v3336=v79[v81[3 + 0 ]];v79[v3337 + (1 -0) ]=v3336;v79[v3337]=v3336[v81[15 -11 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v81[1739 -(1015 + 721) ];v73=v73 + (2 -1) ;v81=v69[v73];v3337=v81[244 -(169 + 73) ];v79[v3337]=v79[v3337](v13(v79,v3337 + (1 -0) ,v81[1899 -(1052 + 844) ]));v73=v73 + (3 -2) ;v81=v69[v73];if ((1075<=4422) and v79[v81[18 -(5 + 11) ]]) then v73=v73 + (1516 -(210 + 1305)) ;else v73=v81[2 + 1 ];end else v79[v81[3 -1 ]]=v79[v81[750 -(646 + 101) ]][v81[380 -(12 + 364) ]];v73=v73 + (716 -(587 + 128)) ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[6 -3 ]][v81[9 -5 ]];v73=v73 + (228 -(196 + 31)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[540 -(227 + 310) ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[775 -(689 + 84) ]]=v79[v81[3]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1377 -(404 + 971) ]]=v79[v81[6 -3 ]][v81[1 + 3 ]];v73=v73 + (1398 -(764 + 633)) ;v81=v69[v73];v62[v81[3 + 0 ]]=v79[v81[1 + 1 ]];end elseif ((3270<4943) and (v82<=255)) then if (v82<=251) then if (v82<=(455 -(114 + 92))) then if (v82==(133 + 115)) then v79[v81[2]]=v79[v81[3]][v81[533 -(4 + 525) ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v79[v81[5 -2 ]][v81[1317 -(636 + 677) ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[1356 -(447 + 907) ]]=v79[v81[1801 -(303 + 1495) ]][v81[10 -6 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[1819 -(1446 + 370) ]][v81[555 -(245 + 306) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[10 -7 ]][v81[2 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v62[v81[1476 -(536 + 937) ]]=v79[v81[5 -3 ]];else local v2803;local v2804;local v2805;v79[v81[154 -(143 + 9) ]]=v62[v81[3]];v73=v73 + (1 -0) ;v81=v69[v73];v2805=v81[2];v2804=v79[v81[3]];v79[v2805 + 1 ]=v2804;v79[v2805]=v2804[v81[1078 -(474 + 600) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[6 -4 ]]={};v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]][v81[8 -5 ]]=v81[4];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]=v81[3];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1490 -(49 + 1439) ]]=v79[v81[1 + 2 ]][v81[15 -11 ]];v73=v73 + (1991 -(769 + 1221)) ;v81=v69[v73];v79[v81[2]]=v81[1 + 2 ];v73=v73 + (1073 -(270 + 802)) ;v81=v69[v73];v2804=v81[1859 -(301 + 1555) ];v2803=v79[v2804];for v3064=v2804 + 1 ,v81[2 + 2 ] do v2803=v2803   .. v79[v3064] ;end v79[v81[2]]=v2803;v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]][v81[78 -(22 + 53) ]]=v79[v81[2 + 2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[9 -7 ]][v81[3]]=v81[9 -5 ];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[4 -2 ]][v81[3 + 0 ]]=v81[3 + 1 ];v73=v73 + 1 ;v81=v69[v73];v2805=v81[1 + 1 ];v79[v2805](v13(v79,v2805 + (93 -(41 + 51)) ,v81[606 -(391 + 212) ]));v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]]=v62[v81[3 + 0 ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[6 -2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[3 -1 ]]=v79[v81[7 -4 ]][v81[2 + 2 ]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[5 -2 ]][v81[4 + 0 ]];v73=v73 + 1 ;v81=v69[v73];v62[v81[379 -(155 + 221) ]]=v79[v81[1 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1459 -(366 + 1091) ]]=v62[v81[3 + 0 ]];v73=v73 + (287 -(90 + 196)) ;v81=v69[v73];v79[v81[1776 -(1710 + 64) ]]=v79[v81[5 -2 ]][v81[19 -15 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2]]=v81[9 -6 ];v73=v73 + (1 -0) ;v81=v69[v73];v2805=v81[2 -0 ];v79[v2805](v79[v2805 + (268 -(72 + 195)) ]);v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1180 -(28 + 1150) ]]=v62[v81[1 + 2 ]];v73=v73 + (599 -(102 + 496)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3]][v81[448 -(181 + 263) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[10 -7 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v62[v81[1511 -(822 + 686) ]];v73=v73 + (2 -1) ;v81=v69[v73];v79[v81[4 -2 ]]=v79[v81[2 + 1 ]][v81[9 -5 ]];v73=v73 + (862 -(252 + 609)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[3];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]=v81[961 -(578 + 380) ];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1718 -(1431 + 285) ]]=v81[2 + 1 ];v73=v73 + (1 -0) ;v81=v69[v73];v2805=v81[2];v79[v2805]=v79[v2805](v13(v79,v2805 + 1 ,v81[4 -1 ]));v73=v73 + 1 ;v81=v69[v73];v79[v81[2]][v81[11 -8 ]]=v79[v81[4]];end elseif ((33<3093) and (v82>250)) then if v79[v81[3 -1 ]] then v73=v73 + (1 -0) ;else v73=v81[1115 -(1013 + 99) ];end elseif ((v79[v81[2]]~=v79[v81[8 -4 ]]) or (4251<1635)) then v73=v73 + 1 ;else v73=v81[3];end elseif (v82<=(1210 -(449 + 508))) then if ((4269>=2204) and (v82>(397 -145))) then local v2857;local v2858;v79[v81[2]]=v79[v81[1895 -(1562 + 330) ]][v81[1976 -(1870 + 102) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[3 -0 ]][v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v79[v81[5 -2 ]][v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];v2858=v81[2 + 0 ];v2857=v79[v81[2 + 1 ]];v79[v2858 + 1 ]=v2857;v79[v2858]=v2857[v81[1 + 3 ]];v73=v73 + (995 -(550 + 444)) ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[5 -2 ];v73=v73 + 1 + 0 ;v81=v69[v73];v2858=v81[1 + 1 ];v79[v2858]=v79[v2858](v13(v79,v2858 + 1 + 0 ,v81[3]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[3]][v81[4]];v73=v73 + (581 -(544 + 36)) ;v81=v69[v73];if ((3820==3820) and (v79[v81[1233 -(70 + 1161) ]]==v81[4])) then v73=v73 + 1 + 0 ;else v73=v81[760 -(130 + 627) ];end else local v2875=0 -0 ;local v2876;local v2877;while true do if ((v2875==(311 -(121 + 190))) or (983>2025)) then v2876=nil;v2877=nil;v79[v81[7 -5 ]][v81[3]]=v79[v81[4 + 0 ]];v73=v73 + (4 -3) ;v2875=1;end if ((4029>=3282) and (v2875==(327 -(255 + 67)))) then v81=v69[v73];v79[v81[2 + 0 ]][v81[6 -3 ]]=v81[282 -(225 + 53) ];v73=v73 + (1 -0) ;v81=v69[v73];v2875=6;end if ((v2875==(1303 -(738 + 561))) or (2130>3833)) then v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[2 + 0 ]]={};v73=v73 + 1 + 0 ;v2875=1616 -(1450 + 161) ;end if (v2875==(1734 -(183 + 1545))) then v79[v81[1 + 1 ]][v81[1173 -(736 + 434) ]]=v81[4 + 0 ];break;end if ((v2875==(4 -3)) or (956>=2506)) then v81=v69[v73];v2877=v81[41 -(32 + 7) ];v79[v2877](v13(v79,v2877 + (3 -2) ,v81[376 -(103 + 270) ]));v73=v73 + 1 + 0 ;v2875=2 + 0 ;end if ((1297==1297) and (v2875==3)) then v2877=v81[2];v2876=v79[v81[1456 -(1021 + 432) ]];v79[v2877 + 1 ]=v2876;v79[v2877]=v2876[v81[4]];v2875=15 -11 ;end if ((3807>=3343) and (v2875==2)) then v81=v69[v73];v79[v81[1416 -(153 + 1261) ]]=v62[v81[1 + 2 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v2875=891 -(800 + 88) ;end end end elseif (v82>(41 + 213)) then local v2878=0;local v2879;local v2880;while true do if (v2878==(16 -10)) then v73=v73 + (822 -(358 + 463)) ;v81=v69[v73];v2880=v81[260 -(176 + 82) ];v2878=17 -10 ;end if ((v2878==(775 -(543 + 227))) or (877==2696)) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v81[11 -8 ];v2878=1792 -(1509 + 277) ;end if (v2878==(1961 -(1453 + 507))) then v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[11 -8 ]][v81[4]];v2878=7 -5 ;end if (v2878==(2 + 6)) then if ((2276<2567) and v79[v81[2]]) then v73=v73 + 1 ;else v73=v81[1 + 2 ];end break;end if ((0 -0)==v2878) then v2879=nil;v2880=nil;v79[v81[1033 -(22 + 1009) ]]=v79[v81[14 -11 ]][v81[1944 -(245 + 1695) ]];v2878=1036 -(611 + 424) ;end if (v2878==(302 -(280 + 18))) then v2879=v79[v81[3]];v79[v2880 + 1 ]=v2879;v79[v2880]=v2879[v81[4]];v2878=5;end if (v2878==(3 + 0)) then v73=v73 + (1 -0) ;v81=v69[v73];v2880=v81[4 -2 ];v2878=4;end if (v2878==(285 -(109 + 169))) then v79[v2880]=v79[v2880](v13(v79,v2880 + 1 + 0 ,v81[2 + 1 ]));v73=v73 + 1 ;v81=v69[v73];v2878=3 + 5 ;end if ((2329<=3267) and (v2878==2)) then v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]]=v79[v81[3]][v81[15 -11 ]];v2878=3;end end else local v2881=v81[4 -2 ];v79[v2881]=v79[v2881]();end elseif (v82<=(1601 -(875 + 467))) then if ((4508>=518) and (v82<=(112 + 145))) then if ((v82>(1191 -935)) or (1759<=550)) then v79[v81[2]]=v79[v81[7 -4 ]][v81[4]];v73=v73 + (3 -2) ;v81=v69[v73];v79[v81[801 -(717 + 82) ]]=v79[v81[1023 -(693 + 327) ]][v81[1915 -(746 + 1165) ]];v73=v73 + (1736 -(1473 + 262)) ;v81=v69[v73];v79[v81[2]]=v79[v81[3 + 0 ]][v81[1 + 3 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1875 -(874 + 999) ]]=v79[v81[8 -5 ]][v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v79[v81[7 -4 ]][v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];if ((3137<3640) and (v79[v81[2 + 0 ]]==v81[17 -13 ])) then v73=v73 + (1 -0) ;else v73=v81[3 + 0 ];end else local v2892;local v2893;v2893=v81[2 + 0 ];v2892=v79[v81[2 + 1 ]];v79[v2893 + (459 -(388 + 70)) ]=v2892;v79[v2893]=v2892[v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[9 -6 ];v73=v73 + 1 + 0 ;v81=v69[v73];v2893=v81[584 -(319 + 263) ];v79[v2893]=v79[v2893](v13(v79,v2893 + 1 ,v81[11 -8 ]));v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[2 + 1 ]][v81[3 + 1 ]];v73=v73 + 1 ;v81=v69[v73];if (v79[v81[816 -(94 + 720) ]]~=v81[382 -(78 + 300) ]) then v73=v73 + (1918 -(774 + 1143)) ;else v73=v81[2 + 1 ];end end elseif (v82==(449 -(18 + 173))) then local v2904;local v2905;v79[v81[5 -3 ]]=v79[v81[3 -0 ]][v81[10 -6 ]];v73=v73 + (4 -3) ;v81=v69[v73];v79[v81[1487 -(677 + 808) ]]();v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[3]];v73=v73 + (971 -(528 + 442)) ;v81=v69[v73];v2905=v81[5 -3 ];v2904=v79[v81[3]];v79[v2905 + (348 -(116 + 231)) ]=v2904;v79[v2905]=v2904[v81[4 + 0 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[7 -5 ]]=v81[1 + 2 ];v73=v73 + 1 ;v81=v69[v73];v2905=v81[1472 -(1242 + 228) ];v79[v2905]=v79[v2905](v13(v79,v2905 + (2 -1) ,v81[3]));v73=v73 + 1 ;v81=v69[v73];if v79[v81[2]] then v73=v73 + (845 -(320 + 524)) ;else v73=v81[3];end else local v2919=0 -0 ;local v2920;local v2921;while true do if (v2919==(7 -4)) then v79[v81[9 -7 ]]=v62[v81[1 + 2 ]];v73=v73 + (2 -1) ;v81=v69[v73];v2919=4;end if (v2919==5) then v79[v2921]=v2920[v81[479 -(63 + 412) ]];v73=v73 + 1 ;v81=v69[v73];v2919=1870 -(1299 + 565) ;end if ((11 -7)==v2919) then v2921=v81[1 + 1 ];v2920=v79[v81[12 -9 ]];v79[v2921 + 1 + 0 ]=v2920;v2919=5 + 0 ;end if (v2919==8) then v79[v81[2 + 0 ]][v81[10 -7 ]]=v81[332 -(79 + 249) ];break;end if ((18 -11)==v2919) then v79[v81[1632 -(305 + 1325) ]][v81[3]]=v81[4];v73=v73 + 1 ;v81=v69[v73];v2919=8;end if ((v2919==(1730 -(1585 + 143))) or (3452>3797)) then v79[v2921](v13(v79,v2921 + (3 -2) ,v81[3]));v73=v73 + (1831 -(1727 + 103)) ;v81=v69[v73];v2919=3;end if (v2919==(3 -2)) then v73=v73 + 1 + 0 ;v81=v69[v73];v2921=v81[2 + 0 ];v2919=6 -4 ;end if ((4943>=3868) and ((280 -(135 + 139))==v2919)) then v79[v81[2 + 0 ]]={};v73=v73 + 1 ;v81=v69[v73];v2919=9 -2 ;end if ((3351==3351) and (v2919==(0 + 0))) then v2920=nil;v2921=nil;v79[v81[1 + 1 ]][v81[3]]=v79[v81[1 + 3 ]];v2919=1;end end end elseif (v82<=(107 + 154)) then if (v82>260) then local v2922;local v2923;v79[v81[5 -3 ]]=v79[v81[3]][v81[1708 -(1084 + 620) ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1055 -(404 + 649) ]]=v79[v81[817 -(318 + 496) ]][v81[4]];v73=v73 + (1883 -(1730 + 152)) ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[10 -7 ]][v81[1865 -(527 + 1334) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v2923=v81[1948 -(464 + 1482) ];v2922=v79[v81[6 -3 ]];v79[v2923 + 1 + 0 ]=v2922;v79[v2923]=v2922[v81[4]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2]]=v81[572 -(485 + 84) ];v73=v73 + 1 + 0 ;v81=v69[v73];v2923=v81[2];v79[v2923]=v79[v2923](v13(v79,v2923 + 1 + 0 ,v81[2 + 1 ]));v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[1 + 1 ]][v81[3]]=v81[9 -5 ];v73=v73 + 1 + 0 ;v81=v69[v73];v73=v81[8 -5 ];else local v2941;local v2942;v79[v81[1003 -(359 + 642) ]]=v79[v81[1 + 2 ]][v81[2 + 2 ]];v73=v73 + (1345 -(564 + 780)) ;v81=v69[v73];v79[v81[6 -4 ]]=v79[v81[1 + 2 ]][v81[2 + 2 ]];v73=v73 + (1 -0) ;v81=v69[v73];v79[v81[2 -0 ]]=v79[v81[3]][v81[9 -5 ]];v73=v73 + 1 + 0 ;v81=v69[v73];v2942=v81[1428 -(909 + 517) ];v2941=v79[v81[462 -(432 + 27) ]];v79[v2942 + (1737 -(69 + 1667)) ]=v2941;v79[v2942]=v2941[v81[2 + 2 ]];v73=v73 + (123 -(16 + 106)) ;v81=v69[v73];v79[v81[2 + 0 ]]=v81[3];v73=v73 + (1253 -(1178 + 74)) ;v81=v69[v73];v2942=v81[2];v79[v2942]=v79[v2942](v13(v79,v2942 + 1 ,v81[1 + 2 ]));v73=v73 + (3 -2) ;v81=v69[v73];if v79[v81[449 -(312 + 135) ]] then v73=v73 + 1 + 0 ;else v73=v81[1 + 2 ];end end elseif ((v82<=(905 -643)) or (2453==2319)) then local v2957;local v2958;v79[v81[4 -2 ]]=v79[v81[1832 -(492 + 1337) ]][v81[2 + 2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[2 + 0 ]]=v79[v81[1393 -(814 + 576) ]][v81[7 -3 ]];v73=v73 + (2 -1) ;v81=v69[v73];v2958=v81[2 + 0 ];v2957=v79[v81[8 -5 ]];v79[v2958 + (2 -1) ]=v2957;v79[v2958]=v2957[v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v79[v81[2]]=v81[1 + 2 ];v73=v73 + (2 -1) ;v81=v69[v73];v2958=v81[2];v79[v2958]=v79[v2958](v13(v79,v2958 + 1 + 0 ,v81[1 + 2 ]));v73=v73 + (2 -1) ;v81=v69[v73];if v79[v81[1 + 1 ]] then v73=v73 + (1360 -(978 + 381)) ;else v73=v81[3];end elseif ((v82>(37 + 226)) or (3733==3964)) then v79[v81[1 + 1 ]]=v62[v81[1 + 2 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]][v81[3]]=v79[v81[8 -4 ]];v73=v73 + 1 ;v81=v69[v73];v79[v81[1 + 1 ]]=v62[v81[3]];v73=v73 + 1 ;v81=v69[v73];v79[v81[5 -3 ]]=v79[v81[3 + 0 ]][v81[9 -5 ]];v73=v73 + 1 ;v81=v69[v73];if ((2699<=3566) and (v79[v81[2 + 0 ]]==v81[4])) then v73=v73 + 1 + 0 ;else v73=v81[1 + 2 ];end else local v3381=569 -(397 + 172) ;while true do if (v3381==(0 -0)) then v79[v81[1119 -(267 + 850) ]]=v62[v81[3 + 0 ]];v73=v73 + (3 -2) ;v81=v69[v73];v3381=995 -(41 + 953) ;end if ((v3381==(16 -12)) or (4220<3303)) then if (v79[v81[1 + 1 ]]==v81[7 -3 ]) then v73=v73 + 1 ;else v73=v81[823 -(817 + 3) ];end break;end if ((460==460) and (v3381==(1387 -(867 + 518)))) then v79[v81[2]]=v62[v81[8 -5 ]];v73=v73 + (331 -(256 + 74)) ;v81=v69[v73];v3381=3 + 0 ;end if ((v3381==(2 + 1)) or (2210>2600)) then v79[v81[8 -6 ]]=v79[v81[3]][v81[191 -(111 + 76) ]];v73=v73 + 1 + 0 ;v81=v69[v73];v3381=1055 -(100 + 951) ;end if (v3381==(626 -(369 + 256))) then v79[v81[8 -6 ]][v81[3]]=v79[v81[4]];v73=v73 + 1 + 0 ;v81=v69[v73];v3381=2;end end end v73=v73 + (64 -(25 + 38)) ;break;end if (v88==(1036 -(890 + 146))) then v81=v69[v73];v82=v81[2 -1 ];v88=1 + 0 ;end end end end;end return v29(v28(),{},v17)(...);end return v15("LOL!2D3Q00030B3Q00427269636B48656C70657203093Q00412Q64546F2Q676C6503043Q004E616D6503363Q004175746F2D48656C702077697468202Q27547269702050656F706C652Q27207461736B20666F722063682Q6F73656E20706C6179657203073Q0044656661756C74010003083Q0043612Q6C6261636B030B3Q00436C6F756448656C70657203393Q004175746F2D48656C702077697468202Q275069636B2055702050656F706C652Q27207461736B20666F722063682Q6F73656E20706C6179657203403Q00416E63686F7220796F757273656C6620666F72202Q2744656174682046726F6D2041626F76652Q27207461736B20666F722063682Q6F73656E20706C61796572030E3Q00576F726D686F6C6548656C70657203363Q00416E63686F7220796F757273656C6620666F72202Q27416D627573682Q27207461736B20666F722063682Q6F73656E20706C6179657203093Q0052756E48656C70657203383Q004175746F2D48656C702077697468202Q2747657420352Q30204B692Q6C732Q27207461736B20666F722063682Q6F73656E20706C61796572030A3Q004F2Q627948656C706572034B3Q004175746F2D48656C702077697468202Q274B692Q6C20352Q302050656F706C652077697468206B692Q6C20627269636B732Q27207461736B20666F722063682Q6F73656E20706C61796572033C3Q00416E63686F7220796F757273656C6620666F72202Q27536C617020456E656D6965732Q27207461736B20666F722063682Q6F73656E20706C6179657203133Q00556C747261496E7374696E637448656C706572033A3Q004175746F2D48656C702077697468202Q27436F756E746572202620446F6467652Q27207461736B20666F722063682Q6F73656E20706C6179657203093Q0042757348656C70657203403Q00416E63686F7220796F757273656C6620666F72202Q27536C617020313Q302070656F706C652Q27207461736B20666F722063682Q6F73656E20706C61796572033E3Q004175746F2D48656C702077697468202Q274869742070656F706C652077697468206275732Q27207461736B20666F722063682Q6F73656E20706C61796572030E3Q00524544414354454448656C70657203403Q004175746F2D48656C702077697468202Q27436F6E7461696E2Q272026202Q275365637572652Q27207461736B7320666F722063682Q6F73656E20706C61796572030A3Q00426F6D6248656C706572033D3Q004175746F2D48656C702077697468202Q27536E6970652Q272026202Q274B6E6F636B2Q27207461736B7320666F722063682Q6F73656E20706C6179657203093Q00526F6248656C70657203313Q004175746F2D48656C702077697468202Q274162736F72622Q27207461736B20666F722063682Q6F73656E20706C61796572030A3Q00466F727448656C70657203373Q004175746F2D48656C702077697468202Q27536D6173682050656F706C652Q27207461736B20666F722063682Q6F73656E20706C61796572030C3Q00476C6F76656C48656C706572034C3Q00416E63686F7220796F757273656C6620666F72202Q274C616E6420313Q30202620323020637269746963616C20686974732Q27207461736B20666F722063682Q6F73656E20706C61796572030E3Q00456E67696E2Q657248656C706572033F3Q00416E63686F7220796F757273656C6620666F72202Q27536C617020323Q302074696D65732Q27207461736B20666F722063682Q6F73656E20706C6179657203403Q00476574206C2Q6F7020736C612Q70656420666F72202Q27536C617020323Q302074696D65732Q27207461736B20666F722063682Q6F73656E20706C61796572033F3Q00476574206C2Q6F70206B692Q6C656420666F72202Q274B692Q6C20313Q302074696D65732Q27207461736B20666F722063682Q6F73656E20706C61796572030A3Q005370696E48656C70657203093Q00412Q6442752Q746F6E032F3Q0054656C65706F727420706C6179657220746F20736166652073706F74207C206E2Q656420676C6F766520636C6F7564030B3Q00466C61736848656C70657203333Q004C2Q6F702074656C65706F727420746F2063682Q6F73656E20706C6179657220666F72202Q27416D627573682Q27207461736B030D3Q00422Q6F7374657248656C70657203363Q00416E63686F7220796F757273656C6620666F72202Q27412Q746163682Q27207461736B20666F722063682Q6F73656E20706C6179657203313Q004175746F2D48656C702077697468202Q27412Q746163682Q27207461736B20666F722063682Q6F73656E20706C61796572030B3Q00537061636548656C70657200C03Q0012543Q00013Q00206Q00024Q00023Q000300302Q00020003000400302Q00020005000600029000035Q0010E80002000700036Q0002000100124Q00083Q00206Q00024Q00023Q000300302Q00020003000900302Q000200050006000290000300013Q0010E80002000700036Q0002000100124Q00083Q00206Q00024Q00023Q000300302Q00020003000A00302Q000200050006000290000300023Q0010E80002000700036Q0002000100124Q000B3Q00206Q00024Q00023Q000300302Q00020003000C00302Q000200050006000290000300033Q0010E80002000700036Q0002000100124Q000D3Q00206Q00024Q00023Q000300302Q00020003000E00302Q000200050006000290000300043Q0010E80002000700036Q0002000100124Q000F3Q00206Q00024Q00023Q000300302Q00020003001000302Q000200050006000290000300053Q0010E80002000700036Q0002000100124Q000F3Q00206Q00024Q00023Q000300302Q00020003001100302Q000200050006000290000300063Q0010E80002000700036Q0002000100124Q00123Q00206Q00024Q00023Q000300302Q00020003001300302Q000200050006000290000300073Q0010E80002000700036Q0002000100124Q00143Q00206Q00024Q00023Q000300302Q00020003001500302Q000200050006000290000300083Q0010E80002000700036Q0002000100124Q00143Q00206Q00024Q00023Q000300302Q00020003001600302Q000200050006000290000300093Q0010E80002000700036Q0002000100124Q00173Q00206Q00024Q00023Q000300302Q00020003001800302Q0002000500060002900003000A3Q0010E80002000700036Q0002000100124Q00193Q00206Q00024Q00023Q000300302Q00020003001A00302Q0002000500060002900003000B3Q0010E80002000700036Q0002000100124Q001B3Q00206Q00024Q00023Q000300302Q00020003001C00302Q0002000500060002900003000C3Q0010E80002000700036Q0002000100124Q001D3Q00206Q00024Q00023Q000300302Q00020003001E00302Q0002000500060002900003000D3Q0010E80002000700036Q0002000100124Q001F3Q00206Q00024Q00023Q000300302Q00020003002000302Q0002000500060002900003000E3Q0010E80002000700036Q0002000100124Q00213Q00206Q00024Q00023Q000300302Q00020003002200302Q0002000500060002900003000F3Q0010E80002000700036Q0002000100124Q00213Q00206Q00024Q00023Q000300302Q00020003002300302Q000200050006000290000300103Q0010E80002000700036Q0002000100124Q00213Q00206Q00024Q00023Q000300302Q00020003002400302Q000200050006000290000300113Q0010D30002000700036Q0002000100124Q00253Q00206Q00264Q00023Q000200302Q000200030027000290000300123Q0010E80002000700036Q0002000100124Q00283Q00206Q00024Q00023Q000300302Q00020003000C00302Q000200050006000290000300133Q0010E80002000700036Q0002000100124Q00283Q00206Q00024Q00023Q000300302Q00020003002900302Q000200050006000290000300143Q0010E80002000700036Q0002000100124Q002A3Q00206Q00024Q00023Q000300302Q00020003002B00302Q000200050006000290000300153Q0010E80002000700036Q0002000100124Q002A3Q00206Q00024Q00023Q000300302Q00020003002C00302Q000200050006000290000300163Q0010E80002000700036Q0002000100124Q002D3Q00206Q00024Q00023Q000300302Q00020003000C00302Q000200050006000290000300173Q0010780002000700032Q00D73Q000200012Q00ED3Q00013Q00183Q00153Q00028Q0003023Q005F47030B3Q00627269636B68656C7065722Q0103073Q005072656D69756D03043Q007461736B03043Q007761697403043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203093Q00436861726163746572030E3Q0046696E6446697273744368696C6403103Q0048756D616E6F6964522Q6F745061727403073Q00656E746572656403063Q0069706169727303093Q00776F726B7370616365030B3Q004765744368696C6472656E03043Q004E616D6503053Q00556E696F6E03063Q00434672616D650100014E3Q001293000100014Q009C000200023Q0026D400010002000100010004303Q00020001001293000200013Q0026D400020005000100010004303Q00050001001285000300023Q001078000300033Q001285000300023Q0020E10003000300030026D40003004D000100040004303Q004D0001001285000300023Q0020E10003000300050026D40003004D000100040004303Q004D0001001293000300013Q0026D400030012000100010004303Q00120001001285000400063Q00205C0004000400074Q00040001000100122Q000400083Q00202Q00040004000900202Q00040004000A00202Q00040004000B00062Q0004004500013Q0004303Q00450001001285000400083Q0020F100040004000900202Q00040004000A00202Q00040004000B00202Q00040004000C00122Q0006000D6Q00040006000200062Q0004004500013Q0004303Q00450001001285000400083Q0020F100040004000900202Q00040004000A00202Q00040004000B00202Q00040004000C00122Q0006000E6Q00040006000200062Q0004004500013Q0004303Q004500010012850004000F3Q0012F4000500103Q00202Q0005000500114Q000500066Q00043Q000600044Q004100010006FB0008004100013Q0004303Q004100010020E10009000800120026D400090041000100130004303Q00410001001285000900083Q00201300090009000900202Q00090009000A00202Q00090009000B00202Q00090009000D00202Q00090009001400102Q00080014000900067B00040035000100020004303Q003500010004303Q004500010004303Q00120001001285000400023Q0020E10004000400030026D400040011000100150004303Q001100010004303Q004D00010004303Q000500010004303Q004D00010004303Q000200012Q00ED3Q00017Q00263Q0003023Q005F47030B3Q00636C6F756468656C7065722Q0103073Q005072656D69756D028Q00026Q00F03F03133Q00506C61796572546F48656C704D61737465727903053Q00706169727303043Q0067616D6503073Q00506C6179657273030A3Q00476574506C617965727303063Q00737472696E672Q033Q0073756203043Q004E616D6503053Q006C6F77657203043Q007461736B03043Q007761697403093Q00776F726B7370616365030E3Q0046696E6446697273744368696C6403063Q005F436C6F7564030B3Q004C6F63616C506C6179657203093Q0043686172616374657203083Q0048756D616E6F69642Q033Q00536974010003103Q0048756D616E6F6964522Q6F745061727403063Q00434672616D6503083Q004F72696F6E4C696203103Q004D616B654E6F74696669636174696F6E03073Q005761726E696E6703073Q00436F6E74656E7403073Q00506C617965722003073Q0020666F756E642103053Q00496D61676503343Q007262787468756D623A2Q2F747970653D412Q7365742669643D2Q31393833323139342Q353837343826773D31353026683D31353003043Q0054696D65026Q00144003113Q00506C61796572206E6F7420666F756E642E01BC3Q0012082Q0100013Q00102Q000100023Q00122Q000100013Q00202Q00010001000200262Q000100BB000100030004303Q00BB0001001285000100013Q0020E10001000100040026D4000100BB000100030004303Q00BB0001001293000100054Q009C000200043Q0026D40001001C000100050004303Q001C0001001293000500053Q0026D400050013000100060004303Q00130001001293000100063Q0004303Q001C00010026D40005000F000100050004303Q000F0001001285000600013Q00204C0002000600074Q000600076Q000400076Q000300063Q00122Q000500063Q00044Q000F00010026D40001000C000100060004303Q000C0001001285000500083Q00128E000600093Q00202Q00060006000A00202Q00060006000B4Q000600076Q00053Q000700044Q00330001001285000A000C3Q00201A000A000A000D00202Q000B0009000E00122Q000C00066Q000D00026Q000A000D000200202Q000A000A000F4Q000A0002000200202Q000B0002000F4Q000B0002000200062Q000A00330001000B0004303Q003300012Q00EF000300093Q0004303Q0035000100067B00050025000100020004303Q002500010006FB000300B100013Q0004303Q00B10001001293000500054Q009C000600063Q0026D400050039000100050004303Q00390001001293000600053Q0026D40006009D000100060004303Q009D0001001293000700053Q0026D40007003F000100050004303Q003F0001001285000800103Q0020230008000800114Q00080001000100122Q000800123Q00202Q00080008001300202Q000A0004000E00122Q000B00146Q000A000A000B4Q0008000A000200062Q0008009800013Q0004303Q00980001001285000800093Q0020CD00080008000A00202Q00080008001500202Q00080008001600202Q00080008001700202Q00080008001800262Q00080078000100190004303Q00780001001293000800054Q009C000900093Q0026D400080056000100050004303Q00560001001293000900053Q0026D400090059000100050004303Q00590001001285000A00103Q0020B8000A000A00114Q000A0001000100122Q000A00093Q00202Q000A000A000A00202Q000A000A001500202Q000A000A001600202Q000A000A001A00122Q000B00123Q00202Q000B000B001300202Q000D0004000E00122Q000E00146Q000D000D000E4Q000B000D000200202Q000B000B001B00102Q000A001B000B00044Q006F00010004303Q005900010004303Q006F00010004303Q00560001001285000A00093Q0020CD000A000A000A00202Q000A000A001500202Q000A000A001600202Q000A000A001700202Q000A000A001800262Q000A0054000100030004303Q005400010004303Q00980001001285000800093Q0020CD00080008000A00202Q00080008001500202Q00080008001600202Q00080008001700202Q00080008001800262Q00080098000100030004303Q00980001001293000800053Q0026D400080081000100050004303Q00810001001285000900103Q0020EA0009000900114Q00090001000100122Q000900093Q00202Q00090009000A00202Q00090009001500202Q00090009001600202Q00090009001700302Q00090018001900044Q008E00010004303Q00810001001285000900093Q0020CD00090009000A00202Q00090009001500202Q00090009001600202Q00090009001700202Q00090009001800262Q00090080000100190004303Q008000010004303Q009800010004303Q003F0001001285000800013Q0020E10008000800020026D40008003E000100190004303Q003E00010004303Q00BB00010026D40006003C000100050004303Q003C00012Q00EF000400033Q0012DD0007001C3Q00202Q00070007001D4Q00093Q000400302Q0009000E001E00122Q000A00203Q00202Q000B0004000E00122Q000C00216Q000A000A000C00102Q0009001F000A00302Q00090022002300302Q0009002400254Q000700090001001293000600063Q0004303Q003C00010004303Q00BB00010004303Q003900010004303Q00BB00010012850005001C3Q00208600050005001D4Q00073Q000400302Q0007000E001E00302Q0007001F002600302Q00070022002300302Q0007002400254Q00050007000100044Q00BB00010004303Q000C00012Q00ED3Q00017Q000F3Q00028Q0003023Q005F4703143Q00636C6F756468656C7065726E756D62657274776F2Q0103073Q005072656D69756D2Q033Q006F6C6403043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203093Q0043686172616374657203103Q0048756D616E6F6964522Q6F745061727403063Q00434672616D6503043Q007461736B03043Q00776169740100013B3Q001293000100014Q009C000200023Q0026D400010002000100010004303Q00020001001293000200013Q0026D400020005000100010004303Q00050001001285000300023Q001078000300033Q001285000300023Q0020E10003000300030026D40003003A000100040004303Q003A0001001285000300023Q0020E10003000300050026D40003003A000100040004303Q003A0001001293000300013Q0026D400030012000100010004303Q00120001001285000400073Q00203A00040004000800202Q00040004000900202Q00040004000A00202Q00040004000B00202Q00040004000C00122Q000400063Q001293000400014Q009C000500053Q0026D40004001D000100010004303Q001D0001001293000500013Q0026D400050020000100010004303Q002000010012850006000D3Q00206600060006000E4Q00060001000100122Q000600073Q00202Q00060006000800202Q00060006000900202Q00060006000A00202Q00060006000B00122Q000700063Q00102Q0006000C000700044Q003000010004303Q002000010004303Q003000010004303Q001D0001001285000600023Q0020E10006000600030026D40006001B0001000F0004303Q001B00010004303Q003A00010004303Q001200010004303Q003A00010004303Q000500010004303Q003A00010004303Q000200012Q00ED3Q00017Q000F3Q00028Q0003023Q005F47030E3Q00776F726D686F6C6568656C7065722Q0103073Q005072656D69756D2Q033Q006F6C6403043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203093Q0043686172616374657203103Q0048756D616E6F6964522Q6F745061727403063Q00434672616D6503043Q007461736B03043Q0077616974010001413Q001293000100014Q009C000200023Q000EB300010002000100010004303Q00020001001293000200013Q0026D400020005000100010004303Q00050001001285000300023Q001078000300033Q001285000300023Q0020E10003000300030026D400030040000100040004303Q00400001001285000300023Q0020E10003000300050026D400030040000100040004303Q00400001001293000300014Q009C000400043Q0026D400030013000100010004303Q00130001001293000400013Q0026D400040016000100010004303Q00160001001285000500073Q00203A00050005000800202Q00050005000900202Q00050005000A00202Q00050005000B00202Q00050005000C00122Q000500063Q001293000500014Q009C000600063Q0026D400050021000100010004303Q00210001001293000600013Q000EB300010024000100060004303Q002400010012850007000D3Q00206600070007000E4Q00070001000100122Q000700073Q00202Q00070007000800202Q00070007000900202Q00070007000A00202Q00070007000B00122Q000800063Q00102Q0007000C000800044Q003400010004303Q002400010004303Q003400010004303Q00210001001285000700023Q0020E10007000700030026D40007001F0001000F0004303Q001F00010004303Q004000010004303Q001600010004303Q004000010004303Q001300010004303Q004000010004303Q000500010004303Q004000010004303Q000200012Q00ED3Q00017Q00253Q00028Q0003023Q005F4703093Q0072756E68656C7065722Q0103073Q005072656D69756D03133Q00506C61796572546F48656C704D617374657279026Q00F03F03053Q00706169727303043Q0067616D6503073Q00506C6179657273030A3Q00476574506C617965727303063Q00737472696E672Q033Q0073756203043Q004E616D6503053Q006C6F77657203083Q004F72696F6E4C696203103Q004D616B654E6F74696669636174696F6E03073Q005761726E696E6703073Q00436F6E74656E7403073Q00506C617965722003073Q0020666F756E642103053Q00496D61676503343Q007262787468756D623A2Q2F747970653D412Q7365742669643D2Q31393833323139342Q353837343826773D31353026683D31353003043Q0054696D65026Q00144003043Q007461736B03043Q0077616974030B3Q004C6F63616C506C6179657203093Q00436861726163746572030E3Q0046696E6446697273744368696C64030B3Q00496E4C61627972696E746803053Q00536B752Q6C03103Q0048756D616E6F6964522Q6F745061727403063Q00434672616D6503063Q00486974626F78010003113Q00506C61796572206E6F7420666F756E642E017E3Q001293000100014Q009C000200023Q0026D400010002000100010004303Q00020001001293000200013Q0026D400020005000100010004303Q00050001001285000300023Q001078000300033Q001285000300023Q0020E10003000300030026D40003007D000100040004303Q007D0001001285000300023Q0020E10003000300050026D40003007D000100040004303Q007D0001001293000300014Q009C000400063Q0026D40003001B000100010004303Q001B0001001285000700023Q0020C60004000700064Q000700086Q000600086Q000500073Q00122Q000300073Q0026D400030013000100070004303Q00130001001285000700083Q00128E000800093Q00202Q00080008000A00202Q00080008000B4Q000800096Q00073Q000900044Q00320001001285000C000C3Q00201A000C000C000D00202Q000D000B000E00122Q000E00076Q000F00046Q000C000F000200202Q000C000C000F4Q000C0002000200202Q000D0004000F4Q000D0002000200062Q000C00320001000D0004303Q003200012Q00EF0005000B3Q0004303Q0034000100067B00070024000100020004303Q002400010006FB0005006F00013Q0004303Q006F00012Q00EF000600053Q0012DD000700103Q00202Q0007000700114Q00093Q000400302Q0009000E001200122Q000A00143Q00202Q000B0006000E00122Q000C00156Q000A000A000C00102Q00090013000A00302Q00090016001700302Q0009001800194Q000700090001001293000700014Q009C000800083Q0026D400070045000100010004303Q00450001001293000800013Q0026D400080048000100010004303Q004800010012850009001A3Q0020CC00090009001B4Q00090001000100122Q000900093Q00202Q00090009000A00202Q00090009001C00202Q00090009001D00202Q00090009001E00122Q000B001F6Q0009000B000200062Q0009006A00013Q0004303Q006A00010020E100090006001D00201000090009001E001293000B00204Q00700009000B00020006FB0009006A00013Q0004303Q006A0001001285000900093Q00205D00090009000A00202Q00090009001C00202Q00090009001D00202Q00090009002100202Q000A0006001D00202Q000A000A002000202Q000A000A002300202Q000A000A002200102Q00090022000A00044Q006A00010004303Q004800010004303Q006A00010004303Q00450001001285000900023Q0020E10009000900030026D400090043000100240004303Q004300010004303Q007D0001001285000700103Q0020860007000700114Q00093Q000400302Q0009000E001200302Q00090013002500302Q00090016001700302Q0009001800194Q00070009000100044Q007D00010004303Q001300010004303Q007D00010004303Q000500010004303Q007D00010004303Q000200012Q00ED3Q00017Q00343Q0003023Q005F47030A3Q006F2Q627968656C7065722Q0103073Q005072656D69756D03133Q00506C61796572546F48656C704D61737465727903053Q00706169727303043Q0067616D6503073Q00506C6179657273030A3Q00476574506C617965727303063Q00737472696E672Q033Q0073756203043Q004E616D65026Q00F03F03053Q006C6F77657203083Q004F72696F6E4C696203103Q004D616B654E6F74696669636174696F6E03073Q005761726E696E6703073Q00436F6E74656E7403073Q00506C617965722003073Q0020666F756E642103053Q00496D61676503343Q007262787468756D623A2Q2F747970653D412Q7365742669643D2Q31393833323139342Q353837343826773D31353026683D31353003043Q0054696D65026Q00144003073Q006F6C6473697A6503093Q00776F726B737061636503053Q004C6F2Q627903093Q0054656C65706F72743203043Q0053697A6503043Q007461736B03043Q0077616974029A5Q99B93F03073Q00566563746F72332Q033Q006E6577026Q005940030E3Q0046696E6446697273744368696C6403083Q004F2Q62794974656D030B3Q004C6176615370692Q6E657203093Q004C617661426C6F636B030B3Q006C6561646572737461747303053Q00476C6F766503053Q0056616C756503043Q004F2Q6279030B3Q004C6F63616C506C6179657203093Q0043686172616374657203103Q0048756D616E6F6964522Q6F745061727403073Q00656E7465726564028Q00030A3Q0043616E436F2Q6C696465010003063Q00434672616D6503113Q00506C61796572206E6F7420666F756E642E3Q012Q0012082Q0100013Q00102Q000100023Q00122Q000100013Q00202Q00010001000200262Q00012Q002Q0100030004304Q002Q01001285000100013Q0020E10001000100040026D400012Q002Q0100030004304Q002Q01001285000100013Q0020340001000100054Q000200033Q00122Q000400063Q00122Q000500073Q00202Q00050005000800202Q0005000500094Q000500066Q00043Q000600044Q002200010012850009000A3Q00201A00090009000B00202Q000A0008000C00122Q000B000D6Q000C00016Q0009000C000200202Q00090009000E4Q00090002000200202Q000A0001000E4Q000A0002000200062Q000900220001000A0004303Q002200012Q00EF000200083Q0004303Q0024000100067B00040014000100020004303Q001400010006FB000200F800013Q0004303Q00F800012Q00EF000300023Q0012380004000F3Q00202Q0004000400104Q00063Q000400302Q0006000C001100122Q000700133Q00202Q00080003000C00122Q000900146Q00070007000900102Q00060012000700302Q00060015001600302Q0006001700184Q00040006000100122Q0004001A3Q00202Q00040004001B00202Q00040004001C00202Q00040004001D00122Q000400193Q00122Q0004001E3Q00202Q00040004001F00122Q000500206Q00040002000100122Q0004001A3Q00202Q00040004001B00202Q00040004001C00122Q000500213Q00202Q00050005002200122Q000600233Q00122Q000700233Q00122Q000800236Q00050008000200102Q0004001D00050012850004001E3Q00207300040004001F4Q00040001000100122Q0004001A3Q00202Q00040004002400122Q000600253Q00202Q00070003000C00122Q000800266Q0006000600084Q00040006000200062Q0004006B000100010004303Q006B00010012850004001A3Q00201100040004002400122Q000600253Q00202Q00070003000C00122Q000800276Q0006000600084Q00040006000200062Q000400EE00013Q0004303Q00EE0001002010000400030024001293000600284Q00700004000600020006FB000400EE00013Q0004303Q00EE00010020E1000400030028002010000400040024001293000600294Q00700004000600020006FB000400EE00013Q0004303Q00EE00010020E10004000300280020E10004000400290020E100040004002A0026D4000400EE0001002B0004303Q00EE0001001285000400073Q0020E10004000400080020E100040004002C0020E100040004002D0006FB000400EE00013Q0004303Q00EE0001001285000400073Q0020F100040004000800202Q00040004002C00202Q00040004002D00202Q00040004002400122Q0006002E6Q00040006000200062Q000400EE00013Q0004303Q00EE0001001285000400073Q0020F100040004000800202Q00040004002C00202Q00040004002D00202Q00040004002400122Q0006002F6Q00040006000200062Q000400EE00013Q0004303Q00EE0001001293000400304Q009C000500053Q0026D400040085000100300004303Q00850001001293000500303Q0026D400050088000100300004303Q008800010012850006001A3Q00201100060006002400122Q000800253Q00202Q00090003000C00122Q000A00276Q00080008000A4Q00060008000200062Q000600BA00013Q0004303Q00BA0001001293000600303Q0026D400060094000100300004303Q009400010012850007001A3Q0020B400070007002400122Q000900253Q00202Q000A0003000C00122Q000B00276Q00090009000B4Q00070009000200202Q00070007003100262Q000700A8000100030004303Q00A800010012850007001A3Q00203500070007002400122Q000900253Q00202Q000A0003000C00122Q000B00276Q00090009000B4Q00070009000200302Q0007003100320012850007001A3Q00200F00070007002400122Q000900253Q00202Q000A0003000C00122Q000B00276Q00090009000B4Q00070009000200122Q000800073Q00202Q00080008000800202Q00080008002C00202Q00080008002D00202Q00080008002400122Q000A002E6Q0008000A000200202Q00080008003300102Q00070033000800044Q00BA00010004303Q009400010012850006001A3Q00201100060006002400122Q000800253Q00202Q00090003000C00122Q000A00266Q00080008000A4Q00060008000200062Q000600EE00013Q0004303Q00EE0001001293000600303Q0026D4000600C4000100300004303Q00C400010012850007001A3Q0020B400070007002400122Q000900253Q00202Q000A0003000C00122Q000B00266Q00090009000B4Q00070009000200202Q00070007003100262Q000700D8000100030004303Q00D800010012850007001A3Q00203500070007002400122Q000900253Q00202Q000A0003000C00122Q000B00266Q00090009000B4Q00070009000200302Q0007003100320012850007001A3Q00200F00070007002400122Q000900253Q00202Q000A0003000C00122Q000B00266Q00090009000B4Q00070009000200122Q000800073Q00202Q00080008000800202Q00080008002C00202Q00080008002D00202Q00080008002400122Q000A002E6Q0008000A000200202Q00080008003300102Q00070033000800044Q00EE00010004303Q00C400010004303Q00EE00010004303Q008800010004303Q00EE00010004303Q00850001001285000400013Q0020E10004000400020026D400040046000100320004303Q004600010012850004001A3Q00205700040004001B00202Q00040004001C00122Q000500193Q00102Q0004001D000500045Q002Q010012850004000F3Q0020220004000400104Q00063Q000400302Q0006000C001100302Q00060012003400302Q00060015001600302Q0006001700184Q0004000600012Q00ED3Q00017Q000F3Q00028Q0003023Q005F4703133Q006F2Q627968656C7065726E756D62657274776F2Q0103073Q005072656D69756D2Q033Q006F6C6403043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203093Q0043686172616374657203103Q0048756D616E6F6964522Q6F745061727403063Q00434672616D6503043Q007461736B03043Q00776169740100013B3Q001293000100014Q009C000200023Q0026D400010002000100010004303Q00020001001293000200013Q0026D400020005000100010004303Q00050001001285000300023Q001078000300033Q001285000300023Q0020E10003000300030026D40003003A000100040004303Q003A0001001285000300023Q0020E10003000300050026D40003003A000100040004303Q003A0001001293000300014Q009C000400043Q0026D400030013000100010004303Q00130001001293000400013Q0026D400040016000100010004303Q00160001001285000500073Q00203A00050005000800202Q00050005000900202Q00050005000A00202Q00050005000B00202Q00050005000C00122Q000500063Q001293000500013Q0026D400050020000100010004303Q002000010012850006000D3Q00206600060006000E4Q00060001000100122Q000600073Q00202Q00060006000800202Q00060006000900202Q00060006000A00202Q00060006000B00122Q000700063Q00102Q0006000C000700044Q002E00010004303Q00200001001285000600023Q0020E10006000600030026D40006001F0001000F0004303Q001F00010004303Q003A00010004303Q001600010004303Q003A00010004303Q001300010004303Q003A00010004303Q000500010004303Q003A00010004303Q000200012Q00ED3Q00017Q00383Q0003023Q005F4703133Q00556C747261496E7374696E637468656C7065722Q0103073Q005072656D69756D03133Q00506C61796572546F48656C704D61737465727903053Q00706169727303043Q0067616D6503073Q00506C6179657273030A3Q00476574506C617965727303063Q00737472696E672Q033Q0073756203043Q004E616D65026Q00F03F03053Q006C6F77657203083Q004F72696F6E4C696203103Q004D616B654E6F74696669636174696F6E03073Q005761726E696E6703073Q00436F6E74656E7403073Q00506C617965722003073Q0020666F756E642103053Q00496D61676503343Q007262787468756D623A2Q2F747970653D412Q7365742669643D2Q31393833323139342Q353837343826773D31353026683D31353003043Q0054696D65026Q00144003073Q006F6C6473697A6503093Q00776F726B737061636503053Q004C6F2Q627903093Q0054656C65706F72743203043Q0053697A6503043Q007461736B03043Q0077616974029A5Q99B93F03073Q00566563746F72332Q033Q006E6577026Q005940028Q0003093Q00436861726163746572030E3Q0046696E6446697273744368696C6403103Q0048756D616E6F6964522Q6F745061727403073Q00656E7465726564030B3Q006C6561646572737461747303053Q00476C6F766503053Q0056616C7565030E3Q00556C74726120496E7374696E6374030B3Q004C6F63616C506C6179657203113Q005265706C69636174656453746F7261676503013Q0062030A3Q0046697265536572766572026Q33D33F03063Q00434672616D65026Q001C4003063Q00416E676C6573025Q00806640029A5Q99D93F010003113Q00506C61796572206E6F7420666F756E642E01C63Q0012082Q0100013Q00102Q000100023Q00122Q000100013Q00202Q00010001000200262Q000100C5000100030004303Q00C50001001285000100013Q0020E10001000100040026D4000100C5000100030004303Q00C50001001285000100013Q0020340001000100054Q000200033Q00122Q000400063Q00122Q000500073Q00202Q00050005000800202Q0005000500094Q000500066Q00043Q000600044Q002200010012850009000A3Q00201A00090009000B00202Q000A0008000C00122Q000B000D6Q000C00016Q0009000C000200202Q00090009000E4Q00090002000200202Q000A0001000E4Q000A0002000200062Q000900220001000A0004303Q002200012Q00EF000200083Q0004303Q0024000100067B00040014000100020004303Q001400010006FB000200BD00013Q0004303Q00BD00012Q00EF000300023Q0012380004000F3Q00202Q0004000400104Q00063Q000400302Q0006000C001100122Q000700133Q00202Q00080003000C00122Q000900146Q00070007000900102Q00060012000700302Q00060015001600302Q0006001700184Q00040006000100122Q0004001A3Q00202Q00040004001B00202Q00040004001C00202Q00040004001D00122Q000400193Q00122Q0004001E3Q00202Q00040004001F00122Q000500206Q00040002000100122Q0004001A3Q00202Q00040004001B00202Q00040004001C00122Q000500213Q00202Q00050005002200122Q000600233Q00122Q000700233Q00122Q000800236Q00050008000200102Q0004001D0005001293000400243Q0026D400040047000100240004303Q004700010012850005001E3Q0020E100050005001F2Q002F0005000100010020E10005000300250006FB000500B300013Q0004303Q00B300010020E1000500030025002010000500050026001293000700274Q00700005000700020006FB000500B300013Q0004303Q00B300010020E1000500030025002010000500050026001293000700284Q00700005000700020006FB000500B300013Q0004303Q00B30001002010000500030026001293000700294Q00700005000700020006FB000500B300013Q0004303Q00B300010020E10005000300290020100005000500260012930007002A4Q00700005000700020006FB000500B300013Q0004303Q00B300010020E10005000300290020E100050005002A0020E100050005002B0026D4000500B30001002C0004303Q00B30001001285000500073Q0020E10005000500080020E100050005002D0020E10005000500250006FB000500B300013Q0004303Q00B30001001285000500073Q0020F100050005000800202Q00050005002D00202Q00050005002500202Q00050005002600122Q000700276Q00050007000200062Q000500B300013Q0004303Q00B30001001285000500073Q0020F100050005000800202Q00050005002D00202Q00050005002500202Q00050005002600122Q000700286Q00050007000200062Q000500B300013Q0004303Q00B30001001293000500243Q0026D4000500920001000D0004303Q00920001001285000600073Q0020DC00060006002E00202Q00060006002F00202Q00060006003000202Q00080003002500202Q0008000800274Q00060008000100122Q0006001E3Q00202Q00060006001F00122Q000700316Q00060002000100044Q00B300010026D400050084000100240004303Q00840001001285000600073Q00200600060006000800202Q00060006002D00202Q00060006002500202Q00060006002700202Q00070003002500202Q00070007002700202Q00070007003200122Q000800323Q00202Q00080008002200122Q000900243Q00122Q000A00333Q00122Q000B00246Q0008000B00024Q00070007000800122Q000800323Q00202Q00080008003400122Q000900353Q00122Q000A00243Q00122Q000B00246Q0008000B00024Q00070007000800102Q00060032000700122Q0006001E3Q00202Q00060006001F00122Q000700366Q00060002000100122Q0005000D3Q00044Q008400010004303Q00B300010004303Q00470001001285000500013Q0020E10005000500020026D400050046000100370004303Q004600010012850004001A3Q00205700040004001B00202Q00040004001C00122Q000500193Q00102Q0004001D000500044Q00C500010012850004000F3Q0020220004000400104Q00063Q000400302Q0006000C001100302Q00060012003800302Q00060015001600302Q0006001700184Q0004000600012Q00ED3Q00017Q000F3Q00028Q0003023Q005F4703093Q0042757368656C7065722Q0103073Q005072656D69756D2Q033Q006F6C6403043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203093Q0043686172616374657203103Q0048756D616E6F6964522Q6F745061727403063Q00434672616D6503043Q007461736B03043Q0077616974010001353Q001293000100014Q009C000200023Q0026D400010002000100010004303Q00020001001293000200013Q0026D400020005000100010004303Q00050001001285000300023Q001078000300033Q001285000300023Q0020E10003000300030026D400030034000100040004303Q00340001001285000300023Q0020E10003000300050026D400030034000100040004303Q00340001001293000300013Q0026D400030012000100010004303Q00120001001285000400073Q00203A00040004000800202Q00040004000900202Q00040004000A00202Q00040004000B00202Q00040004000C00122Q000400063Q001293000400013Q0026D40004001C000100010004303Q001C00010012850005000D3Q00206600050005000E4Q00050001000100122Q000500073Q00202Q00050005000800202Q00050005000900202Q00050005000A00202Q00050005000B00122Q000600063Q00102Q0005000C000600044Q002A00010004303Q001C0001001285000500023Q0020E10005000500030026D40005001B0001000F0004303Q001B00010004303Q003400010004303Q001200010004303Q003400010004303Q000500010004303Q003400010004303Q000200012Q00ED3Q00017Q00333Q0003023Q005F47030A3Q0062752Q7368656C7065722Q0103073Q005072656D69756D03133Q00506C61796572546F48656C704D61737465727903053Q00706169727303043Q0067616D6503073Q00506C6179657273030A3Q00476574506C617965727303063Q00737472696E672Q033Q0073756203043Q004E616D65026Q00F03F03053Q006C6F776572028Q0003083Q004F72696F6E4C696203103Q004D616B654E6F74696669636174696F6E03073Q005761726E696E6703073Q00436F6E74656E7403073Q00506C617965722003073Q0020666F756E642103053Q00496D61676503343Q007262787468756D623A2Q2F747970653D412Q7365742669643D2Q31393833323139342Q353837343826773D31353026683D31353003043Q0054696D65026Q001440027Q004003093Q00776F726B737061636503053Q004C6F2Q627903093Q0054656C65706F72743203043Q0053697A6503073Q00566563746F72332Q033Q006E6577026Q00594003043Q007461736B03043Q007761697403093Q00436861726163746572030E3Q0046696E6446697273744368696C6403103Q0048756D616E6F6964522Q6F745061727403073Q00656E7465726564030B3Q006C6561646572737461747303053Q00476C6F766503053Q0056616C75652Q033Q00627573030B3Q004C6F63616C506C6179657203083Q004275734D6F64656C03063Q00434672616D650100026Q00084003073Q006F6C6473697A65029A5Q99B93F03113Q00506C61796572206E6F7420666F756E642E01BD3Q0012082Q0100013Q00102Q000100023Q00122Q000100013Q00202Q00010001000200262Q000100BC000100030004303Q00BC0001001285000100013Q0020E10001000100040026D4000100BC000100030004303Q00BC0001001285000100013Q0020340001000100054Q000200033Q00122Q000400063Q00122Q000500073Q00202Q00050005000800202Q0005000500094Q000500066Q00043Q000600044Q002200010012850009000A3Q00201A00090009000B00202Q000A0008000C00122Q000B000D6Q000C00016Q0009000C000200202Q00090009000E4Q00090002000200202Q000A0001000E4Q000A0002000200062Q000900220001000A0004303Q002200012Q00EF000200083Q0004303Q0024000100067B00040014000100020004303Q001400010006FB000200B400013Q0004303Q00B400010012930004000F3Q000EB3000F0037000100040004303Q003700012Q00EF000300023Q0012DD000500103Q00202Q0005000500114Q00073Q000400302Q0007000C001200122Q000800143Q00202Q00090003000C00122Q000A00156Q00080008000A00102Q00070013000800302Q00070016001700302Q0007001800194Q0005000700010012930004000D3Q000EB3001A009E000100040004303Q009E00010012850005001B3Q00209B00050005001C00202Q00050005001D00122Q0006001F3Q00202Q00060006002000122Q000700213Q00122Q000800213Q00122Q000900216Q00060009000200102Q0005001E00060012930005000F4Q009C000600063Q0026D4000500450001000F0004303Q004500010012930006000F3Q0026D4000600480001000F0004303Q00480001001285000700223Q0020E10007000700232Q002F0007000100010020E10007000300240006FB0007009900013Q0004303Q009900010020E1000700030024002010000700070025001293000900264Q00700007000900020006FB0007009900013Q0004303Q009900010020E1000700030024002010000700070025001293000900274Q00700007000900020006FB0007009900013Q0004303Q00990001002010000700030025001293000900284Q00700007000900020006FB0007009900013Q0004303Q009900010020E1000700030028002010000700070025001293000900294Q00700007000900020006FB0007009900013Q0004303Q009900010020E10007000300280020E10007000700290020E100070007002A0026D4000700990001002B0004303Q00990001001285000700073Q0020E10007000700080020E100070007002C0020E10007000700240006FB0007009900013Q0004303Q00990001001285000700073Q0020F100070007000800202Q00070007002C00202Q00070007002400202Q00070007002500122Q000900266Q00070009000200062Q0007009900013Q0004303Q00990001001285000700073Q0020F100070007000800202Q00070007002C00202Q00070007002400202Q00070007002500122Q000900276Q00070009000200062Q0007009900013Q0004303Q009900010012850007001B3Q0020100007000700250012930009002D4Q00700007000900020006FB0007009900013Q0004303Q00990001001285000700073Q0020BD00070007000800202Q00070007002C00202Q00070007002400202Q00070007002600122Q0008001B3Q00202Q00080008002500122Q000A002D6Q0008000A000200202Q00080008002E00102Q0007002E000800044Q009900010004303Q004800010004303Q009900010004303Q00450001001285000700013Q0020E10007000700020026D4000700430001002F0004303Q00430001001293000400303Q0026D4000400A6000100300004303Q00A600010012850005001B3Q00205700050005001C00202Q00050005001D00122Q000600313Q00102Q0005001E000600044Q00BC00010026D4000400270001000D0004303Q002700010012850005001B3Q0020F300050005001C00202Q00050005001D00202Q00050005001E00122Q000500313Q00122Q000500223Q00202Q00050005002300122Q000600326Q00050002000100122Q0004001A3Q00044Q002700010004303Q00BC0001001285000400103Q0020220004000400114Q00063Q000400302Q0006000C001200302Q00060013003300302Q00060016001700302Q0006001800194Q0004000600012Q00ED3Q00017Q00343Q0003023Q005F47030E3Q00524544414354454468656C7065722Q0103073Q005072656D69756D03133Q00506C61796572546F48656C704D61737465727903053Q00706169727303043Q0067616D6503073Q00506C6179657273030A3Q00476574506C617965727303063Q00737472696E672Q033Q0073756203043Q004E616D65026Q00F03F03053Q006C6F77657203083Q004F72696F6E4C696203103Q004D616B654E6F74696669636174696F6E03073Q005761726E696E6703073Q00436F6E74656E7403073Q00506C617965722003073Q0020666F756E642103053Q00496D61676503343Q007262787468756D623A2Q2F747970653D412Q7365742669643D2Q31393833323139342Q353837343826773D31353026683D31353003043Q0054696D65026Q00144003073Q006F6C6473697A6503093Q00776F726B737061636503053Q004C6F2Q627903093Q0054656C65706F72743203043Q0053697A6503043Q007461736B03043Q0077616974029A5Q99B93F03073Q00566563746F72332Q033Q006E6577026Q005940028Q0003093Q00436861726163746572030E3Q0046696E6446697273744368696C6403103Q0048756D616E6F6964522Q6F745061727403073Q00656E7465726564030B3Q006C6561646572737461747303053Q00476C6F766503053Q0056616C7565030A3Q005B52454441435445445D030B3Q004C6F63616C506C6179657203093Q0057652Q6C4D6F64656C03063Q00506F7274616C03163Q0046696E6446697273744368696C64576869636849734103103Q00546F7563685472616E736D692Q74657203063Q00434672616D65010003113Q00506C61796572206E6F7420666F756E642E01B73Q0012082Q0100013Q00102Q000100023Q00122Q000100013Q00202Q00010001000200262Q000100B6000100030004303Q00B60001001285000100013Q0020E10001000100040026D4000100B6000100030004303Q00B60001001285000100013Q0020340001000100054Q000200033Q00122Q000400063Q00122Q000500073Q00202Q00050005000800202Q0005000500094Q000500066Q00043Q000600044Q002200010012850009000A3Q00201A00090009000B00202Q000A0008000C00122Q000B000D6Q000C00016Q0009000C000200202Q00090009000E4Q00090002000200202Q000A0001000E4Q000A0002000200062Q000900220001000A0004303Q002200012Q00EF000200083Q0004303Q0024000100067B00040014000100020004303Q001400010006FB000200AE00013Q0004303Q00AE00012Q00EF000300023Q0012380004000F3Q00202Q0004000400104Q00063Q000400302Q0006000C001100122Q000700133Q00202Q00080003000C00122Q000900146Q00070007000900102Q00060012000700302Q00060015001600302Q0006001700184Q00040006000100122Q0004001A3Q00202Q00040004001B00202Q00040004001C00202Q00040004001D00122Q000400193Q00122Q0004001E3Q00202Q00040004001F00122Q000500206Q00040002000100122Q0004001A3Q00202Q00040004001B00202Q00040004001C00122Q000500213Q00202Q00050005002200122Q000600233Q00122Q000700233Q00122Q000800236Q00050008000200102Q0004001D0005001293000400243Q0026D400040047000100240004303Q004700010012850005001E3Q0020E100050005001F2Q002F0005000100010020E10005000300250006FB000500A400013Q0004303Q00A400010020E1000500030025002010000500050026001293000700274Q00700005000700020006FB000500A400013Q0004303Q00A400010020E1000500030025002010000500050026001293000700284Q00700005000700020006FB000500A400013Q0004303Q00A40001002010000500030026001293000700294Q00700005000700020006FB000500A400013Q0004303Q00A400010020E10005000300290020100005000500260012930007002A4Q00700005000700020006FB000500A400013Q0004303Q00A400010020E10005000300290020E100050005002A0020E100050005002B0026D4000500A40001002C0004303Q00A40001001285000500073Q0020E10005000500080020E100050005002D0020E10005000500250006FB000500A400013Q0004303Q00A40001001285000500073Q0020F100050005000800202Q00050005002D00202Q00050005002500202Q00050005002600122Q000700276Q00050007000200062Q000500A400013Q0004303Q00A40001001285000500073Q0020F100050005000800202Q00050005002D00202Q00050005002500202Q00050005002600122Q000700286Q00050007000200062Q000500A400013Q0004303Q00A400010012850005001A3Q0020100005000500260012930007002E4Q00700005000700020006FB000500A400013Q0004303Q00A400010012850005001A3Q00206900050005002E00202Q00050005002600122Q0007002F6Q00050007000200062Q000500A400013Q0004303Q00A400010012850005001A3Q00200601050005002E00202Q00050005002F00202Q00050005003000122Q000700316Q00050007000200062Q000500A400013Q0004303Q00A40001001285000500073Q0020AE00050005000800202Q00050005002D00202Q00050005002500202Q00050005002700122Q0006001A3Q00202Q00060006002E00202Q00060006002F00202Q00060006003200102Q00050032000600044Q00A400010004303Q00470001001285000500013Q0020E10005000500020026D400050046000100330004303Q004600010012850004001A3Q00205700040004001B00202Q00040004001C00122Q000500193Q00102Q0004001D000500044Q00B600010012850004000F3Q0020220004000400104Q00063Q000400302Q0006000C001100302Q00060012003400302Q00060015001600302Q0006001700184Q0004000600012Q00ED3Q00017Q003A3Q0003023Q005F47030A3Q00426F6D6268656C7065722Q0103073Q005072656D69756D03133Q00506C61796572546F48656C704D61737465727903053Q00706169727303043Q0067616D6503073Q00506C6179657273030A3Q00476574506C617965727303063Q00737472696E672Q033Q0073756203043Q004E616D65026Q00F03F03053Q006C6F77657203083Q004F72696F6E4C696203103Q004D616B654E6F74696669636174696F6E03073Q005761726E696E6703073Q00436F6E74656E7403073Q00506C617965722003073Q0020666F756E642103053Q00496D61676503343Q007262787468756D623A2Q2F747970653D412Q7365742669643D2Q31393833323139342Q353837343826773D31353026683D31353003043Q0054696D65026Q00144003073Q006F6C6473697A6503093Q00776F726B737061636503053Q004C6F2Q627903093Q0054656C65706F72743203043Q0053697A6503043Q007461736B03043Q0077616974029A5Q99B93F03073Q00566563746F72332Q033Q006E6577026Q00594003093Q00436861726163746572030E3Q0046696E6446697273744368696C6403103Q0048756D616E6F6964522Q6F745061727403073Q00656E7465726564030B3Q006C6561646572737461747303053Q00476C6F766503053Q0056616C756503043Q00426F6D62030B3Q004C6F63616C506C6179657203083Q0048756D616E6F696403063Q004865616C7468028Q0003063Q005F62C3B86D62027Q0040030C3Q00444541544842412Q5249455203063Q00434672616D65026Q00084003093Q00526167646F2Q6C6564002Q033Q006F6C6403083Q00416E63686F726564010003113Q00506C61796572206E6F7420666F756E642E012B012Q0012082Q0100013Q00102Q000100023Q00122Q000100013Q00202Q00010001000200262Q0001002A2Q0100030004303Q002A2Q01001285000100013Q0020E10001000100040026D40001002A2Q0100030004303Q002A2Q01001285000100013Q0020340001000100054Q000200033Q00122Q000400063Q00122Q000500073Q00202Q00050005000800202Q0005000500094Q000500066Q00043Q000600044Q002200010012850009000A3Q00201A00090009000B00202Q000A0008000C00122Q000B000D6Q000C00016Q0009000C000200202Q00090009000E4Q00090002000200202Q000A0001000E4Q000A0002000200062Q000900220001000A0004303Q002200012Q00EF000200083Q0004303Q0024000100067B00040014000100020004303Q001400010006FB000200222Q013Q0004303Q00222Q012Q00EF000300023Q0012380004000F3Q00202Q0004000400104Q00063Q000400302Q0006000C001100122Q000700133Q00202Q00080003000C00122Q000900146Q00070007000900102Q00060012000700302Q00060015001600302Q0006001700184Q00040006000100122Q0004001A3Q00202Q00040004001B00202Q00040004001C00202Q00040004001D00122Q000400193Q00122Q0004001E3Q00202Q00040004001F00122Q000500206Q00040002000100122Q0004001A3Q00202Q00040004001B00202Q00040004001C00122Q000500213Q00202Q00050005002200122Q000600233Q00122Q000700233Q00122Q000800236Q00050008000200102Q0004001D00050012850004001E3Q0020E100040004001F2Q002F0004000100010020E10004000300240006FB000400182Q013Q0004303Q00182Q010020E1000400030024002010000400040025001293000600264Q00700004000600020006FB000400182Q013Q0004303Q00182Q010020E1000400030024002010000400040025001293000600274Q00700004000600020006FB000400182Q013Q0004303Q00182Q01002010000400030025001293000600284Q00700004000600020006FB000400182Q013Q0004303Q00182Q010020E1000400030028002010000400040025001293000600294Q00700004000600020006FB000400182Q013Q0004303Q00182Q010020E10004000300280020E10004000400290020E100040004002A0026D4000400182Q01002B0004303Q00182Q01001285000400073Q0020E10004000400080020E100040004002C0020E10004000400240006FB000400182Q013Q0004303Q00182Q01001285000400073Q0020F100040004000800202Q00040004002C00202Q00040004002400202Q00040004002500122Q000600266Q00040006000200062Q000400182Q013Q0004303Q00182Q01001285000400073Q0020F100040004000800202Q00040004002C00202Q00040004002400202Q00040004002500122Q000600276Q00040006000200062Q000400182Q013Q0004303Q00182Q01001285000400073Q0020F100040004000800202Q00040004002C00202Q00040004002400202Q00040004002500122Q0006002D6Q00040006000200062Q000400182Q013Q0004303Q00182Q01001285000400073Q00202900040004000800202Q00040004002C00202Q00040004002400202Q00040004002500122Q0006002D6Q00040006000200202Q00040004002E00262Q000400182Q01002F0004303Q00182Q010012850004001A3Q00201D00040004002500202Q00060003000C00122Q000700306Q0006000600074Q00040006000200062Q000400182Q013Q0004303Q00182Q010012930004002F3Q0026D4000400BB000100310004303Q00BB00010012930005002F3Q0026D40005009F0001002F0004303Q009F00010012850006001E3Q00209500060006001F4Q00060001000100122Q0006001A3Q00202Q00060006003200122Q000700073Q00202Q00070007000800202Q00070007002C00202Q00070007002400202Q00070007002600202Q00070007003300102Q00060033000700044Q00AF00010004303Q009F0001001285000600073Q0020CD00060006000800202Q00060006002C00202Q00060006002400202Q00060006002D00202Q00060006002E00262Q0006009E0001002F0004303Q009E00010012850005001E3Q0020E100050005001F2Q002F000500010001001293000400343Q0026D4000400EF0001002F0004303Q00EF00010012930005002F3Q0026D4000500BE0001002F0004303Q00BE00010012850006001E3Q00202300060006001F4Q00060001000100122Q0006001A3Q00202Q00060006002500202Q00080003000C00122Q000900306Q0008000800094Q00060008000200062Q000600DA00013Q0004303Q00DA0001001285000600073Q00200500060006000800202Q00060006002C00202Q00060006002400202Q00060006002600122Q0007001A3Q00202Q00070007002500202Q00090003000C00122Q000A00306Q00090009000A4Q00070009000200202Q00070007003300102Q00060033000700044Q00DA00010004303Q00BE0001001285000600073Q0020CD00060006000800202Q00060006002C00202Q00060006002400202Q00060006003500202Q00060006002A00262Q000600BD000100030004303Q00BD00010012850006001A3Q00208700060006002500202Q00080003000C00122Q000900306Q0008000800094Q00060008000200262Q000600BD000100360004303Q00BD00010012850005001E3Q0020E100050005001F001293000600204Q00940005000200010012930004000D3Q0026D4000400F90001000D0004303Q00F900010012850005001A3Q00207D00050005003200202Q00050005003300122Q000500373Q00122Q0005001E3Q00202Q00050005001F4Q00050001000100122Q000400313Q0026D40004009C000100340004303Q009C00010012850005001A3Q00202C00050005003200122Q000600373Q00102Q00050033000600122Q000500073Q00202Q00050005000800202Q00050005002C00202Q00050005002400062Q000500182Q013Q0004303Q00182Q01001285000500073Q0020F100050005000800202Q00050005002C00202Q00050005002400202Q00050005002500122Q000700266Q00050007000200062Q000500182Q013Q0004303Q00182Q01001285000500073Q00207400050005000800202Q00050005002C00202Q00050005002400202Q00050005002500122Q000700266Q00050007000200302Q0005003800030004303Q00182Q010004303Q009C0001001285000400013Q0020E10004000400020026D400040046000100390004303Q004600010012850004001A3Q00205700040004001B00202Q00040004001C00122Q000500193Q00102Q0004001D000500044Q002A2Q010012850004000F3Q0020220004000400104Q00063Q000400302Q0006000C001100302Q00060012003A00302Q00060015001600302Q0006001700184Q0004000600012Q00ED3Q00017Q00353Q0003023Q005F4703093Q00526F6268656C7065722Q0103073Q005072656D69756D03133Q00506C61796572546F48656C704D61737465727903053Q00706169727303043Q0067616D6503073Q00506C6179657273030A3Q00476574506C617965727303063Q00737472696E672Q033Q0073756203043Q004E616D65026Q00F03F03053Q006C6F77657203083Q004F72696F6E4C696203103Q004D616B654E6F74696669636174696F6E03073Q005761726E696E6703073Q00436F6E74656E7403073Q00506C617965722003073Q0020666F756E642103053Q00496D61676503343Q007262787468756D623A2Q2F747970653D412Q7365742669643D2Q31393833323139342Q353837343826773D31353026683D31353003043Q0054696D65026Q00144003073Q006F6C6473697A6503093Q00776F726B737061636503053Q004C6F2Q627903093Q0054656C65706F72743203043Q0053697A6503043Q007461736B03043Q0077616974029A5Q99B93F03073Q00566563746F72332Q033Q006E6577026Q005940028Q0003093Q00436861726163746572030E3Q0046696E6446697273744368696C6403103Q0048756D616E6F6964522Q6F745061727403073Q00656E7465726564030B3Q006C6561646572737461747303053Q00476C6F766503053Q0056616C75652Q033Q00726F62030B3Q004C6F63616C506C6179657203083Q0048756D616E6F696403063Q004865616C746803053Q004669656C6403063Q00697061697273030B3Q004765744368696C6472656E03063Q00434672616D65010003113Q00506C61796572206E6F7420666F756E642E01C33Q0012082Q0100013Q00102Q000100023Q00122Q000100013Q00202Q00010001000200262Q000100C2000100030004303Q00C20001001285000100013Q0020E10001000100040026D4000100C2000100030004303Q00C20001001285000100013Q0020340001000100054Q000200033Q00122Q000400063Q00122Q000500073Q00202Q00050005000800202Q0005000500094Q000500066Q00043Q000600044Q002200010012850009000A3Q00201A00090009000B00202Q000A0008000C00122Q000B000D6Q000C00016Q0009000C000200202Q00090009000E4Q00090002000200202Q000A0001000E4Q000A0002000200062Q000900220001000A0004303Q002200012Q00EF000200083Q0004303Q0024000100067B00040014000100020004303Q001400010006FB000200BA00013Q0004303Q00BA00012Q00EF000300023Q0012380004000F3Q00202Q0004000400104Q00063Q000400302Q0006000C001100122Q000700133Q00202Q00080003000C00122Q000900146Q00070007000900102Q00060012000700302Q00060015001600302Q0006001700184Q00040006000100122Q0004001A3Q00202Q00040004001B00202Q00040004001C00202Q00040004001D00122Q000400193Q00122Q0004001E3Q00202Q00040004001F00122Q000500206Q00040002000100122Q0004001A3Q00202Q00040004001B00202Q00040004001C00122Q000500213Q00202Q00050005002200122Q000600233Q00122Q000700233Q00122Q000800236Q00050008000200102Q0004001D0005001293000400243Q000EB300240047000100040004303Q004700010012850005001E3Q0020E100050005001F2Q002F0005000100010020E10005000300250006FB000500B000013Q0004303Q00B000010020E1000500030025002010000500050026001293000700274Q00700005000700020006FB000500B000013Q0004303Q00B000010020E1000500030025002010000500050026001293000700284Q00700005000700020006FB000500B000013Q0004303Q00B00001002010000500030026001293000700294Q00700005000700020006FB000500B000013Q0004303Q00B000010020E10005000300290020100005000500260012930007002A4Q00700005000700020006FB000500B000013Q0004303Q00B000010020E10005000300290020E100050005002A0020E100050005002B0026D4000500B00001002C0004303Q00B00001001285000500073Q0020E10005000500080020E100050005002D0020E10005000500250006FB000500B000013Q0004303Q00B00001001285000500073Q0020F100050005000800202Q00050005002D00202Q00050005002500202Q00050005002600122Q000700276Q00050007000200062Q000500B000013Q0004303Q00B00001001285000500073Q0020F100050005000800202Q00050005002D00202Q00050005002500202Q00050005002600122Q000700286Q00050007000200062Q000500B000013Q0004303Q00B00001001285000500073Q0020F100050005000800202Q00050005002D00202Q00050005002500202Q00050005002600122Q0007002E6Q00050007000200062Q000500B000013Q0004303Q00B00001001285000500073Q00202900050005000800202Q00050005002D00202Q00050005002500202Q00050005002600122Q0007002E6Q00050007000200202Q00050005002F00262Q000500B0000100240004303Q00B000010012850005001A3Q002010000500050026001293000700304Q00700005000700020006FB000500B000013Q0004303Q00B00001001285000500313Q0012F40006001A3Q00202Q0006000600324Q000600076Q00053Q000700044Q00AC00010020E1000A0009000C0026D4000A00AC000100300004303Q00AC0001001285000A00073Q002013000A000A000800202Q000A000A002D00202Q000A000A002500202Q000A000A002700202Q000A000A003300102Q00090033000A00067B000500A2000100020004303Q00A200010004303Q00B000010004303Q00470001001285000500013Q0020E10005000500020026D400050046000100340004303Q004600010012850004001A3Q00205700040004001B00202Q00040004001C00122Q000500193Q00102Q0004001D000500044Q00C200010012850004000F3Q0020220004000400104Q00063Q000400302Q0006000C001100302Q00060012003500302Q00060015001600302Q0006001700184Q0004000600012Q00ED3Q00017Q003E3Q0003023Q005F47030A3Q00466F727468656C7065722Q0103073Q005072656D69756D03133Q00506C61796572546F48656C704D61737465727903053Q00706169727303043Q0067616D6503073Q00506C6179657273030A3Q00476574506C617965727303063Q00737472696E672Q033Q0073756203043Q004E616D65026Q00F03F03053Q006C6F77657203083Q004F72696F6E4C696203103Q004D616B654E6F74696669636174696F6E03073Q005761726E696E6703073Q00436F6E74656E7403073Q00506C617965722003073Q0020666F756E642103053Q00496D61676503343Q007262787468756D623A2Q2F747970653D412Q7365742669643D2Q31393833323139342Q353837343826773D31353026683D31353003043Q0054696D65026Q00144003073Q006F6C6473697A6503093Q00776F726B737061636503053Q004C6F2Q627903093Q0054656C65706F72743203043Q0053697A6503043Q007461736B03043Q0077616974029A5Q99B93F03073Q00566563746F72332Q033Q006E6577026Q005940028Q0003093Q00436861726163746572030E3Q0046696E6446697273744368696C6403103Q0048756D616E6F6964522Q6F745061727403073Q00656E7465726564030B3Q006C6561646572737461747303053Q00476C6F766503053Q0056616C756503043Q00466F7274030B3Q004C6F63616C506C6179657203083Q0048756D616E6F696403063Q00697061697273030B3Q004765744368696C6472656E03043Q0050617274030A3Q0062726F776E736D6F6B65030A3Q0043616E436F2Q6C6964650100027Q004003063Q00434672616D6503113Q005265706C69636174656453746F72616765030D3Q0053656C664B6E6F636B6261636B030A3Q004669726553657276657203053Q00466F72636503093Q00446972656374696F6E026Q0024C0026Q00E03F03113Q00506C61796572206E6F7420666F756E642E01DF3Q0012082Q0100013Q00102Q000100023Q00122Q000100013Q00202Q00010001000200262Q000100DE000100030004303Q00DE0001001285000100013Q0020E10001000100040026D4000100DE000100030004303Q00DE0001001285000100013Q0020340001000100054Q000200033Q00122Q000400063Q00122Q000500073Q00202Q00050005000800202Q0005000500094Q000500066Q00043Q000600044Q002200010012850009000A3Q00201A00090009000B00202Q000A0008000C00122Q000B000D6Q000C00016Q0009000C000200202Q00090009000E4Q00090002000200202Q000A0001000E4Q000A0002000200062Q000900220001000A0004303Q002200012Q00EF000200083Q0004303Q0024000100067B00040014000100020004303Q001400010006FB000200D600013Q0004303Q00D600012Q00EF000300023Q0012380004000F3Q00202Q0004000400104Q00063Q000400302Q0006000C001100122Q000700133Q00202Q00080003000C00122Q000900146Q00070007000900102Q00060012000700302Q00060015001600302Q0006001700184Q00040006000100122Q0004001A3Q00202Q00040004001B00202Q00040004001C00202Q00040004001D00122Q000400193Q00122Q0004001E3Q00202Q00040004001F00122Q000500206Q00040002000100122Q0004001A3Q00202Q00040004001B00202Q00040004001C00122Q000500213Q00202Q00050005002200122Q000600233Q00122Q000700233Q00122Q000800236Q00050008000200102Q0004001D0005001293000400243Q0026D400040047000100240004303Q004700010012850005001E3Q0020E100050005001F2Q002F0005000100010020E10005000300250006FB000500CC00013Q0004303Q00CC00010020E1000500030025002010000500050026001293000700274Q00700005000700020006FB000500CC00013Q0004303Q00CC00010020E1000500030025002010000500050026001293000700284Q00700005000700020006FB000500CC00013Q0004303Q00CC0001002010000500030026001293000700294Q00700005000700020006FB000500CC00013Q0004303Q00CC00010020E10005000300290020100005000500260012930007002A4Q00700005000700020006FB000500CC00013Q0004303Q00CC00010020E10005000300290020E100050005002A0020E100050005002B0026D4000500CC0001002C0004303Q00CC0001001285000500073Q0020E10005000500080020E100050005002D0020E10005000500250006FB000500CC00013Q0004303Q00CC0001001285000500073Q0020F100050005000800202Q00050005002D00202Q00050005002500202Q00050005002600122Q000700276Q00050007000200062Q000500CC00013Q0004303Q00CC0001001285000500073Q0020F100050005000800202Q00050005002D00202Q00050005002500202Q00050005002600122Q000700286Q00050007000200062Q000500CC00013Q0004303Q00CC0001001285000500073Q0020F100050005000800202Q00050005002D00202Q00050005002500202Q00050005002600122Q0007002E6Q00050007000200062Q000500CC00013Q0004303Q00CC00010012850005002F3Q0012F40006001A3Q00202Q0006000600304Q000600076Q00053Q000700044Q00C800010020E1000A0009000C0026D4000A00C8000100310004303Q00C80001002010000A00090026001293000C00324Q0070000A000C00020006FB000A00C800013Q0004303Q00C80001001293000A00244Q009C000B000B3Q0026D4000A009C000100240004303Q009C0001001293000B00243Q0026D4000B00A60001000D0004303Q00A600010030DE000900330034001285000C001E3Q0020E1000C000C001F2Q002F000C00010001001293000B00353Q0026D4000B00B0000100350004303Q00B00001001285000C00073Q002013000C000C000800202Q000C000C002D00202Q000C000C002500202Q000C000C002700202Q000C000C003600102Q00090036000C0004303Q00C800010026D4000B009F000100240004303Q009F0001001285000C00073Q00205B000C000C003700202Q000C000C003800202Q000C000C00394Q000E3Q000200302Q000E003A000D00122Q000F00213Q00202Q000F000F002200122Q001000243Q00122Q001100243Q00122Q0012003C6Q000F0012000200102Q000E003B000F4Q000C000E000100122Q000C001E3Q00202Q000C000C001F00122Q000D003D6Q000C0002000100122Q000B000D3Q00044Q009F00010004303Q00C800010004303Q009C000100067B00050092000100020004303Q009200010004303Q00CC00010004303Q00470001001285000500013Q0020E10005000500020026D400050046000100340004303Q004600010012850004001A3Q00205700040004001B00202Q00040004001C00122Q000500193Q00102Q0004001D000500044Q00DE00010012850004000F3Q0020220004000400104Q00063Q000400302Q0006000C001100302Q00060012003E00302Q00060015001600302Q0006001700184Q0004000600012Q00ED3Q00017Q000F3Q00028Q0003023Q005F47030C3Q00676C6F76656C68656C7065722Q0103073Q005072656D69756D2Q033Q006F6C6403043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203093Q0043686172616374657203103Q0048756D616E6F6964522Q6F745061727403063Q00434672616D6503043Q007461736B03043Q00776169740100013B3Q001293000100014Q009C000200023Q0026D400010002000100010004303Q00020001001293000200013Q0026D400020005000100010004303Q00050001001285000300023Q001078000300033Q001285000300023Q0020E10003000300030026D40003003A000100040004303Q003A0001001285000300023Q0020E10003000300050026D40003003A000100040004303Q003A0001001293000300014Q009C000400043Q0026D400030013000100010004303Q00130001001293000400013Q0026D400040016000100010004303Q00160001001285000500073Q00203A00050005000800202Q00050005000900202Q00050005000A00202Q00050005000B00202Q00050005000C00122Q000500063Q001293000500013Q0026D400050020000100010004303Q002000010012850006000D3Q00206600060006000E4Q00060001000100122Q000600073Q00202Q00060006000800202Q00060006000900202Q00060006000A00202Q00060006000B00122Q000700063Q00102Q0006000C000700044Q002E00010004303Q00200001001285000600023Q0020E10006000600030026D40006001F0001000F0004303Q001F00010004303Q003A00010004303Q001600010004303Q003A00010004303Q001300010004303Q003A00010004303Q000500010004303Q003A00010004303Q000200012Q00ED3Q00017Q000F3Q00028Q0003023Q005F47030E3Q00656E67696E2Q657268656C7065722Q0103073Q005072656D69756D2Q033Q006F6C6403043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203093Q0043686172616374657203103Q0048756D616E6F6964522Q6F745061727403063Q00434672616D6503043Q007461736B03043Q0077616974010001413Q001293000100014Q009C000200023Q0026D400010002000100010004303Q00020001001293000200013Q0026D400020005000100010004303Q00050001001285000300023Q001078000300033Q001285000300023Q0020E10003000300030026D400030040000100040004303Q00400001001285000300023Q0020E10003000300050026D400030040000100040004303Q00400001001293000300014Q009C000400043Q0026D400030013000100010004303Q00130001001293000400013Q0026D400040016000100010004303Q00160001001285000500073Q00203A00050005000800202Q00050005000900202Q00050005000A00202Q00050005000B00202Q00050005000C00122Q000500063Q001293000500014Q009C000600063Q0026D400050021000100010004303Q00210001001293000600013Q000EB300010024000100060004303Q002400010012850007000D3Q00206600070007000E4Q00070001000100122Q000700073Q00202Q00070007000800202Q00070007000900202Q00070007000A00202Q00070007000B00122Q000800063Q00102Q0007000C000800044Q003400010004303Q002400010004303Q003400010004303Q00210001001285000700023Q0020E10007000700030026D40007001F0001000F0004303Q001F00010004303Q004000010004303Q001600010004303Q004000010004303Q001300010004303Q004000010004303Q000500010004303Q004000010004303Q000200012Q00ED3Q00017Q00243Q0003023Q005F47030F3Q00656E67696E2Q657268656C70652Q722Q0103073Q005072656D69756D03073Q006F6C6473697A6503093Q00776F726B737061636503053Q004C6F2Q627903093Q0054656C65706F72743203043Q0053697A6503043Q007461736B03043Q0077616974029A5Q99B93F03073Q00566563746F72332Q033Q006E6577026Q00594003063Q00697061697273030B3Q004765744368696C6472656E03043Q004E616D6503063Q0054752Q726574030E3Q0046696E6446697273744368696C6403093Q0048696E67655061727403053Q00476C6F7665028Q00026Q00F03F030C3Q0054617267657454752Q72657403063Q00636672616D6503063Q00434672616D6503043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203093Q0043686172616374657203103Q0048756D616E6F6964522Q6F745061727403073Q00656E746572656403083Q0048756D616E6F696400010001AA3Q0012082Q0100013Q00102Q000100023Q00122Q000100013Q00202Q00010001000200262Q000100A9000100030004303Q00A90001001285000100013Q0020E10001000100040026D4000100A9000100030004303Q00A90001001285000100063Q0020B900010001000700202Q00010001000800202Q00010001000900122Q000100053Q00122Q0001000A3Q00202Q00010001000B00122Q0002000C6Q00010002000100122Q000100063Q00202Q00010001000700202Q00010001000800122Q0002000D3Q00202Q00020002000E00122Q0003000F3Q00122Q0004000F3Q00122Q0005000F6Q00020005000200102Q0001000900020012850001000A3Q0020D100010001000B4Q00010001000100122Q000100103Q00122Q000200063Q00202Q0002000200114Q000200036Q00013Q000300044Q009E00010020E10006000500120026D40006009E000100130004303Q009E0001002010000600050014001293000800154Q00700006000800020006FB0006009E00013Q0004303Q009E00010020E1000600050015002010000600060014001293000800164Q00700006000800020006FB0006009E00013Q0004303Q009E0001001293000600174Q009C000700073Q0026D400060036000100170004303Q00360001001293000700173Q0026D40007008E000100180004303Q008E0001001285000800063Q002010000800080014001293000A00194Q00700008000A00020006FB0008004700013Q0004303Q00470001001285000800063Q00200E00080008001900202Q00080008001500202Q00080008001600202Q00080008001B00122Q0008001A3Q001293000800174Q009C000900093Q0026D400080049000100170004303Q00490001001293000900173Q0026D40009004C000100170004303Q004C0001001285000A000A3Q0020BF000A000A000B4Q000A0001000100122Q000A00063Q00202Q000A000A001400122Q000C00196Q000A000C000200062Q000A008300013Q0004303Q00830001001285000A001C3Q0020E1000A000A001D0020E1000A000A001E0020E1000A000A001F0006FB000A008300013Q0004303Q00830001001285000A001C3Q0020F1000A000A001D00202Q000A000A001E00202Q000A000A001F00202Q000A000A001400122Q000C00206Q000A000C000200062Q000A008300013Q0004303Q00830001001285000A001C3Q0020F1000A000A001D00202Q000A000A001E00202Q000A000A001F00202Q000A000A001400122Q000C00216Q000A000C000200062Q000A008300013Q0004303Q00830001001285000A001C3Q0020F1000A000A001D00202Q000A000A001E00202Q000A000A001F00202Q000A000A001400122Q000C00226Q000A000C000200062Q000A008300013Q0004303Q00830001001285000A001C3Q0020E3000A000A001D00202Q000A000A001E00202Q000A000A001F00202Q000A000A002000122Q000B001A3Q00102Q000A001B000B00044Q008300010004303Q004C00010004303Q008300010004303Q00490001001285000A00063Q002010000A000A0014001293000C00194Q0070000A000C00020026C3000A009E000100230004303Q009E0001001285000A00013Q0020E1000A000A00020026D4000A0047000100240004303Q004700010004303Q009E00010026D400070039000100170004303Q003900010030DE0005001200190012850008000A3Q0020BF00080008000B4Q00080001000100122Q000800063Q00202Q00080008001400122Q000A00196Q0008000A000200062Q0008009100013Q0004303Q00910001001293000700183Q0004303Q003900010004303Q009E00010004303Q0036000100067B00010026000100020004303Q00260001001285000100013Q0020E10001000100020026D40001001D000100240004303Q001D0001001285000100063Q0020E10001000100070020E1000100010008001285000200053Q0010780001000900022Q00ED3Q00017Q002C3Q0003023Q005F4703103Q00656E67696E2Q657268656C70653Q722Q0103073Q005072656D69756D03073Q006F6C6473697A6503093Q00776F726B737061636503053Q004C6F2Q627903093Q0054656C65706F72743203043Q0053697A6503043Q007461736B03043Q0077616974029A5Q99B93F03073Q00566563746F72332Q033Q006E6577026Q005940028Q00027Q0040030C3Q00444541544842412Q5249455203063Q00434672616D6503043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203093Q0043686172616374657203103Q0048756D616E6F6964522Q6F745061727403083Q0048756D616E6F696403063Q004865616C7468026Q0008402Q033Q006F6C64026Q00104003043Q007469636B026Q00F03F030E3Q0046696E6446697273744368696C6403073Q00656E746572656403083Q00416E63686F726564026Q00144003053Q007061697273030B3Q004765744368696C6472656E03043Q004E616D6503063Q0054752Q72657403093Q0048696E67655061727403053Q00476C6F76650003173Q0074752Q72652Q7468617477692Q6C6B692Q6C2Q75736967010001EB3Q0012082Q0100013Q00102Q000100023Q00122Q000100013Q00202Q00010001000200262Q000100EA000100030004303Q00EA0001001285000100013Q0020E10001000100040026D4000100EA000100030004303Q00EA0001001285000100063Q0020B900010001000700202Q00010001000800202Q00010001000900122Q000100053Q00122Q0001000A3Q00202Q00010001000B00122Q0002000C6Q00010002000100122Q000100063Q00202Q00010001000700202Q00010001000800122Q0002000D3Q00202Q00020002000E00122Q0003000F3Q00122Q0004000F3Q00122Q0005000F6Q00020005000200102Q000100090002001293000100104Q009C000200023Q0026D40001003E000100110004303Q003E00010012850003000A3Q0020E100030003000B2Q002F000300010001001293000300103Q0026D400030025000100100004303Q002500010012850004000A3Q00209500040004000B4Q00040001000100122Q000400063Q00202Q00040004001200122Q000500143Q00202Q00050005001500202Q00050005001600202Q00050005001700202Q00050005001800202Q00050005001300102Q00040013000500044Q003500010004303Q00250001001285000400143Q0020CD00040004001500202Q00040004001600202Q00040004001700202Q00040004001900202Q00040004001A00262Q00040024000100100004303Q002400010012930001001B3Q0026D4000100480001001B0004303Q004800010012850003000A3Q00203900030003000B4Q00030001000100122Q000300063Q00202Q00030003001200122Q0004001C3Q00102Q00030013000400122Q0001001D3Q0026D400010051000100100004303Q005100010012850003000A3Q00204500030003000B4Q00030001000100122Q0003001E6Q0003000100024Q000200033Q00122Q0001001F3Q0026D4000100780001001D0004303Q00780001001285000300143Q0020E10003000300150020E10003000300160020E10003000300170006FB0003007300013Q0004303Q00730001001285000300143Q0020F100030003001500202Q00030003001600202Q00030003001700202Q00030003002000122Q000500186Q00030005000200062Q0003007300013Q0004303Q00730001001285000300143Q0020F100030003001500202Q00030003001600202Q00030003001700202Q00030003002000122Q000500216Q00030005000200062Q0003007300013Q0004303Q00730001001285000300143Q00207400030003001500202Q00030003001600202Q00030003001700202Q00030003002000122Q000500186Q00030005000200302Q0003002200030012850003000A3Q0020E100030003000B0012930004001D4Q00940003000200010004303Q00E100010026D40001001F0001001F0004303Q001F00010012850003001E4Q00FE0003000100022Q0081000300030002002655000300DB000100230004303Q00DB0001001293000300104Q009C000400043Q0026D400030081000100100004303Q00810001001293000400103Q0026D40004008A0001001F0004303Q008A00010012850005000A3Q0020E100050005000B2Q002F0005000100010004303Q007A00010026D400040084000100100004303Q00840001001285000500243Q0012F4000600063Q00202Q0006000600254Q000600076Q00053Q000700044Q00CC00010020E1000A000900260026D4000A00CC000100270004303Q00CC0001002010000A00090020001293000C00284Q0070000A000C00020006FB000A00CC00013Q0004303Q00CC00010020E1000A00090028002010000A000A0020001293000C00294Q0070000A000C00020006FB000A00CC00013Q0004303Q00CC0001001285000A00143Q0020E1000A000A00150020E1000A000A00160020E1000A000A00170006FB000A00CC00013Q0004303Q00CC0001001285000A00143Q0020F1000A000A001500202Q000A000A001600202Q000A000A001700202Q000A000A002000122Q000C00186Q000A000C000200062Q000A00CC00013Q0004303Q00CC0001001285000A00143Q0020F1000A000A001500202Q000A000A001600202Q000A000A001700202Q000A000A002000122Q000C00216Q000A000C000200062Q000A00CC00013Q0004303Q00CC0001001285000A00143Q0020F1000A000A001500202Q000A000A001600202Q000A000A001700202Q000A000A002000122Q000C00196Q000A000C000200062Q000A00CC00013Q0004303Q00CC0001001285000A00143Q0020D6000A000A001500202Q000A000A001600202Q000A000A001700202Q000A000A001800202Q000B0009002800202Q000B000B002000122Q000D00296Q000B000D000200202Q000B000B001300102Q000A0013000B00067B00050092000100020004303Q00920001001285000500063Q002010000500050020001293000700274Q00700005000700020026D4000500D60001002A0004303Q00D600012Q009C000500053Q0012F00005002B3Q0012930004001F3Q0004303Q008400010004303Q007A00010004303Q008100010004303Q007A0001001285000300063Q0020E000030003001200202Q00030003001300122Q0003001C3Q00122Q000100113Q00044Q001F0001001285000300013Q0020E10003000300020026D40003001D0001002C0004303Q001D0001001285000100063Q0020E10001000100070020E1000100010008001285000200053Q0010780001000900022Q00ED3Q00017Q00373Q0003023Q005F4703133Q00506C61796572546F48656C704D61737465727903053Q00706169727303043Q0067616D6503073Q00506C6179657273030A3Q00476574506C617965727303063Q00737472696E672Q033Q0073756203043Q004E616D65026Q00F03F03053Q006C6F776572028Q00027Q004003113Q005265706C69636174656453746F72616765030C3Q00436C6F75644162696C697479030A3Q004669726553657276657203043Q007461736B03043Q007761697403093Q00776F726B7370616365030E3Q0046696E6446697273744368696C64030A3Q00506C617965724E616D6503063Q005F436C6F7564026Q000840026Q001040029A5Q99D93F030B3Q0056656869636C655365617403063Q00434672616D652Q033Q006E6577024Q008079D140026Q005EC0025Q00AEABC02Q033Q004E4558030A3Q004571756970476C6F766503053Q00436C6F7564026Q33D33F026Q002440030B3Q004C6F63616C506C6179657203093Q0043686172616374657203083Q0048756D616E6F69642Q033Q005369742Q0103103Q0048756D616E6F6964522Q6F7450617274029A5Q99B93F027B14AE47E17A843F03053Q004F7269676F025Q00C0624003083Q004F72696F6E4C696203103Q004D616B654E6F74696669636174696F6E03073Q005761726E696E6703073Q00436F6E74656E7403113Q00506C61796572206E6F7420666F756E642E03053Q00496D61676503343Q007262787468756D623A2Q2F747970653D412Q7365742669643D2Q31393833323139342Q353837343826773D31353026683D31353003043Q0054696D65026Q00144000E93Q00124A3Q00013Q00206Q00024Q000100023Q00122Q000300033Q00122Q000400043Q00202Q00040004000500202Q0004000400064Q000400056Q00033Q000500044Q00180001001285000800073Q00201A00080008000800202Q00090007000900122Q000A000A6Q000B8Q0008000B000200202Q00080008000B4Q00080002000200202Q00093Q000B4Q00090002000200062Q00080018000100090004303Q001800012Q00EF000100073Q0004303Q001A000100067B0003000A000100020004303Q000A00010006FB000100E000013Q0004303Q00E000010012930003000C3Q0026D4000300300001000D0004303Q00300001001285000400043Q0020E100040004000E0020E100040004000F0020100004000400102Q0094000400020001001285000400113Q0020BC0004000400124Q00040001000100122Q000400133Q00202Q00040004001400122Q000600153Q00122Q000700166Q0006000600074Q00040006000200062Q0004002400013Q0004303Q00240001001293000300173Q0026D400030045000100180004303Q00450001001285000400113Q00203F00040004001200122Q000500196Q00040002000100122Q000400133Q00202Q00040004001400122Q000600153Q00122Q000700166Q0006000600074Q00040006000200202Q00040004001A00122Q0005001B3Q00202Q00050005001C00122Q0006001D3Q00122Q0007001E3Q00122Q0008001F6Q00050008000200102Q0004001B000500044Q00E800010026D4000300500001000A0004303Q00500001001285000400203Q00208900040004002100122Q000600226Q00040006000100122Q000400113Q00202Q00040004001200122Q000500236Q00040002000100122Q0003000D3Q0026D4000300C8000100170004303Q00C800010012930004000A3Q001293000500243Q0012930006000A3Q00048B0004009700010012930008000C4Q009C000900093Q0026D4000800580001000C0004303Q005800010012930009000C3Q0026D40009005B0001000C0004303Q005B0001001285000A00043Q002029000A000A000500202Q000A000A002500202Q000A000A002600202Q000A000A001400122Q000C00276Q000A000C000200202Q000A000A002800262Q000A008E000100290004303Q008E0001001293000A000C4Q009C000B000B3Q0026D4000A00690001000C0004303Q00690001001293000B000C3Q0026D4000B006C0001000C0004303Q006C0001001285000C00113Q002049000C000C00124Q000C0001000100122Q000C00043Q00202Q000C000C000500202Q000C000C002500202Q000C000C002600202Q000C000C001400122Q000E002A6Q000C000E000200122Q000D00133Q00202Q000D000D001400122Q000F00153Q00122Q001000166Q000F000F00104Q000D000F000200202Q000D000D001B00102Q000C001B000D00044Q008400010004303Q006C00010004303Q008400010004303Q00690001001285000C00043Q00208D000C000C000500202Q000C000C002500202Q000C000C002600202Q000C000C001400122Q000E00276Q000C000E000200202Q000C000C002800262Q000C0067000100290004303Q00670001001285000A00113Q0020E1000A000A0012001293000B002B4Q0094000A000200010004303Q009600010004303Q005B00010004303Q009600010004303Q005800010004E70004005600010012930004000A3Q001293000500243Q0012930006000A3Q00048B000400C700010012930008000C3Q0026D40008009C0001000C0004303Q009C00010020E100090002002600200001090009001400122Q000B00276Q0009000B000200202Q00090009002800262Q000900C0000100290004303Q00C000010012930009000C3Q0026D4000900A60001000C0004303Q00A60001001285000A00113Q002060000A000A00124Q000A0001000100202Q000A0002002600202Q000A000A001400122Q000C002A6Q000A000C000200122Q000B00133Q00202Q000B000B001400122Q000D00153Q00122Q000E00166Q000D000D000E4Q000B000D000200202Q000B000B001B00102Q000A001B000B00044Q00B900010004303Q00A600010020E1000A00020026002084000A000A001400122Q000C00276Q000A000C000200202Q000A000A002800262Q000A00A5000100290004303Q00A50001001285000900113Q0020E1000900090012001293000A002C4Q00940009000200010004303Q00C600010004303Q009C00010004E70004009B0001001293000300183Q000EB3000C001D000100030004303Q001D00012Q00EF000200013Q0012C4000400043Q00202Q00040004000500202Q00040004002500202Q00040004002600202Q00040004001400122Q0006002A6Q00040006000200122Q000500133Q00202Q00050005002D00202Q00050005001B0012850006001B3Q00209700060006001C00122Q0007000C3Q00122Q0008002E3Q00122Q0009000C6Q0006000900024Q00050005000600102Q0004001B000500122Q0003000A3Q00044Q001D00010004303Q00E800010012850003002F3Q0020220003000300304Q00053Q000400302Q00050009003100302Q00050032003300302Q00050034003500302Q0005003600374Q0003000500012Q00ED3Q00017Q000F3Q00028Q0003023Q005F4703113Q00466C61736848656C706572416E63686F722Q0103073Q005072656D69756D2Q033Q006F6C6403043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203093Q0043686172616374657203103Q0048756D616E6F6964522Q6F745061727403063Q00434672616D6503043Q007461736B03043Q0077616974010001413Q001293000100014Q009C000200023Q0026D400010002000100010004303Q00020001001293000200013Q0026D400020005000100010004303Q00050001001285000300023Q001078000300033Q001285000300023Q0020E10003000300030026D400030040000100040004303Q00400001001285000300023Q0020E10003000300050026D400030040000100040004303Q00400001001293000300014Q009C000400043Q0026D400030013000100010004303Q00130001001293000400013Q0026D400040016000100010004303Q00160001001285000500073Q00203A00050005000800202Q00050005000900202Q00050005000A00202Q00050005000B00202Q00050005000C00122Q000500063Q001293000500014Q009C000600063Q0026D400050021000100010004303Q00210001001293000600013Q0026D400060024000100010004303Q002400010012850007000D3Q00206600070007000E4Q00070001000100122Q000700073Q00202Q00070007000800202Q00070007000900202Q00070007000A00202Q00070007000B00122Q000800063Q00102Q0007000C000800044Q003400010004303Q002400010004303Q003400010004303Q00210001001285000700023Q0020E10007000700030026D40007001F0001000F0004303Q001F00010004303Q004000010004303Q001600010004303Q004000010004303Q001300010004303Q004000010004303Q000500010004303Q004000010004303Q000200012Q00ED3Q00017Q00283Q0003023Q005F47030B3Q00466C61736848656C7065722Q0103073Q005072656D69756D03133Q00506C61796572546F48656C704D61737465727903053Q00706169727303043Q0067616D6503073Q00506C6179657273030A3Q00476574506C617965727303063Q00737472696E672Q033Q0073756203043Q004E616D65026Q00F03F03053Q006C6F77657203083Q004F72696F6E4C696203103Q004D616B654E6F74696669636174696F6E03073Q005761726E696E6703073Q00436F6E74656E7403073Q00506C617965722003073Q0020666F756E642103053Q00496D61676503343Q007262787468756D623A2Q2F747970653D412Q7365742669643D2Q31393833323139342Q353837343826773D31353026683D31353003043Q0054696D65026Q001440028Q0003043Q007461736B03043Q007761697403093Q00436861726163746572030E3Q0046696E6446697273744368696C6403103Q0048756D616E6F6964522Q6F745061727403073Q00656E7465726564030B3Q004C6F63616C506C6179657200030B3Q00456E746572506F7274616C03093Q0054656C65706F72743203063Q00434672616D652Q033Q006E6577026Q0010C0010003113Q00506C61796572206E6F7420666F756E642E01C03Q0012082Q0100013Q00102Q000100023Q00122Q000100013Q00202Q00010001000200262Q000100BF000100030004303Q00BF0001001285000100013Q0020E10001000100040026D4000100BF000100030004303Q00BF0001001285000100013Q0020340001000100054Q000200033Q00122Q000400063Q00122Q000500073Q00202Q00050005000800202Q0005000500094Q000500066Q00043Q000600044Q002200010012850009000A3Q00201A00090009000B00202Q000A0008000C00122Q000B000D6Q000C00016Q0009000C000200202Q00090009000E4Q00090002000200202Q000A0001000E4Q000A0002000200062Q000900220001000A0004303Q002200012Q00EF000200083Q0004303Q0024000100067B00040014000100020004303Q001400010006FB000200B700013Q0004303Q00B700012Q00EF000300023Q0012DD0004000F3Q00202Q0004000400104Q00063Q000400302Q0006000C001100122Q000700133Q00202Q00080003000C00122Q000900146Q00070007000900102Q00060012000700302Q00060015001600302Q0006001700184Q000400060001001293000400193Q0026D400040034000100190004303Q003400010012850005001A3Q0020E100050005001B2Q002F0005000100010020E100050003001C0006FB000500B200013Q0004303Q00B200010020E100050003001C00201000050005001D0012930007001E4Q00700005000700020006FB000500B200013Q0004303Q00B200010020E100050003001C00201000050005001D0012930007001F4Q00700005000700020006FB000500B200013Q0004303Q00B20001001285000500073Q0020E10005000500080020E10005000500200020E100050005001C0006FB000500B200013Q0004303Q00B20001001285000500073Q0020F100050005000800202Q00050005002000202Q00050005001C00202Q00050005001D00122Q0007001E6Q00050007000200062Q000500B200013Q0004303Q00B20001001285000500073Q0020F100050005000800202Q00050005002000202Q00050005001C00202Q00050005001D00122Q0007001F6Q00050007000200062Q000500B200013Q0004303Q00B20001001293000500193Q0026D400050061000100190004303Q00610001001285000600073Q00204200060006000800202Q00060006002000202Q00060006001C00202Q00060006001D00122Q0008001F6Q00060008000200262Q00060086000100210004303Q00860001001293000600194Q009C000700073Q0026D40006006E000100190004303Q006E0001001293000700193Q0026D400070071000100190004303Q00710001001285000800223Q001293000900234Q00940008000200010012850008001A3Q0020CC00080008001B4Q00080001000100122Q000800073Q00202Q00080008000800202Q00080008002000202Q00080008001C00202Q00080008001D00122Q000A001F6Q0008000A000200062Q0008007600013Q0004303Q007600010004303Q008600010004303Q007100010004303Q008600010004303Q006E0001001285000600073Q0020E10006000600080020E10006000600200020E100060006001C0006FB000600B200013Q0004303Q00B20001001285000600073Q0020F100060006000800202Q00060006002000202Q00060006001C00202Q00060006001D00122Q0008001E6Q00060008000200062Q000600B200013Q0004303Q00B20001001285000600073Q0020F100060006000800202Q00060006002000202Q00060006001C00202Q00060006001D00122Q0008001F6Q00060008000200062Q000600B200013Q0004303Q00B20001001285000600073Q0020F500060006000800202Q00060006002000202Q00060006001C00202Q00060006001E00202Q00070003001C00202Q00070007001E00202Q00070007002400122Q000800243Q00202Q00080008002500122Q000900193Q00122Q000A00193Q00122Q000B00266Q0008000B00024Q00070007000800102Q00060024000700044Q00B200010004303Q006100010004303Q00B200010004303Q00340001001285000500013Q0020E10005000500020026D400050033000100270004303Q003300010004303Q00BF00010012850004000F3Q0020220004000400104Q00063Q000400302Q0006000C001100302Q00060012002800302Q00060015001600302Q0006001700184Q0004000600012Q00ED3Q00017Q000F3Q00028Q0003023Q005F4703133Q00422Q6F7374657248656C706572416E63686F722Q0103073Q005072656D69756D2Q033Q006F6C6403043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203093Q0043686172616374657203103Q0048756D616E6F6964522Q6F745061727403063Q00434672616D6503043Q007461736B03043Q0077616974010001413Q001293000100014Q009C000200023Q0026D400010002000100010004303Q00020001001293000200013Q0026D400020005000100010004303Q00050001001285000300023Q001078000300033Q001285000300023Q0020E10003000300030026D400030040000100040004303Q00400001001285000300023Q0020E10003000300050026D400030040000100040004303Q00400001001293000300014Q009C000400043Q0026D400030013000100010004303Q00130001001293000400013Q0026D400040016000100010004303Q00160001001285000500073Q00203A00050005000800202Q00050005000900202Q00050005000A00202Q00050005000B00202Q00050005000C00122Q000500063Q001293000500014Q009C000600063Q0026D400050021000100010004303Q00210001001293000600013Q0026D400060024000100010004303Q002400010012850007000D3Q00206600070007000E4Q00070001000100122Q000700073Q00202Q00070007000800202Q00070007000900202Q00070007000A00202Q00070007000B00122Q000800063Q00102Q0007000C000800044Q003400010004303Q002400010004303Q003400010004303Q00210001001285000700023Q0020E10007000700030026D40007001F0001000F0004303Q001F00010004303Q004000010004303Q001600010004303Q004000010004303Q001300010004303Q004000010004303Q000500010004303Q004000010004303Q000200012Q00ED3Q00017Q00423Q0003023Q005F47030D3Q00422Q6F7374657248656C7065722Q0103073Q005072656D69756D03133Q00506C61796572546F48656C704D61737465727903053Q00706169727303043Q0067616D6503073Q00506C6179657273030A3Q00476574506C617965727303063Q00737472696E672Q033Q0073756203043Q004E616D65026Q00F03F03053Q006C6F77657203083Q004F72696F6E4C696203103Q004D616B654E6F74696669636174696F6E03073Q005761726E696E6703073Q00436F6E74656E7403073Q00506C617965722003073Q0020666F756E642103053Q00496D61676503343Q007262787468756D623A2Q2F747970653D412Q7365742669643D2Q31393833323139342Q353837343826773D31353026683D31353003043Q0054696D65026Q00144003073Q006F6C6473697A6503093Q00776F726B737061636503053Q004C6F2Q627903093Q0054656C65706F72743203043Q0053697A6503043Q007461736B03043Q0077616974029A5Q99B93F03073Q00566563746F72332Q033Q006E6577026Q00594003093Q00436861726163746572030E3Q0046696E6446697273744368696C6403103Q0048756D616E6F6964522Q6F745061727403073Q00656E7465726564030B3Q006C6561646572737461747303053Q00476C6F766503053Q0056616C756503073Q00422Q6F73746572030B3Q004C6F63616C506C61796572029Q0003063Q00434672616D65026Q0010C0030A3Q0047657453657276696365030E3Q0047657444657363656E64616E7473030D3Q00422Q6F737465724F626A6563742Q033Q0070617203063Q00506172656E74030D3Q00436865636B65644F626A656374027Q004003053Q00622Q6F7374030D3Q004C617374536C612Q7065644279010003053Q004172656E61030F3Q00437562654F6644656174684172656103233Q007468652063756265206F662064656174682869206865617264206974206B692Q6C732903163Q0046696E6446697273744368696C64576869636849734103083Q0048756D616E6F696403063Q004865616C746803073Q0044657374726F7903113Q00506C61796572206E6F7420666F756E642E0164012Q0012082Q0100013Q00102Q000100023Q00122Q000100013Q00202Q00010001000200262Q000100632Q0100030004303Q00632Q01001285000100013Q0020E10001000100040026D4000100632Q0100030004303Q00632Q01001285000100013Q0020340001000100054Q000200033Q00122Q000400063Q00122Q000500073Q00202Q00050005000800202Q0005000500094Q000500066Q00043Q000600044Q002200010012850009000A3Q00201A00090009000B00202Q000A0008000C00122Q000B000D6Q000C00016Q0009000C000200202Q00090009000E4Q00090002000200202Q000A0001000E4Q000A0002000200062Q000900220001000A0004303Q002200012Q00EF000200083Q0004303Q0024000100067B00040014000100020004303Q001400010006FB0002005B2Q013Q0004303Q005B2Q012Q00EF000300023Q0012380004000F3Q00202Q0004000400104Q00063Q000400302Q0006000C001100122Q000700133Q00202Q00080003000C00122Q000900146Q00070007000900102Q00060012000700302Q00060015001600302Q0006001700184Q00040006000100122Q0004001A3Q00202Q00040004001B00202Q00040004001C00202Q00040004001D00122Q000400193Q00122Q0004001E3Q00202Q00040004001F00122Q000500206Q00040002000100122Q0004001A3Q00202Q00040004001B00202Q00040004001C00122Q000500213Q00202Q00050005002200122Q000600233Q00122Q000700233Q00122Q000800236Q00050008000200102Q0004001D00050012850004001E3Q0020E100040004001F2Q002F0004000100010020E10004000300240006FB000400512Q013Q0004303Q00512Q010020E1000400030024002010000400040025001293000600264Q00700004000600020006FB000400512Q013Q0004303Q00512Q010020E1000400030024002010000400040025001293000600274Q00700004000600020006FB000400512Q013Q0004303Q00512Q01002010000400030025001293000600284Q00700004000600020006FB000400512Q013Q0004303Q00512Q010020E1000400030028002010000400040025001293000600294Q00700004000600020006FB000400512Q013Q0004303Q00512Q010020E10004000300280020E10004000400290020E100040004002A0026D4000400512Q01002B0004303Q00512Q01001285000400073Q0020E10004000400080020E100040004002C0020E10004000400240006FB000400512Q013Q0004303Q00512Q01001285000400073Q0020F100040004000800202Q00040004002C00202Q00040004002400202Q00040004002500122Q000600266Q00040006000200062Q000400512Q013Q0004303Q00512Q01001285000400073Q0020F100040004000800202Q00040004002C00202Q00040004002400202Q00040004002500122Q000600276Q00040006000200062Q000400512Q013Q0004303Q00512Q010012930004002D3Q0026D4000400810001002D0004303Q008100010012930005002D3Q000EB3002D009F000100050004303Q009F00010012850006001E3Q0020AD00060006001F4Q00060001000100122Q000600073Q00202Q00060006000800202Q00060006002C00202Q00060006002400202Q00060006002500122Q000800276Q00060008000200262Q0006009E0001002E0004303Q009E00010012850006001E3Q0020CC00060006001F4Q00060001000100122Q000600073Q00202Q00060006000800202Q00060006002C00202Q00060006002400202Q00060006002500122Q000800276Q00060008000200062Q0006009200013Q0004303Q009200010012930005000D3Q0026D4000500840001000D0004303Q00840001001285000600073Q00201900060006000800202Q00060006002C00202Q00060006002400202Q00060006002600202Q00070003002400202Q00070007002600202Q00070007002F00122Q0008002F3Q00202Q00080008002200122Q0009002D3Q00122Q000A002D3Q00122Q000B00306Q0008000B00024Q00070007000800102Q0006002F000700122Q000600063Q00122Q000700073Q00202Q00070007003100122Q000900086Q00070009000200202Q00070007002C00202Q00070007002400202Q0007000700324Q000700086Q00063Q000800044Q00DE00010006FB000A00DE00013Q0004303Q00DE00010020E1000B000A000C0026D4000B00DE000100330004303Q00DE0001001293000B002D3Q0026D4000B00C80001002D0004303Q00C800010020E1000C000A00350012F0000C00343Q0030DE000A000C0036001293000B000D3Q0026D4000B00CE000100370004303Q00CE0001001285000C00383Q0020CB000C000C000D0012F0000C00383Q0004303Q00DE00010026D4000B00C20001000D0004303Q00C20001001285000C001E3Q0020BF000C000C001F4Q000C0001000100122Q000C00343Q00202Q000C000C002500122Q000E00366Q000C000E000200062Q000C00D000013Q0004303Q00D00001001285000C001E3Q0020E1000C000C001F2Q002F000C00010001001293000B00373Q0004303Q00C2000100067B000600BC000100020004303Q00BC00010004303Q00E200010004303Q00840001001285000600383Q000E6C003700F9000100060004303Q00F90001001285000600073Q0020F100060006000800202Q00060006002C00202Q00060006002400202Q00060006002500122Q000800396Q00060008000200062Q000600F900013Q0004303Q00F90001001285000600073Q0020C500060006000800202Q00060006002C00202Q00060006002400202Q00060006002500122Q000800396Q00060008000200202Q00060006002A00202Q00070003000C00062Q000600FD000100070004303Q00FD0001001285000600013Q0020E10006000600020026D4000600830001003A0004303Q00830001001285000500073Q0020F100050005000800202Q00050005002C00202Q00050005002400202Q00050005002500122Q000700396Q00050007000200062Q000500512Q013Q0004303Q00512Q010012930005002D4Q009C000600063Q0026D4000500082Q01002D0004303Q00082Q010012930006002D3Q0026D40006000B2Q01002D0004303Q000B2Q010012930007002D3Q0026D40007000E2Q01002D0004303Q000E2Q010012850008001E3Q0020C800080008001F4Q00080001000100122Q000800073Q00202Q00080008000800202Q00080008002C00202Q00080008002400202Q00080008002600122Q0009001A3Q00202Q00090009003B00202Q00090009003C00202Q00090009003D00202Q00090009002F00102Q0008002F000900044Q00202Q010004303Q000E2Q01001285000800073Q0020E10008000800080020E100080008002C0020E10008000800240006FB0008000D2Q013Q0004303Q000D2Q01001285000800073Q0020F100080008000800202Q00080008002C00202Q00080008002400202Q00080008003E00122Q000A003F6Q0008000A000200062Q0008000D2Q013Q0004303Q000D2Q01001285000800073Q00208D00080008000800202Q00080008002C00202Q00080008002400202Q00080008003E00122Q000A003F6Q0008000A000200202Q00080008004000262Q0008000D2Q01002D0004303Q000D2Q01001285000700073Q0020F100070007000800202Q00070007002C00202Q00070007002400202Q00070007002500122Q000900396Q00070009000200062Q000700512Q013Q0004303Q00512Q01001285000700073Q00200B00070007000800202Q00070007002C00202Q00070007002400202Q00070007002500122Q000900396Q00070009000200202Q0007000700414Q00070002000100044Q00512Q010004303Q000B2Q010004303Q00512Q010004303Q00082Q010004303Q00512Q010004303Q00810001001285000400013Q0020E10004000400020026D4000400460001003A0004303Q004600010012850004001A3Q00205700040004001B00202Q00040004001C00122Q000500193Q00102Q0004001D000500044Q00632Q010012850004000F3Q0020220004000400104Q00063Q000400302Q0006000C001100302Q00060012004200302Q00060015001600302Q0006001700184Q0004000600012Q00ED3Q00017Q000F3Q00028Q0003023Q005F4703113Q00537061636548656C706572416E63686F722Q0103073Q005072656D69756D2Q033Q006F6C6403043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203093Q0043686172616374657203103Q0048756D616E6F6964522Q6F745061727403063Q00434672616D6503043Q007461736B03043Q00776169740100012F3Q001293000100013Q0026D400010001000100010004303Q00010001001285000200023Q001078000200033Q001285000200023Q0020E10002000200030026D40002002E000100040004303Q002E0001001285000200023Q0020E10002000200050026D40002002E000100040004303Q002E0001001293000200013Q0026D40002000E000100010004303Q000E0001001285000300073Q00203A00030003000800202Q00030003000900202Q00030003000A00202Q00030003000B00202Q00030003000C00122Q000300063Q001293000300013Q000EB300010018000100030004303Q001800010012850004000D3Q00206600040004000E4Q00040001000100122Q000400073Q00202Q00040004000800202Q00040004000900202Q00040004000A00202Q00040004000B00122Q000500063Q00102Q0004000C000500044Q002600010004303Q00180001001285000400023Q0020E10004000400030026D4000400170001000F0004303Q001700010004303Q002E00010004303Q000E00010004303Q002E00010004303Q000100012Q00ED3Q00017Q00",v9(),...);

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
