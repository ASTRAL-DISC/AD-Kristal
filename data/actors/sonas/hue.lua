local actor, super = Class(Actor, "hue")

function actor:init()
    super.init(self)

    self.name = "Hue"

    self.width = 31
    self.height = 38

    self.hitbox = {5, 23, 18, 15}

    self.path = "npcs/sonas/hue"
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
        ["sit"] = {0, 1},
        ["balloon"] = {-5, -25},
    }
end

function actor:onSpriteInit(sprite)
    sprite.siner = 0
    sprite.float_speed = 2
    sprite.notesiner = math.random(600)
    sprite.notealpha = 1
    sprite.floating = false
    sprite.singing = false
end

function actor:onSpriteUpdate(sprite)
    if sprite.sprite == "balloon" then
        sprite.floating = true
        sprite.siner = sprite.siner + DT * sprite.float_speed
        sprite.y = math.sin(sprite.siner) * 6
    elseif sprite.sprite == "sit" then
        sprite.singing = true
    end
end

function actor:onSpriteDraw(sprite)
    if sprite.singing then
        self.notes = Assets.getTexture("npcs/sonas/hue/notes")
        sprite.notesiner = sprite.notesiner + DTMULT
        Draw.setColor(1, 1, 1, sprite.notealpha)
        Draw.draw(self.notes, (math.sin((sprite.notesiner / 20)) * 2), (math.cos((sprite.notesiner / 20)) * 2), 0, 1, 1, self.width/2 - 40, self.height/2 - 10)
    end
end

function actor:onWorldUpdate(chara)
    if chara.sprite.singing then
        local player = Game.world.player
        local distance = Utils.dist(player.x, player.y, chara.x, chara.y)
        local alpha = Utils.clampMap(distance, 50, 150, 1, 0)
        chara.sprite.notealpha = alpha
    end
end

return actor