local actor, super = Class(Actor, "noelle_lw")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Noelle"

    -- Width and height for this actor, used to determine its center
    self.width = 23
    self.height = 46

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {2, 33, 19, 14}

    -- A table that defines where the Soul should be placed on this actor if they are a player.
    -- First value is x, second value is y.
    self.soul_offset = {11.5, 28}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {1, 1, 0}

    -- Path to this actor's sprites (defaults to "")
    self.path = "party/noelle/light"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "walk"

    -- Sound to play when this actor speaks (optional)
    self.voice = "noelle"
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = "face/noelle"
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = {-12, -10}

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of sprite animations
    self.animations = {
        ["sit_bench_turn"] = {"sit_bench_turn", 2/30, false},
        ["clap"] = {"clap", 1/15, true},
        ["sweater"] = {"sweater", 2/30, true},

        ["game"] = {"game", 2/15, true},
        ["game_done"] = {"game_done", 2/30, false},

        ["laugh"] = {"laugh", 1/15, true},
    }

    -- Tables of sprites to change into in mirrors
    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {
        --Movement
        ["walk_serious/left"] = {0, 0},
        ["walk_serious/right"] = {0, 0},
        ["walk_serious/up"] = {0, 0},
        ["walk_serious/down"] = {0, 0},

        ["walk_blush/left"] = {0, 0},
        ["walk_blush/right"] = {0, 0},
        ["walk_blush/up"] = {0, 0},
        ["walk_blush/down"] = {0, 0},

        ["walk_sad/left"] = {0, 0},
        ["walk_sad/right"] = {0, 0},
        ["walk_sad/up"] = {0, 0},
        ["walk_sad/down"] = {0, 0},

        --Cutscenes
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

        --Animations
        ["clap"] = {2, -1},
        ["sweater"] = {2, -1},
        ["laugh"] = {0, 0},

        ["sit_bench_turn"] = {1, 3},
    }
end

function actor:getDefault()
    if Game:getFlag("noelle_switch") then
        return "walk_serious"
    else
        return "walk"
    end
end

return actor