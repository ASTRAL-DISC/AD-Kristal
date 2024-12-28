local actor, super = Class(Actor, "sweet")

function actor:init()
    super.init(self)

    self.name = "Sweet"

    self.width = 34
    self.height = 43

    self.hitbox = {8, 24, 20, 20}

    self.color = {1, 1, 1}

    self.flip = "right"

    self.path = "npcs/castletown/sweet"
    self.default = "sing"

    self.miniface = "face/mini/sweet"
    self.miniface_offset = {-3, -6}
	
	self.animations = {
        ["sing"] = {"sing", 10/30, true},
        ["sing_stop"] = {"sing_stop", function(s, w) self:musicAnim(s, w, 1) end},
	}

    self.offsets = {
        ["sing"] = {0, 0},
        ["sing_stop"] = {0, -1}
    }
end

function actor:musicAnim(sprite, wait, beat_delay)
    while true do
        local music = Music.getPlaying()[1]
        if music and Mod.bpm[music.current] then
            local beat = music.source:tell() / (60 / Mod.bpm[music.current])
            sprite:setFrame(math.floor(beat / beat_delay) + 1)
        end
        wait()
    end
end

function actor:onWorldUpdate(chara)
	local music = Music.getPlaying()[1]
	if Game.world.map.id == "castletown/cafe2" and music and music.current == "funky_normal" then
		if chara.sprite.anim == "sing_stop" and (music:tell() > 38.57 and music:tell() < 84.48) then
			chara:setAnimation("sing")
		elseif chara.sprite.anim == "sing" and (music:tell() > 0 and music:tell() < 38.57) then
			chara:setAnimation("sing_stop")
		end
	end
end

return actor