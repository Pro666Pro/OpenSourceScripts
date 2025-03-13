if not game.IsLoaded then
game.Loaded:Wait()
end

-- Credits, message is not squished up cuz it looks bad
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Credits to Nexer1234_AnotherAlt",
	Text = "Made by @nexer1234 ( youtube & discord )",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000
})
  
if game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then

fireclickdetector(workspace.Lobby.Alchemist.ClickDetector)

task.wait(1)

if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then

if not game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Cauldron") then
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end

local args = {
    [1] = "BrewPotion"
}

-- Grug Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Nightmare Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Confusion Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Red Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Glowing Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Red Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Glowing Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Power Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Red Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Dire Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Wild Vine")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Red Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dire Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Wild Vine")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Paralyzing Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Plane Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Plane Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Plane Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Haste Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Autumn Sprout")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Jade Stone")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Autumn Sprout")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Jade Stone")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Invisibility Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Hazel Lily")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Hazel Lily")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Hazel Lily")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Explosion Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Red Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Fire Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Fire Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Fire Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Red Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Invincible Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Elder Wood")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Elder Wood")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Toxic Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Red Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Red Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Freeze Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Winter Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Wild Vine")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Glowing Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Wild Vine")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Glowing Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Winter Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Winter Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Feather Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Hazel Lily")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Hazel Lily")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Speed Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Hazel Lily")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Plane Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Hazel Lily")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Plane Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Lethal Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Slow Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Jade Stone")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Plane Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Jade Stone")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Plane Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Antitoxin Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Glowing Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Elder Wood")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Plane Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Plane Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Plane Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Elder Wood")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Glowing Mushroom")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Corrupted Vine Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Wild Vine")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Elder Wood")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Jade Stone")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Wild Vine")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Wild Vine")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Wild Vine")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blood Rose")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Dark Root")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Elder Wood")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Jade Stone")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Field Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Hazel Lily")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Plane Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Hazel Lily")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Plane Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Plane Flower")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))

-- Lost Potion
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Elder Wood")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "AddItem","Red Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Elder Wood")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Elder Wood")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Elder Wood")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Red Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer( "MixItem","Blue Crystal")
wait(0.01)
game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))
else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "You don't have alchemist",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end

else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Wrong game buddy",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
