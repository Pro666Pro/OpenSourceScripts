ff
pcall(function()
local a = Instance.new("Hint")
a.Text = "Support Gui Loading..."
a.Name = "HintGui"
a.Parent = game.CoreGui
end)
pcall(function()
getgenv().gethui = function() return game:GetService("CoreGui") end
gethui = function() return game:GetService("CoreGui") end
end)
pcall(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/BypassAntiCheat/main/main.lua'))()
end)
local success, error = pcall(function()
Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)
if success then
print("Loaded New Rayfield")
Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
elseif not success then
print("Loaded Old Rayfield")
Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()
end

Window = Rayfield:CreateWindow({
   Name = "Support Gui - nexer scripts",
   Icon = 0,    
   LoadingTitle = "Support Gui",
   LoadingSubtitle = "by nexer",
   Theme = "Amethyst",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = "SlapFarmGui",
      FileName = "SlapFarmGuiConfiguration"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Verify yourself firstly!",
      Subtitle = "Key Needed!",
      Note = "The key is ''cheese''",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"cheese"}
   }
})


function Notify(title, content, time, mode)
time = time or 10
mode = mode or false
if mode == true then
img = 136186846844342
elseif mode == false then
img = 71508738660632
end
Rayfield:Notify({
	Title = title,
	Content = content,
	Duration = time,
	Image = img,
	Actions = {},
})
end

local Main = Window:CreateTab("Main", 98952570395426)
local Other = Window:CreateTab("Other", 12809025337)

local ScriptLabel = Main:CreateLabel("Choose script here!")
_G.Script = "Unknown"
local ScriptDropdown = Main:CreateDropdown({
   Name = "Choose Version",
   Options = {"Ultimate Badge Hub","Slap Farm Gui","Mastery Farm Gui"},
   CurrentOption = "Unknown",
   MultiSelection = false,
   Callback = function(Option)
_G.Script = Option
Notify("Success", "".._G.Script.." choosen!", 10, true)
   end,
})

local CategoryLabel = Main:CreateLabel("Choose category here!")
_G.MessageType = "Unknown"
local CategoryDropdown = Main:CreateDropdown({
   Name = "Choose Category",
   Options = {"Bug Report","Suggestion"},
   CurrentOption = "Unknown",
   MultiSelection = false,
   Callback = function(Option)
_G.MessageType = Option
Notify("Success", "".._G.MessageType.." choosen!", 10, true)
   end,
})

local MessageLabel = Main:CreateLabel("Write message here!")
_G.Message = "Unknown"
local MessageTextbox = Main:CreateInput({
   Name = "Write Message",
   PlaceholderText = "Input...",
   NumbersOnly = false,
   OnEnter = true,
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
_G.Message = Text
Notify("Success", "Message written!", 10, true)
   end,
})

_G.ArleadyBeingSent = false
local MainButton = Main:CreateButton({
   Name = "Send Message",
   Callback = function()
if _G.ArleadyBeingSent ~= true then
_G.ArleadyBeingSent = true
local success, error = pcall(function()
Notify("Success", "Sending message...", 10, true)

--[[
please do not nuke my webhook, i did nothing wrong 🥺

Which things this webhook logs?
It only logs:
Your device ( need to fix bugs )
Your ping ( also need to fix bugs )
Your executor ( this also need to fix bugs )
Your username and userid ( for feedback )
That's all! So please don't nuke it 😽
]]--



Notify("Success", "Message sent!", 10, true)
task.delay(60, function()
_G.ArleadyBeingSent = false
end
end)
if not success then
_G.ArleadyBeingSent = false
Notify("Error", "Message has not been sent. Possible errors: webhook is down or you didn't choose category/script or you didn't wrote message.")
end
else
Notify("Error", "You're sending messages too fast!")
end
   end,
})

local CloseHubButton = Other:CreateButton({
   Name = "Close Launcher",
   Callback = function()
Rayfield:Destroy()
   end,
})

pcall(function()
game.CoreGui:FindFirstChild("HintGui"):Destroy()
end)
