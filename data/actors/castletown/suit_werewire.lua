local actor, super = Class(Actor, "suit_werewire")

function actor:init()
    super.init(self)

    self.name = "Suit Werewire"

    self.width = 57
    self.height = 270

    self.hitbox = {10, 240, 20, 20}

    self.flip = "right"

    self.path = "npcs/castletown/suit_werewire"
    self.default = "talk"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {
        ["talk"] = 0.25,
    }

    self.animations = {}
    
    self.offsets = {}
end

return actor