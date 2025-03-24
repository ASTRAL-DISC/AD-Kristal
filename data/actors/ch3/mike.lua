local actor, super = Class(Actor, "mike")

function actor:init()
    super.init(self)

    self.name = "M.I.K.E."

    self.width = 58
    self.height = 67

    self.hitbox = {10, 50, 38, 17}

    self.color = {0, 1, 0}

    self.path = "npcs/ch3/mike"
    self.default = "walk"

    self.voice = "mike"
    self.portrait_path = "face/mike"
    self.portrait_offset = {0, 0}
	
	self.indent_string = ">> "

    self.animations = {
        -- Cutscene animations
        ["laugh"] = {"laugh", 4/30, true},

        ["noise"] = {"noise", 4/30, true},
        ["noise_sad"] = {"noise_sad", 4/30, true},
        
        -- Miku
        ["miku/flowers_walk"] = {"miku/flowers_walk", 4/30, true},
        ["miku/flowers_throw"] = {"miku/flowers_throw", 4/30, false},
    }

    self.offsets = {
        ["walk/down"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},

        ["boaless/walk/down"] = {0, 0},
        ["boaless/walk/left"] = {0, 0},
        ["boaless/walk/right"] = {0, 0},
        ["boaless/walk/up"] = {0, 0},

        -- Cutscene offsets
        ["laugh"] = {0, 0},

        ["arms_out"] = {1, 0},

        ["displeased"] = {0, 0},
        ["point_angry"] = {0, 0},

        ["noise"] = {0, 0},
        ["noise_sad"] = {0, 0},

        ["shocked"] = {-1, -1},
        ["perplexed"] = {0, 0},
        ["perplexed_b"] = {0, 0},

        ["shrug"] = {0, 0},
        ["smug"] = {0, 0},

        ["worried"] = {0, 0},

        -- Miku
        ["miku/arms_out"] = {-2, 2},
        ["miku/flowers_walk"] = {-2, 3},
        ["miku/flowers_throw"] = {-2, 3},
    }
end

return actor