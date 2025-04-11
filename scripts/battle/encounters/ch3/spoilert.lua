local Spoilert, super = Class(Encounter, "spoilert")

function Spoilert:init()
    super.init(self)

    self.text = "* DANGER ZONE! Don't look!"

    self.music = "battle"
    self.background = true

    self:addEnemy("spoilert")
end

return Spoilert