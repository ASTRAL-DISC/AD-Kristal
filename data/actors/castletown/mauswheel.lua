local actor, super = Class(Actor, "mauswheel")

function actor:init()
    super.init(self)

    self.name = "Mauswheel"

    self.width = 60
    self.height = 58

    self.hitbox = {10, 10, 50, 48}

    self.flip = "right"

    self.path = "npcs/castletown/mauswheel"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {
        ["idle"] = 0.18
    }

    self.animations = {
        --["idle"] = {"idle", 0.18, true},
    }
    
    self.offsets = {
        ["idle"] = {0, 0},
    }
end

return actor