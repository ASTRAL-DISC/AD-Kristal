local actor, super = Class(Actor, "berdly_lw")

function actor:init()
    super.init(self)

    self.name = "Berdly"

    self.width = 20
    self.height = 40

    self.hitbox = {0, 27, 20, 14}

    self.color = Utils.hexToRgb("#31b081")

    self.path = "party/berdly/light"
    self.default = "walk"

    self.voice = "berdly"
    self.portrait_path = "face/berdly"
    self.portrait_offset = {-12, -10}

    self.can_blush = false

    self.animations = {
        ["laugh"] = {"laugh", 4/30, true},
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

        -- Cutscene offsets
        ["laugh"] = {0, 0},

        ["book_point"] = {-18, 1},

        ["sit_book"] = {-8, -8},
        ["sit_book_squint"] = {-8, -8},
    }
end

return actor