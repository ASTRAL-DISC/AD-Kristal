local actor, super = Class(Actor, "blobgal")

function actor:init()
    super.init(self)

    self.name = "Blob Gal"

    self.width = 20
    self.height = 36

    self.hitbox = {0, 10, 20, 36}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/hometown/blobgal"
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