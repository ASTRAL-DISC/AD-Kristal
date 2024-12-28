local actor, super = Class(Actor, "capn")

function actor:init()
    super.init(self)

    self.name = "Cap'n"

    self.width = 46
    self.height = 40

    self.hitbox = {14, 53, 34, 18}

    self.color = {1, 1, 1}

    self.flip = "right"

    self.path = "npcs/castletown/capn"
    self.default = "idle"

    self.miniface = "face/mini/capn"
    self.miniface_offset = {-3, 2}
	
	self.animations = {}
    
    self.offsets = {}
end

return actor