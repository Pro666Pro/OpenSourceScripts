local script = [[
print("Put your script in here! ( not in print )")
]]
local comp = script:gsub(".", function(b) return "\\" .. b:byte() end) or script .. "\""
setclipboard(tostring('loadstring("'..comp..'")()'))
