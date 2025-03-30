local actor, super = Class(Actor, "solomon")

function actor:init()
    super.init(self)

    self.name = "Solomon"

    self.width = 23
    self.height = 35

    self.hitbox = {2, 43, 19, 14}

    self.path = "npcs/ch4/solomon"

    self.default = "climb"

    self.animations = {
        ["climb"] = {"climb", 0.15, true},
    }
    
    self.offsets = {
        --Movement
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},

        --Cutscenes
        ["climb"] = {0, 0},
    }
end

return actor