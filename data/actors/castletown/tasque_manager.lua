local actor, super = Class(Actor, "tasque_manager")

function actor:init()
    super.init(self)

    self.name = "Tasque Manager"

    self.width = 95
    self.height = 74
	
    self.hitbox = {6, 64, 75, 10}

    self.flip = "right"

    self.path = "npcs/castletown/tm"
    self.default = "spared_static"

    self.animations = {
	    ["idle"]           = {"idle", 0, true},
	    ["spared"]         = {"spared", 0, true},
        ["spared_static"]  = {"spared_static", 0.25, true},
        ["hurt"]           = {"hurt", 0, false},
        ["sing"]           = {"sing", 4/30, true},
        ["sing_stop"]      = {"sing_stop", function(s, w) self:musicAnim(s, w, 1) end},
    }

    self.offsets = {
        ["spared_static"] = {11, 3},
        ["hurt"]          = {29, 10},
        ["sing"]          = {19, 5},
        ["sing_stop"]     = {19, 5}
    }

	self.spotlight = {
        offset_x = 3,
        offset_y = -3,
        width = 60,
        beam_height = 200,
        top_color = {1, 1, 1, 0.0},
        bottom_color = {0, 1, 1, 0.25},
        base_color = {0, 0.75, 0.75, 1}
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

function actor:onWorldUpdate(chara)
	local music = Music.getPlaying()[1]
	if Game.world.map.id == "castletown/cafe" and music and music.current == "funky_normal" then
		if chara.sprite.anim == "sing_stop" then
            if (music:tell() > 7.67 and music:tell() < 23.22) or (music:tell() > 38.57 and music:tell() < 84.48) then
			    chara:setAnimation("sing")
            end
        elseif chara.sprite.anim == "sing" then
            if (music:tell() > 23.22 and music:tell() < 38.57) or (music:tell() > 0 and music:tell() < 7.67) then
			    chara:setAnimation("sing_stop")
            end
        end
	end
end

function actor:onSpriteInit(sprite)
    local mockup = Assets.getTexture(self.path.."/parts/mockup")

    local tm_sprite = {}
    local tm_sparesprite = {}
	
    tm_sprite[1] = Assets.getTexture(self.path.."/parts/tail")
    tm_sprite[2] = Assets.getTexture(self.path.."/parts/hand_r")
    tm_sprite[3] = Assets.getTexture(self.path.."/parts/hand_l")
    tm_sprite[4] = Assets.getTexture(self.path.."/parts/legs")
    tm_sprite[5] = Assets.getTexture(self.path.."/parts/body")
    tm_sprite[6] = Assets.getTexture(self.path.."/parts/head")
	
    tm_sparesprite[1] = Assets.getTexture(self.path.."/parts/tail_spare")
    tm_sparesprite[2] = Assets.getTexture(self.path.."/parts/hand_r_spare")
    tm_sparesprite[3] = Assets.getTexture(self.path.."/parts/hand_l")
    tm_sparesprite[4] = Assets.getTexture(self.path.."/parts/legs")
    tm_sparesprite[5] = Assets.getTexture(self.path.."/parts/body")
    tm_sparesprite[6] = Assets.getTexture(self.path.."/parts/head_spare")
	
    sprite.tm_sprite = tm_sprite
    sprite.tm_sparesprite = tm_sparesprite
    sprite.mockup = mockup
	
	sprite.timer = 0
end

function actor:onSpriteDraw(sprite)
    super.onSpriteDraw(sprite)
	
    sprite.timer = sprite.timer + 1.5 * DTMULT
	
    if sprite.anim == "idle" then
	    local tailsprite = sprite.tm_sprite[1]
		local tail_x, tail_y = sprite.x + 60, sprite.y + 48
		Draw.draw(tailsprite, tail_x, tail_y, ((math.sin(sprite.timer / 6))) * math.rad(10), 1, 1, 60, 48)
		
	    local handSprite = sprite.tm_sprite[2]
		local hand_x, hand_y = (sprite.x + 39) + (math.sin(sprite.timer / 6)), (sprite.y + 26) + (math.sin(sprite.timer / 6))
		Draw.draw(handSprite, hand_x, hand_y, 0, 1, 1, 39, 26)
		
	    local whipSprite = sprite.tm_sprite[3]
		local whip_x, whip_y = (sprite.x + 29) + (math.cos(sprite.timer / 6)), (sprite.y + 36) + (math.sin(sprite.timer / 6))
		Draw.draw(whipSprite, whip_x, whip_y, math.sin(sprite.timer / 6) * math.rad(-15), 1, 1, 29, 36)
		
	    local legSprite = sprite.tm_sprite[4]
		local leg_x, leg_y = (sprite.x + 51) + (math.sin(sprite.timer / 6) * 0), (sprite.y + 35)
		Draw.draw(legSprite, leg_x, leg_y, 0, 1, 1, 51, 35)
		
	    local bodySprite = sprite.tm_sprite[5]
		local body_x, body_y = sprite.x + 55, (sprite.y + 29) + (math.sin(sprite.timer / 6))
		Draw.draw(bodySprite, body_x, body_y, 0, 1, 1, 55, 29)
		
	    local headSprite = sprite.tm_sprite[6]
		local head_x, head_y = sprite.x + 57, (sprite.y + 24) + (math.sin(sprite.timer / 6) * 1.5)
		Draw.draw(headSprite, head_x, head_y, (math.sin((sprite.timer / 6))) * math.rad(-10), 1, 1, 57, 24)
		
	elseif sprite.anim == "spared" then
	    local tailsprite = sprite.tm_sparesprite[1]
		local tail_x, tail_y = sprite.x + 60, sprite.y + 48
		Draw.draw(tailsprite, tail_x, tail_y, ((math.sin(sprite.timer / 6))) * math.rad(10), 1, 1, 60, 48)
		
	    local handSprite = sprite.tm_sparesprite[2]
		local hand_x, hand_y = (sprite.x + 39) + (math.sin(sprite.timer / 6)), (sprite.y + 26) + (math.sin(sprite.timer / 6))
		Draw.draw(handSprite, hand_x, hand_y, 0, 1, 1, 39, 26)
		
	    local whipSprite = sprite.tm_sparesprite[3]
		local whip_x, whip_y = (sprite.x + 29) + (math.cos(sprite.timer / 6)), (sprite.y + 36) + (math.sin(sprite.timer / 6))
		Draw.draw(whipSprite, whip_x, whip_y, math.sin(sprite.timer / 6) * math.rad(-15), 1, 1, 29, 36)
		
	    local legSprite = sprite.tm_sparesprite[4]
		local leg_x, leg_y = (sprite.x + 51) + (math.sin(sprite.timer / 6) * 0), (sprite.y + 35)
		Draw.draw(legSprite, leg_x, leg_y, 0, 1, 1, 51, 35)
		
	    local bodySprite = sprite.tm_sparesprite[5]
		local body_x, body_y = sprite.x + 55, (sprite.y + 29) + (math.sin(sprite.timer / 6))
		Draw.draw(bodySprite, body_x, body_y, 0, 1, 1, 55, 29)
		
	    local headSprite = sprite.tm_sparesprite[6]
		local head_x, head_y = sprite.x + 57, (sprite.y + 24) + (math.sin(sprite.timer / 6) * 1.5)
		Draw.draw(headSprite, head_x, head_y, (math.sin((sprite.timer / 6))) * math.rad(-10), 1, 1, 57, 24)
	end
end

return actor