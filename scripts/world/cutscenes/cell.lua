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
        Game:setDepths(true)
        Game.world.music:pause()

        local black = Rectangle(0, 0, Game.world.width, Game.world.height)
        black:setColor(COLORS.black)
        black.alpha = 1
        Game.world:spawnObject(black, "below_ui")

        cutscene:wait(2)

        cutscene:wait(cutscene:playSound("phone", 0.7, 0.8))
        cutscene:text("* ... [wait:5]?\n[wait:10]* There's the phone.")
        cutscene:text("* Instinctively, [wait:5]you reach for your pocket.")
        cutscene:text("* But you did not have a phone with you.")

        cutscene:wait(0.5)

        cutscene:wait(cutscene:playSound("phone", 0.7, 0.8))
        cutscene:text("* ... [wait:5]?\n[wait:10]* There's the phone.")
        cutscene:text("* Instinctively, [wait:5]you search your hands.")
        cutscene:text("* But they were only grasping at nothing.")

        cutscene:wait(0.5)

        cutscene:wait(cutscene:playSound("phone", 0.7, 0.78))
        cutscene:text("* ... [wait:5]?\n[wait:10]* There's the phone.")
        cutscene:text("* This time, [wait:5]it echoes inside your heart.")
        cutscene:text("* It hurts.")
        cutscene:text("* But through the pain,")
        cutscene:text("* you take a deep breath,")
        cutscene:text("* [wait:10]and answer it genuinely.")
        if Game.world:getCellFlag("cell.him", 0) > 0 then
            cutscene:text("* (No one picked up.)")
        else
            cutscene:wait(2)

            local GSTYLE = "[speed:0.4][spacing:6][style:GONER]"
            cutscene:setSpeaker("gaster")

            cutscene:text(GSTYLE .." ", "apathy")
            --[[cutscene:text(GSTYLE .."... [wait:40]ARE YOU THERE?", "taciturn")
            cutscene:text(GSTYLE .."...", "vacillation")

            cutscene:text(GSTYLE .."YES, [wait:40]OF COURSE.\n[wait:40]OF COURSE YOU ARE.", "aloof")
            cutscene:text(GSTYLE .."THERE IS A REASON\n[wait:40]I CONTACTED YOU.", "insensitivity")
            cutscene:text(GSTYLE .."JUST AS THERE IS A REASON [wait:40]YOU ANSWERED.", "insensitivity")]]

            cutscene:text(GSTYLE .."[wait:40][color:green][6[wait:20]/4[wait:20]/2[wait:5]0[wait:5]2[wait:5]5]", "aloof")
            cutscene:text(GSTYLE .."IN [wait:40][color:green][2[wait:20]3][color:reset] [wait:40]DAYS,", "vacillation")
            cutscene:text(GSTYLE .."YOU WILL SEE SOMETHING\n[wait:40]QUITE WONDERFUL.", "euphoria")
            cutscene:text(GSTYLE .."MY HANDS TREMBLE[wait:40]\nWITH EXCITEMENT.", "choleric")
            cutscene:text(GSTYLE .."PERHAPS THIS FEELING IS [wait:40]SHARED BY MILLIONS?", "contempt")

            cutscene:text(GSTYLE .."...", "taciturn")

            --[[cutscene:text(GSTYLE .."DESPITE ALL ODDS,\n[wait:40]HOW HAVE YOU BEEN?", "wistful")
            cutscene:text(GSTYLE .."... PERHAPS.\n[wait:40]THIS QUESTION IS [wait:40]UNWARRANTED.", "choleric")
            cutscene:text(GSTYLE .."HOWEVER, I FEEL\n[wait:40]INCLINED TO ASK IT.", "trepidation")
            cutscene:text(GSTYLE .."[wait:40]THERE IS [wait:40]AN ODD COMFORT [wait:40]IN UNCHANGING SCENERY.", "wistful")
            cutscene:text(GSTYLE .."PERHAPS. [wait:40]THE FEELING OF KNOWING THAT PLACE", "euphoria")
            cutscene:text(GSTYLE .."KNOWING IT WILL\n[wait:40]NEVER BETRAY YOU.", "euphoria")
            cutscene:text(GSTYLE .."AN ISLAND\n[wait:40]UNTO YOURSELF.", "ire")
            cutscene:text(GSTYLE .."[wait:80]A STATE OF PURE\n[wait:40]IGNORANT\n[wait:40]BLISS.", "wistful")
            cutscene:text(GSTYLE .."NO MATTER WHAT IS HAPPENING OUTSIDE THESE WALLS,", "vacillation")
            cutscene:text(GSTYLE .."OR THE LACK OF THEM.", "aggravation")

            cutscene:text(GSTYLE .."HOWEVER.", "trepidation")
            cutscene:text(GSTYLE .."YOUR WORLD IS NEVER SO UNCHANGING.", "trepidation")
            cutscene:text(GSTYLE .."NO MATTER HOW MUCH [wait:40]YOU'VE WANTED IT TO BE.", "ire")
            cutscene:text(GSTYLE .."ON SLEEPLESS NIGHTS\n[wait:40]ON DORMANT DAYS.", "taciturn")
            cutscene:text(GSTYLE .."IT IS DIZZYING IN WAYS I CANNOT COMPREHEND.", "worry")
            cutscene:text(GSTYLE .."MAKE ME UNDERSTAND.", "aggravation")
            cutscene:text(GSTYLE .."THIS EXHILARATION [wait:40]YOU FEEL", "contempt")
            cutscene:text(GSTYLE .."IT IS THE SAME\n[wait:40]AS MINE.", "vacillation")
            cutscene:text(GSTYLE .."BUT WE LOOK THROUGH [wait:40]DIFFERENT LENSES.", "aloof")
            cutscene:text(GSTYLE .."WHAT YOU HAVE\n[wait:40]IS NOT ENOUGH.", "trepidation")
            cutscene:text(GSTYLE .."WHAT I HAVE", "aggravation")]]

            --cutscene:text(GSTYLE .."", "taciturn")

            cutscene:text(GSTYLE .."WHEN THAT DAY COMES, [wait:40]REMEMBER", "wistful")
            cutscene:text(GSTYLE .."YOU DESERVE\n[wait:40]TO REST.", "ire")
            cutscene:text(GSTYLE .."MISERY, [wait:40]MISFORTUNE. [wait:40]THEY WILL TAKE THEIR LEAVE.", "trepidation")
            cutscene:text(GSTYLE .."EVERY STEP YOU TAKE\n[wait:40]AT YOUR HEART'S EVERY PULSE", "worry")
            cutscene:text(GSTYLE .."IF YOU WISH FOR EVEN A HINT OF SAFETY", "aggravation")
            cutscene:text(GSTYLE .."THEN THAT WISH\n[wait:40]WILL BE MADE VALID.", "wistful")
            cutscene:text(GSTYLE .."[wait:80]IT IS WAITING.", "euphoria")

            cutscene:wait(3)

            cutscene:setSpeaker()
            cutscene:text("* (Click...)")

            cutscene:wait(3)
            Game:setDepths(false)
            black:fadeOutAndRemove(1)
            Game.world.music:resume()
        end
    end,
}