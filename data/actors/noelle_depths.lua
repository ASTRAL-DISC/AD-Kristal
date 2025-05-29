local actor, super = Class(Actor, "noelle_depths")

function actor:init()
    super.init(self)

    self.name = "Noelle"

    self.width = 23
    self.height = 47

    self.hitbox = {2, 34, 19, 15}

    self.color = {1, 1, 0}

    self.path = "party/noelle/depths"
    self.default = "walk"

    self.voice = "noelle"
    self.portrait_path = "face/noelle"
    self.portrait_offset = {-12, -10}

    self.can_blush = false

    self.animations = {}

    self.offsets = {
        ["walk/down"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/up"] = {0, 0},
    }
end

return actor