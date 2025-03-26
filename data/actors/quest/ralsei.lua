local actor, super = Class(Actor, "quest/ralsei")

function actor:init()
    super.init(self)

    self.name = "Ralsei"
    self.name_caption = "caption_ralsei"

    self.width = 13
    self.height = 19

    self.hitbox = {0, 10, 13, 7}

    self.color = {0, 1, 0}

    self.path = "party/ralsei/quest"
    self.default = "walk"

    self.voice = "quest/ralsei"
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