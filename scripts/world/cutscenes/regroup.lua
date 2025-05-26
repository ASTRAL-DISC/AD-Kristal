-- code made originally by Nyako!
return{
    default = function(cutscene)
        if #Game.party ~= 3 then return end

        Assets.playSound("jump")
        cutscene:resetSprites()
        
        cutscene:detachCamera()
        cutscene:detachFollowers()

        for _, member in ipairs(Game.party) do
            cutscene:getCharacter(member.id).sprite:set("landed_1")
        end
        cutscene:wait(2/30)
        
        local p1 = cutscene:getCharacter(Game.party[1].actor.id)
        local p2 = cutscene:getCharacter(Game.party[2].actor.id)
        local p3 = cutscene:getCharacter(Game.party[3].actor.id)

        local fall_sprite = p3.actor.id == "ralsei" and "fall" or "fall_1"

        p1:jumpTo(p2.x + 80, p2.y, 12, 17/30, fall_sprite, "landed_1")
        p2:jumpTo(p2.x, p2.y, 12, 17/30, fall_sprite, "landed_1")
        p3:jumpTo(p2.x - 80, p2.y, 12, 17/30, fall_sprite, "landed_1")

        cutscene:wait(20/30)
        Assets.playSound("impact")
        cutscene:wait(16/30)
        Assets.playSound("swing")

        for _, member in ipairs(Game.party) do
            cutscene:getCharacter(member.id):spin(2)
        end

        cutscene:wait(16/30)
        Assets.playSound("bell")
        
        for _, member in ipairs(Game.party) do
            cutscene:getCharacter(member.id):spin(0)
            cutscene:getCharacter(member.id).sprite:set("pose")
        end

        cutscene:wait(15/30)
        cutscene:resetSprites()

        for _, member in ipairs(Game.party) do
            cutscene:getCharacter(member.id):setFacing("right")
        end

        cutscene:attachCamera()
        cutscene:interpolateFollowers()
        cutscene:attachFollowers()
    end,
    noelle = function(cutscene)
        if not cutscene:getCharacter("ralsei") and cutscene:getCharacter("noelle") then return end

        local kris = cutscene:getCharacter("kris")
        local ralsei = cutscene:getCharacter("ralsei")
        local noelle = cutscene:getCharacter("noelle")

        Assets.playSound("jump")
        
        cutscene:resetSprites()

        cutscene:panTo(noelle.x, noelle.y)
        cutscene:detachFollowers()

        kris.sprite:set("landed_1")
        ralsei.sprite:set("landed_1")
        noelle.sprite:set("shocked")
        cutscene:wait(1/30)
        
        kris:jumpTo(noelle.x + 80, noelle.y, 12, 17/30, "fall_1", "landed_1")
        ralsei:jumpTo(noelle.x - 80, noelle.y, 12, 17/30, "fall", "landed_1")

        cutscene:wait(20/30)
        Assets.playSound("impact")
        cutscene:wait(16/30)
        Assets.playSound("swing")

        kris:spin(2)
        ralsei:spin(2)

        cutscene:wait(16/30)
        Assets.playSound("bell")
        
        kris:spin(0)
        ralsei:spin(0)
        kris.sprite:set("pose")
        ralsei.sprite:set("pose")
        cutscene:wait(1.5)
        kris:resetSprite()
        ralsei:resetSprite()
        kris:setFacing("left")
        ralsei:setFacing("right")

        cutscene:setSpeaker("noelle")
        cutscene:text("* ... [wait:5]Err, [wait:5]what are we doing?", "confused_surprise")

        cutscene:setSpeaker("ralsei")
        cutscene:text("* (Well, [wait:5]you're supposed to strike a cool pose...)", "pleased")
        cutscene:text("* (We typically would do this with Susie, [wait:5]so...)", "small_smile_side")
        
        cutscene:setSpeaker("noelle")
        cutscene:text("* O-Oh!", "shock_b")

        Assets.playSound("swing")
        noelle:resetSprite()
        noelle:spin(2)
        cutscene:wait(16/30)
        Assets.playSound("bell")

        noelle:spin(0)
        noelle.sprite:set("pose")
        kris.sprite:set("pose")
        ralsei.sprite:set("pose")

        cutscene:wait(12/30)
        cutscene:setSpeaker("noelle")
        cutscene:text("* (Is... [wait:5]Is this good?)", "confused_surprise_b")

        cutscene:setSpeaker("ralsei")
        cutscene:text("* (Yes)", "pleased")

        cutscene:setSpeaker("noelle")
        cutscene:text("* (Okay!)", "smile_closed_b")

        cutscene:resetSprites()
        
        kris:setFacing("right")
        noelle:setFacing("right")
        ralsei:setFacing("right")
        cutscene:attachCamera()
        cutscene:interpolateFollowers()
        cutscene:attachFollowers()
    end,
}