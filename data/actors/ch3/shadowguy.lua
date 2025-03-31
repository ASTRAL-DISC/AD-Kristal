-- original library by KateBulka
local actor, super = Class(Actor, "shadowguy")

function actor:init()
    super.init(self)

    self.name = "Shadowguy"

    self.width = 54
    self.height = 56

	local offset = self.height * .75
	local xoffset = self.width * .25
	
    self.hitbox = {xoffset, offset, self.width - (xoffset * 2), self.height - offset}

    self.flip = "right"

    self.path = "enemies/ch3/shadowguy"
    self.default = "idle"

	self.talk_sprites = {
		["talk"] = 0.25
	}
	
    self.animations = {
        ["idle"] = {"idle", 0.15, true},
		["talk"] = {"idle", 0.25, true},
        ["hurt"] = {"hurt", 0, false},
		["play"] = {"play", 0.075, true},
		["play_stop"] = {"play_stop", function(s, w) self:musicAnim(s, w, 1) end},
		["shooting"] = {"shooting", 0, false},
		["prepare"] = {"prepare", 0.2, true},
		["pullsocks"] = {"pullsocks", 0.2, true},
		["scream"] = {"scream", 0, false},
        ["spared"] = {"spared", 0, false},
	}	
	
    self.offsets = {
        ["play"] = {-18, 0},
		["play_stop"] = {-18, 0},
        ["prepare"] = {0, -8},
		["scream"] = {9, -7},
		["hurt"] = {9, -7},
	}
	
	self.timer = 0
	self.no_reflection = true
end

function actor:musicAnim(sprite, wait, beat_delay)
    while true do
        local music = Music.getPlaying()[1]
        if (music and music.current == "funky_normal") and MUSIC_BPM[music.current] then
            local beat = music.source:tell() / (60 / MUSIC_BPM[music.current])
            sprite:setFrame(math.floor(beat / beat_delay) + 1)
        end
        wait()
    end
end

function actor:createSprite()
	return ShadowguyActor(self)
end

function actor:onWorldUpdate(chara)
	local music = Music.getPlaying()[1]
	if Game.world.map.id == "castletown/cafe" and (music and music.current == "funky_normal") then
		if chara.sprite.anim == "play_stop" and (music:tell() > 23.32 and music:tell() < 84.48) then
			chara:setAnimation("play")
		elseif chara.sprite.anim == "play" and (music:tell() > 0 and music:tell() < 23.32) then
			chara:setAnimation("play_stop")
		end
	end
end

function actor:preSetAnimation(sprite, anim, ...)
	if anim == "shooting" then
		sprite.gun.visible = true
	elseif sprite == "scream" then
		Assets.playSound("scream")
	else
		if sprite.gun then
			sprite.gun.visible = false
		end
	end
end

return actor