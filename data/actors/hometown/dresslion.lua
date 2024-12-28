local actor, super = Class(Actor, "dresslion")

function actor:init()
    super.init(self)

    self.name = "Dress Lion"

    self.width = 29
    self.height = 44

    self.hitbox = {0, 10, 29, 34}

    self.color = {1, 0, 0}
    
    self.flip = nil

    self.path = "npcs/hometown/dresslion"
    self.default = "talk"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {
        ["talk"] = 0.25
    }
    
    self.animations = {}

    self.offsets = {}
end

return actor