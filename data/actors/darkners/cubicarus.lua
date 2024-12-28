local actor, super = Class(Actor, "cubicarus")

function actor:init()
    super.init(self)

    self.name = "Cubicarus"

    self.width = 45
    self.height = 26

    self.hitbox = {0, 10, 45, 16}

    self.color = {0, 1, 0}

    self.flip = nil

    self.path = "npcs/darkners/cubicarus"
    self.default = "default"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {}

    self.offsets = {}
end

return actor