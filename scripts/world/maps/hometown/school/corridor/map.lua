local Corridor, super = Class(Map)

function Corridor:load()
    super.load(self)
end

function Corridor:onEnter()
    if Game:getFlag("afternoon") then
        local overlay = Game.world.map:getImageLayer("overlay")
        overlay.visible = true
    else
        local overlay = Game.world.map:getImageLayer("overlay")
        overlay.visible = false
    end

    --[[if Game.chapter == 4 and Game:getFlag("ch4_rain") then
        Game.stage:setWeather("rain", true, true, Game.world)
    end]]
end

function Corridor:onExit()
    --[[if Game.stage:hasWeather("rain") then
        Game.stage:resetWeather()
    end]]
end

return Corridor