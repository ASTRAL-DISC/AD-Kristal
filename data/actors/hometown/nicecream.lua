local actor, super = Class(Actor, "nicecream")

function actor:init()
    super.init(self)

    self.name = "Nice Cream"

    self.width = 21
    self.height = 57

    self.hitbox = {0, 10, 21, 47}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/hometown/nicecream"
    self.default = "talk"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {
        ["talk"] = 0.2
    }

    self.animations = {}
    
    self.offsets = {}
end

return actor