local actor, super = Class(Actor, "diamondboy")

function actor:init()
    super.init(self)

    self.name = "Diamond Boy"

    self.width = 20
    self.height = 32

    self.hitbox = {0, 10, 20, 22}

    self.color = {1, 0, 0}
    
    self.flip = nil

    self.path = "npcs/hometown/diamondboy"
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