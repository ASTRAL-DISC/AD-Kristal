local actor, super = Class(Actor, "susie")

function actor:init(style)
    super.init(self)

    local susie_style = style or Game:getConfig("susieStyle")

    self.name = "Susie"

    self.width = 25
    self.height = 43

    self.hitbox = {3, 31, 19, 14}

    self.soul_offset = {12.5, 24}

    self.color = {1, 0, 1}

    self.path = "party/susie/dark"
    if susie_style == 1 then
        self.default = "walk_bangs"
    else
        self.default = "walk"
    end

    self.voice = "susie"
    if susie_style == 1 then
        self.portrait_path = "face/susie_bangs"
    elseif susie_style == 2 then
        self.portrait_path = "face/susie"
    else
        self.portrait_path = "face/susie_eyes"
    end
    self.portrait_offset = {-5, 0}

    self.can_blush = false

    self.animations = {
        -- Movement animations
        ["slide"]               = {"slide", 4/30, true},

        -- Battle animations
        ["battle/idle"]         = {"battle/idle", 0.2, true},

        ["battle/attack"]       = {"battle/attack", 1/15, false},
        ["battle/act"]          = {"battle/act", 1/15, false},
        ["battle/spell"]        = {"battle/spell", 1/15, false, next="battle/idle"},
        ["battle/item"]         = {"battle/item", 1/12, false, next="battle/idle"},
        ["battle/spare"]        = {"battle/act", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle/attackready", 0.2, true},
        ["battle/act_ready"]    = {"battle/actready", 0.2, true},
        ["battle/spell_ready"]  = {"battle/spellready", 0.2, true},
        ["battle/item_ready"]   = {"battle/itemready", 0.2, true},
        ["battle/defend_ready"] = {"battle/defend", 1/15, false},

        ["battle/act_end"]      = {"battle/actend", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         = {"battle/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"battle/defeat", 1/15, false},

        ["battle/transition"]   = {self.default.."/right_1", 1/15, false},
        ["battle/intro"]        = {"battle/attack", 1/15, true},
        ["battle/victory"]      = {"battle/victory", 1/10, false},

        ["battle/rude_buster"]  = {"battle/rudebuster", 1/15, false, next="battle/idle"},

        -- Cutscene animations
        ["jump_fall"]           = {"fall", 1/5, true},
        ["jump_ball"]           = {"ball", 1/15, true},

        ["diagonal_kick_right"] = {"diagonal_kick_right", 4/30, false},
        ["diagonal_kick_left"] = {"diagonal_kick_left", 4/30, false},

        ["sleep"] = {"sleep", 8/30, true},

        ["shock_down_flip"] = {"shock_down_flip", 1/10, true},
        ["red_carpet"] = {"red_carpet", 2/30, true},
        ["dance"] = {"dance", 4/30, true},

        ["flailing"] = {"flailing", 2/30, true},
        ["slam"] = {"slam", 2/30, false},

        ["kris_tug"] = {"kris_tug", 2/30, true},

        ["outfits/melon"] = {"outfits/melon", 4/30, true},

        ["iceslide/up"] = {"iceslide/up", 0, false},
        ["iceslide/down"] = {"iceslide/down", 0, false},
        ["iceslide/left"] = {"iceslide/left", 0, false},
        ["iceslide/right"] = {"iceslide/right", 0, false},
    }

    self.animations_eyes = {
        -- Battle animations
        ["battle/idle"]         = {"battle_eyes/idle", 0.2, true},

        ["battle/attack"]       = {"battle_eyes/attack", 1/15, false},
        ["battle/act"]          = {"battle_eyes/act", 1/15, false},
        ["battle/spell"]        = {"battle_eyes/spell", 1/15, false, next="battle/idle"},
        ["battle/item"]         = {"battle_eyes/item", 1/12, false, next="battle/idle"},
        ["battle/spare"]        = {"battle_eyes/act", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle_eyes/attackready", 0.2, true},
        ["battle/act_ready"]    = {"battle_eyes/actready", 0.2, true},
        ["battle/spell_ready"]  = {"battle_eyes/spellready", 0.2, true},
        ["battle/item_ready"]   = {"battle_eyes/itemready", 0.2, true},
        ["battle/defend_ready"] = {"battle_eyes/defend", 1/15, false},

        ["battle/act_end"]      = {"battle_eyes/actend", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         = {"battle_eyes/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"battle_eyes/defeat", 1/15, false},

        ["battle/transition"]   = {self.default.."/right_1", 1/15, false},
        ["battle/intro"]        = {"battle_eyes/attack", 1/15, true},
        ["battle/victory"]      = {"battle_eyes/victory", 1/10, false},

        ["battle/rude_buster"]  = {"battle_eyes/rudebuster", 1/15, false, next="battle/idle"},
    }

    if susie_style == 1 then
        self.animations["battle/transition"] = {"bangs_wall_right", 0, true}
    end

    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",

        ["walk_unhappy/down"] = "walk_unhappy/up",
        ["walk_unhappy/up"] = "walk_unhappy/down",
        ["walk_unhappy/left"] = "walk_unhappy/left",
        ["walk_unhappy/right"] = "walk_unhappy/right",

        ["walk_bangs/down"] = "walk_bangs/up",
        ["walk_bangs/up"] = "walk_bangs/down",
        ["walk_bangs/left"] = "walk_bangs/left",
        ["walk_bangs/right"] = "walk_bangs/right",

        ["walk_bangs_unhappy/down"] = "walk_bangs_unhappy/up",
        ["walk_bangs_unhappy/up"] = "walk_bangs_unhappy/down",
        ["walk_bangs_unhappy/left"] = "walk_bangs_unhappy/left",
        ["walk_bangs_unhappy/right"] = "walk_bangs_unhappy/right",
    }
    
    self.offsets = {
        -- Movement offsets
        ["walk/down"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},

        ["walk_bangs/down"] = {0, -2},
        ["walk_bangs/left"] = {0, -2},
        ["walk_bangs/right"] = {0, -2},
        ["walk_bangs/up"] = {0, -2},

        ["walk_bangs_unhappy/down"] = {0, -2},
        ["walk_bangs_unhappy/left"] = {0, -2},
        ["walk_bangs_unhappy/right"] = {0, -2},
        ["walk_bangs_unhappy/up"] = {0, -2},

        ["walk_unhappy/down"] = {0, 0},
        ["walk_unhappy/left"] = {0, 0},
        ["walk_unhappy/right"] = {0, 0},
        ["walk_unhappy/up"] = {0, -2},

        ["walk_back_arm/left"] = {-3, -2},
        ["walk_back_arm/right"] = {0, -2},

        ["slide"] = {-5, -12},

        -- Battle offsets
        ["battle/idle"] = {-22, -1},

        ["battle/attack"] = {-26, -25},
        ["battle/attackready"] = {-26, -25},
        ["battle/act"] = {-24, -25},
        ["battle/actend"] = {-24, -25},
        ["battle/actready"] = {-24, -25},
        ["battle/spell"] = {-22, -30},
        ["battle/spellready"] = {-22, -15},
        ["battle/item"] = {-22, -1},
        ["battle/itemready"] = {-22, -1},
        ["battle/defend"] = {-20, -23},

        ["battle/defeat"] = {-22, -1},
        ["battle/hurt"] = {-22, -1},

        ["battle/victory"] = {-28, -7},

        ["battle/rudebuster"] = {-44, -33},

        -- Cutscene offsets
        ["pose"] = {-1, -1},

        ["fall"] = {0, -4},
        ["ball"] = {1, 7},
        ["landed"] = {-5, -2},

        ["shock_left"] = {0, -4},
        ["shock_right"] = {-16, -4},
        ["shock_down"] = {0, -2},
        ["shock_up"] = {-6, 0},

        ["shock_behind"] = {-15, -3},
        ["shock_down_flip"] = {0, -2},

        ["laugh_left"] = {-8, -2},
        ["laugh_right"] = {-4, -2},

        ["point_laugh_left"] = {-14, 2},
        ["point_laugh_right"] = {0, 2},

        ["point_left"] = {-11, 2},
        ["point_right"] = {0, 2},
        ["point_up"] = {-2, -12},

        ["point_up_turn"] = {-4, -12},

        ["playful_punch"] = {-8, 0},

        ["wall_left"] = {0, -2},
        ["wall_right"] = {0, -2},

        ["bangs_wall_left"] = {0, -2},
        ["bangs_wall_right"] = {0, -2},

        ["exasperated_left"] = {-1, 0},
        ["exasperated_right"] = {-5, 0},

        ["angry_down"] = {-10, 2},
        ["turn_around"] = {-12, 2},

        ["away"] = {-1, -2},
        ["away_turn"] = {-1, -2},
        ["away_hips"] = {-2, -1},
        ["away_hand"] = {-2, -2},
        ["away_scratch"] = {-2, -2},

        ["t_pose"] = {-6, 0},

        ["fell"] = {-18, -2},

        ["kneel_right"] = {-4, -2},
        ["kneel_left"] = {-12, -2},

        ["diagonal_kick_right"] = {-5, -1},
        ["diagonal_kick_left"] = {-3, -1},

        ["sleep"] = {-18, 20},
        ["blink"] = {-18, 20},
        ["red_carpet"] = {0, -2},
        ["dance"] = {0, 0},
        ["flailing"] = {0, -2},
        ["slam"] = {-5, -7},
        ["kris_tug"] = {0, -2},

        -- Iceslide
        ["iceslide/up"] = {-5, -7},
        ["iceslide/down"] = {0, 0},
        ["iceslide/left"] = {-2, 1},
        ["iceslide/right"] = {-2, 1},

        -- Outfits
        ["outfits/care"] = {0, 0},
        ["outfits/cowboy"] = {-1, -6},
        ["outfits/redcarpet"] = {0, 0},
        ["outfits/melon"] = {-8, 3},
        ["outfits/swap"] = {0, -1},
        ["outfits/halloween"] = {-4, -6},

        -- Battle (eyes version)
        ["battle_eyes/idle"] = {-22, -1},
        ["battle_eyes/attack"] = {-26, -25},
        ["battle_eyes/attackready"] = {-26, -25},
        ["battle_eyes/act"] = {-24, -25},
        ["battle_eyes/actend"] = {-24, -25},
        ["battle_eyes/actready"] = {-24, -25},
        ["battle_eyes/spell"] = {-22, -30},
        ["battle_eyes/spellready"] = {-22, -15},
        ["battle_eyes/item"] = {-22, -1},
        ["battle_eyes/itemready"] = {-22, -1},
        ["battle_eyes/defend"] = {-20, -23},
        ["battle_eyes/defeat"] = {-22, -1},
        ["battle_eyes/hurt"] = {-22, -1},
        ["battle_eyes/victory"] = {-28, -7},
        ["battle_eyes/rudebuster"] = {-44, -33},
    }

    self.spotlight = {
        offset_x = 0,
        offset_y = 0,
        width = 80,
        beam_height = 280,
        top_color = {1, 1, 1, 0.0},
        bottom_color = {1, 0, 1, 0.25},
        base_color = {0.75, 0, 0.75, 1}
    }
end

function actor:getPortraitPath()
    if Game:getPartyMember("susie"):getFlag("eyes") or Game:getConfig("susieStyle") == 3 then
        return "face/susie_eyes"
    else
        return "face/susie"
    end
end

function actor:getAnimation(anim)
    if Game:getPartyMember("susie"):getFlag("eyes", false) or Game:getConfig("susieStyle") == 3 and self.animations_eyes[anim] ~= nil then
        return self.animations_eyes[anim] or nil
    else
        return super.getAnimation(self, anim)
    end
end

return actor