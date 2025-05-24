local actor, super = Class(Actor, "ramb")

function actor:init()
    super.init(self)

    self.name = "RAMB"

    self.width = 44
    self.height = 49

    self.hitbox = {0, 30, 37, 19}

    self.flip = nil

    self.path = "npcs/ch3/ramb"
    self.default = "talk"

    self.voice = nil

    self.animations = {
        ["bow"] = {"bow", 0.15, false},
        ["unbow"] = {"unbow", 0.12, false, next="talk"},
    }

    self.talk_sprites = {
        ["talk"] = 0.18,
    }
    
    self.offsets = {
        ["talk"] = {0, 0},
        ["bow"] = {0, 0},
    }
end

return actor