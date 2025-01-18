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
        noelle:setFacing("up")
        cutscene:text("* I thought for sure it was--", "sad_side")
        noelle:setFacing("right")
        cutscene:text("* Huh? [wait:5]What I'm doing alone out here?", "confused_surprise")
        cutscene:text("* I'm... [wait:5]I... [wait:5]I came here for a midnight prayer.", "confused_surprise_b")
        cutscene:text("* I know it's dangerous ever since your house got robbed, [wait:5]but...", "shock_b")
        noelle:setSprite("look_away")
        cutscene:text("* *sigh*...[wait:5]\n* It's... [wait:5]not really worth explaining.", "dejected")
        noelle:setSprite("sad")
        cutscene:text("* Just... [wait:5]don't tell Mom I'm here, [wait:5]please.", "down")
        noelle:setSprite("walk_serious")
        noelle:setFacing("up")
        cutscene:text("* A-Anyway, [wait:5]I wanted to go in, [wait:5]but...", "sad")
        cutscene:text("* The lights are off.", "confused_surprise_b")
        noelle:setFacing("right")
        cutscene:text("* Don't you think it's strange?", "confused")
        cutscene:text("* Usually a place of worship is open at all hours...", "confused_surprise_b")
        noelle:setFacing("left")
        cutscene:text("* It's not THAT late, [wait:5]either.", "smile_closed_b")
        noelle:setFacing("right")
        cutscene:text("* And no one seems to be around.", "frown")
        cutscene:text("* So, [wait:5]um...", "confused_surprise")

        cutscene:setSpeaker()
        local choice = cutscene:choicer({"Let's\nbreak in", "Call your\nmom"})
        if choice == 1 then
            cutscene:setSpeaker(noelle)
            cutscene:text("* B-Break in?", "confused_surprise_b")
            cutscene:text("* Gosh, [wait:5]Kris, [wait:5]where do you even get these ideas from?! [wait:5]Susie?", "smile_closed_b")
            cutscene:text("* ... [wait:5]D-Don't tell her I said THAT.", "blush")
            cutscene:text("* Um, [wait:5]but no, [wait:5]thanks...\n[wait:5]* I'd... [wait:5]rather not.", "confused_surprise")
        else
            cutscene:setSpeaker(noelle)
            cutscene:text("* What?", "shock")
            cutscene:text("* U-Um, [wait:5]NO, [wait:5]Kris.\n[wait:5]* I actually don't want her to know I'm here.", "smile_closed_b")
            cutscene:text("* Didn't you hear me earlier...?", "confused_surprise")
            cutscene:text("* She would just get angry at me, [wait:5]send me home, [wait:5]and...", "down")
            cutscene:text("* It's just... [wait:5]I came here to do something important.", "sad_side")
            cutscene:text("* If I went home, [wait:5]I'd just not be able to get any sleep...", "sad")
        end

        cutscene:setSpeaker(noelle)
        noelle:setFacing("up")
        cutscene:text("* ...", "dejected")
        noelle:setFacing("right")
        cutscene:text("* Come to think of it, [wait:5]Kris... [wait:5]What are YOU doing here?", "confused_surprise_b")
        cutscene:text("* It's unlike you to come to service. [wait:5]At least not without Azzy.", "confused_surprise")
        cutscene:text("* Earlier today you came too...", "frown")
        cutscene:text("* Did you even get any sleep lately? [wait:5]You look...", "confused")

        local black = Sprite("misc/darkportal/church", 596, 648)
        black:setScale(2)
        black:setColor(COLORS.black)
        black:setOrigin(0.5, 1)
        black.layer = kris.layer
        Game.world:addChild(black)

        Assets.playSound("locker")
        kris:setFacing("up")
        noelle:setSprite("shocked_behind")
        noelle:shake(3)

        cutscene:wait(1.5)

        local darkdoor = DarkDoorFX(566, 527, 30, 59, "church", {color = {0, 0, 0}})
        Game.world:spawnObject(darkdoor, black.layer)

        Game.world.music:play("creepydoor")
        
        cutscene:wait(2.5)

        cutscene:setSpeaker(noelle)
        noelle:shake(2)
        cutscene:text("* ... [wait:5]What...", "shock")
        
        noelle:setSprite("walk_serious")
        noelle:setFacing("up")

        cutscene:text("* F-Father Alvin?[wait:5]\n* Are you in there?", "shock_b")
        cutscene:text("* I'm...! [wait:5]I'm sorry we came so late! [wait:5]I just...", "nervous")

        cutscene:wait(2.5)
        cutscene:text("* ... [wait:5]Father Alvin...?", "frown")

        noelle:setFacing("right")
        kris:setFacing("left")

        cutscene:text("* K-Kris...? [wait:5]Why is it so...", "nervous_b")
        cutscene:text("* ... [wait:5]DARK in there...?", "nervous")

        noelle:setFacing("up")
        kris:setFacing("up")

        cutscene:wait(2)

        noelle:setFacing("left")
        kris:setFacing("left")

        cutscene:text("* (Gosh...)", "down")
        cutscene:text("* (I told myself I wouldn't be so scared of everything...)", "down")
        cutscene:text("* (...)", "upset_down")

        kris:setFacing("up")

        cutscene:detachCamera()

        Game:addPartyMember("noelle")
        noelle:convertToFollower(1)

        kris.visible = false
        Game.world:getPartyCharacter("noelle").visible = false

        local transition = DarkTransition(240, {
            movement_table = {-0.31, 0.74},
            sparkles = 1,
            sparkles_character = 2,
            draw_doorblack = false,
            skiprunback = true
        })

        local mask = ColorMaskFX({0, 0, 0}, 0.6)

        transition.character_data[1].sprite_1:addFX(mask)
        transition.character_data[2].sprite_1:addFX(mask)

        transition.layer = 99999
        Game.world:addChild(transition)
    
        local waiting = true
        local endData = nil

        transition.loading_callback = function()
            Game.world.timer:tween(2, mask, {amount = 0}, "linear", function ()
                transition.character_data[1].sprite_1:removeFX(mask)
                transition.character_data[2].sprite_1:removeFX(mask)
            end)
        end
    
        transition.land_callback = function()
            cutscene:loadMap("basin/start")
            local kris = cutscene:getCharacter("kris")
            local noelle = cutscene:getCharacter("noelle")
            kris.visible = false
            noelle.visible = false
        end

        transition.end_callback = function(transition, data)
            waiting = false
            endData = data
        end
    
        cutscene:wait(function() return not waiting end)
    
        for _, character in ipairs(endData) do
            local char = Game.world:getPartyCharacter(character.party)
            local kx, ky = character.sprite_1:localToScreenPos(character.sprite_1.width / 2, 0)
            if char then
                char:setScreenPos(kx, transition.final_y)
                char.visible = true
                char:setFacing("down")
            end
        end

        cutscene:endCutscene()
        cutscene:gotoCutscene("basin.intro")
    end,
}