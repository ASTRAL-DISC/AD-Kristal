local MayorsOffice, super = Class(Map)

function MayorsOffice:load()
    super.load(self)
    --[[if Game.chapter == 6 then
        Game.party = {"kris, susie"}
    end]]
end

function MayorsOffice:onEnter()
    local blindsopen = Game.world.map:getImageLayer("bg2")
    
    if Game.chapter == 5 then
        blindsopen.visible = false
        if not Game:getFlag("seen_mayor") then
            Game.world:startCutscene("hometown/townhall.mayorsoffice")
        else
            if Game.world:getCharacter("comet_lw") then
                local comet = Game.world:getCharacter("comet_lw")
                comet.layer = Game.world:getLayer("3") + 1
            end
        end
    elseif Game.chapter == 6 then
        blindsopen.visible = true
        Game.world:startCutscene("hometown/townhall.mayorsoffice_ch6")
    end
end

function MayorsOffice:onExit()
    --[[if Game.stage:hasWeather("rain") then
        Game.stage:resetWeather()
    end]]
end

return MayorsOffice