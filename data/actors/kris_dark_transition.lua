local actor, super = Class(Actor, "kris_dark_transition")

function actor:init()
    super.init(self)
    
    self.name = "Kris"

    self.width = 19
    self.height = 37

    self.path = "party/kris/dark_transition"
    self.default = "run"
end

return actor