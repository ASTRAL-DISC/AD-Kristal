local actor, super = Class(Actor, "coody")

function actor:init()
    super.init(self)

    self.name = "Coody"

    self.width = 43
    self.height = 32

    self.hitbox = {4, 23, 40, 10}

    self.flip = "right"

    self.path = "npcs/castletown/coody"
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