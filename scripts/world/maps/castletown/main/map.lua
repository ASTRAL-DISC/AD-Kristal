local Main, super = Class(Map)

function Main:onEnter()
    super.onEnter(self)
    if #Game.party == 2 and not Game:hasPartyMember("ralsei") then
        Game:addPartyMember("ralsei")
        Game.world:spawnFollower("ralsei")
    end
end

return Main