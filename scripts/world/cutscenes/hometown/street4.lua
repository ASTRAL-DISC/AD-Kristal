return {
    wrongway = function(cutscene, event)
        cutscene:text("* (Not the right way.)")
    end,
    scarflady = function(cutscene, event)
        cutscene:setSpeaker(event)
        cutscene:text("* I hear the Mayor is going out today. [wait:5]How delightful!")
        cutscene:text("* Personally, [wait:5]I hate politicians, [wait:5]but...")
    end,
    flanneldemon = function(cutscene, event)
        local interact_count = event:getFlag("interact_count", 0)
        interact_count = interact_count + 1
        event:setFlag("interact_count", interact_count)
        if interact_count == 1 then
            cutscene:setSpeaker(event)
            cutscene:text("* Dude, [wait:5]I miss Gerson.")
            cutscene:text("* He was such a cool teacher! [wait:5]Didn't care whenever we got\ninto trouble, [wait:5]or skipped class.")
            cutscene:text("* 'Course, [wait:5]if we started skipping for days straight, [wait:5]he'd call\nour parents.")
            cutscene:text("* Don't want no missing students...")
        else
            cutscene:setSpeaker(event)
            cutscene:text("* Hey! [wait:5]What's your teacher like?")
            cutscene:setSpeaker()
            local choice = cutscene:choicer({"She's alright", "She likes anime"})
            if choice == 1 then
                cutscene:setSpeaker(event)
                cutscene:text("* Oh, [wait:5]I see.")
                cutscene:text("* Shame you didn't have Gerson as a teacher, [wait:5]man.")
                cutscene:text("* He would've thrown paper planes with you during class.")
            else
                cutscene:setSpeaker(event)
                cutscene:text("* So she's a nerd, [wait:5]huh.")
                cutscene:text("* Good thing they're cool!")
            end
        end
    end,
    greenfire = function(cutscene, event)
        cutscene:setSpeaker(event)
        cutscene:text("* I wonder if I should invite someone to the festival soon... [wait:5]But who?")
        cutscene:text("* ...Nah, [wait:5]I'll just get nervous and end up setting all the\ntents on fire...")
    end,
    nicecream = function(cutscene, event)
        cutscene:setSpeaker(event)
        cutscene:text("* That coworker of mine, [wait:5]he broke up with his online girlfriend.")
        cutscene:text("* He didn't show up to work today...")
        cutscene:text("* Hm? The reason for the break\nup?")
        cutscene:text("* Something about long distance. [wait:5]And lack of grainy photos.")
    end,
    sunny = function(cutscene, event)
        --[[local interact_count = event:getFlag("interact_count", 0)
        interact_count = interact_count + 1
        event:setFlag("interact_count", interact_count)]]
        cutscene:setSpeaker(event)
        cutscene:text("* Hello! [wait:5]I'm here to run some tests.")
        cutscene:text("* Let's test [color:yellow]cutscene:rectText[color:reset] first.")
        cutscene:rectText("* [speed:0.6]And... [wait:5]We are testing!", "sunny_lw")
        cutscene:text("* Did it work?")
    end,
    fluen = function(cutscene, event)
        local player = Game.world.player
        local interact_count = event:getFlag("interact_count", 0)
        interact_count = interact_count + 1
        event:setFlag("interact_count", interact_count)
        if player.facing == "right" then
            cutscene:setSpeaker(event)
            cutscene:text("* ...Don't read my texts, [wait:5]please.")
        elseif interact_count == 1 then
            cutscene:setSpeaker(event)
            cutscene:text("* ...Why are you looking at me like that...?")
        else
            cutscene:setSpeaker(event)
            cutscene:text("* I'm busy. [wait:5]Please go away...")
        end
    end,

    noellechurch = function(cutscene, event)
        Game.world.music:stop()
        local kris = cutscene:getCharacter("kris_lw")
        local noelle = cutscene:getCharacter("noelle_lw")

        noelle:shake(3)
        noelle:setSprite("shocked")
        Assets.playSound("noelle_scared")
        cutscene:look(kris, Utils.facingFromAngle(Utils.angle(kris, noelle)))

        cutscene:wait(1.8)

        cutscene:setSpeaker(noelle)
        cutscene:text("* K-Kris?!", "shock")
        noelle:setSprite("walk_serious")

        kris:walkTo("kris", 1, "left", false)
        cutscene:wait(cutscene:walkTo(noelle, "noelle", 1, "right", true))

        cutscene:text("* You scared me...", "surprise_frown_b")
        cutscene:text("* I thought for sure it was--", "sad_side")
        noelle:setFacing("up")
        cutscene:text("* ... [wait:5]A-Anyway!", "confused_surprise_b")
        noelle:setFacing("right")
        cutscene:text("* Huh? [wait:5]What I'm doing alone out here?", "confused_surprise")
        cutscene:text("* I'm... [wait:5]I came here for\na midnight prayer.", "sad_side")
        noelle:setSprite("look_away")
        cutscene:text("* *sigh*...[wait:5]\n* It's... [wait:5]not really worth explaining.", "dejected")
        noelle:setSprite("sad")
        cutscene:text("* Just... [wait:5]don't tell Mom I'm here, [wait:5]please.", "down")
        noelle:setSprite("walk_serious")
        noelle:setFacing("up")
        cutscene:text("* Anyway, [wait:5]I wanted to go in, [wait:5]but...", "sad")
        cutscene:text("* The lights are off.", "confused_surprise_b")
        noelle:setFacing("right")
        cutscene:text("* N-Not that Mr. Father Alvin can't take a break! [wait:5]But...", "shock_b")
        cutscene:text("* Don't you think it's strange?", "confused")
        cutscene:text("* Usually a place of worship is open at all hours...", "confused_surprise_b")
        noelle:setFacing("left")
        cutscene:text("* It's not THAT late, [wait:5]either.", "question")
        noelle:setFacing("right")
        cutscene:text("* So, [wait:5]um...", "confused_surprise")

        cutscene:setSpeaker()
        local choice = cutscene:choicer({"Let's\nbreak in", "Call your\nmom"})
        if choice == 1 then
            cutscene:setSpeaker(noelle)
            cutscene:text("* What?", "confused_surprise")
            cutscene:text("* Oh come on, [wait:5]Kris! [wait:5]We're not explorers anymore!", "smile_closed_b")
            cutscene:text("* What's next? [wait:5]We steal all the sick fruit juice?", "question")
            cutscene:text("* ... [wait:5]No, that's not the \"obvious course of action\"?", "confused_surprise_b")
        else
            cutscene:setSpeaker(noelle)
            cutscene:text("* What??", "shock")
            cutscene:text("* U-Um, [wait:5]NO, [wait:5]Kris.\n[wait:5]* I actually don't want her to know I'm here.", "frown")
            cutscene:text("* Didn't you hear me earlier? [wait:5]Stop making\nfun of me!", "confused_surprise")
        end

        cutscene:setSpeaker(noelle)
        noelle:setFacing("up")
        cutscene:text("* Hm...", "dejected")
        noelle:setFacing("right")
        cutscene:text("* Maybe... [wait:5]we should call Father Alvin out here?", "confused")
        cutscene:text("* Then we can-- [func:kriswalk][face:silly]WAIT WHAT ARE YOU DOING", "confused_surprise", noelle, {
            functions = {
                kriswalk = function ()
                    noelle:setFacing("up")
                    cutscene:walkTo(kris, "kris2", 1, "up", false)
                end
            }
        }, {auto = true})

        local black = Sprite("misc/darkportal/church", 596, 648)
        black:setScale(2)
        black:setColor(COLORS.black)
        black:setOrigin(0.5, 1)
        black.layer = kris.layer
        Game.world:addChild(black)

        Assets.playSound("locker")
        noelle:setFacing("up")

        cutscene:wait(1.5)

        local darkdoor = DarkDoorFX(566, 527, 30, 59, "church", {color = {0, 0, 0}})
        Game.world:spawnObject(darkdoor, black.layer)

        Game.world.music:play("creepydoor")
        kris:walkTo("kris", 1, "up", true)
        
        cutscene:wait(1)
        local choice = cutscene:choicer({"Let's\njump in", "Call your\nmom"})
    end,
}