local TsunTsun, super = Class(Encounter)

function TsunTsun:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Tsun-Tsun attacks!"

    -- Battle music ("battle" is rude buster)
    self.music = "battle"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("tsuntsun")
end

return TsunTsun