local actor, super = Class(Actor, "jigsawry")

function actor:init()
    super.init(self)

    self.name = "Jigsawry"

    self.width = 36
    self.height = 38

    self.hitbox = {0, 24, 36, 18}

    self.color = {1, 1, 1}

    self.flip = "left"

    self.path = "npcs/castletown/jigsawry"
    self.default = "spared"

    self.talk_sprites = {
        ["spared"] = 0.2
    }
	
	self.animations = {
        --["spared"] = {"spared", 0.2, true},
        ["talk"] = {"spared", 0.25, true},
	}
end

return actor