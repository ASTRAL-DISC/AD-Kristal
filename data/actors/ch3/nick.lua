local actor, super = Class(Actor, "nick")

function actor:init()
    super.init(self)

    self.name = "Nick"

    self.width = 41
    self.height = 75

    self.hitbox = {9, 60, 24, 15}

    self.color = Utils.hexToRgb("#eb991b")

    self.path = "npcs/ch3/nick"
    self.default = "walk"

    self.voice = "nick"
    self.portrait_path = "face/nick"
    self.portrait_offset = {-28, -18}

    self.animations = {}
    
    self.offsets = {
        ["walk/down"] = {0, -1},
        ["walk/left"] = {0, -1},
        ["walk/right"] = {0, -1},
        ["walk/up"] = {0, -1},

        -- Cutscene offsets
        ["gesture"] = {2, -1},
        ["surprise_eye"] = {-9, -1},
        ["bow"] = {0, -1},
        ["shock"] = {-8, 2},
        ["shock_look"] = {-8, 2},
    }
end

return actor