return {
    home = function(cutscene)
        Assets.playSound("phone", 0.7)
        cutscene:text("* (Ring, [wait:5]ring...)")
        if Game.world:getCellFlag("cell.home", 0) > 0 then
            cutscene:text("* (No one picked up.)")
        else
            if Game.chapter == 3 then
                cutscene:setSpeaker("toriel_lw")
                cutscene:text("* Yes, [wait:5]Kris, [wait:5]honey?", "neutral")
                cutscene:text("* I know, [wait:5]the situation is upsetting, [wait:5]but...", "worried")
                cutscene:text("* We will figure it out! [wait:5]Do not worry.", "glad")
                cutscene:text("* I am currently with officer Napstablook, [wait:5]so we can do something about the car.", "excited")
                cutscene:text("* I just wish you and Susie would not have left the house so suddenly...", "worried")
                cutscene:text("* We will have a talk when you come back.", "angry")
                cutscene:text("* Be safe out there, [wait:5]alright? [wait:5]If anything arises, [wait:5]call.", "worried")
                cutscene:text("* Love you, [wait:5]honey. [wait:5]See you soon...", "glad")
                --[[if Game.world.map.id:find("hometown/school/") then
                    cutscene:text("* ... [wait:5]No? [wait:5]You are at school already?", "worried")
                    cutscene:text("* Ah, [wait:5]perfect. [wait:5]Thank you for dropping those off.", "glad")
                    cutscene:text("* If you want to rest before school, [wait:5]make sure to come home quick!", "neutral")
                    cutscene:text("* No? [wait:5]You would rather be with your friends?", "blush")
                    cutscene:text("* Ah, [wait:5]I see! [wait:5]Feel free to hang out with them!", "excited")
                    cutscene:text("* But do remember you all have to go to class soon.", "unimpressed")
                    cutscene:text("* Love you, [wait:5]honey. [wait:5]I will see you after school.", "glad")
                else
                    cutscene:text("* ... [wait:5]No? [wait:5]You are... [wait:5]hanging out?", "worried")
                    cutscene:text("* Ah, [wait:5]forgive me, [wait:5]Kris!", "blush")
                    cutscene:text("* I would not want to be in the middle of that...", "happy")
                    cutscene:text("* Just make sure to go to class as soon as you are done!", "glad")
                    cutscene:text("* Do not be late, [wait:5]of course.", "unimpressed")
                    cutscene:text("* Love you, [wait:5]honey. [wait:5]I will see you after school.", "glad")
                end]]
                cutscene:setSpeaker()
                cutscene:text("* (Click...)")
            end
        end
    end,
    him = function(cutscene)
        Game.world.music:pause()
        cutscene:during(function ()
            if Game.world.cutscene.textbox.box.visible then
                Game.world.cutscene.textbox.box.visible = false
            end
        end)

        local black = Rectangle(0, 0, Game.world.width, Game.world.height)
        black:setColor(COLORS.black)
        black.alpha = 1
        Game.world:spawnObject(black, "below_ui")

        Assets.playSound("phone", 0.7)
        cutscene:text("* (Ring, [wait:5]ring...)")
        if Game.world:getCellFlag("cell.him", 0) > 0 then
            cutscene:text("* (No one picked up.)")
        else
            cutscene:wait(1)

            local GSTYLE = "[speed:0.4][spacing:6][style:GONER]"
            cutscene:setSpeaker("gaster")

            cutscene:text(GSTYLE .."[wait:80]TESTING WILL COMMENCE", "apathy")
            cutscene:text(GSTYLE .."IN THREE\n[wait:40]TWO\n[wait:80]ONE[wait:10].", "apathy")
            cutscene:text(GSTYLE .."...", "insensitivity")
            cutscene:text(GSTYLE .."... [wait:40]ARE YOU THERE?", "taciturn")
            cutscene:text(GSTYLE .."YES, [wait:40]OF COURSE.\n[wait:40]OF COURSE YOU ARE.", "aloof")
            cutscene:text(GSTYLE .."DESPITE ALL ODDS,\n[wait:40]HOW HAVE YOU BEEN?", "wistful")
            cutscene:text(GSTYLE .."... PERHAPS\n[wait:40]NOT THE MOST ADEQUATE QUESTION.", "euphoria")
            cutscene:text(GSTYLE .."APOLOGIES FOR PULLING YOU OUT OF YOUR...", "choleric")
            cutscene:text(GSTYLE .."COMFORT ZONE.", "apathy")
            cutscene:text(GSTYLE .."THE FACT YOU CAN CALL IT \"COMFORT\" IS [wait:40]INTRIGUING.", "wistful")
            cutscene:text(GSTYLE .."PLEASE [wait:40]DO NOT LOOK SO SULLEN.", "insensitivity")
            cutscene:text(GSTYLE .."I'D LIKE TO SHARE SOMETHING WITH YOU.", "euphoria")
            cutscene:text(GSTYLE .."BUT...", "aloof")
            cutscene:text(GSTYLE .."I WORRY.", "worry")

            cutscene:wait(6)

            cutscene:setSpeaker()
            cutscene:text("* (Click...)")
            black:fadeOutAndRemove(1)
            Game.world.music:resume()
        end
    end,
}