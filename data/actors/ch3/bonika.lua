local actor, super = Class(Actor, "bonika")

function actor:init()
    super.init(self)

    self.name = "Bonika"

    self.width = 32
    self.height = 60

    self.hitbox = {3, 40, 20, 20}
	
	self.flip = "left"

    self.path = "npcs/ch3/bonika"

    self.default = "idle"

    self.talk_sprites = {
        ["talk"] = 0.25,
        ["helmet_talk"] = 0.25
    }

    self.animations = {
        ["phone"] = {"phone", 0.18, true},
        ["laugh"] = {"laugh", 0.2, true},
        ["hairflip"] = {"hairflip", 0.18, false},
        ["ride"] = {"ride", 0.18, true}
    }
    
    self.offsets = {
        ["idle"] = {0, 0},
        ["talk"] = {0, 0},
        ["helmet_talk"] = {0, 0},
        ["phone"] = {0, 0},
        ["laugh"] = {0, 0},
        ["hairflip"] = {1, 0},
        ["ride"] = {-28, -4},
    }
end

return actor