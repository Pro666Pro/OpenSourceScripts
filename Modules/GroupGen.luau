ModScr = {}

totalattempts = 0
currentid = 0
gencompleted = false
HINT = nil

function UpdateHint()
if game:GetService("CoreGui"):FindFirstChild("GeneratorLog") then
if gencompleted == true then
game:GetService("CoreGui"):FindFirstChild("GeneratorLog").Text = "Generation is completed!"
else
game:GetService("CoreGui"):FindFirstChild("GeneratorLog").Text = "Total Attempts = "..totalattempts.." : ID That's Being Checked = "..currentid
end
end
end


function ModScr:LogMode(boolval)
boolval = boolval or false
if boolval == false then return
elseif boolval == true then
HINT = Instance.new("Hint")
HINT.Name = "GeneratorLog"
HINT.Text = "Loading"
HINT.Parent = game:GetService("CoreGui")
repeat task.wait() until game:GetService("CoreGui"):FindFirstChild("GeneratorLog")
UpdateHint()
end
end

-- Table To String Created by Pyseph#1015
-- Empty/Ownerless group finder created by @nexer1234

local SpecialCharacters = {['\a'] = '\\a', ['\b'] = '\\b', ['\f'] = '\\f', ['\n'] = '\\n', ['\r'] = '\\r', ['\t'] = '\\t', ['\v'] = '\\v', ['\0'] = '\\0'}
local Keywords = { ['and'] = true, ['break'] = true, ['do'] = true, ['else'] = true, ['elseif'] = true, ['end'] = true, ['false'] = true, ['for'] = true, ['function'] = true, ['if'] = true, ['in'] = true, ['local'] = true, ['nil'] = true, ['not'] = true, ['or'] = true, ['repeat'] = true, ['return'] = true, ['then'] = true, ['true'] = true, ['until'] = true, ['while'] = true, ['continue'] = true}
local Functions = {[DockWidgetPluginGuiInfo.new] = "DockWidgetPluginGuiInfo.new"; [warn] = "warn"; [CFrame.fromMatrix] = "CFrame.fromMatrix"; [CFrame.fromAxisAngle] = "CFrame.fromAxisAngle"; [CFrame.fromOrientation] = "CFrame.fromOrientation"; [CFrame.fromEulerAnglesXYZ] = "CFrame.fromEulerAnglesXYZ"; [CFrame.Angles] = "CFrame.Angles"; [CFrame.fromEulerAnglesYXZ] = "CFrame.fromEulerAnglesYXZ"; [CFrame.new] = "CFrame.new"; [gcinfo] = "gcinfo"; [os.clock] = "os.clock"; [os.difftime] = "os.difftime"; [os.time] = "os.time"; [os.date] = "os.date"; [tick] = "tick"; [bit32.band] = "bit32.band"; [bit32.extract] = "bit32.extract"; [bit32.bor] = "bit32.bor"; [bit32.bnot] = "bit32.bnot"; [bit32.arshift] = "bit32.arshift"; [bit32.rshift] = "bit32.rshift"; [bit32.rrotate] = "bit32.rrotate"; [bit32.replace] = "bit32.replace"; [bit32.lshift] = "bit32.lshift"; [bit32.lrotate] = "bit32.lrotate"; [bit32.btest] = "bit32.btest"; [bit32.bxor] = "bit32.bxor"; [pairs] = "pairs"; [NumberSequence.new] = "NumberSequence.new"; [assert] = "assert"; [tonumber] = "tonumber"; [Color3.fromHSV] = "Color3.fromHSV"; [Color3.toHSV] = "Color3.toHSV"; [Color3.fromRGB] = "Color3.fromRGB"; [Color3.new] = "Color3.new"; [Delay] = "Delay"; [Stats] = "Stats"; [UserSettings] = "UserSettings"; [coroutine.resume] = "coroutine.resume"; [coroutine.yield] = "coroutine.yield"; [coroutine.running] = "coroutine.running"; [coroutine.status] = "coroutine.status"; [coroutine.wrap] = "coroutine.wrap"; [coroutine.create] = "coroutine.create"; [coroutine.isyieldable] = "coroutine.isyieldable"; [NumberRange.new] = "NumberRange.new"; [PhysicalProperties.new] = "PhysicalProperties.new"; [PluginManager] = "PluginManager"; [Ray.new] = "Ray.new"; [NumberSequenceKeypoint.new] = "NumberSequenceKeypoint.new"; [Version] = "Version"; [Vector2.new] = "Vector2.new"; [Instance.new] = "Instance.new"; [delay] = "delay"; [spawn] = "spawn"; [unpack] = "unpack"; [string.split] = "string.split"; [string.match] = "string.match"; [string.gmatch] = "string.gmatch"; [string.upper] = "string.upper"; [string.gsub] = "string.gsub"; [string.format] = "string.format"; [string.lower] = "string.lower"; [string.sub] = "string.sub"; [string.pack] = "string.pack"; [string.rep] = "string.rep"; [string.char] = "string.char"; [string.packsize] = "string.packsize"; [string.reverse] = "string.reverse"; [string.byte] = "string.byte"; [string.unpack] = "string.unpack"; [string.len] = "string.len"; [string.find] = "string.find"; [CellId.new] = "CellId.new"; [ypcall] = "ypcall"; [version] = "version"; [print] = "print"; [stats] = "stats"; [printidentity] = "printidentity"; [settings] = "settings"; [UDim2.fromOffset] = "UDim2.fromOffset"; [UDim2.fromScale] = "UDim2.fromScale"; [UDim2.new] = "UDim2.new"; [table.pack] = "table.pack"; [table.move] = "table.move"; [table.insert] = "table.insert"; [table.getn] = "table.getn"; [table.foreachi] = "table.foreachi"; [table.maxn] = "table.maxn"; [table.foreach] = "table.foreach"; [table.concat] = "table.concat"; [table.unpack] = "table.unpack"; [table.find] = "table.find"; [table.create] = "table.create"; [table.sort] = "table.sort"; [table.remove] = "table.remove"; [TweenInfo.new] = "TweenInfo.new"; [loadstring] = "loadstring"; [require] = "require"; [Vector3.FromNormalId] = "Vector3.FromNormalId"; [Vector3.FromAxis] = "Vector3.FromAxis"; [Vector3.fromAxis] = "Vector3.fromAxis"; [Vector3.fromNormalId] = "Vector3.fromNormalId"; [Vector3.new] = "Vector3.new"; [Vector3int16.new] = "Vector3int16.new"; [setmetatable] = "setmetatable"; [next] = "next"; [Wait] = "Wait"; [wait] = "wait"; [ipairs] = "ipairs"; [elapsedTime] = "elapsedTime"; [time] = "time"; [rawequal] = "rawequal"; [Vector2int16.new] = "Vector2int16.new"; [collectgarbage] = "collectgarbage"; [newproxy] = "newproxy"; [Spawn] = "Spawn"; [PluginDrag.new] = "PluginDrag.new"; [Region3.new] = "Region3.new"; [utf8.offset] = "utf8.offset"; [utf8.codepoint] = "utf8.codepoint"; [utf8.nfdnormalize] = "utf8.nfdnormalize"; [utf8.char] = "utf8.char"; [utf8.codes] = "utf8.codes"; [utf8.len] = "utf8.len"; [utf8.graphemes] = "utf8.graphemes"; [utf8.nfcnormalize] = "utf8.nfcnormalize"; [xpcall] = "xpcall"; [tostring] = "tostring"; [rawset] = "rawset"; [PathWaypoint.new] = "PathWaypoint.new"; [DateTime.fromUnixTimestamp] = "DateTime.fromUnixTimestamp"; [DateTime.now] = "DateTime.now"; [DateTime.fromIsoDate] = "DateTime.fromIsoDate"; [DateTime.fromUnixTimestampMillis] = "DateTime.fromUnixTimestampMillis"; [DateTime.fromLocalTime] = "DateTime.fromLocalTime"; [DateTime.fromUniversalTime] = "DateTime.fromUniversalTime"; [Random.new] = "Random.new"; [typeof] = "typeof"; [RaycastParams.new] = "RaycastParams.new"; [math.log] = "math.log"; [math.ldexp] = "math.ldexp"; [math.rad] = "math.rad"; [math.cosh] = "math.cosh"; [math.random] = "math.random"; [math.frexp] = "math.frexp"; [math.tanh] = "math.tanh"; [math.floor] = "math.floor"; [math.max] = "math.max"; [math.sqrt] = "math.sqrt"; [math.modf] = "math.modf"; [math.pow] = "math.pow"; [math.atan] = "math.atan"; [math.tan] = "math.tan"; [math.cos] = "math.cos"; [math.sign] = "math.sign"; [math.clamp] = "math.clamp"; [math.log10] = "math.log10"; [math.noise] = "math.noise"; [math.acos] = "math.acos"; [math.abs] = "math.abs"; [math.sinh] = "math.sinh"; [math.asin] = "math.asin"; [math.min] = "math.min"; [math.deg] = "math.deg"; [math.fmod] = "math.fmod"; [math.randomseed] = "math.randomseed"; [math.atan2] = "math.atan2"; [math.ceil] = "math.ceil"; [math.sin] = "math.sin"; [math.exp] = "math.exp"; [getfenv] = "getfenv"; [pcall] = "pcall"; [ColorSequenceKeypoint.new] = "ColorSequenceKeypoint.new"; [ColorSequence.new] = "ColorSequence.new"; [type] = "type"; [Region3int16.new] = "Region3int16.new"; [ElapsedTime] = "ElapsedTime"; [select] = "select"; [getmetatable] = "getmetatable"; [rawget] = "rawget"; [Faces.new] = "Faces.new"; [Rect.new] = "Rect.new"; [BrickColor.Blue] = "BrickColor.Blue"; [BrickColor.White] = "BrickColor.White"; [BrickColor.Yellow] = "BrickColor.Yellow"; [BrickColor.Red] = "BrickColor.Red"; [BrickColor.Gray] = "BrickColor.Gray"; [BrickColor.palette] = "BrickColor.palette"; [BrickColor.New] = "BrickColor.New"; [BrickColor.Black] = "BrickColor.Black"; [BrickColor.Green] = "BrickColor.Green"; [BrickColor.Random] = "BrickColor.Random"; [BrickColor.DarkGray] = "BrickColor.DarkGray"; [BrickColor.random] = "BrickColor.random"; [BrickColor.new] = "BrickColor.new"; [setfenv] = "setfenv"; [UDim.new] = "UDim.new"; [Axes.new] = "Axes.new"; [error] = "error"; [debug.traceback] = "debug.traceback"; [debug.profileend] = "debug.profileend"; [debug.profilebegin] = "debug.profilebegin"}

