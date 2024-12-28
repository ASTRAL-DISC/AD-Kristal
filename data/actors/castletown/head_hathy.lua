local actor, super = Class(Actor, "head_hathy")

function actor:init()
    super.init(self)

    self.name = "Head Hathy"

    self.width = 53
    self.height = 48

    self.hitbox = {13, 35, 40, 14}

    self.color = {1, 0, 0}

    self.flip = "right"

    self.path = "npcs/castletown/headhathy"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {
        ["idle"] = 0.25,
    }

    self.animations = {
        --["idle"] = {"idle", 0.25, true},
        ["hurt"] = {"hurt", 0, false},
        ["spared"] = {"spared", 0, false},
    }

    self.offsets = {
        ["hurt"] = {0, -10},
        ["spared"] = {2, 0},
    }
end

return actor