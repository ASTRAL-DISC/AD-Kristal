local actor, super = Class(Actor, "quest/lancer")

function actor:init()
    super.init(self)

    self.name = "Lancer"
    self.name_caption = "caption_lancer"

    self.width = 14
    self.height = 16

    self.hitbox = {0, 10, 14, 10}

    self.color =  Utils.hexToRgb("#31b081")

    self.path = "world/events/lancered"
    self.default = ""

    self.voice = "quest/lancer"
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.animations = {}

    self.mirror_sprites = {}

    self.offsets = {}
end

return actor