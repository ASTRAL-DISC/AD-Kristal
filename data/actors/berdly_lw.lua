local actor, super = Class(Actor, "berdly_lw")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Berdly"

    -- Width and height for this actor, used to determine its center
    self.width = 20
    self.height = 40

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {0, 27, 20, 14}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = Utils.hexToRgb("#31b081")

    -- Path to this actor's sprites (defaults to "")
    self.path = "party/berdly/light"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "walk"

    -- Sound to play when this actor speaks (optional)
    self.voice = "berdly"
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = "face/berdly"
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = {-12, -10}

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of sprite animations
    self.animations = {
        ["laugh"]               = {"laugh", 4/30, true},
    }

    -- Tables of sprites to change into in mirrors
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

    -- Table of sprite offsets (indexed by sprite name)
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
    }
end

return actor