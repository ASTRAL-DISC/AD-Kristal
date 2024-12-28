local actor, super = Class(Actor, "dynatv")

function actor:init()
    super.init(self)

    self.name = "Dynamo"

    self.width = 78
    self.height = 49

    self.path = "npcs/ch3/dynamo/screen"
    self.default = "off_6"

    self.voice = nil

    self.animations = {
        ["happy"] = {"happy", 0.2, true},
        ["mad"] = {"mad", 0.2, true},
        ["reading"] = {"reading", 0.2, false},
        ["call"] = {"call", 0.2, true},
        ["static"] = {"static", 0.1, true},
        ["off"] = {"off", 0.15, false},
    }

    self.talk_sprites = {
        ["happy"] = 0.18,
        ["mad"] = 0.18,
        ["reading"] = 0.18,
        ["call"] = 0.18,
    }
    
    self.offsets = {}
end

return actor