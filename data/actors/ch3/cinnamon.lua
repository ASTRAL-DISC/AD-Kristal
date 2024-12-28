local actor, super = Class(Actor, "cinnamon")

function actor:init()
    super.init(self)
    
    self.name = "Cinnamon"

    self.width = 69
    self.height = 85

    self.hitbox = {2, 58, 69, 18}

    self.color = {0, 1, 1}
	
	self.flip = nil

    self.path = "npcs/ch3/cinnamon"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false
	
	self.talk_sprites = {
        ["talk"] = 0.25
    }

    self.animations = {
        ["idle"] = {"idle", 0.25, true},
    }

    self.offsets = {}
	
end

function actor:onTalkStart(text, sprite)
    if sprite.sprite == "idle" then
        sprite:setSprite("talk")
    end
end

function actor:onTalkEnd(text, sprite)
    if sprite.sprite == "talk" then
        sprite:setSprite("idle")
    end
end

return actor