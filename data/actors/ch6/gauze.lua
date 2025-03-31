local actor, super = Class(Actor, "gauze")

function actor:init()
    super.init(self)

    self.name = "Gauze"

    self.width = 19
    self.height = 39

    self.hitbox = {0, 25, 19, 14}

    self.soul_offset = {10, 24}

    self.color = {0.5, 0, 0.5}

    self.path = "npcs/ch6/gauze"
    self.default = "walk"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.animations = {
        -- Cutscene animations
        ["startled"] = {"startled", 0.25, false},
        ["emerge_start"] = {"emerge_start", 0.3, true},
        ["emerge"] = {"emerge", 0.3, false},
        ["emerge_pause"] = {"emerge_pause", 0.3, true},
        ["emerge_mid"] = {"emerge_mid", 0.27, false},
        ["emerge_mid_pause"] = {"emerge_mid_pause", 0.27, true},
        ["emerge_end"] = {"emerge_end", 0.25, false},
    }

    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }

    self.offsets = {
        -- Movement offsets
        ["walk/left"] = {0, 1},
        ["walk/right"] = {0, 1},
        ["walk/up"] = {0, 1},
        ["walk/down"] = {0, 1},

        -- Cutscene offsets
        ["startled"] = {-3, 1},
        ["emerge_start"] = {-7, 1},
        ["emerge"] = {-7, 1},
        ["emerge_pause"] = {-7, 1},
        ["emerge_mid"] = {-7, 1},
        ["emerge_mid_pause"] = {-7, 1},
        ["emerge_end_pause"] = {-7, 1},
        ["emerge_end"] = {-7, 1},
    }
end

return actor