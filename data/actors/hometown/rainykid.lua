local actor, super = Class(Actor, "rainykid")

function actor:init()
    super.init(self)

    self.name = "Rainy Kid"

    self.width = 21
    self.height = 36

    self.hitbox = {2, 18, 18, 10}

    self.color = {1, 0, 0}
    
    self.flip = "left"

    self.path = "npcs/hometown/rainykid"
    self.default = "hop"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}
    
    self.animations = {
        ["hop"] = {"hop", 0.13, true},
    }

    self.offsets = {}
end

return actor