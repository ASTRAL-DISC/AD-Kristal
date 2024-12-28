local actor, super = Class(Actor, "barricode")

function actor:init()
    super.init(self)

    self.name = "Barri-Code"

    self.width = 25
    self.height = 53

    self.hitbox = {2, 43, 19, 14}

    self.color = {0.6, 0.6, 0.6}
	
	self.flip = "right"

    self.path = "npcs/ch3/barricode"
    self.default = "idle_a"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false
	
	self.talk_sprites = {
        ["idle_a"] = 0.2,
		["idle_b"] = 0.2,
    }

    self.animations = {}
    self.offsets = {
        ["idle_a"] = {0, 0},
        ["idle_b"] = {2, 0}
    }
	
end

return actor