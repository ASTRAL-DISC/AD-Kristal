local actor, super = Class(Actor, "rabbick")

function actor:init()
    super.init(self)

    self.name = "Rabbick"

    self.width = 11
    self.height = 11

    self.hitbox = {0, 5, 11, 6}

    self.flip = nil

    self.path = "npcs/castletown/rabbick"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {}

    self.animations = {}
    
    self.offsets = {
        ["idle"] = {0, 0},
    }
end

return actor