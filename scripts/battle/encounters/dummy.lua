local Dummy, super = Class(Encounter, "dummy")

function Dummy:init()
    super.init(self)

    self.text = "* The tutorial begins...?"

    self.music = "battle"
    self.background = true

    self:addEnemy("dummy")
end

return Dummy