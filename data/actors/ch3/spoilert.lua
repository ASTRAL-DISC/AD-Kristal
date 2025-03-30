local actor, super = Class(Actor, "spoilert")

function actor:init()
    super.init(self)

    self.name = "Spoilert"

    self.width = 37
    self.height = 40

    self.hitbox = {9, 30, 19, 10}
	
	self.flip = "right"

    self.path = "enemies/ch3/spoilert"

    self.default = "idle"

    self.talk_sprites = {
        ["idle"] = 0.25
    }

    self.animations = {
        ["idle"] = {"idle", 0.25, true},
        ["spared"] = {"spared", 0, false},
        ["hurt"] = {"hurt", 0, false}
    }
    
    self.offsets = {
        ["idle"] = {0, 0},
        ["spared"] = {-1, 0},
        ["hurt"] = {0, 0},
    }
	
end

return actor