local actor, super = Class(Actor, "chara_lw")

function actor:init()
    super.init(self)

    self.name = "Chara"

    self.width = 24
    self.height = 47

    self.hitbox = {6, 28, 19, 15}

    self.color = {1, 0, 0}

    self.path = "npcs/lightners/chara/light"
    self.default = "walk"

    self.voice = "chara"
    self.portrait_path = "face/chara"
    self.portrait_offset = {-20, -10}

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
        ["walk/right"] = {0, -1},
        ["walk/left"] = {0, -1},
        ["walk/up"] = {0, 0},

        -- Cutscene offsets
        ["arms_out"] = {0, 0},

        ["pointing_left"] = {0, 0},
        ["pointing_right"] = {0, 0},
    }

    self.voice_timer = 0
end

function actor:onWorldUpdate(chara)
    self.voice_timer = Utils.approach(self.voice_timer, 0, DTMULT)
end

function actor:onTextSound(node, state)
    if self.voice_timer == 0 then
        Assets.stopAndPlaySound("voice/chara")
        self.voice_timer = 1.1
    end
    return true
end

return actor