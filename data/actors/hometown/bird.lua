local actor, super = Class(Actor, "bird")

function actor:init()
    super.init(self)

    self.name = "Small Bird"

    self.width = 15
    self.height = 19

    self.hitbox = {0, 10, 15, 9}

    self.color = {1, 1, 0}

    self.flip = nil

    self.path = "npcs/hometown/bird"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["idle"] = {"idle", 0.25, true},
        ["fly"] = {"fly", 0.1, true},
        ["cry"] = {"cry", 0.25, true}
    }
    
    self.offsets = {
        ["idle"] = {0, 0},
        ["fly"] = {1, -1},
        ["cry"] = {0, 0},
    }
end

return actor