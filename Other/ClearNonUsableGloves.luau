a = {}
count = 1
for i,v in pairs(game:GetService("Players").LocalPlayer._unlockedGloves:GetChildren()) do
if v and v:IsA("BoolValue") and v.Value == false then
a[count] = v.Name
count = count + 1
end
end

function Delete(ins)
if ins and ins.Parent and ins.Parent.Name == "ItemFrame" and ins.Parent.Visible == true and ins:IsA("TextLabel") and ins.Name == "ItemName" and ins.Text == a[table.find(a, ins.Text)] and ins.Parent:FindFirstChild("ViewFrame") and ins.Parent:WaitForChild("ViewFrame"):FindFirstChild("LockIcon") and ins.Parent:WaitForChild("ViewFrame"):WaitForChild("LockIcon").Visible ~= true then
ins.Parent.Visible = false
end
end

game:GetService("Players").LocalPlayer.PlayerGui.InventoryGui.InventoryWindow.Content.DescendantAdded:Connect(Delete)
