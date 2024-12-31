return {
    sip = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        local ralsei = cutscene:getCharacter("ralsei")
        local noelle = cutscene:getCharacter("noelle")
        local queen = cutscene:getCharacter("queen")
        local acid = cutscene:getEvent("acidglass")

        Assets.playSound("queen/sip")
        cutscene:text("[noskip]*[wait:3s]", "sip", "queen", {auto = true})

        if susie then
            cutscene:text("* Kris Susie How Do You Like My New:", "smile", "queen")
        elseif noelle then
            cutscene:text("* Noelle How Do You Like My New:", "smile", "queen")
        elseif susie and noelle then
            cutscene:text("* Noelle How Do You Like My New:", "smile", "queen")
        else
            cutscene:text("* Kris Cross Applesauce How Do You Like My New:", "smile", "queen")
        end

        Assets.playSound("queen/sip_2")
        cutscene:text("[noskip]*[wait:1s]", "sip", "queen", {auto = true})
        cutscene:text("* Room", "smile", "queen")
        if ralsei then
            if noelle then
                cutscene:text("* Didn't... [wait:5]didn't you already do that introduction?", "dismissive", "ralsei")
                Assets.playSound("queen/sip_3")
                cutscene:text("[noskip]*[wait:2s]", "sip", "queen", {auto = true})
                cutscene:text("* Noelle Do You Want A Sip", "smile", "queen")
            else
                Assets.playSound("queen/sip_3")
                cutscene:text("[noskip]*[wait:2s]", "sip", "queen", {auto = true})
                cutscene:text("* Do You Want A Sip", "smile", "queen")
            end
        else
            Assets.playSound("queen/sip_3")
            cutscene:text("[noskip]*[wait:2s]", "sip", "queen", {auto = true})
            cutscene:text("* Do You Want A Sip", "smile", "queen")
        end

        if susie then
            if noelle then
                cutscene:text("* ...", "confused_surprise_b", "noelle")
                cutscene:text("* ...", "confused_surprise", "noelle")
                cutscene:text("* ... [wait:5]Is it alright if I try some?", "smile_closed_b", "noelle")
                cutscene:text("[noskip]*[wait:0.5s]", "shock", "susie", {auto = true})
                cutscene:text("* Uhh, [wait:5]you might not wanna do that.", "annoyed", "susie")
                cutscene:text("* Admire the courage, [wait:5]though.", "nervous_side", "susie")
                noelle:setSprite("blush_side")
                noelle:shake(2)
                cutscene:text("* Oh...! [wait:5]T-Thank you!!", "blush", "noelle")
                noelle:resetSprite()
                Assets.playSound("queen/sip_2", 0.8, 1.5)
                cutscene:text("[noskip]*[wait:0.5s]", "sip", "queen", {auto = true})
                cutscene:text("* You Are Missing Out On The Free Pool Water", "smile", "queen")
            else
                cutscene:text("* Uhh...[wait:3] that's acid. We'd die.", "nervous_side", "susie")
                cutscene:text("* Oh Dear First You Don't Want To Swim In The Free Pool", "smile", "queen")
                cutscene:text("* Now You Don't Want To Drink The Free Pool Water", "pout", "queen")
                cutscene:text("* More For Me I Suppose", "smile_side_l", "queen")
            end
        elseif noelle then
            cutscene:text("* ...", "confused_surprise_b", "noelle")
            cutscene:text("* ...", "confused_surprise", "noelle")
            cutscene:text("* ... [wait:5]Is it alright if I try some?", "smile_closed_b", "noelle")
            Assets.playSound("queen/sip_2", 0.8, 1.8)
            cutscene:text("[noskip]*[wait:0.5s]", "sip", "queen", {auto = true})
            cutscene:text("* Yeah Sure", "smile", "queen")
            Assets.playSound("queen/sip_2", 0.8, 2)
            cutscene:text("[noskip]*[wait:0.5s]", "sip", "queen", {auto = true})
            cutscene:text("* One Second", "smile_side_l", "queen")
            Assets.playSound("queen/sip_3")
            acid:setSprite("world/events/castletown/queen/acid_drink")
            acid.sprite:play(0.2, false)
            cutscene:text("[noskip]*[wait:3s]", "sip", "queen", {auto = true})
            cutscene:text("* [wait:5]?", "sip", "queen")
            queen:setSprite("stealth")
            cutscene:text("* ... [wait:5]Well", "analyze", "queen")
            Assets.playSound("jump")

            local jump_x, jump_y = cutscene:getMarker("queen")
            queen:jumpTo(jump_x, jump_y, 20, 0.3, "stealth_mad", "stealth_mad")

            local jump_startup = 5/30; --pulled from "Character:jumpTo"
            local land_sprite = "walk/left"

            Game.stage.timer:after(jump_startup, function()
                queen.land_sprite = land_sprite --change land sprite after takeoff
            end)
            cutscene:wait(function()
                return not queen.jumping
            end)

            queen:resetSprite()
            queen:setFacing("left")

            cutscene:look(kris, "right")
            if susie then
                cutscene:look(susie, "right")
            end
            if noelle then
                cutscene:look(noelle, "right")
            end
            if ralsei then
                cutscene:look(ralsei, "right")
            end

            cutscene:text("* There Goes All The Free Pool Water", "pout", "queen")
            queen:setAnimation("laugh")
            cutscene:text("* Just Kidding: [wait:5]I Have An Infinite Supply", "big_smile", "queen")
            queen:resetSprite()
            queen:setFacing("left")
            cutscene:text("* As Long As Peach Boy Cooks More Of It With The Recipe I Gave Him", "true", "queen")
            if ralsei then
                cutscene:text("* Is That Not Right", "smile_side_l", "queen")
                cutscene:text("* Err, [wait:5]yes, [wait:5]Ma'am!", "pleased", "ralsei")
                cutscene:text("* Perfection", "haha", "queen")
                queen:setFacing("down")
            end
            queen.cutscene = "castletown/queenroom.queen"
            queen.idle_sprite = "walk"
            queen.sprite:setSprite("walk")
            queen.turn = true
        end
    end,
    queen = function(cutscene, event)
        cutscene:text("* Lmao", "lmao", event)
    end,
    rouxls = function(cutscene, event)
        cutscene:text("* (Geteth OUTTE of here)", "baffled_look", event)
    end,
}