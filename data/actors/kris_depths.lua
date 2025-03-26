local actor, super = Class(Actor, "kris_depths")

function actor:init()
    super.init(self)

    self.name = "Kris"

    self.width = 24
    self.height = 39

    self.hitbox = {3, 25, 19, 14}

    self.color = {0, 1, 1}

    self.path = "party/kris/depths"
    self.default = "walk"

    self.voice = "kris"
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.animations = {}
    
    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }

    self.floor_mirror_sprites = {
        ["walk/down"] = "walk/down",
        ["walk/up"] = "walk/up",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }

    self.floor_mirror_sprites_alt = {
        ["walk/down"] = "walk_gauze/down",
        ["walk/up"] = "walk_gauze/up",
        ["walk/left"] = "walk_gauze/left",
        ["walk/right"] = "walk_gauze/right",
    }

    self.offsets = {
        -- Movement offsets
        ["walk/down"] = {0, 1},
        ["walk/right"] = {0, 1},
        ["walk/left"] = {0, 1},
        ["walk/up"] = {0, 1},

        ["walk_gauze/left"] = {2, 0},
        ["walk_gauze/right"] = {2, 0},
        ["walk_gauze/up"] = {2, 0},
        ["walk_gauze/down"] = {2, 0},

        -- Cutscene offsets
    }
end

function actor:getFloorMirrorSprites()
    if Game.world and Game.world.map.id == "ch6/reflection" then
        return self.floor_mirror_sprites_alt
    else
        return self.floor_mirror_sprites
    end
end

return actor