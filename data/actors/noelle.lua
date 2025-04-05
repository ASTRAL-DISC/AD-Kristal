local actor, super = Class(Actor, "noelle")

function actor:init()
    super.init(self)

    self.name = "Noelle"

    self.width = 23
    self.height = 46

    self.hitbox = {2, 33, 19, 14}

    self.soul_offset = {11.5, 28}

    self.color = {1, 1, 0}

    self.path = "party/noelle/dark"
    self.default = "walk"

    self.voice = "noelle"
    self.portrait_path = "face/noelle"
    self.portrait_offset = {-12, -10}

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
        ["laugh"]               = {"laugh", 4/30, true},

        ["slide"] = {"slide", 4/30, true},
        ["landed"] = {"landed", 4/30, false},
        ["fall"] = {"fall", 4/30, true},
        ["jump_ball"] = {"jump_ball", 1/15, true},

        -- Iceslide
        ["iceslide/up"] = {"iceslide/up", 0, false},
        ["iceslide/down"] = {"iceslide/down", 0, false},
        ["iceslide/left"] = {"iceslide/left", 0, false},
        ["iceslide/right"] = {"iceslide/right", 0, false},

        -- Choir Minigame
        ["choir/hold"] = {"choir/hold", 1/15, true},
        ["choir/hold_b"] = {"choir/hold_b", 1/15, true},
        ["choir/idle"] = {"choir/idle", 4/30, true},
        ["choir/single_note"] = {"choir/single_note", 4/30, true},
    }

    self.animations_alt = {
        -- Battle animations
        ["battle/idle"]         = {"battle_alt/idle", 0.2, true},

        ["battle/attack"]       = {"battle/spell", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle/idle", 0.2, true},
        ["battle/defend_ready"] = {"battle_alt/defend", 1/15, false},

        ["battle/hurt"]         = {"battle_alt/hurt", 1/15, false, temp=true, duration=0.5},

        ["battle/transition"]   = {"battle_alt/intro", 1/15, false},
        ["battle/victory"]      = {"battle_alt/pray", 5/30, true},
    }

    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",

        ["walk_happy/down"] = "walk_happy/up",
        ["walk_happy/up"] = "walk_happy/down",
        ["walk_happy/left"] = "walk_happy/left",
        ["walk_happy/right"] = "walk_happy/right",

        ["walk_happy_alt/down"] = "walk_happy_alt/up",
        ["walk_happy_alt/up"] = "walk_happy_alt/down",
        ["walk_happy_alt/left"] = "walk_happy_alt/left",
        ["walk_happy_alt/right"] = "walk_happy_alt/right",

        ["walk_blush/down"] = "walk_blush/up",
        ["walk_blush/up"] = "walk_blush/down",
        ["walk_blush/left"] = "walk_blush/left",
        ["walk_blush/right"] = "walk_blush/right",

        ["walk_look_up/down"] = "walk_look_up/up",
        ["walk_look_up/up"] = "walk_look_up/down",
        ["walk_look_up/left"] = "walk_look_up/left",
        ["walk_look_up/right"] = "walk_look_up/right",

        ["walk_sad/down"] = "walk_sad/up",
        ["walk_sad/up"] = "walk_sad/down",
        ["walk_sad/left"] = "walk_sad/left",
        ["walk_sad/right"] = "walk_sad/right",

        ["walk_smile/down"] = "walk_smile/up",
        ["walk_smile/up"] = "walk_smile/down",
        ["walk_smile/left"] = "walk_smile/left",
        ["walk_smile/right"] = "walk_smile/right",

        ["walk_mad/left"] = "walk_mad/left",
        ["walk_mad/right"] = "walk_mad/right",
    }

    self.offsets = {
        -- Movement offsets
        ["walk/down"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/up"] = {0, 0},

        ["walk_smile/down"] = {0, 0},
        ["walk_smile/right"] = {0, 0},
        ["walk_smile/left"] = {0, 0},
        ["walk_smile/up"] = {0, 0},

        ["walk_happy/down"] = {0, 0},
        ["walk_happy/right"] = {0, 0},
        ["walk_happy/left"] = {0, 0},
        ["walk_happy/up"] = {0, 0},

        ["walk_happy_alt/down"] = {0, 0},
        ["walk_happy_alt/right"] = {0, 0},
        ["walk_happy_alt/left"] = {0, 0},
        ["walk_happy_alt/up"] = {0, 0},

        ["walk_blush/down"] = {0, 0},
        ["walk_blush/right"] = {0, 0},
        ["walk_blush/left"] = {0, 0},
        ["walk_blush/up"] = {0, 0},

        ["walk_sad/down"] = {0, 0},
        ["walk_sad/right"] = {0, 0},
        ["walk_sad/left"] = {0, 0},
        ["walk_sad/up"] = {0, 0},

        ["walk_look_up/down"] = {0, 0},
        ["walk_look_up/right"] = {0, 0},
        ["walk_look_up/left"] = {0, 0},
        ["walk_look_up/up"] = {0, 0},

        ["walk_scared/left"] = {-4, 3},
        ["walk_scared/right"] = {2, 3},

        ["walk_mad/left"] = {-2, 2},
        ["walk_mad/right"] = {5, 2},

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
        ["battle/itemready"] = {0, 0},
        ["battle/defend"] = {-9, 0},

        ["battle/defeat"] = {0, 0},
        ["battle/hurt"] = {-9, 0},

        ["battle/intro"] = {-11, -7},
        ["battle/victory"] = {0, 0},

        ["battle_alt/idle"] = {-3, 0},
        ["battle_alt/defend"] = {-3, -6},
        ["battle_alt/hurt"] = {-3, 0},
        ["battle_alt/intro"] = {-11, -7},
        ["battle_alt/float"] = {-11, -7},
        ["battle_alt/pray"] = {-3, 0},
        ["battle_alt/spell_special"] = {-5, -1},

        -- Cutscene offsets
        ["blush"] = {0, 0},
        ["blush_side"] = {0, 0},

        ["hand_mouth"] = {0, 0},
        ["hand_mouth_side"] = {0, 0},

        ["laugh"] = {0, 0},

        ["point_up"] = {-4, 1},

        ["shocked"] = {0, 0},
        ["shocked_behind"] = {0, 0},

        ["headtilt"] = {0, -1},

        ["collapsed"] = {-14, 29},
        ["collapsed_look_up"] = {-18, 23},
        ["collapsed_reach"] = {-14, 29},

        ["hurt"] = {0, 0},
        ["kneel"] = {0, 0},
        ["kneel_shocked_left"] = {0, 0},
        ["kneel_shocked_right"] = {0, 0},
        ["kneel_smile_left"] = {0, 0},
        ["kneel_smile_right"] = {0, 0},

        ["smile_left"] = {0, 0},
        ["smile_right"] = {0, 0},

        ["head_lowered"] = {0, 0},
        ["head_lowered_look_left"] = {0, 0},
        ["head_lowered_look_right"] = {0, 0},

        ["slide"] = {-3, 0},
        ["pose"] = {-3, 0},
        ["landed"] = {-3, 0},
        ["fall"] = {-3, 0},
        ["jump_ball"] = {1, 8},
    
        ["blush_look"] = {-3, 0},
        ["wrist_blush"] = {-2, 1},
    
        ["clap"] = {2, -1},
    
        ["exasperated"] = {0, 0},
        ["wtf"] = {0, 0},
    
        ["scroll"] = {0, 0},
        ["scroll_focus"] = {0, 1},
        ["scroll_sing"] = {-2, 2},
    
        -- Choir Minigame
        ["choir/hold"] = {-6, 1},
        ["choir/hold_b"] = {-6, 1},
        ["choir/idle"] = {-6, 0},
        ["choir/single_note"] = {-6, 1},

        -- Iceslide
        ["iceslide/up"] = {-6, 0},
        ["iceslide/down"] = {-7, 0},
        ["iceslide/left"] = {0, -2},
        ["iceslide/right"] = {0, -2},

        -- Outfits
        ["outfits/halloween"] = {0, 0},
        ["outfits/halloween_look"] = {1, -1},
    }

    self.spotlight = {
        offset_x = -2,
        offset_y = -1,
        width = 80,
        beam_height = 280,
        top_color = {1, 1, 1, 0.0},
        bottom_color = {1, 1, 0, 0.25},
        base_color = {0.75, 0.75, 0, 1}
    }
end

function actor:getAnimation(anim)
    if Game:getPartyMember("noelle"):getFlag("weird", false) and self.animations_alt[anim] ~= nil then
        return self.animations_alt[anim] or nil
    else
        return super.getAnimation(self, anim)
    end
end

function actor:onSetAnimation(sprite, anim, keep_anim)
    if anim[1] == "battle_alt/pray" then
        local background = SnowglobeEffect(0, 0, false)
        local foreground = SnowglobeEffect(0, 0, true)
        sprite.parent:addChild(background)
        sprite.parent:addChild(foreground)
        background.layer = sprite.layer - 1
        foreground.layer = sprite.layer + 1
        background:setScale(0.5)
        foreground:setScale(0.5)
    end
end

function actor:getDefault()
    if Game:getPartyMember("noelle"):getFlag("switch") then
        return "walk_happy"
    else
        return "walk"
    end
end

return actor