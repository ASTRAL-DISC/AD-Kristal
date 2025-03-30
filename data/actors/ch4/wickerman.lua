local actor, super = Class(Actor, "wickerman")

function actor:init()
    super.init(self)

    self.name = "wickerman"

    self.width = 84
    self.height = 72

    self.hitbox = {13, 50, 38, 22}

    self.path = "npcs/ch4/wickerman"

    self.default = "idle"

    self.animations = {
        ["idle"] = {"idle", 0.15, true},
    }
    
    self.offsets = {
        --Cutscenes
        ["idle"] = {0, 0},
    }
end

return actor