function GetHierarchy(Object)
	local Hierarchy = {}

	local ChainLength = 1
	local Parent = Object
	
	while Parent do
		Parent = Parent.Parent
		ChainLength = ChainLength + 1
	end

	Parent = Object
	local Num = 0
	while Parent do
		Num = Num + 1

		local ObjName = string.gsub(Parent.Name, '[%c%z]', SpecialCharacters)
		ObjName = Parent == game and 'game' or ObjName

		if Keywords[ObjName] or not string.match(ObjName, '^[_%a][_%w]*$') then
			ObjName = '["' .. ObjName .. '"]'
		elseif Num ~= ChainLength - 1 then
			ObjName = '.' .. ObjName
		end

		Hierarchy[ChainLength - Num] = ObjName
		Parent = Parent.Parent
	end

	return table.concat(Hierarchy)
end
local function SerializeType(Value, Class)
	if Class == 'string' then
		-- Not using %q as it messes up the special characters fix
		return string.format('"%s"', string.gsub(Value, '[%c%z]', SpecialCharacters))
	elseif Class == 'Instance' then
		return GetHierarchy(Value)
	elseif type(Value) ~= Class then -- CFrame, Vector3, UDim2, ...
		return Class .. '.new(' .. tostring(Value) .. ')'
	elseif Class == 'function' then
		return Functions[Value] or '\'[Unknown ' .. (pcall(setfenv, Value, getfenv(Value)) and 'Lua' or 'C')  .. ' ' .. tostring(Value) .. ']\''
	elseif Class == 'userdata' then
		return 'newproxy(' .. tostring(not not getmetatable(Value)) .. ')'
	elseif Class == 'thread' then
		return '\'' .. tostring(Value) ..  ', status: ' .. coroutine.status(Value) .. '\''
	else -- thread, number, boolean, nil, ...
		return tostring(Value)
	end
