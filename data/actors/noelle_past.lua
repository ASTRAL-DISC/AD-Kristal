local actor, super = Class(Actor, "noelle_past")

function actor:init()
    super.init(self)

    self.name = "Noelle"

    self.width = 21
    self.height = 31

    self.hitbox = {2, 20, 19, 10}

    self.color = {1, 1, 0}

    self.path = "party/noelle/light/past"
    self.default = "walk"

    self.voice = "noelle"
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.animations = {
        ["crying"] = {"crying", 0.2, true}
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

        ["crying"] = {0, 0}
    }
end

function actor:onTextSound(node, state)
    Assets.stopAndPlaySound("voice/noelle", 1, 1.06)
    return true
end

return actor