return {
    sit = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        if not susie then return end
        local ocean = Music("ocean")
        ocean:setVolume(0)
        Game.lock_movement = true
        Game.world.music:fade(0, 2)
        local susie_sit_x, susie_sit_y = cutscene:getMarker("susie")
        local kris_sit_x, kris_sit_y = cutscene:getMarker("kris")
        event.toggled = true
        cutscene:detachFollowers()
        cutscene:detachCamera()
        cutscene:walkTo(susie, susie_sit_x, susie_sit_y, 1.2)
        cutscene:walkTo(kris, kris_sit_x, kris_sit_y, 1.2)
        cutscene:panTo("camera", 2)
        cutscene:wait(2)
        kris:setAnimation({"sit", 0.25, true})
        susie:setAnimation({"sit", 0.25, true})
        cutscene:wait(1)
        ocean:fade(0.6, 1)
        cutscene:wait(function() return Input.pressed("confirm") end); Input.clear("confirm")
        Game.world.music:fade(1, 2)
        ocean:fade(0, 1)
        cutscene:wait(cutscene:attachCamera(2))
        ocean:remove()
        kris:resetSprite()
        susie:resetSprite()
        cutscene:interpolateFollowers()
        cutscene:attachFollowers()
        Game.lock_movement = false
    end,
    sit_dark = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local ocean = Music("ocean")
        ocean:setVolume(0)
        Game.lock_movement = true
        Game.world.music:fade(0, 2)
        local kris_sit_x, kris_sit_y = cutscene:getMarker("kris")
        event.toggled = true
        cutscene:detachCamera()
        cutscene:walkTo(kris, kris_sit_x, kris_sit_y, 1.2)
        cutscene:panTo("camera", 2)
        cutscene:wait(2)
        kris:setAnimation({"sit", 0.25, true})
        cutscene:wait(1)
        ocean:fade(0.6, 1)
        cutscene:wait(function() return Input.pressed("confirm") end); Input.clear("confirm")
        Game.world.music:fade(1, 2)
        ocean:fade(0, 1)
        cutscene:wait(cutscene:attachCamera(2))
        ocean:remove()
        kris:resetSprite()
        Game.lock_movement = false
    end,
    onion = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        if not Game:getFlag("onion_seen") then
            Game:setFlag("onion_seen", true)
            local lagoon = Game.world:getEvent(13)
            local onion_x, onion_y = cutscene:getMarker("onion")
            local onionsan = Game.world:spawnNPC("onionsan", onion_x, onion_y)
            onionsan.layer = lagoon.layer + 1
            local scissor = ScissorFX(0, 0, 200, -60)
            local depth = 62
            onionsan:addFX(scissor)
            onionsan.sprite.y = onionsan.sprite.y + depth
            scissor.height = scissor.height + depth * 3
            Game.world.timer:tween(4, scissor, {height = onionsan.height + depth * 3})
            Game.world.timer:tween(4, onionsan, {y = scissor.height})
            cutscene:wait(4.5)
            if Game.chapter == 3 then
                cutscene:text("* ... [wait:5]Hey!!")
                onionsan:setSprite("yhear")
                cutscene:text("* Friend...")
                onionsan:setAnimation({"sing", 0.2, true})
                cutscene:text("* It's so nice to see you back again!!")
                onionsan:setSprite("disappoint")
                cutscene:text("* Normally they don't... [wait:5]come back...")
                onionsan:setSprite("menace")
                cutscene:text("* Did you think about the secret\nI shared yesterday...? [wait:5]About\nthe song?!")
                local choice = cutscene:choicer({"Yes", "No"}) == 1
                if choice then
                    cutscene:text("* Remember that I said I'd be on the case...?")
                    onionsan:setSprite("wistful")
                    cutscene:wait(1)
                    onionsan:setSprite("disappoint")
                    cutscene:text("* Well... [wait:5]I didn't hear the song again...")
                    onionsan:setSprite("menace")
                    cutscene:text("* BUT!! [wait:5]... [wait:5]I saw something this time. [wait:5]Underwater.")
                    cutscene:text("* It looked... [wait:5]It looked...")
                    onionsan:setSprite("wistful")
                    cutscene:text("* Like something I've seen before.")
                    cutscene:text("* Except... [wait:5]whenever I try to remember its shape...")
                    onionsan:setSprite("menace")
                    cutscene:text("* My head gets fuzzy... [wait:5]and...")
                    onionsan:setAnimation({"sing", 0.2, true})
                    cutscene:text("* I think it smiled at me!")
                    cutscene:text("* Oh, [wait:5]Kris!![wait:5]\n* It's the first time someone smiled at me!!")
                    cutscene:text("* Not even you did!![wait:5]\n* I'm probably going to make another friend!!")
                    onionsan:setAnimation({"kawaii", 0.2, true})
                    cutscene:text("* Don't get jealous, y'hear![wait:5]\n* But I think this new friend...")
                    cutscene:text("* Will last for all eternity, [wait:5]y'hear!!!")
                    onionsan:setSprite("wistful")
                    cutscene:text("* At least... [wait:5]I have this feeling.")
                    onionsan:resetSprite()
                    cutscene:text("* Anyway, [wait:5]don't forget to come back tomorrow!")
                    cutscene:text("* I might have something new to tell!")
                    cutscene:text("* See you then, [wait:5]Kris!!")
                else
                    onionsan:setSprite("disappoint")
                    cutscene:text("* No...?")
                    onionsan:setSprite("disappoint")
                    cutscene:text("* Ah, [wait:5]well... [wait:5]I'm sure y'hou have more important things to do...")
                    onionsan:setSprite("wistful")
                    cutscene:text("* Like school, [wait:5]or playing baseball with your friends...")
                    onionsan:setSprite("disappoint")
                    cutscene:text("* Hey... [wait:5]Y'hear...")
                    cutscene:text("* Do you think...")
                    onionsan:setAnimation({"kawaii", 0.2, true})
                    cutscene:text("* Your friends![wait:5]\n* Could I meet them sometime?")
                    onionsan:setSprite("disappoint")
                    cutscene:text("* I've been wanting new friends for a while...")
                    onionsan:setAnimation({"sing", 0.2, true})
                    cutscene:text("* And don't worry, [wait:5]you're an amazing friend, [wait:5]y'hear!!")
                    onionsan:setSprite("menace")
                    cutscene:text("* It's just nice to have more.")
                    cutscene:text("* So I can share more secrets...")
                    onionsan:setSprite("wistful")
                    cutscene:text("* And have them... [wait:5]think about it.")
                    onionsan:setSprite("yhear")
                    cutscene:text("* Or play baseball together, [wait:5]y'hear!!")
                    onionsan:setSprite("wistful")
                    cutscene:text("* Y'hear, [wait:5]Kris...\n[wait:5]* Do you think I could meet your friends?")
                    local friends = cutscene:choicer({"Yes", "Don't have\nany friends"}) == 1
                    if friends then
                        onionsan:setAnimation({"kawaii", 0.2, true})
                        cutscene:text("* Oh!! [wait:5]Oh!! [wait:5]I'm so happy... [wait:5]I...!")
                        onionsan:setAnimation({"sing", 0.2, true})
                        cutscene:text("* I'll have so many new friends, [wait:5]y'hear! [wait:5]One step closer to\nbeing POPULAR, [wait:5]y'hear!")
                        onionsan:setSprite("wistful")
                        cutscene:text("* I'll... [wait:5]have to find a bat, [wait:5]or something.")
                        onionsan:resetSprite()
                        cutscene:text("* Come back tomorrow with your friends!")
                        cutscene:text("* We'll get along so well! [wait:5]Just you see, [wait:5]just y'hear!!")
                        cutscene:text("* See you tomorrow! [wait:5]Kris!!")
                        Game:setFlag("onion_friends", true)
                    else
                        onionsan:setSprite("disappoint")
                        cutscene:text("* N-[wait:1]No friends...?")
                        onionsan:setSprite("yhear")
                        cutscene:text("* What are you saying!! [wait:5]You have me, [wait:5]y'hear?!")
                        cutscene:text("* If you didn't...")
                        onionsan:setSprite("menace")
                        cutscene:text("* Then you wouldn't have come back.")
                        onionsan:setSprite("disappoint")
                        cutscene:text("* Unless you're here to make fun of me...")
                        onionsan:setSprite("wistful")
                        cutscene:text("* No! [wait:5]No! [wait:5]I shouldn't be thinking these things of my friend!")
                        onionsan:setAnimation({"kawaii", 0.2, true})
                        cutscene:text("* A friend so loyal, [wait:5]they didn't share my secret!!")
                        onionsan:setSprite("menace")
                        cutscene:text("* Y... [wait:5]You didn't, [wait:5]right?")
                        cutscene:text("* ...")
                        onionsan:setAnimation({"sing", 0.2, true})
                        cutscene:text("* Anyway!! [wait:5]I am still on the case!")
                        onionsan:setSprite("menace")
                        cutscene:text("* If that... [wait:5]matters to you...")
                        onionsan:resetSprite()
                        cutscene:text("* See you tomorrow!!\n[wait:5]* My \"no friends\" friend!!")
                    end
                end
            elseif Game.chapter == 4 then
                if Game:getFlag("onion_friends") then
                    if cutscene:getCharacter("susie") then
                    elseif cutscene:getCharacter("noelle") then
                    end
                else
                    cutscene:text("* ... [wait:5]Hey!!")
                    onionsan:setSprite("yhear")
                    cutscene:text("* Friend...")
                    onionsan:setSprite("wistful")
                    cutscene:wait(1)
                    onionsan:setSprite("disappoint")
                    cutscene:text("* ... [wait:5]I realized... [wait:5]I don't have anything to say...")
                    onionsan:setSprite("menace")
                    cutscene:text("* Uh... [wait:5]Bye!!")
                end
                    
            end
            --WIP, doesn't look right
            depth = -62
            Game.world.timer:tween(4, scissor, {height = onionsan.height})
            Game.world.timer:tween(4, onionsan, {y = scissor.height})
            cutscene:wait(4)
            onionsan:remove()
        end
    end,
}