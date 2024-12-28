local actor, super = Class(Actor, "rudinn_ranger")

function actor:init()
    super.init(self)

    self.name = "Rudinn Ranger"

    self.width = 35
    self.height = 40

    self.hitbox = {3, 24, 24, 16}

    self.flip = "right"

    self.path = "npcs/castletown/rudinn_ranger"
    self.default = "talk"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {
        ["talk"] = 0.25,
    }

    self.animations = {}
    
    self.offsets = {}
end

return actor