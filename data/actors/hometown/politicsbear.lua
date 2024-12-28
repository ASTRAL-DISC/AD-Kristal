local actor, super = Class(Actor, "politicsbear")

function actor:init()
    super.init(self)

    self.name = "Politics Bear"

    self.width = 33
    self.height = 46

    self.hitbox = {0, 30, 33, 20}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/hometown/politicsbear"
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