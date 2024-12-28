local actor, super = Class(Actor, "nurse")

function actor:init()
    super.init(self)

    self.name = "Nurse"

    self.width = 29
    self.height = 37

    self.hitbox = {0, 10, 27, 20}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/hometown/nurse"
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