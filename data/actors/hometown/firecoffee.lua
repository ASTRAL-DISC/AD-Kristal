local actor, super = Class(Actor, "firecoffee")

function actor:init()
    super.init(self)

    self.name = "Fire Coffee"

    self.width = 32
    self.height = 57

    self.hitbox = {0, 10, 32, 47}

    self.color = {1, 0, 0}
    
    self.flip = nil

    self.path = "npcs/hometown/firecoffee"
    self.default = "talk"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}
    
    self.animations = {
        ["idle"] = {"idle", 0.25, true},
    }

    self.offsets = {}
end

return actor