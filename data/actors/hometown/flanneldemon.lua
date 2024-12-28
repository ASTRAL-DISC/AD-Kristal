local actor, super = Class(Actor, "flanneldemon")

function actor:init()
    super.init(self)

    self.name = "Flannel Demon"

    self.width = 30
    self.height = 51

    self.hitbox = {0, 10, 30, 41}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/hometown/flanneldemon"

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