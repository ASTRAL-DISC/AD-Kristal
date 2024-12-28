local actor, super = Class(Actor, "starwalker")

function actor:init()
    super.init(self)

    self.name = "Starwalker"

    self.width = 37
    self.height = 36

    self.hitbox = {2, 26, 27, 10}

    self.color = {1, 1, 0}

    self.flip = nil

    self.path = "npcs/darkners/starwalker"
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