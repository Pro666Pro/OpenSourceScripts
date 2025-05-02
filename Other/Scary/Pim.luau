for i,v in pairs(game:GetDescendants()) do
if v.ClassName == "Sound" then
v:Destroy()
end
end
for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
if v.ClassName ~= "LocalScript" and v.ClassName ~= "Script" and v.ClassName ~= "ModuleScript" and v.ClassName ~= "RemoteEvent" and v.ClassName ~= "RemoteFunction" then
v:Destroy()
end
end
-- destroying all sounds and gui to scare player



-- function to freeze game ( while true loop )
function freeze(duration)
    local ez = os.clock()
    while os.clock() - ez < duration do end
end
freeze(1) -- freeze game, for fun ig

function playsound(id)
local id = id
local sound = Instance.new("Sound")
sound.SoundId = id
sound.Volume = 2
sound.Parent = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
sound:Play()
sound.Ended:Connect(function() sound:Destroy() end)
end -- play sound by id



function Scarytxt()
local screengui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local textargs = {
    [1] = "YOU CAN'T ESCAPE";
    [2] = "ACCEPT YOUR FATE";
    [3] = "STOP";
    [4] = "THIS IS USELESS";
    [5] = "THIS IS THE END";
    [6] = "YOU CAN'T RUN";
    [7] = "YOU CAN'T HIDE";
    [8] = "IT BEHIND YOU";
}
local textlab = Instance.new("textlab")
textlab.Size = UDim2.new(1, 0, 1, 0)
textlab.Position = UDim2.new(0, 0, 0, 0)
textlab.Text = textargs[math.random(1,8)]
textlab.TextColor3 = Color3.fromRGB(255, 0, 0)
textlab.Font = Enum.Font.GothamBold
textlab.TextSize = 1000
textlab.BackgroundTransparency = 1
textlab.TextStrokeTransparency = 0
textlab.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
textlab.Parent = screenGui
playsound("rbxassetid://18909603132")
task.wait(.2)
textlab:Destroy()
end -- function to spawn scary text



-- some variables
local player = game.Players.LocalPlayer
local character = player.Character
local hrp = character:WaitForChild("HumanoidRootPart")
-- image id ( theres pim image, you can change it )
local imageID = "rbxthumb://type=Asset&id=12453827576&w=150&h=150"
-- distance where pim spawns
local dst = math.random(100,500)


-- creating pim
local pim = Instance.new("Part")
pim.Size = Vector3.new(15, 15, .01)
pim.Position = hrp.Position - Vector3.new(dst, 0, 0)
pim.Anchored = true
pim.CanCollide = true
pim.Parent = workspace

-- his face
local decal = Instance.new("Decal")
decal.Texture = imageID
decal.Face = Enum.NormalId.Front
decal.Parent = pim
local backdecal = decal:Clone()
backdecal.Face = Enum.NormalId.Back
backdecal.Parent = pim


-- now we created pim :)

function Caught() -- function when you get caught
local game = game
local screen = Instance.new("ScreenGui")
local jumpscare = Instance.new("ImageLabel")
screen.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screen.Name = "YOU WERE TAKEN"
jumpscare.Parent = screen
jumpscare.Size = UDim2.new(1, 0, 1, 0)
jumpscare.Position = UDim2.new(0, 0, 0, 0)
jumpscare.Image = "rbxthumb://type=Asset&id=12453827576&w=150&h=150" -- yiu can change image jumoscare
jumpscare.BackgroundTransparency = 0
repeat
task.wait()
until game.Players.LocalPlayer.PlayerGui:FindFirstChild("YOU WERE TAKEN") -- waiting till image appears
task.wait()
game.Players.LocalPlayer:Kick("YOU WERE TAKEN") -- u can change message
task.wait(1)
freeze(9999) -- freezing game so you'll have to close roblox
end
-- jumpscare

function Effect() -- scary effects
game.Players.LocalPlayer.Character.Humanoid.HipHeight = 5 -- looks better with this
game.Players.LocalPlayer.CameraMode = "LockFirstPerson" -- more scarier when youre first person

    game:GetService("Lighting").Ambient = Color3.new(0, 0, 0)
    game:GetService("Lighting").OutdoorAmbient = Color3.new(0, 0, 0)
    game:GetService("Lighting").Brightness = 500
    local colorcorrection = Instance.new("ColorCorrectionEffect")
    colorcorrection.Brightness = -92
    colorcorrection.Contrast = 100
    colorcorrection.Saturation = -10 
    colorcorrection.Parent = game:GetService("Lighting")
    
game:GetService("Lighting").FogColor = Color3.fromRGB(255, 0, 0)
game:GetService("Lighting").FogEnd = 500
game:GetService("Lighting").FogStart = 0
game:GetService("Lighting").ClockTime = 8

-- scary effect
    
 
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://5505890439"
sound.Volume = 2
sound.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
sound:Play()
sound.Looped = true
-- scary sounds on the background
end

-- effect func


function pimai() -- pim hum
Effect() -- enabling effect
    while pim and pim.Parent do
        local plrpos = hrp.Position
        local direction = (plrpos - pim.Position).unit
        local speed = 5 -- You can change pim speed here
        
        pim.Position = pim.Position + direction * speed * 0.1
        pim.CFrame = CFrame.new(pim.Position, plrpos) -- pim walking
        
        if (pim.Position - plrpos).magnitude < 5 then
            Caught()
            break
        end -- if hes close to us ( touch us ), then jumpscaring player
        
        task.wait()
    end
end
pimai() -- turning on pim ai
