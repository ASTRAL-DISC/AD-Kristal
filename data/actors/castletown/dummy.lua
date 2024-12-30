local actor, super = Class(Actor, "dummy")

function actor:init()
    super.init(self)

    self.name = "Dummy"

    self.width = 27
    self.height = 45

    self.hitbox = {0, 25, 19, 14}
    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/castletown/dummy"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {}

    self.offsets = {
        ["idle"] = {0, 0},
    }
end

return actor