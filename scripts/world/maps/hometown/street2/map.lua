local Street2, super = Class(Map)

function Street2:onEnter()
    if Game.chapter == 4 and Game:getFlag("ch4_rain") then
        Game.stage:setWeather("rain", true, true, Game.world)
        --[[if Game.world:getCharacter("rainykid") then
            local rainykid = Game.world:getCharacter("rainykid")
            rainykid:walkPath("rainykid", {time = 2}, function ()
                rainykid:walkPath("rainykid", {time = 2})
            end)
        end]]
    end
end

return Street2