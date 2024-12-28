local actor, super = Class(Actor, "wayfer")

function actor:init()
    super.init(self)

    self.name = "Wayfer"

    self.width = 25
    self.height = 23

    self.hitbox = {2, 15, 21, 8}

    self.color = {0, 1, 1}

    self.flip = nil

    self.path = "npcs/darkners/wayfer"
    self.default = "talk"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {
        ["talk"] = 0.25,
    }

    self.animations = {}
    
    self.offsets = {}
end

function actor:onSpriteInit(sprite)
    sprite.siner = 0
    sprite.floating = true
    sprite.float_speed = 3
    sprite.shadow_alpha = 1
end

function actor:onSpriteUpdate(sprite)
    if sprite.floating then
        sprite.siner = sprite.siner + DT * sprite.float_speed
        sprite.y = math.sin(sprite.siner) * 2
        if sprite.shadow_alpha ~= 1 then
            sprite.shadow_alpha = Utils.approach(sprite.shadow_alpha, 1, 0.2 * DTMULT)
        end
    else
        if sprite.shadow_alpha ~= 0 then
            sprite.shadow_alpha = Utils.approach(sprite.shadow_alpha, 0, 0.2 * DTMULT)
        end
    end
end

function actor:onSpriteDraw(sprite)
    if sprite.shadow_alpha > 0 then
        Draw.setColor(42/255, 38/255, 48/255, sprite.shadow_alpha * sprite.alpha)
        local add_w = Utils.wave(sprite.siner, 0, 4)
        local add_h = Utils.wave(sprite.siner + 0.3, 0, 2)
        local width, height = 15 + add_w * 2, 1 + add_h * 2
        local y = sprite.texture:getHeight() + 10 - math.sin(sprite.siner) * 2
        love.graphics.rectangle("fill", 5 - add_w, y - add_h, width, height)
    end
end

return actor