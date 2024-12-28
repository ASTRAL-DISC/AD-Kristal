local actor, super = Class(Actor, "normal")

function actor:init()
    super:init(self)

    self.name = "Normal"

    self.width = 35
    self.height = 40

    self.hitbox = {1, 2, 30, 39}

    self.color = {0, 1, 1}
	
	self.flip = "right"

    self.path = "npcs/hometown/normal"

    self.default = "talk"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false
	
	self.talk_sprites = {
        ["talk"] = 0.2,
    }

    self.animations = {}

    self.offsets = {}
	
end

return actor