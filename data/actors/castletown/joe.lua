local actor, super = Class(Actor, "joe")

function actor:init()
    super.init(self)

    self.name = "Jigsaw Joe"

    self.width = 34
    self.height = 30

    self.hitbox = {4, 20, 28, 10}

    self.flip = nil

    self.path = "npcs/castletown/joe"
    self.default = "frown"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {
        ["frown"] = 0.25,
        ["happy"] = 0.25,
        ["shock"] = 0.25,
        ["shock_b"] = 0.25,
    }

    self.animations = {}
    
    self.offsets = {
        ["happy"] = {0, 0},
        ["frown"] = {0, 0},
        ["shock"] = {-2, 0},
        ["shock_b"] = {-3, 0},
    }
end

return actor