local actor, super = Class(Actor, "sharknado")

function actor:init()
    super.init(self)

    self.name = "Sharknado"

    self.width = 42
    self.height = 39

    self.hitbox = {2, 20, 40, 19}

    self.flip = nil

    self.path = "npcs/ch5/sharknado"
    self.default = "talk"

    self.voice = nil

    self.animations = {}

    self.talk_sprites = {
        ["talk"] = 0.25,
    }
    
    self.offsets = {
        ["talk"] = {0, 0},
    }
end

function actor:onSpriteInit(sprite)
    sprite.windvane_min_speed = 2
    sprite.windvane_slowdown = 0.5
    sprite.windvane_speed = sprite.windvane_min_speed
    sprite.windvane_rotation = 0
end

function actor:onSpriteUpdate(sprite)
    sprite.windvane_rotation = sprite.windvane_rotation + (sprite.windvane_speed * DTMULT)

    if sprite.windvane_speed > sprite.windvane_min_speed then
        sprite.windvane_speed = sprite.windvane_speed - sprite.windvane_slowdown * DTMULT
    end

    sprite.windvane_speed = math.max(sprite.windvane_speed, sprite.windvane_min_speed)
end

function actor:onSpriteDraw(sprite)
    Draw.draw(Assets.getTexture("npcs/ch5/sharknado/windvane"), sprite.x + 40, sprite.y + 2, math.rad(sprite.windvane_rotation), 1, 1, 10.5, 10.5)
end

function actor:onWorldUpdate(chara)
    if Game.world:hasCutscene() then
        chara.sprite.windvane_speed = 20
    end
end

return actor