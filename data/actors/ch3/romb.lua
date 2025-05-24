local actor, super = Class(Actor, "romb")

function actor:init()
    super.init(self)

    self.name = "ROMB"

    self.width = 48
    self.height = 49

    self.hitbox = {6, 30, 42, 19}

    self.flip = nil

    self.path = "npcs/ch3/romb"
    self.default = "idle"

    self.voice = nil

    self.animations = {
        ["idle"] = {"idle", 0.25, true},
        ["bow"] = {"bow", 0.15, false},
        ["unbow"] = {"unbow", 0.12, false, next="idle"},
    }

    self.talk_sprites = {
        ["talk"] = 0.18,
    }
    
    self.offsets = {
        ["idle"] = {0, 0},
        ["talk"] = {0, 0},
        ["bow"] = {0, 0},
    }
end

function actor:onTalkStart(text, sprite)
    if sprite.sprite == "idle" then
        sprite:setSprite("talk")
    end
end

function actor:onTalkEnd(text, sprite)
    if sprite.sprite == "talk" then
        sprite:setAnimation("idle")
    end
end

return actor