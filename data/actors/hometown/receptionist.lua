local actor, super = Class(Actor, "receptionist")

function actor:init()
    super.init(self)

    self.name = "Receptionist"

    self.width = 24
    self.height = 41

    self.hitbox = {0, 20, 24, 20}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/hometown/receptionist"
    self.default = "talk"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {
        ["talk"] = 0.25
    }

    self.animations = {}
    
    self.offsets = {}
end

return actor