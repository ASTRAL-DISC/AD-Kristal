local Upstairs, super = Class(Map)

function Upstairs:onEnter()
    if Game.world:getCharacter("normal") then
        local x, y = self:getMarker("normal")
        local x2, y2 = self:getMarker("normal2")
        if Game.chapter == 4 then
            Game.world:getCharacter("normal"):setPosition(x, y)
        elseif Game.chapter == 5 then
            Game.world:getCharacter("normal"):setPosition(x2, y2)
        elseif Game.chapter == 6 then
            Game.world:getCharacter("normal"):remove()
        end
    end

    if Game.chapter == 4 and Game:getFlag("ch4_rain") then
        Game.stage:setWeather("rain", true, true, Game.world)
    end
end

function Upstairs:onExit()
    if Game.stage:hasWeather("rain") then
        Game.stage:resetWeather()
    end
end

return Upstairs