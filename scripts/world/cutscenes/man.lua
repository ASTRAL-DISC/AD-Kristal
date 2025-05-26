return function(cutscene)

    local function manIsGone()
        if Game.chapter == 7 then
            cutscene:text("* Well, there won't be a man here.")
        else
            cutscene:text("* Well, there was not a man here.")
        end
    end

    if not Game:getFlag("ch"..Game.chapter.."_eggman") then
        Game:setFlag("ch"..Game.chapter.."_eggman", true)

        cutscene:text("* Well, there is a man here.")

        if Game.chapter == 3 then
            cutscene:text("* He wonders about you.") -- WIP
            cutscene:text("* Is there anything on your mind?")
        elseif Game.chapter == 4 then
            cutscene:text("* He greets you politely.") -- WIP
        elseif Game.chapter == 5 then
            cutscene:text("* He gives you a once over.") -- WIP
            cutscene:text("* Are you hiding something?")
        elseif Game.chapter == 6 then
            cutscene:text("* Were you with him, [wait:5]he would look startled.")
            cutscene:text("* But where exactly are you?")
        else
            cutscene:text("* He wants to feel the warmth of your sun.") -- WIP
            cutscene:text("* Will you let him?")
        end

        local choice = cutscene:choicer({"Yes", "No"})

        if choice == 1 then
            Assets.playSound("egg")
            Game.inventory:addItem("egg")
            if Kristal.is_completion then
                Game:getFlag("eggs")[Game.chapter] = true
            end
            cutscene:text("* You got the Egg.")
        else
            manIsGone()
        end
    else
        manIsGone()
    end
end