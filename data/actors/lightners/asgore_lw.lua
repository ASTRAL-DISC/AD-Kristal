local actor, super = Class(Actor, "asgore_lw")

function actor:init()
    super.init(self)

    self.name = "Asgore"

    self.width = 43
    self.height = 61

    self.hitbox = {6, 29, 19, 14}

    self.color = {1, 0.5, 0}

    self.path = "npcs/lightners/asgore/light"
    self.default = "walk"

    self.voice = "asgore"
    self.portrait_path = "face/asgore"
    self.portrait_offset = nil

    self.can_blush = false

    self.animations = {
        -- Cutscene animations
        ["talk/down"]         = {"talk/down", 0.25, true},
        ["talk/left"]         = {"talk/left", 0.25, true},
        ["talk/right"]        = {"talk/right", 0.25, true},

        ["chair_blink"]       = {"chair_blink", 0.25, true},

        ["hug"]               = {"hug", 0.2, true},
        ["hug_end"]           = {"hug_end", 0.2, true},

        ["laugh"]             = {"laugh", 0.2, true},
    }
    
    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }

    self.offsets = {
        -- Movement offsets
        ["walk/down"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/up"] = {0, 0},

        -- Cutscene offsets
    }
end

return actor