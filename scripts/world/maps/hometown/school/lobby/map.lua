local Lobby, super = Class(Map)

function Lobby:onEnter()
    if Game:getFlag("afternoon") then
        local overlay = Game.world.map:getImageLayer("overlay")
        overlay.visible = true
    else
        local overlay = Game.world.map:getImageLayer("overlay")
        overlay.visible = false
    end

    if Game.chapter == 4 and Game:getFlag("ch4_rain") then
        Game.stage:setWeather("rain", true, true, Game.world)
    end
end

function Lobby:onExit()
    if Game.stage:hasWeather("rain") then
        Game.stage:resetWeather()
    end
end

return Lobby