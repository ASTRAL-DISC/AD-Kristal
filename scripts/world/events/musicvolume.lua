local MusicVolume, super = Class(Event, "musicvolume")

function MusicVolume:init(data)
    super.init(self, data)

	self.range = data.properties["range"] or 500
	self.range2 = data.properties["range2"] or 1000
end

function MusicVolume:update()
	local player = Game.world.player
	local event = self
	local distance = Utils.dist(player.x, player.y, event.x, event.y)
    local volume = Utils.clampMap(distance, self.range, self.range2, 1, 0)

	Game.world.music:setVolume(volume)
	super.update(self)
end

return MusicVolume