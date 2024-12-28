local actor, super = Class(Actor, "ladygarf")

function actor:init()
    super.init(self)

    self.name = "Lady Garf"

    self.width = 25
    self.height = 47

    self.hitbox = nil

    self.color = {1, 0, 0}
    
    self.flip = nil

    self.path = "npcs/hometown/ladygarf"
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