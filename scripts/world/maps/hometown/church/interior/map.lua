local Interior, super = Class(Map)

function Interior:onEnter()
    if Game.chapter == 4 and Game:getFlag("ch4_rain") then
        Game.stage:setWeather("rain", true, true, Game.world)
    end

    Game.world:spawnObject(ChurchOverlay(), "objects")
end

function Interior:onExit()
    if Game.stage:hasWeather("rain") then
        Game.stage:resetWeather()
    end
end

return Interior