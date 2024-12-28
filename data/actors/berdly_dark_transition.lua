local actor, super = Class(Actor, "berdly_dark_transition")

function actor:init()
    super.init(self)
    
    self.name = "Berdly"

    self.width = 24
    self.height = 40

    self.path = "party/berdly/dark_transition"
    self.default = "run"
end

return actor