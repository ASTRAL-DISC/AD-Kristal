local actor, super = Class(Actor, "lancerpainting")

function actor:init()
    super.init(self)

    self.width = 20
    self.height = 20

    self.color = {0, 0, 0}

    self.flip = nil

    self.path = "world/castle_town"
    self.default = "lancerpainting"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {}

    self.offsets = {
        ["lancerpainting"] = {0, 0},
        ["lancerpainting_bluh"] = {0, 0},
    }
end

return actor