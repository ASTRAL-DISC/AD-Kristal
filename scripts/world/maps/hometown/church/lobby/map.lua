local Lobby, super = Class(Map)

function Lobby:onEnter()
    if Game.chapter == 4 and Game:getFlag("ch4_rain") then
        Game.stage:setWeather("rain", true, true, Game.world)
    end

    Game.world:spawnObject(ChurchOverlay(true), "objects")
end

function Lobby:onExit()
    if Game.stage:hasWeather("rain") then
        Game.stage:resetWeather()
    end
end

return Lobby