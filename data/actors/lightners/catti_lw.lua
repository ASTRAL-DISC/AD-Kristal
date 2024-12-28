local actor, super = Class(Actor, "catti_lw")

function actor:init()
    super.init(self)

    self.name = "Catti"

    self.width = 36
    self.height = 45

    self.hitbox = {6, 29, 19, 14}

    self.color = {0.9, 0, 0.9}

    self.path = "npcs/lightners/catti/light"
    self.default = "walk"

    self.voice = nil
    self.portrait_path = "face/catti"
    self.portrait_offset = {0, 0}

    self.can_blush = false

    self.animations = {
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

        -- Cutscene offsets
        ["waitress"] = {0, 0},
    }
end

return actor