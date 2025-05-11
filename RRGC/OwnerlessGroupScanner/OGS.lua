digit1 = 35491298 -- from id (number)
digit2 = 35959485 -- up to id (number)

stop = false
currentnumber = tonumber(digit1) - 1
scanning = "https://groups.roblox.com/v1/groups/"..currentnumber
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
group = game:GetService("HttpService"):JSONDecode(game:HttpGet(scanning))

if group and group.memberCount and group.memberCount == 0 and group.publicEntryAllowed and group.publicEntryAllowed == true then
stop = true
hint.Text = "Found Ownerless Group. Copied id to clipboard! ( Group Link: "..currentnumber.." )"
setclipboard(tostring(currentnumber))
else

if not group then
hint.Text = "Failed accessing group. Attempt: "..total.."/"..possiblecomb.." ( Group Link: "..currentnumber.." )"
elseif group and not group.memberCount then
hint.Text = "Failed accessing group member count. Attempt: "..total.."/"..possiblecomb.." ( Group Link: "..currentnumber.." )"
elseif group and group.memberCount and group.memberCount ~= 0 then
hint.Text = "Group has owner. Attempt: "..total.."/"..possiblecomb.." ( Group Link: "..currentnumber.." )"
elseif group and group.memberCount and group.memberCount == 0 and group.publicEntryAllowed and group.publicEntryAllowed == false then
hint.Text = "Group is locked. Attempt: "..total.."/"..possiblecomb.." ( Group Link: "..currentnumber.." )"
end

end

else
stop = true
end
until stop == true
