local actor, super = Class(Actor, "spreeblitz")

function actor:init()
    super.init(self)

    self.name = "Spree Blitz"

    self.width = 38
    self.height = 59

    self.hitbox = {4, 40, 24, 19}

    self.path = "npcs/ch5/spreeblitz"

    self.default = "idle"
    self.voice = "blitz"

    self.animations = {}
    
    self.offsets = {
        --Movement

        --Cutscenes
        ["idle"] = {0, 0},
    }
end

return actor