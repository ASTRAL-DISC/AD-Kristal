local actor, super = Class(Actor, "ponman")

function actor:init()
    super.init(self)

    self.name = "Ponman"

    self.width = 29
    self.height = 44

    self.hitbox = {0, 30, 29, 14}

    self.flip = nil

    self.path = "npcs/castletown/ponman"
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