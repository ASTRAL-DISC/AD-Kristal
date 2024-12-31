local SoundVolume, super = Class(Event, "soundvolume")

function SoundVolume:init(data)
    super.init(self, data)

	local properties = data.properties or {}

	self.sound = properties["sound"] or "smile"
    self.pitch = properties["pitch"] or 1

    --volume (Sound)
    self.sound_start = properties["sound_start"] or 0 --The start value of the initial range.
    self.sound_end = properties["sound_end"] or 100 --The end value of the initial range.
    self.sound_nstart = properties["sound_nstart"] or 1 --The start value of the new range.
    self.sound_nend = properties["sound_nend"] or 0 --The end value of the new range.

    --volume2 (Music)
    self.music_start = properties["music_start"] or 100 --The start value of the initial range.
    self.music_end = properties["music_end"] or 200 --The end value of the initial range.
    self.music_nstart = properties["music_nstart"] or 0 --The start value of the new range.
    self.music_nend = properties["music_nend"] or 1 --The end value of the new range.
end

function SoundVolume:onAddToStage()
	self.noise = Assets.playSound(self.sound, 0, self.pitch)
    self.noise:setLooping(true)
end

function SoundVolume:update()
	local player = Game.world.player
	local distance = Utils.dist(self.x+self.width/2, self.y+self.height/2, player.x+player.width, player.y+player.height)
    local volume = Utils.clampMap(distance, self.sound_start, self.sound_end, self.sound_nstart, self.sound_nend)
	--local volume2 = Utils.clampMap(distance, self.music_start, self.music_end, self.music_nstart, self.music_nend)
    self.noise:setVolume(volume)
	--Game.world.music:setVolume(volume2)
end

function SoundVolume:onRemoveFromStage()
	Assets.stopSound(self.sound)
end

return SoundVolume