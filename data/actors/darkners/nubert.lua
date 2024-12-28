local actor, super = Class(Actor, "nubert")

function actor:init()
    super.init(self)

    self.name = "Nubert"

    self.width = 24
    self.height = 21

    self.hitbox = {2, 15, 18, 8}

    self.flip = nil

    self.path = "npcs/darkners/nubert"
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