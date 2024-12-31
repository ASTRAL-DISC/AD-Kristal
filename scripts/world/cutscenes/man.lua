return {
    ch3 = function(cutscene, event)
        if Game.chapter == 3 then
            if not Game:getFlag("ch3_eggman") then
                Game:setFlag("ch3_eggman", true)
                cutscene:text("* Well, there is a man here.")
                cutscene:text("* He seems to wonder if you're feeling okay.")
                cutscene:text("* Is there truly anything on your mind?")
                local choice = cutscene:choicer({"Yes", "No"})
                if choice == 1 then
                    Assets.playSound("egg")
                    Game.inventory:addItem("egg")
                    cutscene:text("* You got the Egg.")
                else
                    cutscene:text("* Well, there was not a man here.")
                end
            else
                cutscene:text("* Well, there was not a man here.")
            end
        end
    end,
    ch4 = function(cutscene, event)
        if Game.chapter == 4 then
            if not Game:getFlag("ch4_eggman") then
                Game:setFlag("ch4_eggman", true)
                cutscene:text("* Well, there is a man here.")
                cutscene:text("* He greets you politely.")
                cutscene:text("* How are you?")
                local choice = cutscene:choicer({"Yes", "No"})
                if choice == 1 then
                    Assets.playSound("egg")
                    Game.inventory:addItem("egg")
                    cutscene:text("* You got the Egg.")
                else
                    cutscene:text("* Well, there was not a man here.")
                end
            else
                cutscene:text("* Well, there was not a man here.")
            end
        end
    end,
    ch5 = function(cutscene, event)
        if Game.chapter == 5 then
            if not Game:getFlag("ch5_eggman") then
                Game:setFlag("ch5_eggman", true)
                cutscene:text("* Well, there is a man here.")
                cutscene:text("* He gives you a once over.")
                cutscene:text("* Are you hiding something?")
                local choice = cutscene:choicer({"Yes", "No"})
                if choice == 1 then
                    Assets.playSound("egg")
                    Game.inventory:addItem("egg")
                    cutscene:text("* You got the Egg.")
                else
                    cutscene:text("* Well, there was not a man here.")
                end
            else
                cutscene:text("* Well, there was not a man here.")
            end
        end
    end,
    ch6 = function(cutscene, event)
        if Game.chapter == 6 then
            if not Game:getFlag("ch6_eggman") then
                Game:setFlag("ch6_eggman", true)
                cutscene:text("* Well, there is a man here.")
                cutscene:text("* He looks startled by your presence.")
                cutscene:text("* Did he expect you to be here so soon?")
                local choice = cutscene:choicer({"Yes", "No"})
                if choice == 1 then
                    Assets.playSound("egg")
                    Game.inventory:addItem("egg")
                    cutscene:text("* You got the Egg.")
                else
                    cutscene:text("* Well, there was not a man here.")
                end
            else
                cutscene:text("* Well, there was not a man here.")
            end
        end
    end,
    ch7 = function(cutscene, event)
        if Game.chapter == 7 then
            if not Game:getFlag("ch7_eggman") then
                Game:setFlag("ch7_eggman", true)
                cutscene:text("* Well, there is a man here.")
                cutscene:text("* He wants to feel the warmth of your sun.")
                cutscene:text("* Will you let him?")
                local choice = cutscene:choicer({"Yes", "No"})
                if choice == 1 then
                    cutscene:text("* Well, [wait:5]it is done.")
                    Assets.playSound("egg")
                    Game.inventory:addItem("egg")
                    cutscene:text("* You got the Egg.")
                else
                    cutscene:text("* Well, there won't be a man here.")
                    cutscene:text("* You did it.")
                end
            else
                cutscene:text("* Well, there won't be a man here.")
                cutscene:text("* It seems you've lost something.")
            end
        end
    end,
}