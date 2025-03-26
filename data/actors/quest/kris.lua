local actor, super = Class(Actor, "quest/kris")

function actor:init()
    super.init(self)

    self.name = "Kris"

    self.width = 13
    self.height = 17

    self.hitbox = {0, 10, 13, 8}

    self.color = {0, 1, 1}

    self.path = "party/kris/quest"
    self.default = "walk"

    self.voice = nil
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