local actor, super = Class(Actor, "kris")

function actor:init()
    super.init(self)

    self.name = "Kris"

    self.width = 19
    self.height = 37

    self.hitbox = {0, 25, 19, 14}

    self.soul_offset = {10, 24}

    self.color = {0, 1, 1}

    self.path = "party/kris/dark"
    self.default = "walk"

    self.voice = "kris"
    self.portrait_path = "face/kris"
    self.portrait_offset = {-12, -10}

    self.can_blush = false
    
    self.animations = {
        -- Movement animations
        ["slide"]               = {"slide", 4/30, true},

        -- Battle animations
        ["battle/idle"]         = {"battle/idle", 0.2, true},

        ["battle/attack"]       = {"battle/attack", 1/15, false},
        ["battle/act"]          = {"battle/act", 1/15, false},
        ["battle/spell"]        = {"battle/act", 1/15, false},
        ["battle/item"]         = {"battle/item", 1/12, false, next="battle/idle"},
        ["battle/spare"]        = {"battle/act", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle/attackready", 0.2, true},
        ["battle/act_ready"]    = {"battle/actready", 0.2, true},
        ["battle/spell_ready"]  = {"battle/actready", 0.2, true},
        ["battle/item_ready"]   = {"battle/itemready", 0.2, true},
        ["battle/defend_ready"] = {"battle/defend", 1/15, false},

        ["battle/act_end"]      = {"battle/actend", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         = {"battle/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"battle/defeat", 1/15, false},

        ["battle/transition"]   = {"sword_jump_down", 0.2, true},
        ["battle/intro"]        = {"battle/attack", 1/15, false},
        ["battle/victory"]      = {"battle/victory", 1/10, false},

        -- Cutscene animations
        ["jump_fall"]           = {"fall", 1/5, true},
        ["jump_ball"]           = {"ball", 1/15, true},

        ["wakeup"] = {"wakeup", 0.15, false},
        ["sit_look_right"] = {"sit_look_right", 0.5, false},
        ["pirouette"] = {"pirouette", 0.08, true},

        --[[["iceslide/up"] = {"iceslide/up", 0, false},
        ["iceslide/down"] = {"iceslide/down", 0, false},
        ["iceslide/left"] = {"iceslide/left", 0, false},
        ["iceslide/right"] = {"iceslide/right", 0, false},]]

        ["battle_soulless/idle"] = {"battle_soulless/idle", 0.2, true},
        ["battle_soulless/idle_b"] = {"battle_soulless/idle_b", 0.2, true},
        ["battle_soulless/idle_c"] = {"battle_soulless/idle_c", 0.2, true},
        ["battle_soulless/idle_d"] = {"battle_soulless/idle_d", 0.2, true},
        ["battle_soulless/defeat"] = {"battle_soulless/defeat", 0.15, false},
    }

    if Game.chapter == 1 then
        self.animations["battle/transition"] = {"walk/right", 0, true}
    end

    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }

    self.offsets = {
        -- Movement offsets
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},
        ["walk/down"] = {0, 0},

        ["walk_blush/left"] = {0, 0},
        ["walk_blush/right"] = {0, 0},
        ["walk_blush/up"] = {0, 0},
        ["walk_blush/down"] = {0, 0},

        ["slide"] = {0, 0},

        -- Battle offsets
        ["battle/idle"] = {-5, -1},

        ["battle/attack"] = {-8, -6},
        ["battle/attackready"] = {-8, -6},
        ["battle/act"] = {-6, -6},
        ["battle/actend"] = {-6, -6},
        ["battle/actready"] = {-6, -6},
        ["battle/item"] = {-6, -6},
        ["battle/itemready"] = {-6, -6},
        ["battle/defend"] = {-5, -3},

        ["battle/defeat"] = {-8, -5},
        ["battle/hurt"] = {-5, -6},

        ["battle/intro"] = {-8, -9},
        ["battle/victory"] = {-3, 0},

        -- Cutscene offsets
        ["pose"] = {-4, -2},

        ["fall"] = {-5, -6},
        ["ball"] = {1, 8},
        ["landed"] = {-4, -2},

        ["fell"] = {-14, 1},

        ["sword_jump_down"] = {-19, -5},
        ["sword_jump_settle"] = {-27, 4},
        ["sword_jump_up"] = {-17, 2},

        ["hug_left"] = {-4, -1},
        ["hug_right"] = {-2, -1},

        ["peace"] = {0, 0},
        ["rude_gesture"] = {0, 0},

        ["reach"] = {-3, -1},

        ["sit"] = {-3, 0},

        ["t_pose"] = {-4, 0},

        ["wakeup"] = {-3, 0},
        ["sit_look_right"] = {-3, 0},

        ["pirouette"] = {-3, -1},

        -- Outfits
        ["outfits/care"] = {0, 0},
        ["outfits/care_b"] = {0, -3},
        ["outfits/cowboy"] = {-4, -4},
        ["outfits/melon"] = {-2, -10},
        ["outfits/swap"] = {0, 0},
        ["outfits/halloween"] = {-26, 0},

        --Battle (soulless)
        ["battle_soulless/idle"] = {-5, -1},
        ["battle_soulless/idle_b"] = {-12, -1},
        ["battle_soulless/idle_c"] = {-15, -1},
        ["battle_soulless/defeat"] = {-5, 0},
        ["battle_soulless/defeat_look_right"] = {-5, 0},
        ["battle_soulless/defeat_sit"] = {-5, 0},
    }

    self.spotlight = {
        offset_x = -4,
        offset_y = -2,
        width = 80,
        beam_height = 200,
        top_color = {1, 1, 1, 0.0},
        bottom_color = {0, 1, 1, 0.25},
        base_color = {0, 0.75, 0.75, 1}
    }
end

return actor