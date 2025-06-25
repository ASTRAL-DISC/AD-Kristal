local actor, super = Class(Actor, "susie_lw")

function actor:init()
    super.init(self)

    self.name = "Susie"

    self.width = 25
    self.height = 43

    self.hitbox = {3, 30, 19, 14}

    self.soul_offset = {12.5, 24}

    self.color = {1, 0, 1}

    self.path = "party/susie/light"

    if Game:getConfig("susieStyle") == 1 then
        self.default = "walk_bangs"
    else
        self.default = "walk"
    end

    self.voice = "susie"
    if Game:getConfig("susieStyle") == 1 then
        self.portrait_path = "face/susie_bangs"
    elseif Game:getConfig("susieStyle") == 2 then
        self.portrait_path = "face/susie"
    else
        self.portrait_path = "face/susie_eyes"
    end
    self.portrait_offset = {-5, 0}

    self.can_blush = false

    self.animations = {
        -- Cutscene animations
        ["look_up_left_walk"] = {"look_up_left_walk", 0.25, true},

        ["kick"] = {"kick", 0.1, false},
        ["slam"] = {"slam", 0.1, false},

        ["sit"] = {"sit", 0.25, true},

        ["eat_chalk"] = {"eat_chalk", 0.15, false},

        ["diagonal_kick_left"] = {"diagonal_kick_left", 2/30, false},
        ["gaming"] = {"gaming", 4/30, true},
        ["shake_kris"] = {"shake_kris", 2/30, true},
        ["kris_tug"] = {"kris_tug", 2/30, true},

        ["point_up"] = {"point_up", 4/30, true},
    }

    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",

        ["walk_bangs/down"] = "walk_bangs/up",
        ["walk_bangs/up"] = "walk_bangs/down",
        ["walk_bangs/left"] = "walk_bangs/left",
        ["walk_bangs/right"] = "walk_bangs/right",
    }
    
    self.offsets = {
        -- Movement offsets
        ["walk/down"] = {0, -2},
        ["walk/left"] = {0, -2},
        ["walk/right"] = {0, -2},
        ["walk/up"] = {0, -2},

        ["walk_bangs/down"] = {0, -2},
        ["walk_bangs/left"] = {0, -2},
        ["walk_bangs/right"] = {0, -2},
        ["walk_bangs/up"] = {0, -2},

        ["walk_unhappy/down"] = {0, -2},
        ["walk_unhappy/left"] = {0, -2},
        ["walk_unhappy/right"] = {0, -2},
        ["walk_unhappy/up"] = {0, -2},

        ["walk_bangs_unhappy/down"] = {0, -2},
        ["walk_bangs_unhappy/left"] = {0, -2},
        ["walk_bangs_unhappy/right"] = {0, -2},
        ["walk_bangs_unhappy/up"] = {0, -2},

        -- Cutscene offsets
        ["chill"] = {2, -2},

        ["disappointed_chalk_box"] = {0, -2},
        ["hold_chalk_box"] = {0, -2},
        ["blink"] = {0, -2},

        ["look_up"] = {0, -2},

        ["eat_chalk"] = {0, -2},

        ["fall"] = {-2, -2},

        ["shock_down"] = {0, -2},
        ["shock_down_flip"] = {0, -2},

        ["laugh_left"] = {-8, -2},
        ["laugh_right"] = {-4, -2},

        ["playful_punch"] = {-8, 0},
        ["playful_punch_shock"] = {-8, 0},

        ["look_up_left_walk"] = {0, -2},

        ["kick"] = {-5, 0},
        ["slam"] = {-6, -5},

        ["angry_down"] = {-10, 2},
        ["turn_around"] = {-12, 2},

        ["away_scratch"] = {-2, -2},

        ["point_up"] = {-2, -12},
        ["point_up_turn"] = {-4, -12},

        ["diagonal_kick_left"] = {-3, -1},
        ["gaming"] = {0, -2},
        ["shake_kris"] = {-5, -2},
        ["kris_tug"] = {-5, -2},

        ["shock_behind"] = {-15, -3},
        ["shock_behind_left"] = {-5, -3},
    }
end

function actor:getPortraitPath()
    if Game:getPartyMember("susie"):getFlag("eyes") or Game:getConfig("susieStyle") == 3 then
        return "face/susie_eyes"
    else
        return "face/susie"
    end
end

return actor