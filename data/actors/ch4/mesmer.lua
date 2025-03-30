local actor, super = Class(Actor, "mesmer")

function actor:init()
    super.init(self)

    self.name = "Mesmer"

    self.width = 69
    self.height = 74

    self.hitbox = {10, 60, 47, 14}
	
	self.flip = "right"

    self.path = "npcs/ch4/mesmer"

    self.default = "idle"

    self.talk_sprites = {}

    self.animations = {}
    
    self.offsets = {
        ["idle"] = {0, 0},

        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
    }
end

return actor