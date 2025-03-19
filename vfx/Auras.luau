Aura = 7
AuraColor = Color3.fromRGB(149, 0, 255) -- здесь цвет менять
LightEmis = 0.3
PartThatShouldGetEffectfromnexerscripts = game.Players.LocalPlayer.Character.HumanoidRootPart
if Aura == 1 then
local colors = {Color3.fromRGB(0, 0, 0),AuraColor,Color3.fromRGB(0, 0, 0)}
local timePositions = {0,0.3333,1}
local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(timePositions[1], colors[1]),ColorSequenceKeypoint.new(timePositions[2], colors[2]),ColorSequenceKeypoint.new(timePositions[3], colors[3])})
local b = workspace.Lobby.Sun.Attachment:Clone()
b.Parent = PartThatShouldGetEffectfromnexerscripts
b.RealisticFire.Color = colorSequence
b.RealisticFire.LightEmission = LightEmis
elseif Aura == 2 then
local colors = {Color3.fromRGB(0, 0, 0),AuraColor,Color3.fromRGB(0, 0, 0)}
local timePositions = {0,0.3333,1}
local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(timePositions[1], colors[1]),ColorSequenceKeypoint.new(timePositions[2], colors[2]),ColorSequenceKeypoint.new(timePositions[3], colors[3])})
local b = workspace.Lobby.OVERKILL.lighning:Clone()
b.Parent = PartThatShouldGetEffectfromnexerscripts
b.Color = colorSequence
b.LightEmission = LightEmis
elseif Aura == 3 then
local colors = {Color3.fromRGB(0, 0, 0),AuraColor,Color3.fromRGB(0, 0, 0)}
local timePositions = {0,0.3333,1}
local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(timePositions[1], colors[1]),ColorSequenceKeypoint.new(timePositions[2], colors[2]),ColorSequenceKeypoint.new(timePositions[3], colors[3])})
local b = workspace.Lobby["Hallow Jack"].aura:Clone()
b.Parent = PartThatShouldGetEffectfromnexerscripts
b.Color = colorSequence
b.LightEmission = LightEmis
elseif Aura == 4 then
local colors = {Color3.fromRGB(0, 0, 0),AuraColor,Color3.fromRGB(0, 0, 0)}
local timePositions = {0,0.3333,1}
local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(timePositions[1], colors[1]),ColorSequenceKeypoint.new(timePositions[2], colors[2]),ColorSequenceKeypoint.new(timePositions[3], colors[3])})
local b = workspace.Lobby.Phase.ParticleEmitter:Clone()
b.Parent = PartThatShouldGetEffectfromnexerscripts
b.Color = colorSequence
b.LightEmission = LightEmis
elseif Aura == 5 then
local colors = {Color3.fromRGB(0, 0, 0),AuraColor,Color3.fromRGB(0, 0, 0)}
local timePositions = {0,0.3333,1}
local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(timePositions[1], colors[1]),ColorSequenceKeypoint.new(timePositions[2], colors[2]),ColorSequenceKeypoint.new(timePositions[3], colors[3])})
local b = workspace.Lobby.Rattlebones.Attachment:Clone()
b.Parent = PartThatShouldGetEffectfromnexerscripts
b.ParticleEmitter.Color = colorSequence
b.ParticleEmitter.LightEmission = LightEmis
elseif Aura == 6 then
local colors = {Color3.fromRGB(0, 0, 0),AuraColor,Color3.fromRGB(0, 0, 0)}
local timePositions = {0,0.3333,1}
local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(timePositions[1], colors[1]),ColorSequenceKeypoint.new(timePositions[2], colors[2]),ColorSequenceKeypoint.new(timePositions[3], colors[3])})
local b = workspace.Lobby.Kinetic.lightning:Clone()
b.Parent = PartThatShouldGetEffectfromnexerscripts
b.Color = colorSequence
b.LightEmission = LightEmis
elseif Aura == 7 then
local colors = {Color3.fromRGB(0, 0, 0),AuraColor,Color3.fromRGB(0, 0, 0)}
local timePositions = {0,0.3333,1}
local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(timePositions[1], colors[1]),ColorSequenceKeypoint.new(timePositions[2], colors[2]),ColorSequenceKeypoint.new(timePositions[3], colors[3])})
local b = workspace.Lobby.MATERIALIZE.lighning:Clone()
b.Parent = PartThatShouldGetEffectfromnexerscripts
b.Color = colorSequence
b.LightEmission = LightEmis
elseif Aura == 8 then
Part = "HumanoidRootPart"
for i,v in ipairs(game.ReplicatedStorage.Assets.Beatdown.Stand[Part]:GetDescendants()) do
if v.ClassName == "ParticleEmitter" then
local a = v:Clone()
local colors = {Color3.fromRGB(0, 0, 0),AuraColor,Color3.fromRGB(0, 0, 0)}
local timePositions = {0,0.3333,1}
local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(timePositions[1], colors[1]),ColorSequenceKeypoint.new(timePositions[2], colors[2]),ColorSequenceKeypoint.new(timePositions[3], colors[3])})
a.Parent = game.Players.LocalPlayer.Character[Part]
a.Color = colorSequence
a.LightEmission = LightEmis
end
end
Part = "Head"
for i,v in ipairs(game.ReplicatedStorage.Assets.Beatdown.Stand[Part]:GetDescendants()) do
if v.ClassName == "ParticleEmitter" then
local a = v:Clone()
local colors = {Color3.fromRGB(0, 0, 0),AuraColor,Color3.fromRGB(0, 0, 0)}
local timePositions = {0,0.3333,1}
local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(timePositions[1], colors[1]),ColorSequenceKeypoint.new(timePositions[2], colors[2]),ColorSequenceKeypoint.new(timePositions[3], colors[3])})
a.Parent = game.Players.LocalPlayer.Character[Part]
a.Color = colorSequence
a.LightEmission = LightEmis
end
end
Part = "Right Leg"
for i,v in ipairs(game.ReplicatedStorage.Assets.Beatdown.Stand[Part]:GetDescendants()) do
if v.ClassName == "ParticleEmitter" then
local a = v:Clone()
local colors = {Color3.fromRGB(0, 0, 0),AuraColor,Color3.fromRGB(0, 0, 0)}
local timePositions = {0,0.3333,1}
local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(timePositions[1], colors[1]),ColorSequenceKeypoint.new(timePositions[2], colors[2]),ColorSequenceKeypoint.new(timePositions[3], colors[3])})
a.Parent = game.Players.LocalPlayer.Character[Part]
a.Color = colorSequence
a.LightEmission = LightEmis
end
end
Part = "Left Arm"
for i,v in ipairs(game.ReplicatedStorage.Assets.Beatdown.Stand[Part]:GetDescendants()) do
if v.ClassName == "ParticleEmitter" then
local a = v:Clone()
local colors = {Color3.fromRGB(0, 0, 0),AuraColor,Color3.fromRGB(0, 0, 0)}
local timePositions = {0,0.3333,1}
local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(timePositions[1], colors[1]),ColorSequenceKeypoint.new(timePositions[2], colors[2]),ColorSequenceKeypoint.new(timePositions[3], colors[3])})
a.Parent = game.Players.LocalPlayer.Character[Part]
a.Color = colorSequence
a.LightEmission = LightEmis
end
end
Part = "Left Leg"
for i,v in ipairs(game.ReplicatedStorage.Assets.Beatdown.Stand[Part]:GetDescendants()) do
if v.ClassName == "ParticleEmitter" then
local a = v:Clone()
local colors = {Color3.fromRGB(0, 0, 0),AuraColor,Color3.fromRGB(0, 0, 0)}
local timePositions = {0,0.3333,1}
local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(timePositions[1], colors[1]),ColorSequenceKeypoint.new(timePositions[2], colors[2]),ColorSequenceKeypoint.new(timePositions[3], colors[3])})
a.Parent = game.Players.LocalPlayer.Character[Part]
a.Color = colorSequence
a.LightEmission = LightEmis
end
end
Part = "Right Arm"
for i,v in ipairs(game.ReplicatedStorage.Assets.Beatdown.Stand[Part]:GetDescendants()) do
if v.ClassName == "ParticleEmitter" then
local a = v:Clone()
local colors = {Color3.fromRGB(0, 0, 0),AuraColor,Color3.fromRGB(0, 0, 0)}
local timePositions = {0,0.3333,1}
local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(timePositions[1], colors[1]),ColorSequenceKeypoint.new(timePositions[2], colors[2]),ColorSequenceKeypoint.new(timePositions[3], colors[3])})
a.Parent = game.Players.LocalPlayer.Character[Part]
a.Color = colorSequence
a.LightEmission = LightEmis
end
end
Part = "Torso"
for i,v in ipairs(game.ReplicatedStorage.Assets.Beatdown.Stand[Part]:GetDescendants()) do
if v.ClassName == "ParticleEmitter" then
local a = v:Clone()
local colors = {Color3.fromRGB(0, 0, 0),AuraColor,Color3.fromRGB(0, 0, 0)}
local timePositions = {0,0.3333,1}
local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(timePositions[1], colors[1]),ColorSequenceKeypoint.new(timePositions[2], colors[2]),ColorSequenceKeypoint.new(timePositions[3], colors[3])})
a.Parent = game.Players.LocalPlayer.Character[Part]
a.Color = colorSequence
a.LightEmission = LightEmis
end
end
end
