local actor, super = Class(Actor, "shopkeepers/sans")

function actor:init()
    super.init(self)

    self.name = "Sans"

    self.width = 135
    self.height = 109
    
    self.voice = "sans"

    self.path = "shopkeepers/sans"
    self.default = "idle"

    self.font = "comicsnas"

    self.talk_sprites = {
        ["idle"] = 0,
        ["closed"] = 0,
        ["half_closed"] = 0,
        ["creepy"] = 0,
        ["eyelids"] = 0,
        ["eyelids_side"] = 0,
        ["wink"] = 0,
        ["side"] = 0
    }
end

return actor