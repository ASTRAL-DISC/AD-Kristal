local actor, super = Class(Actor, "werewerewire")

function actor:init()
    super.init(self)

    self.name = "Werewerewire"

    self.width = 50
    self.height = 63

    self.hitbox = {10, 10, 50, 48}

    self.flip = "right"

    self.path = "npcs/castletown/werewerewire"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {
        ["idle"] = 0.2
    }

    self.animations = {
        --["idle"] = {"idle", 0.2, true},
    }
    
    self.offsets = {
        ["idle"] = {0, 0},
    }
end

return actor