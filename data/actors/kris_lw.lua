local actor, super = Class(Actor, "kris_lw")

function actor:init()
    super.init(self)

    self.name = "Kris"

    self.width = 19
    self.height = 37

    self.hitbox = {0, 25, 19, 14}

    self.soul_offset = {10, 24}

    self.color = {0, 1, 1}

    self.path = "party/kris/light"
    self.default = "walk"

    self.voice = "kris"
    self.portrait_path = "face/kris"
    self.portrait_offset = {-12, -10}

    self.can_blush = false

    self.animations = {
        -- Cutscene animations
        ["sit"] = {"sit", 0.25, true},
        ["sit_front_dandelion"] = {"sit_front_dandelion", 0.25, false},

        ["soul/up"] = {"soul/up", 0.15, false},
        ["soul/up_soulshine"] = {"soul/up_soulshine", 0.2, false},
    }

    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }

    self.offsets = {
        -- Movement
        ["walk_soulless/left"] = {-4, 0},
        ["walk_soulless/right"] = {-4, 0},
        ["walk_soulless/up"] = {-4, 0},
        ["walk_soulless/down"] = {-4, 0},

        ["wetslide/right"] = {-8, -2},
        ["wetslide/left"] = {-5, -2},

        -- Cutscene offsets
        ["fall"] = {-8, -2},
        ["fallen"] = {-8, 16},
        
        ["sit"] = {-4, -8},
        ["sit_front"] = {-8, -8},
        ["sit_front_down"] = {-8, -8},
        ["sit_front_dandelion"] = {-8, -8},

        ["ghostwalk_lf"] = {-4, 3},
        ["ghostwalk_lu"] = {-4, 3},
        ["ghostwalk_rf"] = {-4, 3},
        ["ghostwalk_ru"] = {-4, 3},
    }
end

return actor