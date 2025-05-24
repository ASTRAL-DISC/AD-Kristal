local actor, super = Class(Actor, "halojack")

function actor:init()
    super.init(self)

    self.name = "Halojack"

    self.width = 27
    self.height = 45

    self.hitbox = {0, 25, 19, 14}

    self.path = "npcs/ch3/halojack"
    self.default = "idle"
    
    self.voice = "halojack"

    self.talk_sprites = {}

    self.animations = {
        ["idle"] = {"idle", 0, false},
    }

    self.offsets = {
        ["idle"] = {0, 0},
    }
end

return actor