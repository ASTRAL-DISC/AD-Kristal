local actor, super = Class(Actor, "berdly")

function actor:init()
    super.init(self)

    self.name = "Berdly"

    self.width = 24
    self.height = 40

    self.hitbox = {0, 27, 20, 14}

    self.color = Utils.hexToRgb("#31b081")

    self.path = "party/berdly/dark"
    self.default = "walk"

    self.voice = "berdly"
    self.portrait_path = "face/berdly_dw"
    self.portrait_offset = {-12, 2}

    self.can_blush = false

    self.animations = {
        -- Battle animations
        ["battle/idle"]         = {"battle/idle", 0.2, true},

        ["battle/attack"]       = {"battle/attack", 1/15, false},
        ["battle/act"]          = {"battle/act", 1/15, false},
        ["battle/spell"]        = {"battle/spell", 1/15, false, next="battle/idle"},
        ["battle/item"]         = {"battle/item", 1/12, false, next="battle/idle"},
        ["battle/spare"]        = {"battle/spell", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle/attackready", 0.2, true},
        ["battle/act_ready"]    = {"battle/actready", 0.2, true},
        ["battle/spell_ready"]  = {"battle/spellready", 0.2, true},
        ["battle/item_ready"]   = {"battle/itemready", 0.2, true},
        ["battle/defend_ready"] = {"battle/defend", 1/15, false},

        ["battle/act_end"]      = {"battle/actend", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         = {"battle/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"battle/defeat", 1/15, false},

        ["battle/transition"]   = {"battle/intro", 1/15, false},
        ["battle/victory"]      = {"battle/victory", 1/10, false},

        -- Cutscene animations
        ["laugh"] = {"laugh", 4/30, true},
        ["jump"] = {"jump", 4/30, true},
        ["jump_ball"] = {"jump_ball", 1/15, true},
        ["rose_mouth"] = {"rose_mouth", 2/30, true},
    }
    
    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
        
        ["walk_blush/down"] = "walk_blush/up",
        ["walk_blush/up"] = "walk_blush/down",
        ["walk_blush/left"] = "walk_blush/left",
        ["walk_blush/right"] = "walk_blush/right",

        ["walk_unhappy/down"] = "walk_unhappy/up",
        ["walk_unhappy/up"] = "walk_unhappy/down",
        ["walk_unhappy/left"] = "walk_unhappy/left",
        ["walk_unhappy/right"] = "walk_unhappy/right",
    }

    self.offsets = {
        -- Movement offsets
        ["walk/down"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/up"] = {0, 0},

        ["walk_blush/down"] = {0, 0},
        ["walk_blush/right"] = {0, 0},
        ["walk_blush/left"] = {0, 0},
        ["walk_blush/up"] = {0, 0},

        ["walk_unhappy/down"] = {0, 0},
        ["walk_unhappy/right"] = {0, 0},
        ["walk_unhappy/left"] = {0, 0},
        ["walk_unhappy/up"] = {0, 0},

        -- Battle offsets
        ["battle/idle"] = {-3, 0},

        ["battle/attack"] = {-8, 0},
        ["battle/attackready"] = {0, 0},
        ["battle/act"] = {0, 0},
        ["battle/actend"] = {0, 0},
        ["battle/actready"] = {0, 0},
        ["battle/spell"] = {-3, 0},
        ["battle/spellready"] = {0, 0},
        ["battle/item"] = {-2, 0},
        ["battle/itemready"] = {-2, 0},
        ["battle/defend"] = {-9, 0},

        ["battle/defeat"] = {0, 0},
        ["battle/hurt"] = {-9, 0},

        ["battle/intro"] = {-11, -7},
        ["battle/victory"] = {0, 0},

        -- Cutscene offsets
        ["laugh"] = {-2, 0},
        ["jump"] = {-6, 0},
        ["rose_mouth"] = {-7, 2},
        ["jump_ball"] = {0, 4},
        ["landed"] = {-4, 0},

        ["pose"] = {-9, 0},

        ["hurt_kneel"] = {-3, 9},

        ["fall"] = {-10, 0},
        ["kneel_scream"] = {-1, 8},

        ["point_right"] = {-4, 0},
        ["crossed_arms"] = {-2, 0},
        ["shocked_left"] = {0, 0},
    }

    self.spotlight = {
        offset_x = 0,
        offset_y = -5,
        width = 90,
        beam_height = 320,
        top_color = {1, 1, 1, 0.0},
        bottom_color = {49/255, 176/255, 129/255, 0.25},
        base_color = {49/175, 176/175, 129/175, 1}
    }
end

function actor:getDefault()
    if Game:getPartyMember("berdly"):getFlag("scar") then
        return "walk_scar"
    else
        return "walk"
    end
end

function actor:getPortraitPath()
    if Game:getPartyMember("berdly"):getFlag("scar") then
        return "face/berdly_dw_scar"
    else
        return "face/berdly_dw"
    end
end

return actor