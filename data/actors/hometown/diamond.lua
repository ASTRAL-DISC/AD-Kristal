local actor, super = Class(Actor, "diamond")

function actor:init()
    super.init(self)

    self.name = "Diamond Guy"

    self.width = 19
    self.height = 20

    self.hitbox = {0, 10, 19, 8}

    self.color = {1, 0, 0}
    
    self.flip = nil

    self.path = "npcs/hometown/diamond"
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