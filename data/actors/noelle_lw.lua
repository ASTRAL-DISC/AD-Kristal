local actor, super = Class(Actor, "noelle_lw")

function actor:init()
    super.init(self)

    self.name = "Noelle"

    self.width = 23
    self.height = 46

    self.hitbox = {2, 33, 19, 14}

    self.soul_offset = {11.5, 28}

    self.color = {1, 1, 0}

    self.path = "party/noelle/light"
    self.default = "walk"

    self.voice = "noelle"
    self.portrait_path = "face/noelle"
    self.portrait_offset = {-12, -10}

    self.can_blush = false

    self.animations = {
        ["sit_bench_turn"] = {"sit_bench_turn", 2/30, false},
        ["clap"] = {"clap", 1/15, true},
        ["sweater"] = {"sweater", 2/30, true},

        ["game"] = {"game", 2/15, true},
        ["game_done"] = {"game_done", 2/30, false},

        ["laugh"] = {"laugh", 1/15, true},
    }

    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }

    self.offsets = {
        -- Movement
        ["walk_serious/left"] = {0, 0},
        ["walk_serious/right"] = {0, 0},
        ["walk_serious/up"] = {0, 0},
        ["walk_serious/down"] = {0, 0},

        ["walk_blush/left"] = {0, 0},
        ["walk_blush/right"] = {0, 0},
        ["walk_blush/up"] = {0, 0},
        ["walk_blush/down"] = {0, 0},

        ["walk_blush_down/left"] = {0, 0},
        ["walk_blush_down/right"] = {0, 0},
        ["walk_blush_down/up"] = {0, 0},
        ["walk_blush_down/down"] = {0, 0},

        ["walk_sad/left"] = {0, 0},
        ["walk_sad/right"] = {0, 0},
        ["walk_sad/up"] = {0, 0},
        ["walk_sad/down"] = {0, 0},

        -- Cutscenes
        ["shocked"] = {0, 0},
        ["shocked_behind"] = {0, 0},

        ["blush"] = {1, 0},
        ["blush_side"] = {1, 0},
        ["blush_look"] = {-3, 1},
        ["hand_mouth"] = {1, 0},
        ["hand_mouth_side"] = {1, 0},

        ["look_away"] = {0, 0},
        ["look_down"] = {0, 0},
        ["head_turn"] = {1, -1},
        ["sad"] = {-1, 1},
        ["surprise"] = {-1, 1},
        ["scared"] = {0, 2},

        ["doll_hold"] = {1, 0},
        ["doll_hold_look"] = {1, 0},
        ["doll_hold_look_smile"] = {1, 0},
        ["doll_hold_pray"] = {1, 0},
        ["doll_hold_sad"] = {1, 0},

        ["sit"] = {0, 3},
        ["sit_eyes_closed"] = {0, 4},
        ["sit_look_away"] = {0, 4},
        ["sit_look_down"] = {0, 4},
        ["sit_sad"] = {0, 3},
        ["sit_sad_b"] = {0, 3},

        ["sit_bench_down"] = {1, 8},
        ["sit_bench_look"] = {4, 3},
        ["sit_bench_look_down"] = {3, 3},
        ["sit_bench_side"] = {2, 4},
        ["sit_bench_side_b"] = {1, 3},

        -- Animations
        ["clap"] = {2, -1},
        ["laugh"] = {0, 0},

        ["sit_bench_turn"] = {1, 3},
    }
end

function actor:getDefault()
    if Game:getPartyMember("noelle"):getFlag("switch") then
        return "walk_serious"
    else
        return "walk"
    end
end

return actor