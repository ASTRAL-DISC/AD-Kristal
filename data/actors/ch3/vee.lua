local actor, super = Class(Actor, "vee")

function actor:init()
    super.init(self)

    self.name = "Vee"

    self.width = 34
    self.height = 48

    self.hitbox = {8, 34, 20, 14}

    self.color = {0, 1, 1}

    self.path = "npcs/ch3/vee"
    self.default = "talk"

    self.flip = "right"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.miniface = "face/mini/vee"
    self.miniface_offset = {0, -5}

    self.animations = {}
    
    self.talk_sprites = {
        ["talk"] = 0.25
    }

    self.offsets = {
        ["talk"] = {0, 0},
    }
end

return actor