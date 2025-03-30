local actor, super = Class(Actor, "firefly")

function actor:init()
    super.init(self)

    self.name = "Firefly"

    self.width = 38
    self.height = 59

    self.hitbox = {4, 40, 24, 19}

    self.path = "npcs/ch5/firefly"

    self.default = "hand_hip"

    self.animations = {
        ["fly_prepare"] = {"fly_prepare", 0.15, false},
        ["fly_prepare_loop"] = {"fly_prepare_loop", 0.15, true},
        ["fly_ready"] = {"fly_ready", 0.15, false},
        ["fly_up"] = {"fly_up", 0.15, true},
    }
    
    self.offsets = {
        --Movement

        --Cutscenes
        ["hand_hip"] = {0, 0},

        ["proud"] = {-3, 2},
        ["wink"] = {0, 0},

        ["fly_prepare"] = {-8, -6},
        ["fly_prepare_loop"] = {-8, -6},
        ["fly_ready"] = {-8, -6},
        ["fly_up"] = {-8, -6},

        ["excited_left"] = {-15, 2},
        ["excited_left_look"] = {-15, 2},
    }
end

return actor