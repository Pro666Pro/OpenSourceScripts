-- You came here to skid? Too bad

for i,v in pairs(game:GetService("CoreGui").TopBarApp.TopBarApp.UnibarLeftFrame:GetChildren()) do
if v and v.Name == "StackedElements" and v:FindFirstChild("Button") and v.Button:FindFirstChild("ActualButton") and v.Button.ActualButton:FindFirstChild("Button") and v.Button.ActualButton.Button.Text == "BETA" then 
v:FindFirstChild("Button"):Destroy()
end
end
if fireclickdetector or fireclickdetector() then
_G.EquipGloveMethod = 1
else
_G.EquipGloveMethod = 2
end
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

local a = {
	["1-CustomButton"] = Instance.new("Frame"),
	["MainClick"] = Instance.new("ImageButton"),
    ["FirstHighlight"] = game:GetService("CoreGui").TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]["3"].nine_dot.Highlighter:Clone(),
    ["2-CustomButton"] = Instance.new("Frame"),
	["MainClick2"] = Instance.new("ImageButton"),
    ["SecondHighlight"] = game:GetService("CoreGui").TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]["3"].nine_dot.Highlighter:Clone(),
    ["3-CustomButton"] = Instance.new("Frame"),
	["MainClick3"] = Instance.new("ImageButton"),
    ["ThirdHighlight"] = game:GetService("CoreGui").TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]["3"].nine_dot.Highlighter:Clone()
}

a["1-CustomButton"]["Position"] = UDim2.new(0, 140, 0, 0)
a["1-CustomButton"]["Size"] = UDim2.new(0, 44, 0, 44)
a["1-CustomButton"]["BackgroundTransparency"] = 1
a["1-CustomButton"]["BorderSizePixel"] = 0
a["1-CustomButton"]["Name"] = "1-CustomButton"
a["1-CustomButton"]["Parent"] = game:GetService("CoreGui"):FindFirstChild("TopBarApp"):FindFirstChild("TopBarApp"):FindFirstChild("UnibarLeftFrame"):FindFirstChild("UnibarMenu"):FindFirstChild("2")

a["MainClick"]["Position"] = UDim2.new(.5, 0, .5, 0)
a["MainClick"]["Size"] = UDim2.new(0, 32, 0, 32)
a["MainClick"]["AnchorPoint"] = Vector2.new(.5, .5)
a["MainClick"]["BackgroundTransparency"] = 1
a["MainClick"]["BorderSizePixel"] = 0
a["MainClick"]["Image"] = "rbxthumb://type=Asset&id=11999546234&w=150&h=150"
a["MainClick"]["ImageContent"] = Content.fromUri("rbxthumb://type=Asset&id=11999546234&w=150&h=150")
a["MainClick"]["Name"] = "MainClick"
a["MainClick"]["Parent"] = a["1-CustomButton"]

a["2-CustomButton"]["Position"] = UDim2.new(0, 188, 0, 0)
a["2-CustomButton"]["Size"] = UDim2.new(0, 44, 0, 44)
a["2-CustomButton"]["BackgroundTransparency"] = 1
a["2-CustomButton"]["BorderSizePixel"] = 0
a["2-CustomButton"]["Name"] = "2-CustomButton"
a["2-CustomButton"]["Parent"] = game:GetService("CoreGui"):FindFirstChild("TopBarApp"):FindFirstChild("TopBarApp"):FindFirstChild("UnibarLeftFrame"):FindFirstChild("UnibarMenu"):FindFirstChild("2")

a["MainClick2"]["Position"] = UDim2.new(.5, 0, .5, 0)
a["MainClick2"]["Size"] = UDim2.new(0, 32, 0, 32)
a["MainClick2"]["AnchorPoint"] = Vector2.new(.5, .5)
a["MainClick2"]["BackgroundTransparency"] = 1
a["MainClick2"]["BorderSizePixel"] = 0
a["MainClick2"]["Image"] = "rbxthumb://type=Asset&id=230820640&w=150&h=150"
a["MainClick2"]["ImageContent"] = Content.fromUri("rbxthumb://type=Asset&id=230820640&w=150&h=150")
a["MainClick2"]["Name"] = "MainClick"
a["MainClick2"]["Parent"] = a["2-CustomButton"]

a["3-CustomButton"]["Position"] = UDim2.new(0, 236, 0, 0)
a["3-CustomButton"]["Size"] = UDim2.new(0, 44, 0, 44)
a["3-CustomButton"]["BackgroundTransparency"] = 1
a["3-CustomButton"]["BorderSizePixel"] = 0
a["3-CustomButton"]["Name"] = "3-CustomButton"
a["3-CustomButton"]["Parent"] = game:GetService("CoreGui"):FindFirstChild("TopBarApp"):FindFirstChild("TopBarApp"):FindFirstChild("UnibarLeftFrame"):FindFirstChild("UnibarMenu"):FindFirstChild("2")

a["MainClick3"]["Position"] = UDim2.new(.5, 0, .5, 0)
a["MainClick3"]["Size"] = UDim2.new(0, 32, 0, 32)
a["MainClick3"]["AnchorPoint"] = Vector2.new(.5, .5)
a["MainClick3"]["BackgroundTransparency"] = 1
a["MainClick3"]["BorderSizePixel"] = 0
a["MainClick3"]["Image"] = "rbxthumb://type=Asset&id=13492317633&w=150&h=150"
a["MainClick3"]["ImageContent"] = Content.fromUri("rbxthumb://type=Asset&id=13492317633&w=150&h=150")
a["MainClick3"]["Name"] = "MainClick"
a["MainClick3"]["Parent"] = a["3-CustomButton"]

