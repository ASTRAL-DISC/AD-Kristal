local actor, super = Class(Actor, "python")

function actor:init()
    super.init(self)

    self.name = "Python"

    self.width = 66
    self.height = 67

    self.hitbox = {4, 4, 58, 67}

    self.color = {1, 0, 0}

    self.flip = "right"

    self.path = "enemies/ch3/python"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {
        ["idle"] = 4/12
    }

    self.animations = {
        ["idle"] = {"idle", 1/12, true},
        ["hurt"] = {"hurt", 1/10, true},
        ["charge"] = {"charge", 1/8, true},
    }
    
    self.offsets = {
        ["idle"] = {0, 0},
        ["hurt"] = {-4, -2},
        ["charge"] = {0, 0},
    }
end

return actor