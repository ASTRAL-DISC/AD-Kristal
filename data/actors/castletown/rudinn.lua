local actor, super = Class(Actor, "rudinn")

function actor:init()
    super.init(self)

    self.name = "Rudinn"

    self.width = 35
    self.height = 40

    self.hitbox = {3, 24, 24, 16}

    self.flip = "right"

    self.path = "npcs/castletown/rudinn"
    self.default = "idle"

    self.animations = {
        ["idle"] = {"idle", 0.25, true},
        ["talk"] = {"talk", 0.15, true},
        ["tired"] = {"tired", 0.25, true},
        ["spared"] = {"spared", 0.25, true},
        ["hurt"] = {"hurt", 0, false},
        ["fan"] = {"fan", 0.25, true},
    }

    self.talk_sprites = {
        ["talk"] = 0.15,
    }

    self.offsets = {
        ["idle"] = {-6, 5},
        ["tired"] = {-6, 5},
        ["spared"] = {-4, 5},
        ["hurt"] = {-1, -1},
        ["fan"] = {-5, 0},
        ["talk"] = {-6, 0},
    }
end

return actor