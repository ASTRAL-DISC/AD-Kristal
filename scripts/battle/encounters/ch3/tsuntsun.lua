local TsunTsun, super = Class(Encounter, "tsuntsun")

function TsunTsun:init()
    super.init(self)

    self.text = "* Tsun-Tsun attacks!"

    self.music = "battle"
    self.background = true
    
    self:addEnemy("tsuntsun")
end

return TsunTsun