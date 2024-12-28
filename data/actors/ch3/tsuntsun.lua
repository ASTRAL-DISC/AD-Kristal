local actor, super = Class(Actor, "tsuntsun")

function actor:init()
    super.init(self)

    self.name = "Tsun-Tsun"

    self.width = 43
    self.height = 73

    self.hitbox = {7, 15, 24, 58}

    self.color = {1, 0, 0}

    self.flip = "right"

    self.path = "enemies/ch3/tsuntsun"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {
        ["idle"] = 1/6
    }

    self.animations = {
        ["idle"] = {"idle", 1/6, true},
        ["hurt"] = {"hurt", 1/10, true},
    }
    
    self.offsets = {
        ["idle"] = {0, 0},
        ["hurt"] = {-4, -2},
    }
end

return actor