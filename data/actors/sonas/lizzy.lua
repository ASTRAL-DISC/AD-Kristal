local actor, super = Class(Actor, "lizzy")

function actor:init()
    super.init(self)

    self.name = "Lizzy"

    self.width = 35
    self.height = 47

    self.hitbox = {10, 36, 25, 14}

    self.path = "npcs/sonas/lizzy"
    self.default = "idle"

    self.voice = nil

    self.portrait_path = nil
    self.portrait_offset = nil
    self.talk_sprites = nil

    self.animations = {
        ["balloon"] = {"balloon", 0.3, true},
    }

    self.offsets = {
        ["idle"] = {0, 0},
        ["balloon"] = {3, -13},
    }
end

function actor:onSpriteInit(sprite)
    sprite.siner = 0
    sprite.float_speed = 3
    sprite.floating = false
    sprite.sweat_timer = 0
end

function actor:onSpriteUpdate(sprite)
    if sprite.sprite == "balloon" then
        sprite.floating = true
        sprite.siner = sprite.siner + DT * sprite.float_speed
        sprite.y = math.sin(sprite.siner) * 6

        if sprite.sweat_timer >= 0 then
            sprite.sweat_timer = sprite.sweat_timer - DTMULT
        else
            local x, y = sprite.x/2 + 34, sprite.y/2 + 22
            local sweat = SweatDrops(x, y)
            sweat.layer = sprite.layer + 1
            sprite:addChild(sweat)
            sprite.sweat_timer = 0.2 * 30
        end
    end
end

return actor