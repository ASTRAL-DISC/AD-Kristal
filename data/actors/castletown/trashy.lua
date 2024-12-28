local actor, super = Class(Actor, "trashy")

function actor:init()
    super.init(self)

    self.name = "Trashy"

    self.width = 71
    self.height = 50

    self.hitbox = {4, 30, 15, 16}

    self.flip = "right"

    self.path = "npcs/castletown/trashy"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {}

    self.animations = {
        ["idle"] = {"idle", 0.25, true},
    }
    
    self.offsets = {}
end

return actor