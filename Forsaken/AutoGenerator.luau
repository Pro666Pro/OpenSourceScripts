for i = 1,4 do
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA("RemoteEvent") and v.Name == "RE" then
v:FireServer()
end
end
task.wait(2.6)
end
