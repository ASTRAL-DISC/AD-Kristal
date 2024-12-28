local actor, super = Class(Actor, "icecap")

function actor:init()
    super.init(self)

    self.name = "Ice Cap"

    self.width = 21
    self.height = 36

    self.hitbox = {0, 10, 21, 26}

    self.color = {1, 0, 0}
    
    self.flip = nil

    self.path = "npcs/hometown/icecap"
    self.default = "blue"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {
        ["blue"] = 0.25,
        ["red"] = 0.25,
        ["green"] = 0.25
    }
    
    self.animations = {}

    self.offsets = {}
end

return actor