local actor, super = Class(Actor, "gaster")

function actor:init()
    super.init(self)

    self.name = "HIM"

    self.width = 24
    self.height = 40

    self.hitbox = {0, 27, 20, 14}

    self.color = {0.8, 0.8, 0.8}

    self.path = "party/berdly/dark"
    self.default = "walk"

    self.voice = "gaster"
    self.portrait_path = "face/gaster"
    self.portrait_offset = {-16, -7}

    self.animations = {
        -- Battle animations

        -- Cutscene animations
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

        -- Battle offsets
        -- Cutscene offsets
    }
end

function actor:onTextSound(node)
    Assets.playSound("voice/gaster/full/" .. string.lower(node.character), 1, 1)
    return true
end

return actor