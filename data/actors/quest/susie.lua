local actor, super = Class(Actor, "quest/susie")

function actor:init()
    super.init(self)

    self.name = "Susie"
    self.name_caption = "caption_susie"

    self.width = 17
    self.height = 20

    self.hitbox = {0, 10, 17, 12}

    self.color = {1, 0, 1}

    self.path = "party/susie/quest"
    self.default = "walk"

    self.voice = "quest/susie"
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