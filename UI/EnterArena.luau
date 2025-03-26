if game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("EnterArena") then
game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("EnterArena"):Destroy()
end

function playsound(id)
local soundId = id
local sound = Instance.new("Sound")
sound.SoundId = soundId
sound.Volume = 2
sound.Parent = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
sound:Play()
sound.Ended:Connect(function() sound:Destroy() end)
end

local a = {
	["Component"] = Instance.new("ScreenGui"),
	["PlayButtons"] = Instance.new("Frame"),
	["EnterArena"] = Instance.new("ImageButton"),
	["UIAspectRatioConstraint"] = Instance.new("UIAspectRatioConstraint"),
	["OtherModes"] = Instance.new("ImageButton"),
	["UIAspectRatioConstraint 2"] = Instance.new("UIAspectRatioConstraint"),
	["UIAspectRatioConstraint 3"] = Instance.new("UIAspectRatioConstraint")
}

a["Component"]["Name"] = "EnterArena"
a["Component"]["Enabled"] = false
a["Component"]["ResetOnSpawn"] = false
a["Component"]["ClipToDeviceSafeArea"] = true
a["Component"]["Parent"] = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
repeat task.wait() until game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("EnterArena")

a["PlayButtons"]["Position"] = UDim2.new(.5, 0, .8999999761581421, 0)
a["PlayButtons"]["Size"] = UDim2.new(.22083333134651184, 0, .0972222238779068, 0)
a["PlayButtons"]["AnchorPoint"] = Vector2.new(.5, 0)
a["PlayButtons"]["BackgroundTransparency"] = 1
a["PlayButtons"]["Name"] = "PlayButtons"
a["PlayButtons"]["Parent"] = a["Component"]

a["EnterArena"]["Position"] = UDim2.new(0.011961722746491432, 0, 0.05050504952669144, 0)
a["EnterArena"]["Size"] = UDim2.new(1.023923397064209, 0, .6565656661987305, 0)
a["EnterArena"]["BackgroundTransparency"] = 1
a["EnterArena"]["ClipsDescendants"] = true
a["EnterArena"]["Image"] = "rbxassetid://87487932146805"
a["EnterArena"]["ImageContent"] = Content.fromUri("rbxassetid://87487932146805")
a["EnterArena"]["Name"] = "EnterArena"
a["EnterArena"]["Parent"] = a["PlayButtons"]
a["UIAspectRatioConstraint"]["AspectRatio"] = 6.950819492340088
a["UIAspectRatioConstraint"]["Name"] = "UIAspectRatioConstraint"
a["UIAspectRatioConstraint"]["Parent"] = a["EnterArena"]

a["OtherModes"]["Position"] = UDim2.new(0.011961722746491432, 0, .6262626051902771, 0)
a["OtherModes"]["Size"] = UDim2.new(1.023923397064209, 0, .42424243688583374, 0)
a["OtherModes"]["BackgroundTransparency"] = 1
a["OtherModes"]["ClipsDescendants"] = true
a["OtherModes"]["Visible"] = false
a["OtherModes"]["Image"] = "rbxassetid://125242022836986"
a["OtherModes"]["ImageContent"] = Content.fromUri("rbxassetid://125242022836986")
a["OtherModes"]["Name"] = "OtherModes"
a["OtherModes"]["Parent"] = a["PlayButtons"]

a["UIAspectRatioConstraint 2"]["AspectRatio"] = 11.1578950881958
a["UIAspectRatioConstraint 2"]["Name"] = "UIAspectRatioConstraint"
a["UIAspectRatioConstraint 2"]["Parent"] = a["OtherModes"]

a["UIAspectRatioConstraint 3"]["AspectRatio"] = 4.038095474243164
a["UIAspectRatioConstraint 3"]["Name"] = "UIAspectRatioConstraint"
a["UIAspectRatioConstraint 3"]["Parent"] = a["PlayButtons"]

a["EnterArena"].MouseButton1Click:Connect(function()
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Sit == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Lobby.Teleport1.CFrame
		playsound("rbxassetid://10066942189")
		a["EnterArena"]["ImageColor3"] = Color3.new(1, 1, 1)
		a["EnterArena"]["Size"] = UDim2.new(1.023923397064209, 0, .6565656661987305, 0)
		a["EnterArena"]["Position"] = UDim2.new(0.011961722746491432, 0, 0.05050504952669144, 0)
	end
end)

function enter()
	name = a["EnterArena"]
	playsound("rbxassetid://10066936758")
  name["ImageColor3"] = Color3.new(0.75, 0.75, 0.75)
	local orgs = name.Size
  local orgp = name.Position
  local news = UDim2.new(orgs.X.Scale * 0.95, 0, orgs.Y.Scale * 0.9, 0)
  local newp = UDim2.new(orgp.X.Scale + (orgs.X.Scale - news.X.Scale) / 2, 0,
	orgp.Y.Scale + (orgs.Y.Scale - news.Y.Scale) / 2, 0)
	name["Size"] = news
	name["Position"] = newp
end

function leave()
	name = a["EnterArena"]
  name["ImageColor3"] = Color3.new(1, 1, 1)
	name["Size"] = UDim2.new(1.023923397064209, 0, .6565656661987305, 0)
	name["Position"] = UDim2.new(0.011961722746491432, 0, 0.05050504952669144, 0)
end

a["EnterArena"].MouseEnter:Connect(enter)
a["EnterArena"].MouseLeave:Connect(leave)

repeat task.wait()
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
a["Component"]["Enabled"] = true
elseif game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") then
a["Component"]["Enabled"] = false
end
until game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("EnterArena") == nil
