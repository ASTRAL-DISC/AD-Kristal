local actor, super = Class(Actor, "plugboy")

function actor:init()
    super.init(self)

    self.name = "Plugboy"

    self.width = 28
    self.height = 31

    self.hitbox = {1, 13, 18, 18}

    self.color = {1, 1, 0}

    self.flip = "right"

    self.path = "npcs/castletown/plugboy"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {
        ["idle"] = 0.15,
        ["cower"] = 0.15,
        ["bandana"] = 0.15,
        ["girl"] = 0.15,
        ["hat"] = 0.15,
        ["suit"] = 0.15,
        ["wig"] = 0.15
    }

    self.animations = {
        ["cower"] = {"cower", 5/30, true},
    }

    self.offsets = {
        ["idle"] = {-3, -3},
        ["bandana"] = {0, -3},
        ["girl"] = {0, -7},
        ["hat"] = {0, -9},
        ["suit"] = {-3, -3},
        ["wig"] = {0, -7},

        ["cower"] = {-2, 1},
        ["spared"] = {-3, 0},
    }
end

return actor