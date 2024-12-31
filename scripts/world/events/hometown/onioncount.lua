local OnionCount, super = Class(Event, "onioncount")

function OnionCount:init(data)
    super.init(self, data)

    self.onion_timer = 0

    self.solid = false
end

function OnionCount:onCollide(chara)
    self.onion_timer = self.onion_timer + 1 * DT
    if self.onion_timer > 200/30 and not Game.world:hasCutscene() then
        Game.world:startCutscene("hometown/lagoon.onion")
        self:remove()
    end
end

function OnionCount:onExit(chara)
    self.onion_timer = 0
end

return OnionCount