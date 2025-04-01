local actor, super = Class(Actor, "lancer")

function actor:init()
    super.init(self)

    self.name = "Lancer"

    self.width = 30
    self.height = 34

    self.hitbox = {7, 20, 22, 15}

    self.flip = nil

    self.path = "npcs/darkners/lancer"
    self.default = "walk"

    self.voice = "lancer"
    self.portrait_path = "face/lancer"
    self.portrait_offset = {-18, -5}

    self.talk_sprites = {}

    self.animations = {
        ["wave"] = {"wave", 0.05, false},
        ["wave_only"] = {"wave_only", 0.05, false},
        ["wave_loop"] = {"wave_loop", 0.1, true},
        ["up_flip"] = {"up_flip", 0.1, true},
        ["sleep"] = {"sleep", 0.35, true},
        ["crawl"] = {"crawl", 0.2, true},
        ["laugh"] = {"laugh", 0.2, true},
        ["laugh_mustache"] = {"laugh_mustache", 0.2, true},
        ["fall"] = {"fall", 0.15, true},
    }
    
    self.offsets = {
        ["walk/down"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},

        ["walk_unhappy/down"] = {0, 0},
        ["walk_unhappy/left"] = {0, 0},
        ["walk_unhappy/right"] = {0, 0},
        ["walk_unhappy/up"] = {0, 0},

        ["walk_mustache/down"] = {0, 0},
        ["walk_mustache/left"] = {0, 0},
        ["walk_mustache/right"] = {0, 0},
        ["walk_mustache/up"] = {0, 0},

        ["walk_frown/down"] = {0, 0},
        ["walk_frown/left"] = {0, 0},
        ["walk_frown/right"] = {0, 0},
        ["walk_frown/up"] = {0, 0},

        ["walk_stone/down"] = {0, 0},
        ["walk_stone/left"] = {0, 0},
        ["walk_stone/right"] = {0, 0},
        ["walk_stone/up"] = {0, 0},
		
        ["wave"] = {-2, -3},
        ["wave_only"] = {-2, -3},
        ["wave_loop"] = {-2, -3},

        ["sleep"] = {-2, 6},

        ["stool"] = {-2, 6},
        ["stool_look"] = {-2, 6},

        ["crawl"] = {-2, 6},

        ["fall"] = {-2, 6},
        ["fell"] = {-3, 13},

        ["pose"] = {4, 0},

        ["relax"] = {-15, -6},
    }
end

return actor