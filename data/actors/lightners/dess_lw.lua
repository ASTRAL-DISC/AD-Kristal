local actor, super = Class(Actor, "dess_lw")

function actor:init()
    super.init(self)

    self.name = "Dess"

    self.width = 23
    self.height = 47

    self.hitbox = {2, 33, 19, 16}

    self.color = Utils.hexToRgb("#ff5d00")

    self.path = "party/dess/light"
    self.default = "walk"

    self.voice = "dess"
    self.portrait_path = "face/dess"
    self.portrait_offset = {-12, -10}

    self.can_blush = false

    self.animations = {}

    self.offsets = {
        ["walk/down"] = {0, -1},
        ["walk/right"] = {0, -1},
        ["walk/left"] = {0, -1},
        ["walk/up"] = {0, -1},
    }
end

return actor