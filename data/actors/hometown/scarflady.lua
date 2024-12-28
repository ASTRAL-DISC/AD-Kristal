local actor, super = Class(Actor, "scarflady")

function actor:init()
    super.init(self)

    self.name = "Scarf Lady"

    self.width = 28
    self.height = 41

    self.hitbox = {0, 10, 28, 41}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/hometown/scarflady"
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