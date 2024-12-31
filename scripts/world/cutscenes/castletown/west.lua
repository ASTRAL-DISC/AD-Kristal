return {
    hole = function(cutscene, event)
        local shine = Game.world.map:getEvent("shine")
        local item

        -- this code could be severely optimized
        if Game.chapter == 4 then
            if Game:getFlag("beat_sb", 3) then
                if Game:getFlag("fought_halojack") and not Game.inventory:hasItem("gloryslicer") then
                    item = "gloryslicer"
                elseif Game:getFlag("spared_halojack") and not Game.inventory:hasItem("idconcealer") then
                    item = "idconcealer"
                end
            end
        elseif Game.chapter == 5 then
            if Game:getFlag("beat_sb", 4) then
                if Game:getFlag("fought_beltrowel") and not Game.inventory:hasItem("bellring") then
                    item = "bellring"
                elseif Game:getFlag("spared_beltrowel") and not Game.inventory:hasItem("corruptstole") then
                    item = "corruptstole"
                end
            end
        elseif Game.chapter == 6 then
            if Game:getFlag("beat_sb", 5) then
                if Game:getFlag("fought_spreeblitz") and not Game.inventory:hasItem("brokentracks") then
                    item = "brokentracks"
                elseif Game:getFlag("spared_spreeblitz") and not Game.inventory:hasItem("safetybelt") then
                    item = "safetybelt"
                end
            end
        elseif Game.chapter == 7 then
            if Game:getFlag("beat_sb", 6) then
                if Game:getFlag("fought_gauze") and not Game.inventory:hasItem("gonerlabrys") then
                    item = "gonerlabrys"
                elseif Game:getFlag("spared_gauze") and not Game.inventory:hasItem("soulbandage") then
                    item = "soulbandage"
                end
            end
        end

        if shine then
            cutscene:text("* (Something is glimmering in the hole.)")
            cutscene:text("* (Look inside?)")

            cutscene:choicer({"Yes", "No"})
            if cutscene.choice == 1 then
                cutscene:text("* (You reached inside and found something alongside a strange piece of glass...)")
                local success, result = Game.inventory:tryGiveItem(item)

                -- will add the shadow crystal thing later

                if success then
                    cutscene:text(result)
                    shine:remove()
                else
                    if item.type == "armor" then
                        cutscene:text("* (But you were carrying too many [color:yellow]ARMORs[color:reset].)")
                    elseif item.type == "weapon" then
                        cutscene:text("* (But you were carrying too many [color:yellow]WEAPONs[color:reset].)")
                    end
                end
            end
        else
            cutscene:text("* (There's a hole in the wall...)")
            cutscene:text("* (There's nothing inside.)")
        end
    end,
}