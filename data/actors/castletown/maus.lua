local actor, super = Class(Actor, "maus")

function actor:init()
    super.init(self)

    self.name = "Maus"

    self.width = 35
    self.height = 12

    self.hitbox = {0, 4, 16, 8}

    self.flip = "right"

    self.path = "npcs/castletown/maus"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {
        ["idle"] = 0.15
    }

    self.animations = {
        --["idle"] = {"idle", 0.15, true},
    }
    
    self.offsets = {
        ["idle"] = {0, 0},
        ["spared"] = {0, 0},
        ["hurt"] = {0, 0},
    }
end

return actor