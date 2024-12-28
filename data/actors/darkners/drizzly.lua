local actor, super = Class(Actor, "drizzly")

function actor:init()
    super.init(self)

    self.name = "Drizzly"

    self.width = 35
    self.height = 40

    self.hitbox = {2, 10, 30, 25}

    self.color = {0, 0, 1}

    self.flip = nil

    self.path = "npcs/darkners/drizzly"
    self.default = "talk"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {
        ["talk"] = 0.18
    }

    self.animations = {}
    
    self.offsets = {}
end

function actor:onSpriteInit(sprite)
    sprite.string = DrizzlyString(self.width - 18, self.height - 32, false)
    sprite:addChild(sprite.string)
    sprite.siner = math.pi * 2 * 30
    sprite.swinging = true
    sprite.swing_speed = 1
end

function actor:onSpriteUpdate(sprite)
    if sprite.swinging then
        if sprite.swing_speed > 0 then
            sprite.siner = sprite.siner + sprite.swing_speed * DTMULT
            sprite.x = math.cos(sprite.siner/30) * 2
        end
    end
end

return actor