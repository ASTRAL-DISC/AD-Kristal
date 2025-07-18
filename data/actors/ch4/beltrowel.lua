local actor, super = Class(Actor, "beltrowel")

function actor:init()
    super.init(self)

    self.name = "Beltrowel"

    self.width = 25
    self.height = 41

    self.hitbox = {2, 30, 20, 11}

    self.color = {0.8, 0, 0}
	
	self.flip = "right"

    self.path = "npcs/ch4/beltrowel"
    self.default = "arms_folded"

    self.voice = "beltrowel"
    self.portrait_path = nil
    self.portrait_offset = nil

    self.font = "main_mono_alt"
    self.indent_string = "♪ "

    self.talk_sprites = {}

    self.animations = {
        ["laugh"] = {"laugh", 0.15, true},
        ["defeat_laugh"] = {"defeat_laugh", 0.15, true},

        ["teleport_away"] = {"teleport_away", 0.18, false},
        ["teleport_back"] = {"teleport_back", 0.18, false},
    }
    
    self.offsets = {
        ["arms_folded"] = {0, 0},
        ["arms_folded_closed"] = {0, 0},
        ["arms_folded_up"] = {-2, 0},
        ["arms_folded_up_look"] = {-2, 0},
        ["arms_folded_up_look_b"] = {-2, 0},

        ["gremlin"] = {0, 0},

        ["angry"] = {-8, 1},
        ["surprised"] = {-8, 1},
        ["surprised_oh"] = {-8, 1},

        ["sliding_right"] = {0, 1},

        ["shocked"] = {-10, -1},

        ["laugh"] = {-10, 2},
        ["laugh_stop"] = {-10, 2},
        ["laugh_stop_look"] = {-10, 2},

        ["arms_out"] = {-6, 0},
        ["arms_out_up"] = {-7, 0},

        ["defeat"] = {-6, 12},
        ["defeat_look"] = {-6, 10},
        ["defeat_laugh"] = {-6, 9},

        ["limp_wrist"] = {0, 1},

        ["surprised_left"] = {-9, 1},
        ["point_angry_left"] = {-14, 1},

        ["teleport_away"] = {-12, -12},
        ["teleport_back"] = {-12, -12},

        ["transform_a"] = {-18, -8},
        ["transform_b"] = {-34, -27},
    }

    self.angry = false
end

function actor:onTextSound(node, state)
    if Game.voice_timer == 0 then
        if not self.angry then
            Assets.stopAndPlaySound("voice/beltrowel", 1.2, 1 + Utils.random(0.1))
        else
            Assets.stopAndPlaySound("voice/beltrowel", 1.2, 1)
        end
        Game.voice_timer = 1.1
    end
    return true
end

function actor:getIndentString()
    if self.angry then
        return "♩ "
    else
        return "♪ "
    end
end

return actor