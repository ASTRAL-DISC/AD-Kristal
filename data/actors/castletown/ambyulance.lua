local actor, super = Class(Actor, "ambyulance")

function actor:init()
    super.init(self)

    self.name = "Ambyu-Lance"

    self.width = 52
    self.height = 47

    self.hitbox = {4, 23, 40, 10}

    self.flip = "right"

    self.path = "npcs/castletown/ambyulance"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {
        ["idle"] = 0.25,
    }

    self.animations = {
        --["idle"] = {"idle", 0.18, true},
        ["chase"] = {"chase", 0.2, true},
    }
    
    self.offsets = {
        ["idle"] = {0, 0},
        ["chase"] = {0, 0},
    }
end

return actor