end
local function TableToString(Table, IgnoredTables, DepthData, Path)
	IgnoredTables = IgnoredTables or {}
	local CyclicData = IgnoredTables[Table]
	if CyclicData then
		return ((CyclicData[1] == DepthData[1] - 1 and '\'[Cyclic Parent ' or '\'[Cyclic ') .. tostring(Table) .. ', path: ' .. CyclicData[2] .. ']\'')
	end

	Path = Path or 'ROOT'
	DepthData = DepthData or {0, Path}
	local Depth = DepthData[1] + 1
	DepthData[1] = Depth
	DepthData[2] = Path

	IgnoredTables[Table] = DepthData
	local Tab = string.rep('    ', Depth)
	local TrailingTab = string.rep('    ', Depth - 1)
	local Result = '{'

	local LineTab = '\n' .. Tab
	local HasOrder = true
	local Index = 1

	local IsEmpty = true
	for Key, Value in next, Table do
		IsEmpty = false
		if Index ~= Key then
			HasOrder = false
		else
			Index = Index + 1
		end

		local KeyClass, ValueClass = typeof(Key), typeof(Value)
		local HasBrackets = false
		if KeyClass == 'string' then
			Key = string.gsub(Key, '[%c%z]', SpecialCharacters)
			if Keywords[Key] or not string.match(Key, '^[_%a][_%w]*$') then
				HasBrackets = true
				Key = string.format('["%s"]', Key)
			end
		else
			HasBrackets = true
			Key = '[' .. (KeyClass == 'table' and string.gsub(TableToString(Key, IgnoredTables, {Depth + 1, Path}), '^%s*(.-)%s*$', '%1') or SerializeType(Key, KeyClass)) .. ']'
		end

		Value = ValueClass == 'table' and TableToString(Value, IgnoredTables, {Depth + 1, Path}, Path .. (HasBrackets and '' or '.') .. Key) or SerializeType(Value, ValueClass)
		Result = Result .. LineTab .. (HasOrder and Value or Key .. ' = ' .. Value) .. ','
	end

	return IsEmpty and Result .. '}' or string.sub(Result,  1, -2) .. '\n' .. TrailingTab .. '}'
