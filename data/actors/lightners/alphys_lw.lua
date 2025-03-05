local actor, super = Class(Actor, "alphys_lw")

function actor:init()
    super.init(self)

    self.name = "Alphys"

    self.width = 19
    self.height = 31

    self.hitbox = {0, 11, 19, 20}

    self.color = {1, 1, 0}

    self.flip = nil

    self.path = "npcs/lightners/alphys/light"
    self.default = "walk"

    self.voice = "alphys"
    self.portrait_path = "face/alphys"
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {}

    self.offsets = {
        ["walk"] = {0, 0}
    }
end

return actor