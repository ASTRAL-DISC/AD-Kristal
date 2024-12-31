return {
    savepoint = function(cutscene, event)
        cutscene:text("* (You are filled with a certain power...)")
    end,
    manual = function(cutscene, event)
        cutscene:text("* (It's a manual. Read a topic?)")
        local tip = cutscene:choicer({"Recruits", "Item storage", "Controls", "Do not read"})

        if tip == 1 then
            cutscene:text("* If you SPARE or PACIFY enough enemies of the same type,[wait:5] they will be RECRUITed.")
            cutscene:text("* RECRUITs will appear in your TOWN. Wonder what happens if you get them all...?")
            cutscene:text("* You can check the area's RECRUIT status at SAVE POINTS. Certain BOSSES are excluded.")
        elseif tip == 2 then
            cutscene:text("* You will now have access to a STORAGE menu at SAVE POINTS.")
            cutscene:text("* When you're out of space,[wait:5] ITEMs you find or BUY will be sent to your STORAGE.")
            cutscene:text("* Feel free to put things inside you might not be able to use yet.")
        elseif tip == 3 then
            cutscene:text("* Here is a reminder of the controls. Change them in the config menu.")
            cutscene:text(string.format("* %s\n* Confirm and interact with things.", Input.getText("confirm")))
            cutscene:text(string.format("* %s\n* Cancel. Hold to RUN. Shows all text instantly.", Input.getText("cancel")))
            cutscene:text(string.format("* %s\n* Opens the menu. Hold down to quickly skip textboxes.", Input.getText("menu")))
        else
            cutscene:text("* (There's no time to read books.)")
        end
    end,
    fountain = function(cutscene, event)
        cutscene:text("* A fountain. [wait:5]An iridescent liquid flows through.")
        cutscene:text("* It's strangely satisfying to watch.")
    end,
    fountain_sign = function(cutscene, event)
        cutscene:text("* \"Welcome to "..Game.save_name.."TOWN!\"")
    end,
    wayfer = function(cutscene, event)
        local interact_count = event:getFlag("interact_count", 0)
        interact_count = interact_count + 1
        event:setFlag("interact_count", interact_count)
        if interact_count == 1 then
            cutscene:setSpeaker(event)
            cutscene:text("* Call me Wayfer. [wait:5]Wine baths are good for the health.")
            cutscene:text("* Gotta get the..... [wait:10]JUICE!!!")
        else
            cutscene:setSpeaker(event)
            cutscene:text("* Today I've heard of something called a \"[color:yellow]Credits Sequence[color:reset]\".")
            cutscene:text("* Does it have any [wait:10]JUICE?")

            Game.world.music:pause()
            local black = Rectangle(0, 0, Game.world.width, Game.world.height)
            black:setColor(0, 0, 0)
            black.alpha = 0
            Game.world:spawnObject(black, "below_ui")
            Game.world.timer:tween(1, black, {alpha = 1})

            cutscene:wait(2)

            local theme = "ch3_credits"
            local credits = CreditsTest(theme)
            credits:setLayer(black.layer + 1)
            Game.world:addChild(credits)
            cutscene:wait(function() return credits:isRemoved() end)

            black:fadeOutAndRemove(1)
            cutscene:wait(1)
            Game.world.music:resume()
            Game:setBorder("castle")
            cutscene:text("* How was that for JUICE?!")
        end
    end,
    jewel = function(cutscene, event)
        cutscene:setSpeaker(event)
        cutscene:text("* We're still working on the jewel shop, [wait:5]sorry!")
        cutscene:text("* Maybe you can enter it in a different chapter of life...?")
    end,
    drizzly = function(cutscene, event)
        cutscene:setSpeaker(event)
        cutscene:text("* ...")
        cutscene:text("* ... [wait:5]Who are you?")
    end,
}