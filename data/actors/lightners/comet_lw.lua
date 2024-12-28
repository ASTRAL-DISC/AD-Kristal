local actor, super = Class(Actor, "comet_lw")

function actor:init()
    super.init(self)

    self.name = "Comet"

    self.width = 25
    self.height = 56

    self.hitbox = {4, 30, 22, 25}

    self.path = "npcs/lightners/comet/light"
    self.default = "walk"

    self.voice = "comet"

    self.portrait_path = "face/comet"
    
    self.portrait_offset = {-28, -18}

    self.talk_sprites = {}

    self.animations = {
        ["mad"] = {"mad", 2/30, true},

        ["fountain/jump"] = {"fountain/jump", 1/15, false},
        ["fountain/stab"] = {"fountain/stab", 1/15, false, next = "fountain/stab_loop"},
        ["fountain/stab_loop"] = {"fountain/stab_loop", 1/15, true},
        ["fountain/stab_b"] = {"fountain/stab_b", 1/15, false, next = "fountain/stab_b_loop"},
        ["fountain/stab_b_loop"] = {"fountain/stab_b_loop", 1/15, true},
        ["fountain/stab_c"] = {"fountain/stab_c", 1/15, false, next = "fountain/stab_c_loop"},
        ["fountain/stab_c_loop"] = {"fountain/stab_c_loop", 1/15, true},
        ["fountain/invert_loop"] = {"fountain/invert_loop", 1/15, true},
    }

    self.offsets = {
        --Movement
        ["walk/left"] = {0, 1},
        ["walk/right"] = {0, 1},
        ["walk/up"] = {0, 1},
        ["walk/down"] = {0, 1},

        ["walk_mad/left"] = {0, 1},
        ["walk_mad/right"] = {0, 1},
        ["walk_mad/up"] = {0, 1},
        ["walk_mad/down"] = {0, 1},

        ["walk_tired/left"] = {0, 1},
        ["walk_tired/right"] = {0, 1},
        ["walk_tired/up"] = {0, 1},
        ["walk_tired/down"] = {0, 1},

        ["walk_casual/left"] = {0, 1},
        ["walk_casual/right"] = {0, 1},
        ["walk_casual/up"] = {0, 1},
        ["walk_casual/down"] = {0, 1},

        -- Cutscene
        ["tired"] = {-4, 3},
        ["mad"] = {-6, 3},
        ["mad_b"] = {-6, 3},
        ["hand_hip"] = {2, 3},
        ["hand_hip_look"] = {2, 3},
        ["hand_hip_mad"] = {2, 3},
        ["side"] = {1, 2},
        ["side_look"] = {1, 2},

        ["chair"] = {-10, -2},
        ["chair_look"] = {-10, -2},
        ["desk"] = {0, 5},
        ["desk_look"] = {0, 5},
        ["desk_look_tired"] = {0, 5},

        ["surprised_down"] = {0, 0},

        -- Fountain make
        ["fountain/scissor_hold"] = {0, 0},
        ["fountain/jump"] = {-40, 0},
        ["fountain/stab"] = {-40, 0},
        ["fountain/stab_loop"] = {-40, 0},
        ["fountain/stab_b"] = {-40, 0},
        ["fountain/stab_b_loop"] = {-40, 0},
        ["fountain/stab_c"] = {-40, 0},
        ["fountain/stab_c_loop"] = {-40, 0},
        ["fountain/invert_loop"] = {-40, 0},
        ["fountain/stab_end_darkened"] = {-40, 0},
        ["fountain/stab_end"] = {-40, 0},
    }
end

return actor