local actor, super = Class(Actor, "poppup")

function actor:init()
    super.init(self)

    self.name = "Poppup"

    self.width = 44
    self.height = 56

    self.hitbox = {4, 30, 38, 20}

    self.flip = "right"

    self.path = "npcs/castletown/poppup"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {
        ["idle"] = 0.25,
    }

    self.animations = {}
    
    self.offsets = {}
end

return actor