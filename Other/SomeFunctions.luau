BigNumber = 9e9 or math.huge or 500000
FirePrompt = function(instance) if instance and instance:IsA("ProximityPrompt") and fireproximityprompt then instance.HoldDuration = 0; instance.RequiresLineOfSight = false; instance.MaxActivationDistance = BigNumber; fireproximityprompt(instance) end end
RequireService = cloneref or function(clone) return clone end
BlockInstance = function(ez) ez.Name = "BlockedInstance_"..math.random(0,500000).."" ez.Parent = RequireService(game:GetService("LogService")) ez:Destroy() end
