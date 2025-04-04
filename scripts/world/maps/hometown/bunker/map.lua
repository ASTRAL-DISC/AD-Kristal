local Bunker, super = Class(Map)

function Bunker:onEnter()
    if Game:getFlag("bunker_no_vines") then
        local event = Game.world.map:getEvent("bunker")
        event:setSprite("tilesets/spr_shelter_opened_b")
    end

    if Game.chapter == 4 and Game:getFlag("ch4_rain") then
        Game.stage:setWeather("rain", true, true, Game.world)
    end
end

function Bunker:onExit()
    if Game.stage:hasWeather("rain") then
        Game.stage:resetWeather()
    end
end

return Bunker