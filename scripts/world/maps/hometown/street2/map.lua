local Street2, super = Class(Map)

function Street2:onEnter()
    --[[if Game.chapter == 4 and Game:getFlag("ch4_rain") then
        Game.stage:setWeather("rain", true, true, Game.world)
    end]]
end

return Street2