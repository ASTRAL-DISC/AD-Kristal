local Shadowguys, super = Class(Encounter)

function Shadowguys:init()
    super.init(self)

    self.text = "* Two Shadowguys emerge from the\ndarkness!" -- WIP

    self.music = "battle_vapor"
    self.background = true

    self:addEnemy("shadowguy")
    self:addEnemy("shadowguy")
end

return Shadowguys