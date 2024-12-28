local actor, super = Class(Actor, "swatchling")

function actor:init()
    super.init(self)
    
    self.name = "Swatchling"

    self.width = 68
    self.height = 69

    self.hitbox = {15, 49, 30, 20}

    self.color = {1, 1, 1}

    self.flip = "right"

    self.path = "npcs/castletown/swatchling"
    self.default = "walk"

    self.talk_sprites = {
        ["walk"] = 0.25,
    }
end

return actor