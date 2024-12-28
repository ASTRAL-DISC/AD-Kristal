local actor, super = Class(Actor, "kris_past")

function actor:init()
    super.init(self)

    self.name = "Kris"

    self.width = 23
    self.height = 32

    self.hitbox = {3, 20, 16, 12}

    self.color = {0, 1, 1}

    self.path = "party/kris/light/past"
    self.default = "walk"

    self.voice = "kris"
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

        -- Cutscene offsets
        ["sit_tv"] = {0, 3},
    }
end

function actor:onTextSound(node, state)
    Assets.playSound("voice/kris", 1, 1.12)
    return true
end

return actor