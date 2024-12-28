local actor, super = Class(Actor, "mike")

function actor:init()
    super.init(self)

    self.name = "M.I.K.E."

    self.width = 57
    self.height = 67

    self.hitbox = {-1, 51, 19, 14}

    self.color = {0, 1, 0}

    self.path = "npcs/ch3/mike"
    self.default = "walk"

    self.voice = "mike"
    self.portrait_path = "face/mike"
    self.portrait_offset = {0, 0}
	
	self.indent_string = ">> "

    self.animations = {
        -- Cutscene animations
        ["laugh"]               = {"laugh", 4/30, true},

        ["angry"]               = {"angry", 4/30, true},

        ["blank"]          		= {"blank", 2/30, false},
        ["blank_sad"]         	= {"blank_sad", 2/30, false},
		["shocked"]         	= {"shock", 2/30, false},
		["showoff"]         	= {"showoff", 2/30, false},
		["showoff_b"]         	= {"showoff_b", 2/30, false},
		["smug"]         		= {"smug", 2/30, false},
		["worried"]         	= {"worried", 2/30, false},
    }

    self.offsets = {
        ["walk/down"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},

        -- Cutscene offsets
        ["laugh"] = {0, 0},

        ["shocked"] = {-11, -2},
    }
end

return actor