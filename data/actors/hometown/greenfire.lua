local actor, super = Class(Actor, "greenfire")

function actor:init()
    super.init(self)
    
    self.name = "Green Fire"

    self.width = 18
    self.height = 55

    self.hitbox = {0, 10, 18, 55}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/hometown/greenfire"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["idle"] = {"idle", 0.25, true},
    }

    self.offsets = {}
end

return actor