local actor, super = Class(Actor, "nick")

function actor:init()
    super.init(self)

    self.name = "Nick"

    self.width = 24
    self.height = 69

    self.hitbox = {-1, 51, 19, 14}

    self.color = Utils.hexToRgb("#eb991b")

    self.path = "npcs/ch3/nick"
    self.default = "walk"

    self.voice = "nick"
    self.portrait_path = "face/nick"
    self.portrait_offset = {-28, -18}

    self.animations = {}
    
    self.offsets = {
        ["walk/down"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},

        -- Cutscene offsets
        ["shock"] = {-8, 2},
        ["shock_look"] = {-8, 2},
    }
end

return actor