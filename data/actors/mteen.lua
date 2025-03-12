local actor, super = Class(Actor, "mteen")

function actor:init()
    super.init(self)

    self.name = "M.Teen"

    self.width = 25
    self.height = 40

    self.hitbox = {2, 33, 19, 14}
    self.color = {0.9, 0.7, 1}

    self.path = "party/mteen/dark"
    self.default = "walk"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

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
    }

    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",

        ["walk_serious/down"] = "walk_serious/up",
        ["walk_serious/up"] = "walk_serious/down",
        ["walk_serious/left"] = "walk_serious/left",
        ["walk_serious/right"] = "walk_serious/right",
    }
    
    self.offsets = {
        -- Movement offsets
        ["walk/down"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/up"] = {0, 0},

        ["walk_serious/down"] = {0, 0},
        ["walk_serious/right"] = {0, 0},
        ["walk_serious/left"] = {0, 0},
        ["walk_serious/up"] = {0, 0},

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

        -- Cutscene offsets
        ["eye_widen"] = {-1, -1},
        ["eye_widen_look"] = {-1, -1},
        ["smile_look"] = {-1, -1},

        ["happy"] = {-1, -1},
        ["laugh"] = {-1, -1},

        ["shocked"] = {-4, 1},

        ["look_down"] = {-1, 0},
        ["look_down_smile"] = {-1, 0},
        ["look_left"] = {-1, 0},

        ["fell"] = {-5, 15},
        ["fell_look"] = {-5, 15},
    }
end

return actor