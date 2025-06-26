local actor, super = Class(Actor, "angel")

function actor:init()
    super.init(self)

    self.name = "ANGEL"

    self.width = 31
    self.height = 41

    self.hitbox = {6, 29, 19, 14}

    self.color = {1, 0, 0}

    self.path = "party/angel/dark"
    self.default = "walk"

    self.voice = "angel"
    self.portrait_path = "face/angel"
    self.portrait_offset = {-28, -18}

    --self.indent_string = "# "

    self.can_blush = false

    self.animations = {
        -- Battle animations
        ["battle/idle"]         = {"battle/idle", 0.2, true},

        ["battle/attack"]       = {"battle/idle", 1/15, false},
        ["battle/act"]          = {"battle/idle", 1/15, false},
        ["battle/spell"]        = {"battle/idle", 1/15, false, next="battle/idle"},
        ["battle/item"]         = {"battle/idle", 1/12, false, next="battle/idle"},
        ["battle/spare"]        = {"battle/idle", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle/idle", 0.2, true},
        ["battle/act_ready"]    = {"battle/idle", 0.2, true},
        ["battle/spell_ready"]  = {"battle/idle", 0.2, true},
        ["battle/item_ready"]   = {"battle/idle", 0.2, true},
        ["battle/defend_ready"] = {"battle/idle", 1/15, false},

        ["battle/act_end"]      = {"battle/idle", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         = {"battle/idle", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"battle/idle", 1/15, false},

        ["battle/transition"]   = {self.default.."/right_1", 1/15, false},
        ["battle/victory"]      = {"battle/idle", 1/10, false},

        -- Cutscene animations
    }

    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }

    self.floor_mirror_sprites = {
        ["walk/down"] = "walk/down",
        ["walk/up"] = "walk/up",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }

    self.offsets = {
        -- Movement offsets
        ["walk/down"] = {0, 1},
        ["walk/right"] = {-2, 0},
        ["walk/left"] = {2, 0},
        ["walk/up"] = {0, 1},

        -- Cutscene offsets

        -- Battle offsets
        ["battle/idle"] = {-15, -3}
    }
end

function actor:onTextSound(node, state)
    if Game.voice_timer == 0 then
        local snd = Assets.stopAndPlaySound("voice/angel")
        snd:setPitch(0.8 + Utils.random(0.4))
        Game.voice_timer = 1.1
    end
    return true
end

return actor