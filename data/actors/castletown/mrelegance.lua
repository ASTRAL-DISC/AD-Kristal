local actor, super = Class(Actor, "mrelegance")

function actor:init()
    super.init(self)
    
    self.name = "Mr. Elegance"

    self.width = 26
    self.height = 30

    self.hitbox = {4, 14, 20, 16}

    self.flip = "right"

    self.path = "npcs/castletown/mrelegance"
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