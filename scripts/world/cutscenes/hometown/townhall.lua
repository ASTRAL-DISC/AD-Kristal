return {
    receptionist_counter = function(cutscene, event)
        if Game.chapter == 3 then
            if event.interact_count == 1 then
                cutscene:setSpeaker("receptionist")
                cutscene:text("* If you're still looking for\nthe mayor...\n[wait:5]* She's still quite busy.")
                cutscene:text("* Can't have a festival while criminal dogs run around.")
            else
                cutscene:setSpeaker("receptionist")
                cutscene:text("* No, [wait:5]being her neighbor does not grant you a visit.")
                cutscene:text("* She usually schedules those,[wait:5]\nand I'm afraid teens are not on her agenda.")
            end
        elseif Game.chapter == 4 then
            cutscene:setSpeaker("receptionist")
            cutscene:text("* I am terribly sorry, [wait:5]but the mayor is very, [wait:5]very busy.")
            cutscene:text("* And probably in a bad mood. [wait:5]We can hear the air conditioner from here.")
        elseif Game.chapter == 5 then
            if Game:getFlag("seen_mayor") then
                cutscene:setSpeaker("receptionist")
                cutscene:text("* Have you seen the mayor yet? [wait:5]She's not currently accepting visits.")
                cutscene:text("* It's rare to see her do.")
                cutscene:text("* Usually she's stressing herself out over work...")
            else
                cutscene:setSpeaker("receptionist")
                cutscene:text("* Oh! [wait:5]You're here to see the mayor.")
                cutscene:text("* She's accepting visits today. [wait:5]Her daughter was just here.")
            end
        elseif Game.chapter == 6 then
            cutscene:setSpeaker("receptionist")
            cutscene:text("* Good evening! [wait:5]We hope you are enjoying the festival.")
            cutscene:text("* The mayor is quite pleased with our work.")
            cutscene:text("* You can see her, [wait:5]if you'd like! [wait:5]She's in her office.")
        elseif Game.chapter == 7 then
            cutscene:setSpeaker("receptionist")
            cutscene:text("* Hello! [wait:5]Have you come here to place your vote?")
            cutscene:text("* We have wonderful people on the mayor campaign.")
            cutscene:text("* I'm sure you'll make the right choice between the two of them!")
        end
    end,

    receptionist = function(cutscene, event)
        cutscene:setSpeaker(event)
        cutscene:text("* Please do not come behind the counter.")
        cutscene:text("* Good manners, [wait:5]yes? [wait:5]That's important in politics!")
    end,

    politicsbear = function(cutscene, event)
        cutscene:setSpeaker(event)
        if Game.chapter == 3 then
            cutscene:text("* Chapter 3 dialogue placeholder")
        elseif Game.chapter == 4 then
            cutscene:text("* Chapter 4 dialogue placeholder")
        elseif Game.chapter == 5 then
            cutscene:text("* The mayor seems to have something planned for today.")
            cutscene:text("* Which is just normal, [wait:5]since she always has plans.")
            cutscene:text("* Maybe I shouldn't get too into politics... [wait:5]Or else I'll end up like her icy self.")
        elseif Game.chapter == 6 then
            cutscene:text("* Today is the day of the festival.")
            cutscene:text("* Over the past few hours, [wait:5]the mayor came down to refill her coffee jar thrice in a row.")
            cutscene:text("* Becoming a caffeine addict\nseems to be in the job description.")
            cutscene:text("* Now I'm worried for my future.\n[wait:5]* I prefer tea.")
        elseif Game.chapter == 7 then
            cutscene:text("* Look at me now... [wait:5]I'm running for mayor.")
            cutscene:text("* Turns out nearly ending the world puts a stain on your track record...")
            cutscene:text("* Which is why the previous mayor quit.")
            cutscene:text("* ...She would have been impeached soon anyway, [wait:5]but I guess she had to have the last word.")
            cutscene:text("* She was always good at public speeches. [wait:5]I'd freeze up on the spot...")
            cutscene:text("* Hey, [wait:5]don't look at me like that. [wait:5]That hardly matters if you can just smile and wave.")
            cutscene:text("* Thaaaaat's politics!")
        end
    end,

    businessguy = function(cutscene, event)
        local interact_count = event:getFlag("interact_count", 0)
        interact_count = interact_count + 1
        event:setFlag("interact_count", interact_count)
        cutscene:setSpeaker(event)
        if Game.chapter == 3 then
            if interact_count == 1 then
                cutscene:text("* Chapter 3 dialogue placeholder")
            else
                cutscene:text("* Chapter 3 dialogue placeholder.... 2!!!!!!")
            end
        elseif Game.chapter == 4 then
            if interact_count == 1 then
                cutscene:text("* Chapter 4 dialogue placeholder")
            else
                cutscene:text("* Chapter 4 dialogue placeholder.... 2!!!!!!")
            end
        elseif Game.chapter == 5 then
            if interact_count == 1 then
                cutscene:text("* Sorry, [wait:5]kid. [wait:5]To go down these stairs...")
                cutscene:text("* You're gonna have to show a basic understanding of politics first.")
                cutscene:text("* Which is still a little far away from your grasp.")
                cutscene:setSpeaker()
                local choice = cutscene:choicer({"I can do\na salespitch", "I know how\nto lie"})
                if choice == 1 then
                    cutscene:setSpeaker(event)
                    cutscene:text("* What, [wait:5]and not freeze up on the spot?")
                    cutscene:text("* You look like the type who gets nervous by crowds.")
                    cutscene:text("* ...And what would you even be selling?\n[wait:5]* Apple juice?")
                else
                    cutscene:setSpeaker(event)
                    cutscene:text("* You think you're smart, [wait:5]huh, [wait:5]kid?")
                    cutscene:text("* Don't let the mayor catch you saying that!")
                end
            else
                if not Game:getFlag("seen_mayor") then
                    cutscene:setSpeaker(event)
                    cutscene:text("* The mayor is finally open to visits.")
                    cutscene:text("* Why don't you try pestering her instead of me?")
                else
                    cutscene:setSpeaker(event)
                    cutscene:text("* So you've seen the mayor, [wait:5]huh.")
                    cutscene:text("* What's that? [wait:5]Some \"rando\" was\nin the way last time?")
                    cutscene:text("* Nonsense. [wait:5]The town hall\nwelcomes all citizens!")
                    cutscene:text("* ...You're just a teen, [wait:5]though.")
                end
            end
        end
    end,

    blobgal = function(cutscene, event)
        cutscene:setSpeaker(event)
        cutscene:text("* That weird guy who used to hang around... [wait:5]I found out he didn't even work here.")
        cutscene:text("* As a blob, [wait:5]I... [wait:5]don't have much to say about it.")
    end,

    chair = function(cutscene, event)
        cutscene:text("* (It's a chair.)[wait:5]\n* (Maybe it's into politics.)")
    end,

    townmap = function(cutscene, event)
        cutscene:text("* (It's a map of your town. [wait:5]The sepia hues give it a nostalgic mood.)")
    end,

    door1 = function(cutscene, event)
        Assets.playSound("knock")
        cutscene:text("* (Knock knock knock...)")
        cutscene:text("* Hey, dearie~ [wait:5]Kindly take your knocking somewhere else.")
        cutscene:text("* People are trying to work here, [wait:5]ahuhuhu!")
    end,

    window2 = function(cutscene, event)
        cutscene:text("* (You peek through the window.)")
        cutscene:text("* (There's a spider lady playing cards with other tiny spiders.)")
    end,

    door2 = function(cutscene, event)
        Assets.playSound("knock")
        cutscene:text("* (Knock knock knock...)")
        cutscene:text("* (No answer, [wait:5]except for the\nfaint sound of pen to paper.)")
    end,

    door3 = function(cutscene, event)
        Assets.playSound("knock")
        cutscene:text("* (Knock knock knock...)")
        cutscene:text("* (...)")
        cutscene:text("* (This might be the supply closet.)")
    end,

    trash = function(cutscene, event)
        cutscene:text("* (You look through the trash... [wait:10]And find more trash!)")
        cutscene:text("* (Politics themed.)")
    end,

    watercooler = function(cutscene, event)
        cutscene:text("* (The movement of the watercooler's bubbles is hypnotic.)")
    end,

    glasstree = function(cutscene, event)
        cutscene:text("* (A Christmas tree made out of glass.)")
        cutscene:text("* (Looks fragile.)")
    end,

    noelle = function(cutscene, event)
        Assets.playSound("voice/noelle")
        cutscene:wait(cutscene:playSound("voice/noelle"))
        Assets.playSound("voice/noelle")
        cutscene:wait(cutscene:playSound("voice/noelle"))
        Assets.playSound("voice/noelle")
        cutscene:wait(cutscene:playSound("voice/noelle"))
        Assets.playSound("voice/noelle")
        cutscene:wait(cutscene:playSound("voice/noelle"))
        Assets.playSound("voice/noelle")
        cutscene:wait(cutscene:playSound("voice/noelle"))
        Assets.playSound("voice/noelle")
        cutscene:wait(cutscene:playSound("voice/noelle"))
        Assets.playSound("voice/noelle")
        cutscene:wait(0.5)
        cutscene:text("* (You can hear Noelle talking. [wait:5]She sounds upset.)")
    end,

    mayorsoffice = function (cutscene, event)
        Game.world.music:stop()
        local kris = cutscene:getCharacter("kris_lw")
        local comet = cutscene:getCharacter("comet_lw")
        local spawn_x, spawn_y = cutscene:getMarker("noelle")
        local pos_x, pos_y = cutscene:getMarker("comet")
        comet:moveTo(pos_x, pos_y)
        local noelle = Game.world:spawnNPC("noelle_lw", spawn_x, spawn_y)
        noelle:setSprite("sad")
        comet:setSprite("hand_hip")
        cutscene:wait(0.5)
        cutscene:text("* Noelle, [wait:5]what happened yesterday?", "annoyed", comet)
        cutscene:text("* You were gone. [wait:5]This is not at all like you.", "stern", comet)
        cutscene:text("* S-Sorry, [wait:5]Mom... [wait:5]I...", "sad", noelle)
        cutscene:text("* I was at the church...", "sad_side", noelle)
        comet:setSprite("mad_b")
        cutscene:text("* All night, [wait:5]Noelle?", "squint", comet)
        comet:setSprite("hand_hip")
        cutscene:text("* I'm sorry, [wait:5]I...", "sad_b", noelle)
        noelle:setSprite("surprise")
        comet:setSprite("hand_hip_look")
        cutscene:wait(1)
        Game.world.music:play("comet_overworld")
        comet:resetSprite()
        noelle:resetSprite()
        cutscene:setSprite(noelle, "walk_serious")
        noelle:setFacing("down")
        comet:setFacing("down")
        cutscene:text("* ...Oh. [wait:5]Good morning, [wait:5]Kris.", "neutral", comet)
        cutscene:text("* I did not see you there.", "worried_look", comet)
        cutscene:text("* One thing. [wait:5]Next time you and Noelle decide on a nightly getaway...", "stern", comet)
        cutscene:text("* Please be sure to tell your parents where you plan to go.", "annoyed", comet)
        comet:setFacing("left")
        noelle:setFacing("right")
        cutscene:text("* Understood, [wait:5]both of you? [wait:5]Thank you.", "annoyed_b", comet)
        comet:setFacing("up")
        cutscene:text("* Now. [wait:5]You two better get going to school, [wait:5]it's almost time.", "neutral", comet)
        cutscene:text("* And we have a special trip coming soon.", "smile", comet)
        comet:setFacing("left")
        noelle:setFacing("down")
        cutscene:text("* ...\"We\"?", "confused", noelle)
        noelle:setFacing("right")
        cutscene:text("* Mom! [wait:5]You're going, [wait:5]too?", "shock_b", noelle)
        cutscene:text("* Yes.", "neutral", comet)
        cutscene:text("* The purpose of this trip is so I can sign deals on movable rides.", "neutral", comet)
        cutscene:text("* For the festival. [wait:5]\n* I want everything to go perfectly.", "worried_look", comet)
        cutscene:text("* So I got into contact with Ms Alphys...", "neutral", comet)
        cutscene:text("* And let her know of my idea of taking your class along.", "sarcastic", comet)
        noelle:setFacing("down")
        cutscene:text("* That's...", "confused_surprise", noelle)
        cutscene:setSprite(noelle, "walk")
        noelle:setFacing("right")
        cutscene:text("* That's really great, [wait:5]Mom!", "smile_closed", noelle)
        cutscene:text("* I'm sure everyone will enjoy it!", "smile", noelle)
        cutscene:text("* And... [wait:5]um... [wait:5]It's nice that you're coming along too.", "confused_surprise_b", noelle)
        cutscene:setSprite(noelle, "walk_serious")
        noelle:setFacing("down")
        cutscene:text("* Especially since you've been very busy this week...", "confused_surprise", noelle)
        noelle:setFacing("right")
        comet:setSprite("tired")
        cutscene:text("* Well, [wait:5]that's what you get as mayor.", "pained", comet)
        comet:setSprite("side")
        cutscene:text("* I'm always working to make the town a better place, [wait:5]everyday.", "neutral", comet)
        comet:setSprite("side_look")
        cutscene:text("* It's simply the way it is.", "neutral", comet)
        cutscene:text("* I... [wait:5]I know that...", "sad_smile", noelle)
        noelle:setSprite("look_away")
        cutscene:text("* ...", "frown", noelle)
        noelle:resetSprite()
        cutscene:setSprite(noelle, "walk")
        noelle:setFacing("down")
        comet:resetSprite()
        comet:setFacing("down")
        cutscene:text("* Well, [wait:5]Kris, [wait:5]we better get going!", "smile_closed_b", noelle)
        cutscene:text("* Wouldn't want to miss the trip, [wait:5]right?", "smile", noelle)
        cutscene:text("* ...", "frown", noelle)
        noelle:setFacing("up")
        comet:walkPath("comet_path", {time = 2, facing = "down"})
        cutscene:wait(2.5)
        cutscene:setTextboxTop(false)
        cutscene:text("* Yes, [wait:5]now if you'll excuse me...", "neutral", comet)
        comet:setSprite("desk")
        comet.layer = 0.6
        cutscene:text("* I've decided to end the visiting period. [wait:5]You may go now.", "neutral", comet)
        cutscene:wait(0.5)
        noelle:setFacing("down")
        cutscene:setTextboxTop(true)
        cutscene:text("* I'll be on ahead, [wait:5]Kris!", "smile", noelle)
        noelle:walkPath("noelle_path", {time = 2.5, facing = "down"})
        cutscene:wait(3)
        cutscene:text("* (By the way, [wait:5]if we could talk about yesterday's \"dream\"...)", "confused_surprise", noelle)
        cutscene:text("* (It would mean a lot to me. [wait:5]Thank you!)", "smile_closed", noelle)
        cutscene:wait(cutscene:walkTo(noelle, noelle.x, noelle.y + 100, 1.5))
        noelle:remove()
        Assets.playSound("doorclose")
        Game:setFlag("seen_mayor", true)
    end,

    drawers = function(cutscene, event)
        cutscene:text("* (Office drawers, [wait:5]a coffee\nmaker, [wait:5]a mug and...)")
        cutscene:text("* (Brrr!)\n[wait:5]* (The air conditioner is turned up to the max.)")
    end,

    trash2 = function(cutscene, event)
        local interact_count = event:getFlag("interact_count", 0)
        interact_count = interact_count + 1
        event:setFlag("interact_count", interact_count)
        if interact_count == 1 then
            local comet = cutscene:getCharacter("comet_lw")
            cutscene:text("* What are you doing digging in my trash?", "squint", comet)
        else
            local comet = cutscene:getCharacter("comet_lw")
            cutscene:text("* Stop that.", "angry_closed", comet)
        end
    end,

    chair2 = function(cutscene, event)
        cutscene:text("* (A chair.)\n[wait:5]* (This one is definitely into politics.)")
        cutscene:text("* (You wouldn't want to be scrutizined by the mayor's\ngaze here.)")
    end,

    comet = function(cutscene, event)
        local interact_count = event:getFlag("interact_count", 0)
        interact_count = interact_count + 1
        event:setFlag("interact_count", interact_count)
        cutscene:setSpeaker(event)
        if interact_count == 1 then
            event:setSprite("desk_look")
            cutscene:text("* Yes, [wait:5]Kris?", "neutral")
            cutscene:text("* ...", "raised_brow")
            event:setSprite("desk_look_tired")
            cutscene:text("* ...", "what")
            cutscene:text("* Kris, [wait:5]if you don't wish for anything important...", "stern")
            cutscene:text("* Then see yourself out.", "annoyed")
            event:setSprite("desk")
        else
            event:setSprite("desk_look_tired")
            cutscene:text("* Please, [wait:5]I have work to do.", "angry")
            cutscene:text("* I'll see you at school soon enough.", "stern")
            event:setSprite("desk")
        end
    end,

    busy = function(cutscene, event)
        if Game:getFlag("seen_mayor") then
            cutscene:text("* (Maybe you shouldn't disturb her.)")
            local kris = cutscene:getCharacter("kris")
            cutscene:walkTo(kris, kris.x, kris.y + 40, 0.75, "down")
        end
    end,

    nosusie = function(cutscene, event)
        cutscene:text("* (Looks like she won't speak to you...)")
        cutscene:text("* (Come back to this room with [color:yellow]Susie[color:reset].)")
        cutscene:text("* (ONLY Susie, [wait:5]by the way.)")
    end,

    mayorsoffice_ch6 = function (cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        local comet = cutscene:getCharacter("comet_lw")

        cutscene:detachFollowers()

        Game.world.map:getHitbox(11).collidable = false

        local comet_x, comet_y = comet:getRelativePos(0, 0)

        local mask = ColorMaskFX({0.2, 0, 0.2}, 0.6)
        local mask2 = ColorMaskFX({0, 0, 0}, 1)

        local overlay = Sprite("world/hometown/townhall/mayorsoffice_overlay1", 0, 0)
        overlay.alpha = 0.6
        overlay.layer = comet.layer + 1
        Game.world:addChild(overlay)

        if not susie then return end

        local transition = Game.world.map:getEvent("transition_special")
        transition:remove()

        kris:moveTo("kris")
        susie:moveTo("susie")

        Game.world.music:stop()
        cutscene:wait(1)
        cutscene:wait(cutscene:playSound("doorclose"))

        susie:setSprite("walk_unhappy")

        cutscene:wait(cutscene:walkTo(susie, "susie2", 1, "down", false))
        cutscene:wait(cutscene:playSound("doorclose"))
        cutscene:wait(cutscene:walkTo(kris, "kris2", 1, "right", false, "linear", function ()
            susie:setFacing("left")
        end))

        cutscene:wait(0.5)

        susie:setFacing("up")
        kris:setFacing("up")

        cutscene:wait(1)

        cutscene:setSpeaker(susie)
        cutscene:text("* ...", "neutral_side")
        cutscene:text("* Hey, [wait:5]uh...", "neutral")

        cutscene:setSpeaker(comet)
        cutscene:text("* It seems everyone has been enjoying the festival so far.", "neutral")
        cutscene:text("* The attractions, [wait:5]the games, [wait:5]the visitors.", "neutral")
        cutscene:text("* Everything is going exactly as I envisioned it.", "neutral")
        cutscene:text("* It's more than perfect.", "neutral")
        cutscene:text("* I am proud of the town's teamwork and determination.", "smile")

        cutscene:setSpeaker(susie)
        cutscene:text("* ...", "neutral")
        cutscene:text("* I think...[wait:5]\n* You should be more proud of your daughter.", "neutral_side")
        cutscene:text("* She's handling the situation like no one else.", "neutral")
        cutscene:text("* And actually decided to come along and have fun for once.", "neutral")
        cutscene:text("* Because her... [wait:5]Because Rudy asked her to.", "annoyed_down")

        cutscene:setSpeaker(comet)
        cutscene:text("* ... [wait:5]Yes, [wait:5]I am aware.", "neutral")

        comet:setFacing("down")

        cutscene:setSpeaker(susie)
        cutscene:text("* So what are you doing cooped up in here?", "annoyed")
        cutscene:text("* Noelle needs you in her life more than ever.", "annoyed_down")
        cutscene:text("* And I ain't seeing you out there and about.", "annoyed")
        comet:setSprite("walk_mad")
        cutscene:text("* It would do you some good to get out of this damn office for once.", "annoyed")
        
        
        cutscene:wait(cutscene:walkPath(comet, "comet_path2", {time = 1.8, facing = "down"}))

        cutscene:setSpeaker(comet)
        cutscene:text("* ...", "stern")
        comet:setFacing("left")
        cutscene:text("* It's quite funny.", "stern")
        cutscene:text("* Here I thought you were just bringing Noelle down with you...", "annoyed_b")
        comet:setFacing("down")
        cutscene:text("* But you're actually WORRIED about her?", "angry_closed")
        cutscene:text("* And confronting ME?", "annoyed")

        cutscene:setSpeaker(susie)
        cutscene:text("* Hell yeah, I am.", "annoyed")
        cutscene:text("* It seems that the source of all her problems go back to you somehow.", "annoyed")
        cutscene:text("* Your husband is in the goddamn hospital and you don't even visit him!", "angry")
        cutscene:text("* Your daughter feels aimless...", "angry_b")
        cutscene:text("* And keeps waiting for her sister to come home!", "angry_c")

        comet:setSprite("hand_hip_mad")

        cutscene:setSpeaker(comet)
        cutscene:text("* Don't you dare speak about Dess!", "angry")
        cutscene:text("* You know nothing!", "angry")

        susie:setSprite("point_up_1")
        susie:slideTo(susie.x, susie.y - 5, 0.1)
        comet:setSprite("surprised_down")
        comet:slideTo("comet2", 0.1)
        kris:setFacing("right")

        cutscene:setSpeaker(susie)
        cutscene:text("* I know that Noelle is suffering!", "angry_b")

        kris:setFacing("up")

        cutscene:text("* Your family is being torn apart right under your nose!", "angry_b")
        
        susie:setSprite("walk_bangs_unhappy")
        susie:setFacing("right")
        
        cutscene:text("* All this time...", "bangs_neutral")
        cutscene:text("* When all you cared about was keeping a fancy title...", "bangs_neutral")
        cutscene:text("* Everyday, [wait:5]Noelle did her best only to put up a smile.", "bangs_neutral")
        
        susie:setFacing("down")
        
        cutscene:text("* We've all been through hell together, [wait:5]but she...", "bangs_neutral")
        cutscene:text("* ...still tries to look on the bright side.", "bangs_neutral")
        
        susie:setSprite("look_up")
        
        cutscene:text("* Even when sometimes it feels like it isn't worth it.", "bangs_smile")
        cutscene:text("* And still, [wait:5]she keeps mourning her sister's disappearance...", "bangs_neutral")
        cutscene:text("* Now... [wait:5]her dad is...", "bangs_neutral")
        
        susie:setSprite("walk_bangs_unhappy")
        susie:setFacing("down")
        
        cutscene:text("* ...", "bangs_neutral")
        susie:setFacing("up")
        cutscene:text("* It's too much.", "bangs_neutral")
        cutscene:text("* ...", "bangs_neutral")
        cutscene:text("* What I'm saying is...", "bangs_smile")

        susie:setSprite("point_up_1")
        susie:shake(2)
        Assets.playSound("wing")

        cutscene:text("* Can't you just lay off the damn politics and start being her mother?!", "angry_c")

        susie:setSprite("walk_unhappy")
        susie:setFacing("up")

        cutscene:wait(3)

        comet:setSprite("walk_tired")
        comet:setFacing("up")

        cutscene:setSpeaker(comet)
        cutscene:text("* ...", "pained")
        comet:setFacing("down")
        cutscene:text("* ... [wait:5]Yes. [wait:5]You are right.", "neutral")

        cutscene:setSpeaker(susie)
        cutscene:text("* And another thing--!![wait:5]", "angry", susie, {auto = true})
        cutscene:text("* ", "shock")

        susie:setFacing("right")

        cutscene:text("* Wait, [wait:5]I am?", "surprise")

        susie:setFacing("up")

        cutscene:setSpeaker(comet)
        comet:setFacing("up")
        cutscene:text("* To a certain extent, [wait:5]yes.", "neutral")
        cutscene:text("* I plan to undo my wrongdoings as a mother...", "stern")
        cutscene:text("* And make sure our family is brought together again.", "stern")

        cutscene:setSpeaker(susie)
        cutscene:text("* Uh... [wait:5]That's... [wait:5] great?", "nervous")
        susie:setFacing("left")
        kris:setFacing("right")
        cutscene:text("* (Psst, [wait:5]hey Kris... [wait:5]I didn't expect THIS.)", "shy_b")

        susie:setFacing("up")
        kris:setFacing("up")

        cutscene:setSpeaker(comet)
        cutscene:text("* Yes, [wait:5]that's why...", "pained")
        cutscene:text("* [wait:10][speed:0.7]I pray for my wish to be heard.", "angry_closed")
        comet:setSprite("fountain/scissor_hold")

        cutscene:setSpeaker(susie)
        susie:walkTo("susie2", 1, "up", true)
        cutscene:wait(1)
        cutscene:text("* [wait:5]Huh?", "shock")

        cutscene:setSpeaker(comet)
        cutscene:text("* [speed:0.7]Hear me, [wait:5]Angel.", "angry_closed")

        cutscene:setSpeaker(susie)
        cutscene:text("* Whoa whoa whoa hey--", "surprise_frown", {auto = true})

        -- FOUNTAIN OPENING
        comet.layer = comet.layer + 25
        susie.layer = comet.layer + 1
        kris.layer = comet.layer + 1
        susie:addFX(mask)
        kris:addFX(mask)
        comet:addFX(mask)
        local x, y = cutscene:getMarker("fountain")
        comet:setAnimation("fountain/jump")

        local flash_vfx = true
        local flash_vfx2 = false
        local flash_vfx_timer = 0
        Game.world.timer:every(1/30, function()
            if flash_vfx2 then
                flash_vfx2 = false
            else
                Assets.playSound("fountain_target")
                flash_vfx_timer = flash_vfx_timer + 1
                local flash = Sprite("effects/fountainmake/flash", comet_x - 40 + flash_vfx_timer * 6, comet_y + 10 + Utils.random(20))
                flash:setScale(2)
                flash:setOriginExact(6, 6)
                flash:setAnimation({"effects/fountainmake/flash", 1/15, false, callback=function(sprite)
                    sprite:remove()
                end})
                flash:setLayer(comet.layer - 1)
                Game.world:addChild(flash)
            end
            return flash_vfx
        end)
        cutscene:wait(1/3)
        flash_vfx2 = true
        cutscene:wait(1/30)
        cutscene:wait(1/3)
        flash_vfx = false
    
        do
            local fmake = Assets.playSound("fountain_make", 1, DT/BASE_DT)
            cutscene:during(function ()
                if not fmake:isPlaying() then return false end
                fmake:setPitch(DT/BASE_DT)
            end)
        end
        comet:removeFX(mask)
        comet:setAnimation("fountain/stab")
        susie:removeFX(mask)
        kris:removeFX(mask)
        kris:addFX(mask2)
        susie:addFX(mask2)

        susie:setSprite("shock_behind_left")
        overlay:remove()

        local fmpillar = Game.world:spawnObject(FMPillar(x, y), comet.layer - 1)
        Game.world.timer:tween(1, fmpillar, {mult = 3/3}, "out-elastic")

        local beamglow = Sprite("effects/fountainmake/beam_glow", x, y - 20)
        beamglow:setScale(2)
        beamglow.alpha = 0.8
        beamglow:setOrigin(0.5, 0)
        beamglow:setLayer(fmpillar.layer - 1)
        Game.world:addChild(beamglow)

        local every = Game.world.timer:every(5/30, function()
            local afterimage = AfterImage(beamglow, 0.4)
            afterimage.graphics.grow = 0.2
            afterimage:setLayer(beamglow.layer + 1)
            beamglow:addChild(afterimage)
        end)

        local bg = Sprite("effects/fountainmake/office_overlay", 0, 0)
        bg:setScale(2)
        bg.alpha = 0
        bg:setLayer(comet.layer - 24)
        Game.world:addChild(bg)

        Game.world.timer:tween(0.4, bg, {alpha = 1}, "out-quint")

        cutscene:wait(1)

        Assets.playSound("closet_impact")
        Assets.stopSound("fountain_make")
        do
            local neofmake = Assets.playSound("neo_fountain_make", 1, DT/BASE_DT)
            cutscene:during(function ()
                if not neofmake:isPlaying() then return false end
                neofmake:setPitch(DT/BASE_DT)
            end)
        end
        comet:setAnimation("fountain/stab_b")
        cutscene:shakeCamera(2)
        Game.world.timer:tween(1, fmpillar, {mult = 4/3}, "out-elastic")
        local fmeffect = Game.world:spawnObject(FMEffect(x, y), comet.layer - 1)

        local every2 = Game.world.timer:every(5/30, function()
            Assets.playSound("ding", 0.2, 0.5 + Utils.random(0.3))
            Game.world:spawnObject(FMParticle(x, y), comet.layer + 1)
        end)

        cutscene:wait(1)
        fmeffect:remove()

        Assets.playSound("closet_impact", 1, 0.8)
        Assets.stopSound("neo_fountain_make")
        do
            local darkerfmake = Assets.playSound("darker_fountain_make", 1, DT/BASE_DT)
            cutscene:during(function ()
                if not darkerfmake:isPlaying() then return false end
                darkerfmake:setPitch(DT/BASE_DT)
            end)
        end
        comet:setAnimation("fountain/stab_c")
        cutscene:shakeCamera(4)
        Game.world.timer:tween(1, fmpillar, {mult = 5/3}, "out-elastic")
        local fmeffect = Game.world:spawnObject(FMEffect(x, y), comet.layer - 1)

        local every3 = Game.world.timer:every(8/30, function()
            Assets.playSound("ding", 0.2, 0.4 + Utils.random(0.3))
            local particle = Game.world:spawnObject(FMParticle(x, y), comet.layer + 1)
            particle.color = COLORS.gray
        end)

        local function createRubble(x, y)
            local rubble = Sprite(Utils.pick({"effects/fountainmake/rubble", "effects/fountainmake/rubble_b"}), x, y)
            rubble:setScale(2)
            rubble:addFX(mask2)
            rubble.physics.speed_y = 30 + Utils.random(2)
            rubble.physics.gravity = 2 + Utils.random(0.06)
            rubble.graphics.spin = 0.2 + Utils.random(1)
            rubble:setOrigin(0.5, 0.5)
            rubble:setLayer(fmpillar.layer + 1)
            Game.world:addChild(rubble)
            Assets.playSound("wing", 0.8, (0.5 + Utils.round(Utils.random(1), 0.2)))
        end

        local rx, ry
        for i = 1, 5 do
            rx, ry = cutscene:getMarker("rubble" .. i)
            Game.world.timer:script(function (wait)
                local every4 = Game.world.timer:every(10/30, function ()
                    createRubble(rx, ry)
                end)
                wait(20/30)
                Game.world.timer:cancel(every4)
            end)
            createRubble(rx, ry)
        end

        local invert = Sprite("npcs/lightners/comet/light/fountain/invert", 215, 184)
        invert:setScale(2)
        invert.alpha = 0
        invert:play(1/15, true)
        invert:setLayer(comet.layer + 1)
        Game.world:addChild(invert)

        local old = invert.update
        invert.update = function(self)
            old(self)
            self.alpha = math.min(fmpillar.inverttimer / 60, 1)
        end
        cutscene:wait(6.88)

        local overlay2 = Sprite("world/hometown/townhall/mayorsoffice_overlay2", 0, 0)
        overlay2.alpha = 0.6
        overlay2.layer = 720
        Game.world:addChild(overlay2)

        Game.world.timer:cancel(every)
        Game.world.timer:cancel(every2)
        Game.world.timer:cancel(every3)
        beamglow:fadeOutAndRemove()
        fmeffect:remove()
        invert:remove()

        Game.world.timer:tween(0.4, bg, {alpha = 0}, "out-quint")

        comet:setSprite("fountain/stab_end_darkened")
        kris:removeFX(mask2)
        susie:removeFX(mask2)

		comet.layer = 700
        kris.layer = 700
        susie.layer = 700
        local fmballs = {}
        local timer = Game.world.timer:every(1/30, function()
            table.insert(fmballs, Game.world:spawnObject(FMBall(x, y), 700))
        end)

        local snd = Assets.playSound("atmosphere")
        snd:setLooping(true)
        snd:setVolume(1)

        cutscene:wait(2)

        susie:setSprite("walk_unhappy")
        susie:setFacing("up")

        for _,particle in ipairs(Game.stage:getObjects(FMParticle)) do
            particle:fadeOutAndRemove()
        end
        for _,particle in ipairs(Game.world.stage:getObjects(FMParticle)) do
            particle:fadeOutAndRemove()
        end

        cutscene:wait(7)
        fmpillar:remove()

        local ball_col_check = true
        cutscene:during(function()
            if not ball_col_check then return false end
    
            Object.startCache()
            for _,other in ipairs(Game.world.stage:getObjects(FMBall)) do
                if other:collidesWith(comet) then
                    assert(other.type ~= FMBall.TYPES.back)
                    local scale = 2
                    other.physics.speed_x = other.physics.speed_x + (-4 + Utils.random(8)) * scale
                    other.physics.speed_y = other.physics.speed_y - (Utils.random(3)) * scale
                    other.back.physics.speed_x = other.physics.speed_x
                    other.back.physics.speed_y = other.physics.speed_y
                end
            end
            Object.endCache()
        end)

        comet:setSprite("fountain/jump_1")
        comet.physics.speed_y = -16
        comet.physics.gravity = 1
        cutscene:wait(function() return comet.y >= 320 end)
        ball_col_check = false
        comet.physics.speed_y = 0
        comet.physics.gravity = 0
        comet:setSprite("fountain/stab_end")

        cutscene:wait(2)
        cutscene:setSpeaker(susie)
        cutscene:text("* ...", "shock")
        cutscene:text("* Is... [wait:5]Is that a Dark Fountain?", "surprise_frown")

        kris.visible = false
        susie:setAnimation("shake_kris")
        susie.actor.offsets["shake_kris"] = {-10, -2}

        cutscene:text("* Kris!!! [wait:5]Did the mayor really just open a Dark Fountain??", "teeth")

        susie:setSprite("walk_unhappy")
        susie:setFacing("up")
        kris.visible = true

        cutscene:setSpeaker(comet)
        cutscene:text("* [speed:0.8]I see you know of them.")
        cutscene:text("* [speed:0.8]Your foolish escapades into the Dark Worlds...")
        cutscene:text("* [speed:0.8]...aren't as well concealed as you think they are.")

        cutscene:setSpeaker(susie)
        cutscene:text("* How did you find out?", "angry")
        cutscene:text("* Just who the hell are you?!", "angry_c")

        local time = 1
        local volume = 1
        local lerp = 0

        Game.world.timer:during(1, function()
            lerp = Utils.approach(lerp, 1, DT/time) -- make the lerp approach 1 over the course of 'time'
            snd:setVolume(Utils.lerp(volume, 0, lerp))
        end)

        cutscene:wait(2)
        Assets.stopSound("atmosphere")

        local tundra = TundraDarkBG(0, 0)
        local comet2

        local blindsopen = Game.world.map:getImageLayer("bg2")
        local blindsclosed = Game.world.map:getImageLayer("bg2")

        local function createSusieDW(sprite, spx, spy)
            local spr = Sprite("party/susie/dark/" .. sprite, spx, spy)
            spr:setScale(2)
            spr.layer = 720
            spr:setOrigin(0.5, 0.5)
            Game.world.timer:script(function(wait)
                while true do
                    Game.world.timer:tween(1, spr, {alpha = 0}, "linear")
                    Game.world.timer:tween(1, susie, {alpha = 1}, "linear")
                    wait(1)
                    Game.world.timer:tween(1, spr, {alpha = 1}, "linear")
                    Game.world.timer:tween(1, susie, {alpha = 0}, "linear")
                    wait(1)
                end
            end)
            Game.world:addChild(spr)
            return spr
        end

        local function createKrisDW(sprite, spx, spy)
            local spr = Sprite("party/kris/dark/" .. sprite, spx, spy)
            spr:setScale(2)
            spr.layer = 720
            spr:setOrigin(0.5, 0.5)
            Game.world.timer:script(function(wait)
                while true do
                    Game.world.timer:tween(1, spr, {alpha = 0}, "linear")
                    Game.world.timer:tween(1, kris, {alpha = 1}, "linear")
                    wait(1)
                    Game.world.timer:tween(1, spr, {alpha = 1}, "linear")
                    Game.world.timer:tween(1, kris, {alpha = 0}, "linear")
                    wait(1)
                end
            end)
            Game.world:addChild(spr)
            return spr
        end

        cutscene:text("* I [wait:15][func:reveal][facec:comet_dw/neutral,-28,-18][wait:4s]am the [color:green]Roaring Knight[color:reset].", "angry_closed", comet, {
            functions = {
                reveal = function()
                    Game.world.timer:script(function(wait)
                        overlay2:fadeOutAndRemove()
                        cutscene:fadeOut(1, {color = COLORS.white})
                        wait(2)
                        Game.world:spawnObject(tundra, 730)

                        blindsopen.visilble = false
                        blindsclosed.visible = false
    
                        comet.visible = false
                        comet:moveTo("comet3")

                        createKrisDW("walk/up", 285, 346)
                        createSusieDW("walk/up", 355, 340)

                        local cx, cy = cutscene:getMarker("comet3")
                        comet2 = cutscene:spawnNPC("comet", cx, cy, {facing = "down"})
                        comet2.layer = susie.layer

                        cutscene:fadeIn(0.2, {color = COLORS.white})
                        cutscene:shakeCamera(5)
                        Assets.playSound("punchheavythunder")
                        wait(0.3)
                        Assets.playSound("scissorbell")
                        comet2:setAnimation("glow", function ()
                            comet2:setAnimation("wind")
                        end)
                    end)
                end
            }
        })

        Game.world.music:play("knight_tense")
        local sx, sy = cutscene:getMarker("susie")
        local kx, ky = cutscene:getMarker("kris")

        cutscene:wait(1)

        cutscene:setSpeaker(susie)
        cutscene:text("* ...[wait:5]The Knight? [wait:5]YOU are the Knight??", "angry")

        --[[local cover = Game.world:spawnObject(FMScreenCover(), 1000)
        cutscene:wait(15)

        cutscene:wait(2)
        overlay2:remove()

        Game.world.timer:cancel(timer)
        for _,fmball in ipairs(Game.stage:getObjects(FMBall)) do
            fmball:remove()
        end
        for _,fmball in ipairs(Game.world.stage:getObjects(FMBall)) do
            fmball:remove()
        end]]
    end,
}