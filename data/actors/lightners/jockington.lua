local actor, super = Class(Actor, "jockington")

function actor:init()
    super.init(self)

    self.name = "Jockington"

    self.width = 41
    self.height = 53

    self.hitbox = {6, 29, 19, 14}

    self.color = {0, 0.8, 0}

    self.path = "npcs/lightners/jockington/dark"
    self.default = "walk"

    self.voice = nil
    self.portrait_path = "face/jockington_dw"
    self.portrait_offset = {0, 0}

    self.can_blush = false

    self.animations = {
        -- Cutscene animations
    }

    self.talk_sprites = {
        ["talk"] = 0.18,
        ["talk_left"] = 0.18
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
        ["up"] = {0, 0},
        ["talk"] = {0, 0},
        ["talk_left"] = {0, 0},
    }
end

return actor