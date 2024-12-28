local actor, super = Class(Actor, "toriel")

function actor:init()
    super.init(self)

    self.name = "Toriel"

    self.width = 31
    self.height = 54

    self.hitbox = {6, 29, 19, 14}

    self.color = {0.5, 0, 1}

    self.path = "npcs/lightners/toriel/dark"
    self.default = "walk"

    self.voice = "toriel"
    self.portrait_path = "face/toriel_dw"
    self.portrait_offset = {-5, 0}

    self.can_blush = false

    self.animations = {
        -- Cutscene animations
        ["talk/down"]         = {"talk/down", 0.25, true},
        ["talk/left"]         = {"talk/left", 0.25, true},
        ["talk/right"]        = {"talk/right", 0.25, true},

        ["hug"]               = {"hug", 0.25, true},
        ["hug_end"]           = {"hug_end", 0.25, true},

        ["laugh"]             = {"laugh", 0.2, true},
    }


    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",

        ["walk_unhappy/down"] = "walk_unhappy/up",
        ["walk_unhappy/up"] = "walk_unhappy/down",
        ["walk_unhappy/left"] = "walk_unhappy/left",
        ["walk_unhappy/right"] = "walk_unhappy/right",

        ["walk_mad/down"] = "walk_mad/up",
        ["walk_mad/up"] = "walk_mad/down",
        ["walk_mad/left"] = "walk_mad/left",
        ["walk_mad/right"] = "walk_mad/right",
    }
    
    self.offsets = {
        -- Movement offsets
        ["walk/down"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/up"] = {0, 0},

        ["walk_unhappy/down"] = {0, 0},
        ["walk_unhappy/right"] = {0, 0},
        ["walk_unhappy/left"] = {0, 0},
        ["walk_unhappy/up"] = {0, 0},

        ["walk_mad/down"] = {0, 0},
        ["walk_mad/right"] = {0, 0},
        ["walk_mad/left"] = {0, 0},
        ["walk_mad/up"] = {0, 0},

        -- Cutscene offsets
        ["talk/down"] = {0, 0},
        ["talk/left"] = {0, 0},
        ["talk/right"] = {0, 0},

        ["surprise"] = {0, 0},

        ["laugh"] = {0, 0},
        ["facepalm"] = {0, 0},

        ["hug"] = {-3, 0},
        ["hug_end"] = {-3, 0},
    }
end

return actor