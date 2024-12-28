local actor, super = Class(Actor, "fommt")

function actor:init()
    super.init(self)

    self.name = "Fommt"

    self.width = 37
    self.height = 41

    self.hitbox = {10, 25, 15, 16}

    self.flip = nil

    self.path = "npcs/castletown/fommt"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {}

    self.animations = {
        ["idle"] = {"idle", 0.25, true},
    }
    
    self.offsets = {}
end

return actor