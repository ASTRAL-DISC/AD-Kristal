local actor, super = Class(Actor, "noelle_dark_transition")

function actor:init()
    super.init(self)
    
    self.name = "Noelle"

    self.width = 23
    self.height = 47

    self.path = "party/noelle/dark_transition"
    self.default = "run"

    self.offsets = {
        ["run"] = {0, 1},
        ["forward"] = {-3, 2},
        ["turn"] = {-3, 2},
        ["light"] = {-3, 2},
        ["white"] = {-3, 2},
        ["dark"] = {-3, 2},
        ["smear"] = {-3, 2},
        ["ball"] = {-3, 2},
        ["landed"] = {0, 2}
    }
end

return actor