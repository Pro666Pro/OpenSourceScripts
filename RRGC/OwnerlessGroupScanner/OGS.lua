digit1 = math.random(35500000,35970000) -- from id (number)
digit2 = 35976860 -- up to id (number)
StopAfterFindingOwnerlessGroup = false -- Set false if no







stop = false
currentnumber = tonumber(digit1) - 1
totalownerlessgroupsfound = 0
scanning = "https://groups.roproxy.com/v1/groups/"..currentnumber
total = 0
possiblecomb = tonumber(digit2) - tonumber(digit1)
hint = Instance.new("Hint")
hint.Text = "Starting scanning..."
hint.Parent = game:GetService("CoreGui") or game:GetService("Workspace")
repeat task.wait()
total = total + 1
currentnumber = currentnumber + 1
if currentnumber ~= tonumber(digit2) then
scanning = "https://groups.roproxy.com/v1/groups/"..currentnumber
local a,b = pcall(function()
group = game:GetService("HttpService"):JSONDecode(game:HttpGet(scanning))
end)
if not a then
group = nil
end
if group and group.owner and group.owner == nil and group.publicEntryAllowed and group.publicEntryAllowed == true then
totalownerlessgroupsfound = totalownerlessgroupsfound + 1
hint.Text = "Found Ownerless Group. Copied link to clipboard! ( Group Link: "..currentnumber.." : Total Groups Found: "..totalownerlessgroupsfound.." )"
setclipboard(tostring("https://www.roblox.com/communities/"..currentnumber))
if StopAfterFindingOwnerlessGroup == true then
stop = true
break
end
else
if not group then
hint.Text = "Failed accessing group. Attempt: "..total.."/"..possiblecomb.." ( Group Id: "..currentnumber.." : Total Groups Found: "..totalownerlessgroupsfound.." )"
elseif group and not group.owner then
hint.Text = "Failed accessing group owner. Attempt: "..total.."/"..possiblecomb.." ( Group Id: "..currentnumber.." : Total Groups Found: "..totalownerlessgroupsfound.." )"
elseif group and group.owner and group.owner ~= nil then
hint.Text = "Group has owner. Attempt: "..total.."/"..possiblecomb.." ( Group Id: "..currentnumber.." : Total Groups Found: "..totalownerlessgroupsfound.." )"
elseif group and group.owner and group.owner == nil and group.publicEntryAllowed and group.publicEntryAllowed == false then
hint.Text = "Group is locked. Attempt: "..total.."/"..possiblecomb.." ( Group Id: "..currentnumber.." : Total Groups Found: "..totalownerlessgroupsfound.." )"
end
end
else
stop = true
hint.Text = "Scanning is completed!"
task.wait(3)
hint:Destroy()
end
until stop == true