a["FirstHighlight"]["Visible"] = false
a["FirstHighlight"]["Name"] = "Highlight"
a["FirstHighlight"]["Parent"] = a["1-CustomButton"]

a["SecondHighlight"]["Visible"] = false
a["SecondHighlight"]["Name"] = "Highlight"
a["SecondHighlight"]["Parent"] = a["2-CustomButton"]

a["ThirdHighlight"]["Visible"] = false
a["ThirdHighlight"]["Name"] = "Highlight"
a["ThirdHighlight"]["Parent"] = a["3-CustomButton"]

function Firstclick()

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Disguise Mode Enabled!",
	Text = "To disable this, you'll have to leave the game.",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Alright!"
})

while task.wait() do

if game.Players.LocalPlayer and game.Players.LocalPlayer.Character then
for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
if v and v:IsA("Accessory") and game.Players.LocalPlayer and game.Players.LocalPlayer.Character then
v:Destroy()
end
end
end
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Pants") then
game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Pants"):Destroy()
end
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("ShirtGraphic") then
game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("ShirtGraphic"):Destroy()
end
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("TShirt") then
game.Players.LocalPlayer.Character:FindFirstChild("TShirt"):Destroy()
end
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Shirt") then
game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Shirt"):Destroy()
end
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
game.Players.LocalPlayer.Character.Torso.BrickColor = BrickColor.new("Bright blue")
end
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Head") then
game.Players.LocalPlayer.Character.Head.BrickColor = BrickColor.new("Bright yellow")
end
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Left Arm") then
game.Players.LocalPlayer.Character["Left Arm"].BrickColor = BrickColor.new("Bright yellow")
end
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Right Arm") then
game.Players.LocalPlayer.Character["Right Arm"].BrickColor = BrickColor.new("Bright yellow")
end
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Left Leg") then
game.Players.LocalPlayer.Character["Left Leg"].BrickColor = BrickColor.new("Bright green")
end
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Right Leg") then
game.Players.LocalPlayer.Character["Right Leg"].BrickColor = BrickColor.new("Bright green")
end
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Head") and game.Players.LocalPlayer.Character.Head:FindFirstChild("Nametag") then
game.Players.LocalPlayer.Character.Head:FindFirstChild("Nametag"):Destroy()
end
if game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("leaderstats") and game.Players.LocalPlayer.leaderstats:FindFirstChild("Slaps") then
game.Players.LocalPlayer.leaderstats.Slaps.Value = 0
end

end

end

function Firstenter()
a["FirstHighlight"]["Visible"] = true
end

function Firstleave()
a["FirstHighlight"]["Visible"] = false
end

function Secondenter()
a["SecondHighlight"]["Visible"] = true
end

function Secondleave()
a["SecondHighlight"]["Visible"] = false
end

function Secondclick()

if workspace:FindFirstChild("Baseplate") then
game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = workspace.Baseplate.CFrame * CFrame.new(0,10,0)
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Teleported to Baseplate!",
    Text = "",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Alright!"
})
elseif workspace:FindFirstChild("Baseplate") == nil then
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "No Baseplate Detected!",
	Text = "",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Alright!"
})
end

end

function Thirdclick()

if game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("leaderstats") and game.Players.LocalPlayer.leaderstats:FindFirstChild("Slaps") then
old = game.Players.LocalPlayer.leaderstats.Glove.Value
task.wait()
EquipGlove("Ghost")
game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
task.wait(.37)
EquipGlove(old)
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "You became invisible!",
	Text = "",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Alright!"
})
else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Failed becoming invisible!",
	Text = "This may happen if you're not in slap battles!",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Alright!"
})
end

end

function Thirdenter()
a["ThirdHighlight"]["Visible"] = true
end

function Thirdleave()
a["ThirdHighlight"]["Visible"] = false
end

a["MainClick"].MouseEnter:Connect(Firstenter)
a["MainClick"].MouseLeave:Connect(Firstleave)
a["MainClick"].MouseButton1Click:Connect(Firstclick)
a["MainClick2"].MouseEnter:Connect(Secondenter)
a["MainClick2"].MouseLeave:Connect(Secondleave)
a["MainClick2"].MouseButton1Click:Connect(Secondclick)
a["MainClick3"].MouseEnter:Connect(Thirdenter)
a["MainClick3"].MouseLeave:Connect(Thirdleave)
a["MainClick3"].MouseButton1Click:Connect(Thirdclick)

while task.wait() do
if game:GetService("CoreGui") and game:GetService("CoreGui"):FindFirstChild("TopBarApp") and game:GetService("CoreGui"):FindFirstChild("TopBarApp"):FindFirstChild("TopBarApp") and game:GetService("CoreGui"):FindFirstChild("TopBarApp"):FindFirstChild("TopBarApp"):FindFirstChild("UnibarLeftFrame") and game:GetService("CoreGui"):FindFirstChild("TopBarApp"):FindFirstChild("TopBarApp"):FindFirstChild("UnibarLeftFrame"):FindFirstChild("UnibarMenu") and game:GetService("CoreGui"):FindFirstChild("TopBarApp"):FindFirstChild("TopBarApp"):FindFirstChild("UnibarLeftFrame"):FindFirstChild("UnibarMenu"):FindFirstChild("2") then
game:GetService("CoreGui"):FindFirstChild("TopBarApp"):FindFirstChild("TopBarApp"):FindFirstChild("UnibarLeftFrame"):FindFirstChild("UnibarMenu"):FindFirstChild("2").Size = UDim2.new(0, 290, 0, 44)
end
end
