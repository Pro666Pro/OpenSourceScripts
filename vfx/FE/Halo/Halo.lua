for i = 1, 100 do
game:GetService("ReplicatedStorage").UTGGeneric:FireServer("enableRunMode")
game:GetService("ReplicatedStorage").UTGGeneric:FireServer("slideStun", game:GetService("Players").LocalPlayer.Character)
end
