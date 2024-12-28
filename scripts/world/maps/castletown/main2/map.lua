local Main2, super = Class(Map)

function Main2:onEnter()
    super.onEnter(self)
    --[[if #Game.party == 2 then
        Game:addPartyMember("ralsei")
        Game.world:spawnFollower("ralsei")
    end]]
end

return Main2