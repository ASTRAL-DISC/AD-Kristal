local actor, super = Class(Actor, "kk")

function actor:init()
    super.init(self)

    self.name = "K_K"

    self.width = 58
    self.height = 68

    self.hitbox = {14, 53, 34, 18}

    self.color = {1, 1, 1}

    self.flip = nil

    self.path = "npcs/castletown/kk"
    self.default = "cymbal"

    self.miniface = "face/mini/kk"
    self.miniface_offset = {-3, -2}
	
	self.animations = {
        ["cymbal"] = {"cymbal", function(s, w) self:musicAnim(s, w, 1) end}
	}
end

function actor:musicAnim(sprite, wait, beat_delay)
    while true do
        local music = Music.getPlaying()[1]
        if music and MUSIC_BPM[music.current] then
            local beat = music.source:tell() / (60 / MUSIC_BPM[music.current])
            sprite:setFrame(math.floor(beat / beat_delay) + 1)
        end
        wait()
    end
end

return actor