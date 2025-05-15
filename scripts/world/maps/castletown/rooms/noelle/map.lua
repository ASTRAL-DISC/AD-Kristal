local NoelleRoom, super = Class(Map)

function NoelleRoom:onEnter()
    super.onEnter(self)
    --[[if not Game:getFlag("seen_noelleroom") then
        Game.world:startCutscene("castletown/noelleroom.intro")
    end]]
end

return NoelleRoom