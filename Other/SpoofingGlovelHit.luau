if hookmetamethod and getnamecallmethod then
local Namecall
Namecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    if method == "FireServer" and tostring(self) == "GeneralHit" and game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("leaderstats") and game.Players.LocalPlayer.leaderstats:FindFirstChild("Glove") and game.Players.LocalPlayer.leaderstats.Glove.Value == "Glovel" then
        local args = {...}
        for i, arg in ipairs(args) do
            if arg == false then
                args[i] = true
            end
        end
        return Namecall(self, unpack(args))
    end
    return Namecall(self, ...)
end)
end
