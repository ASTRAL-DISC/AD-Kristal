local actor, super = Class(Actor, "quest/berdly")

function actor:init()
    super.init(self)

    self.name = "Berdly"
    self.name_caption = "caption_berdly"

    self.width = 15
    self.height = 19

    self.hitbox = {0, 10, 15, 10}

    self.color =  Utils.hexToRgb("#31b081")

    self.path = "party/berdly/quest"
    self.default = "walk"

    self.voice = "quest/berdly"
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.animations = {}

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
    }
end

return actor