local actor, super = Class(Actor, "onionsan")

function actor:init()
    super.init(self)
    
    self.name = "Onion-San"
    
    self.width = 63
    self.height = 62

    self.hitbox = nil

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/hometown/onionsan"
    self.default = "kawaii"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.animations = {
        ["kawaii"] = {"kawaii", 0.25, true},
        ["sing"] = {"sing", 0.25, true},
    }

    self.offsets = {
        ["kawaii"] = {0, 0},
        ["sing"] = {0, 0},
        ["menace"] = {0, 0},
        ["yhear"] = {0, 0},
        ["wistful"] = {0, 0},
        ["disappoint"] = {0, 22}
    }
end

return actor