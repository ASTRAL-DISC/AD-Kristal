local actor, super = Class(Actor, "malius")

function actor:init()
    super.init(self)

    self.name = "Malius"

    self.width = 41
    self.height = 52

    self.hitbox = {5, 35, 31, 17}

    self.flip = "left"

    self.path = "npcs/castletown/malius"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {}

    self.animations = {
        ["idle"] = {"idle", 0.4, true},
        ["talk"] = {"idle", 0.15, true},
        ["powerup"] = {"powerup", 0.07, true},
        ["hit"] = {"hit", 0.07, false},
    }
    
    self.offsets = {
        ["idle"] = {0, 0},
        ["talk"] = {0, 0},
        ["powerup"] = {1, -2}, -- -8, -5 for accuracy
        ["hit"] = {1, -5}, -- -7, -8 for accuracy
    }
end

function actor:onTalkStart(text, sprite)
    if sprite.anim == "idle" then
        sprite:setAnimation("talk")
    end
end

function actor:onWorldUpdate(chara)
    if not Game.world:hasCutscene() then
        if chara.sprite.anim == "talk" then
            chara:setAnimation("idle")
        end
    end
end

return actor