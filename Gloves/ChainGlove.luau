if not game.IsLoaded then
game.Loaded:Wait()
end

-- Credits, message is not squished up cuz it looks bad
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Credits to Nexer1234_AnotherAlt",
	Text = "Made by @nexer1234 ( youtube & discord )",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000
})

if getgenv().AutoGetChainExecuted == true then return end

if getgenv or getgenv() then
getgenv().AutoGetChainExecuted = true
end

local teleport = queueonteleport or queue_on_teleport -- just look at function name bro
if teleport then
    teleport([[
if not game.IsLoaded then
game.Loaded:Wait()
end
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/ChainGlove.luau'))()
	]])
else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Your executor doesn't support queueonteleport/queue_on_teleport, please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end

if game.PlaceId == 9431156611 then

-- Credits to article's hub, sorry, i were too lazy to get all these images id's lol
if game.Workspace.Map.CodeBrick.SurfaceGui:FindFirstChild("IMGTemplate") then
local Code = {}
for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
if v.Name == "IMGTemplate" then
if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
table.insert(Code, "4")
elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
table.insert(Code, "2")
elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
table.insert(Code, "3")
elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
table.insert(Code, "9")
elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
table.insert(Code, "8")
elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
table.insert(Code, "2")
elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
table.insert(Code, "8")
elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
table.insert(Code, "3")
elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
table.insert(Code, "7")
elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
table.insert(Code, "8")
elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
table.insert(Code, "2")
elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
table.insert(Code, "6")
elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
table.insert(Code, "3")
elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
table.insert(Code, "6")
elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
table.insert(Code, "6")
elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
table.insert(Code, "2")
end
end
end
end
fireclickdetector(workspace.Map.OriginOffice.Door.Keypad.Buttons.Reset.ClickDetector)
task.wait(0.25)
for i = 1, #Code do
local Button = Code[i]
fireclickdetector(workspace.Map.OriginOffice.Door.Keypad.Buttons[Button].ClickDetector)
task.wait(0.25)
end
task.wait(0.25)
fireclickdetector(workspace.Map.OriginOffice.Door.Keypad.Buttons.Enter.ClickDetector)
task.wait(3)
while task.wait() do game:GetService("TeleportService"):Teleport(6403373529) end
elseif game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then

while task.wait() do game:GetService("TeleportService"):Teleport(9431156611) end

else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Wrong game buddy",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
