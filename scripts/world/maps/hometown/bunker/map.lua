local Bunker, super = Class(Map)

function Bunker:onEnter()
    if Game:getFlag("bunker_no_vines") then
        local event = Game.world.map:getEvent("bunker")
        event:setSprite("tilesets/spr_shelter_opened_b")
    end

    if Game.chapter == 4 and Game:getFlag("ch4_rain") then
        Game.stage:setWeather("rain", true, true, Game.world)
    end

    --Morning and Evening Tint
    --[[if Game:getFlag("morning") then
        local morning = Game.world:addFX(ColorMaskFX({121/255, 121/255, 121/255}, 0.5))
        morning.layer = WORLD_LAYERS["below_ui"]
    elseif Game:getFlag("evening") then
        local evening = Game.world:addFX(ColorMaskFX({0, 0, 0.1}, 0.7))
        evening.layer = WORLD_LAYERS["below_soul"]
    else
        Game.world:removeFX()
    end]]
end

function Bunker:onExit()
    --Game.world:removeFX()
    if Game.stage:hasWeather("rain") then
        Game.stage:resetWeather()
    end
end

return Bunker