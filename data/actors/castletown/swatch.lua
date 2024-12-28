local actor, super = Class(Actor, "swatch")

function actor:init()
    super.init(self)
    
    self.name = "Swatch"

    self.width = 45
    self.height = 42

    self.hitbox = {5, 35, 35, 35}

    self.color = {1, 1, 1}

    self.flip = nil

    self.path = "npcs/castletown/swatch"
    self.default = "cafe"
	
	self.animations = {}

    self.offsets = {
        ["cafe"] = {0, 0},
    }
end

return actor