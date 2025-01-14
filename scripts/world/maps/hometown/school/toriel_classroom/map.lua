local TorielClassroom, super = Class(Map)

function TorielClassroom:onEnter()
    if Game:getFlag("afternoon") then
        local overlay = Game.world.map:getImageLayer("overlay2")
        overlay.visible = true
    else
        local overlay = Game.world.map:getImageLayer("overlay2")
        overlay.visible = false
    end

    --[[if Game.chapter == 4 and Game:getFlag("ch4_rain") then
        Game.stage:setWeather("rain", true, true, Game.world)
    end]]
end

function TorielClassroom:onExit()
    --[[if Game.stage:hasWeather("rain") then
        Game.stage:resetWeather()
    end]]
end

return TorielClassroom