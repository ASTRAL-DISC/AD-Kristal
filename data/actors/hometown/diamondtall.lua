local actor, super = Class(Actor, "diamondtall")

function actor:init()
    super.init(self)

    self.name = "Diamond Tall Boy"

    self.width = 16
    self.height = 38

    self.hitbox = {0, 10, 16, 28}

    self.color = {1, 0, 0}
    
    self.flip = nil

    self.path = "npcs/hometown/diamondtall"
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