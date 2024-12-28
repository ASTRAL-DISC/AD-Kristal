local actor, super = Class(Actor, "comet")

function actor:init()
    super.init(self)

    self.name = "Comet"

    self.width = 27
    self.height = 56

    self.hitbox = {4, 30, 22, 25}

    self.path = "npcs/lightners/comet/dark"
    self.default = "walk"

    self.voice = "comet"

    self.portrait_path = "face/comet_dw"
    
    self.portrait_offset = {-28, -18}

    self.talk_sprites = {}

    self.animations = {
        ["back_turn"] = {"back_turn", 0.25, false},
        ["back_turn_shadowed"] = {"back_turn_shadowed", 0.25, false},
        ["glow"] = {"glow", 0.15, false},
        ["wind"] = {"wind", 0.15, true},
    }

    self.offsets = {
        --Movement
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},
        ["walk/down"] = {0, 0},

        ["walk_shadowed/left"] = {0, 0},
        ["walk_shadowed/right"] = {0, 0},
        ["walk_shadowed/up"] = {0, 0},
        ["walk_shadowed/down"] = {0, 0},

        -- Cutscene
        ["glow"] = {-10, 0},
        ["wind"] = {-10, 0},
    }
end

return actor