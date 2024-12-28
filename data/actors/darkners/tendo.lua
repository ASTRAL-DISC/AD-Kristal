local actor, super = Class(Actor, "tendo")

function actor:init()
    super.init(self)
    
    self.name = "Tend-O"
    
    self.width = 49
    self.height = 34

    self.hitbox = {2, 15, 18, 8}

    self.color = {1, 0.5, 0}

    self.flip = nil

    self.path = "npcs/darkners/tendo"
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