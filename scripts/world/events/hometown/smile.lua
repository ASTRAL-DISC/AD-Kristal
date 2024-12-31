local Smile, super = Class(Event, "smile")

function Smile:init(data)
    super.init(self, data)
end

function Smile:onAddToStage()
	self.sound = Assets.playSound("smile", 0, 0.15)
	self.sound:setLooping(true)
end

function Smile:update()
	local player = Game.world.player
	local distance = math.abs(self.y - player.y)
    local volume = Utils.clampMap(distance, 0, 500, 0.5, 0)
	local volume2 = Utils.clampMap(distance, 400, 500, 0, 1)
	self.sound:setVolume(volume)
	Game.world.music:setVolume(volume2)
end

function Smile:onRemoveFromStage()
	Assets.stopSound("smile")
end

return Smile