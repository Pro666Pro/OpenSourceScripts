laoslsl -- i wrote it so script won't turn on, i didnt made it yet

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
local EA = Window:CreateTab("Early Access", 98952570395426)
local Other = Window:CreateTab("Other", 12809025337)
local Credits = Window:CreateTab("Credits", 15781236875)

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

local MainButton = Main:CreateButton({
   Name = "Send Message",
   Callback = function()
--loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/slapfarmgui/refs/heads/main/".._G.Version..".lua" or "https://raw.githubusercontent.com/Pro666Pro/slapfarmgui/refs/heads/main/".._G.Version..".0.lua"))()
   end,
})

local EALabel = EA:CreateLabel("No Early Access. [ Yet ]")

local CloseHubButton = Other:CreateButton({
   Name = "Close Launcher",
   Callback = function()
Rayfield:Destroy()
   end,
})

local CreditsLabel = Credits:CreateLabel("Slap Farm Gui v4. [ Owned By Nexer1234 ]")

local YoutubeButton = Credits:CreateButton({
   Name = "Youtube Channel",
   Callback = function()
setclipboard(tostring("https://www.youtube.com/@nexer1234"))
Notify("Copied!", "Copied youtube channel link to clipboard!", 10, true)
   end,
})

local DiscordButton = Credits:CreateButton({
   Name = "Discord Server",
   Callback = function()
setclipboard(tostring("https://discord.gg/s2VCjQUxBc"))
Notify("Copied!", "Copied discord server link to clipboard!", 10, true)
   end,
})

pcall(function()
game.CoreGui:FindFirstChild("HintGui"):Destroy()
end)
