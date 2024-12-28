local actor, super = Class(Actor, "qc_lw")

function actor:init()
    super.init(self)

    self.name = "QC"

    self.width = 21
    self.height = 41

    self.hitbox = {3, 30, 18, 11}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/lightners/qc/light"
    self.default = "stand"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {
        ["diner_talk"] = 0.25
    }

    self.animations = {}
    
    self.offsets = {
        ["stand"] = {0, 0},
        ["diner_talk"] = {-2, 16},
    }
end

return actor