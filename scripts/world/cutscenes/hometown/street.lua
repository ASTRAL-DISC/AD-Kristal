return {
    wrongway = function(cutscene, event)
        cutscene:text("* (Not the right way.)")
    end,
    truck = function(cutscene, event)
        if Game.chapter == 6 and Game:getFlag("bunker_opened") then
            if event.interact_count == 1 then
                cutscene:text("* (Your dad's truck. [wait:5]It's full of gardening tools in the back.)")
                cutscene:text("* (Hm? [wait:5]You spot something jutting out under the flowers...)")
                Game.inventory:addItem("light/pruning_shears")
                Assets.playSound("item")
                cutscene:text("* (Got Pruning Shears.)")
            else
                cutscene:text("* (It's your dad's truck.)")
                cutscene:text("* (The floor of the front seat is littered with old papers and country CDs...)")
            end
        else
            cutscene:text("* (It's your dad's truck.)")
            cutscene:text("* (The floor of the front seat is littered with old papers and country CDs...)")
        end
    end,
}