local actor, super = Class(Actor, "sans_lw")

function actor:init()
    super.init(self)

    self.name = "sans"

    self.width = 23
    self.height = 30
    
    self.hitbox = {0, 5, 22, 39}

    self.color = {0, 1, 1}

    self.flip = nil

    self.path = "npcs/lightners/sans"
    self.default = "default"

    self.voice = "sans"
    self.portrait_path = "face/sans"
    self.portrait_offset = {-5, 0}

    self.font = "comicsnas"

    self.can_blush = false

    self.talk_sprites = {
        [""] = 0.2
    }

    self.animations = {}

    self.offsets = {
        ["default"] = {0, 0},
    }
    
end

return actor