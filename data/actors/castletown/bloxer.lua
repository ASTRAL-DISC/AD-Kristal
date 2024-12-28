local actor, super = Class(Actor, "bloxer")

function actor:init()
    super.init(self)

    self.name = "Bloxer"

    self.width = 38
    self.height = 54

    self.hitbox = {3, 30, 26, 24}

    self.flip = "right"

    self.path = "npcs/castletown/bloxer"
    self.default = "spared"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {}

    self.animations = {}
    
    self.offsets = {
        ["spared"] = {0, 0},
        ["pants_four"] = {0, 0},
    }
end

return actor