end


function GenerateGroup(Data, Mode)
as = Data or "New"
zx = Mode or 1
if as == "Old" then
id = math.random(1000000,1200000)
else
id = math.random(35000000,35950000)
end
currentid = id
UpdateHint()
local a,b = pcall(function()
group = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://groups.roproxy.com/v1/groups/"..id..""))
end)
if not a then
repeat task.wait(.25) local a,b = pcall(function() group = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://groups.roproxy.com/v1/groups/"..id.."")) end) until a
end
if zx == 1 then
if group and not group.code and group.memberCount and group.memberCount == 0 then
return "https://www.roblox.com/communities/"..id..""
else
return false
end
elseif zx == 2 then
if group and not group.code and group.owner and group.owner == nil then
return "https://www.roblox.com/communities/"..id..""
else
return false
end
elseif zx == 3 then
if group and not group.code and group.owner and group.owner == nil and group.publicEntryAllowed and group.publicEntryAllowed == true then
return "https://www.roblox.com/communities/"..id..""
else
return false
end
elseif zx == 4 then
if group and not group.code and group.memberCount and group.memberCount == 0 and group.publicEntryAllowed and group.publicEntryAllowed == true then
return "https://www.roblox.com/communities/"..id..""
else
return false
end
elseif zx == 5 then
if group and not group.code and group.memberCount and group.memberCount == 0 and group.publicEntryAllowed and group.publicEntryAllowed == true and group.owner and group.owner == nil then
return "https://www.roblox.com/communities/"..id..""
else
return false
end
end
end

function ReloadNiceMessage()
if workspace:FindFirstChild("GeneratorMessage") then
workspace:FindFirstChild("GeneratorMessage"):Destroy()
end
MSG = Instance.new("Message")
MSG.Name = "GeneratorMessage"
MSG.Parent = game:GetService("CoreGui")
return MSG
end

function ModScr:Generate(Date, Method, Quantity)
dat = Date or "New"
met = Method or 1
quan = Quantity or 1
bulk = {}
MSG = ReloadNiceMessage()
MSG.Text = "Generating... 0/"..quan..""
for i = 1, quan do
repeat task.wait()
generated = GenerateGroup(dat, met)
if generated == false then
totalattempts = totalattempts + 1
UpdateHint()
end
until generated ~= false
table.insert(bulk, generated)
generated = false
MSG.Text = "Generating... "..i.."/"..quan..""
end
tocopy = TableToString(bulk)
setclipboard(tocopy)
gencompleted = true
MSG.Text = "Generated and copied!"
task.wait(5)
MSG:Destroy()
if HINT then
HINT:Destroy()
end
end

return ModScr
