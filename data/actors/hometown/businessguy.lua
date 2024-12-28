local actor, super = Class(Actor, "businessguy")

function actor:init()
    super.init(self)

    self.name = "Business Guy"

    self.width = 31
    self.height = 29


    self.hitbox = {0, 10, 31, 19}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/hometown/businessguy"
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