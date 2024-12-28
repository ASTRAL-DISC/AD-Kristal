local actor, super = Class(Actor, "flaggie")

function actor:init()
    super.init(self)

    self.name = "Flaggie"

    self.width = 42
    self.height = 35

    self.hitbox = {2, 15, 18, 8}

    self.color = {1, 0, 1}

    self.flip = nil

    self.path = "npcs/darkners/flaggie"
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