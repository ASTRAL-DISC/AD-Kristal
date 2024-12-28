local actor, super = Class(Actor, "mrsociety")

function actor:init()
    super.init(self)

    self.name = "Mr. Society"

    self.width = 30
    self.height = 39

    self.hitbox = {8, 20, 20, 20}

    self.flip = "right"

    self.path = "npcs/castletown/mrsociety"
    self.default = "talk"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {
        ["talk"] = 0.25,
    }

    self.animations = {}
    
    self.offsets = {}
end

return actor