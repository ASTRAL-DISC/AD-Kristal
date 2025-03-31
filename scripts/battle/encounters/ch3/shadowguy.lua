local Shadowguy, super = Class(Encounter)

function Shadowguy:init()
    super.init(self)

    self.text = "* Shadowguy throws some shade at you!"

    self.music = "battle_vapor"
    self.background = true

    self:addEnemy("shadowguy")
end

return Shadowguy