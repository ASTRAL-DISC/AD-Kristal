local actor, super = Class(Actor, "lola")

function actor:init()
    super.init(self)

    self.name = "Lola"

    self.width = 27
    self.height = 44

    self.hitbox = {4, 30, 20, 14}

    self.color = {0.8, 0.8, 0.8}

    self.path = "npcs/ch3/lola"
    self.default = "talk"

    self.flip = "right"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.miniface = "face/mini/lola"
    self.miniface_offset = {0, -4}

    self.animations = {}
    
    self.talk_sprites = {
        ["talk"] = 0.25
    }

    self.offsets = {
        ["talk"] = {0, 0},
    }
end

function actor:onSpriteInit(sprite)
    sprite.siner = 0
    sprite.float_speed = 2
    sprite.floating = true
end

function actor:onSpriteUpdate(sprite)
    sprite.siner = sprite.siner + DT * sprite.float_speed
    sprite.y = math.sin(sprite.siner) * 6
end

return actor