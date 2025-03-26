local actor, super = Class(Actor, "quest/noelle")

function actor:init()
    super.init(self)

    self.name = "noelle"
    self.name_caption = "caption_noelle"

    self.width = 16
    self.height = 20

    self.hitbox = {0, 10, 16, 11}

    self.color = {1, 1, 0}

    self.path = "party/noelle/quest"
    self.default = "walk"

    self.voice = "quest/noelle"
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.animations = {
        -- Cutscene animations
        ["shake_head"] = {"shake_head", 0.2, true},
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
        ["shock"] = {1, 0},
        ["shock_b"] = {1, 0},
        ["shake_head"] = {2, 0},
        ["blush"] = {0, 0},
        ["sad"] = {0, 0},
    }
end

return actor