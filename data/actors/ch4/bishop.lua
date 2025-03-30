local actor, super = Class(Actor, "bishop")

function actor:init()
    super.init(self)

    self.name = "Bishop"

    self.width = 41
    self.height = 73

    self.hitbox = {8, 60, 28, 13}

    self.path = "npcs/ch4/bishop"

    self.default = "arms_behind"

    self.animations = {
        ["laugh"] = {"laugh", 0.15, true},
    }
    
    self.offsets = {
        --Movement

        --Cutscenes
        ["arms_behind"] = {0, 0},
        ["arms_out"] = {0, 0},
        ["laugh"] = {0, 0},
    }
end

return actor