--code made originally by Nyako!
return {
    fungang = function(cutscene)
        Assets.playSound("jump")
        
        cutscene:resetSprites()
        
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        local ralsei = cutscene:getCharacter("ralsei")
        
        cutscene:detachCamera()
        cutscene:detachFollowers()

        kris.sprite:set("landed_1")
        susie.sprite:set("landed_1")
        ralsei.sprite:set("landed_1")
        cutscene:wait(2/30)
        
        kris:jumpTo(susie.x + 80, susie.y, 12, 17/30, "fall_1", "landed_1")
        ralsei:jumpTo(susie.x + 80, susie.y, 12, 17/30, "fall", "landed_1")
        susie:jumpTo(susie.x + 80, susie.y, 12, 17/30, "fall_1", "landed_1")

        cutscene:wait(20/30)
        Assets.playSound("impact")
        cutscene:wait(16/30)
        Assets.playSound("swing")

        kris:spin(2)
        susie:spin(2)
        ralsei:spin(2)

        cutscene:wait(16/30)
        Assets.playSound("bell")
        
        kris:spin(0)
        susie:spin(0)
        ralsei:spin(0)
        kris.sprite:set("pose")
        susie.sprite:set("pose")
        ralsei.sprite:set("pose")
        cutscene:wait(15/30)
        cutscene:resetSprites()
        
        kris:setFacing("right")
        susie:setFacing("right")
        ralsei:setFacing("right")
        cutscene:attachCamera()
        cutscene:interpolateFollowers()
        cutscene:attachFollowers()
    end,
    knr_1st = function(cutscene)
        Assets.playSound("jump")
        
        cutscene:resetSprites()
        
        local kris = cutscene:getCharacter("kris")
        local ralsei = cutscene:getCharacter("ralsei")
        local noelle = cutscene:getCharacter("noelle")

        cutscene:detachCamera()
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
    knr = function(cutscene)
        Assets.playSound("jump")
        
        cutscene:resetSprites()
        
        local kris = cutscene:getCharacter("kris")
        local ralsei = cutscene:getCharacter("ralsei")
        local noelle = cutscene:getCharacter("noelle")
        
        cutscene:detachCamera()
        cutscene:detachFollowers()

        kris.sprite:set("landed_1")
        ralsei.sprite:set("landed_1")
        noelle.sprite:set("landed_1")
        cutscene:wait(1/30)
        
        kris:jumpTo(noelle.x + 80, noelle.y, 12, 17/30, "fall_1", "landed_1")
        ralsei:jumpTo(noelle.x - 80, noelle.y, 12, 17/30, "fall", "landed_1")
        noelle:jumpTo(noelle.x, noelle.y, 12, 17/30, "fall_1", "landed_1")

        cutscene:wait(20/30)
        Assets.playSound("impact")
        cutscene:wait(16/30)
        Assets.playSound("swing")

        kris:spin(2)
        noelle:spin(2)
        ralsei:spin(2)

        cutscene:wait(16/30)
        Assets.playSound("bell")
        
        kris:spin(0)
        noelle:spin(0)
        ralsei:spin(0)
        kris.sprite:set("pose")
        noelle.sprite:set("pose")
        ralsei.sprite:set("pose")
        cutscene:wait(15/30)
        cutscene:resetSprites()
        
        kris:setFacing("right")
        noelle:setFacing("right")
        ralsei:setFacing("right")
        cutscene:attachCamera()
        cutscene:interpolateFollowers()
        cutscene:attachFollowers()
    end,
    knb = function(cutscene)
        Assets.playSound("jump")
        
        cutscene:resetSprites()
        
        local kris = cutscene:getCharacter("kris")
        local noelle = cutscene:getCharacter("noelle")
        local berdly = cutscene:getCharacter("berdly")
        
        cutscene:detachCamera()
        cutscene:detachFollowers()

        kris.sprite:set("landed_1")
        noelle.sprite:set("landed_1")
        berdly.sprite:set("landed_2")
        cutscene:wait(1/30)
        
        kris:jumpTo(kris.x, kris.y, 12, 17/30, "fall_1", "landed_1")
        noelle:jumpTo(kris.x + 80, kris.y, 12, 17/30, "fall", "landed_1")
        berdly:jumpTo(kris.x - 80, kris.y, 12, 17/30, "jump_2", "landed_2")

        cutscene:wait(20/30)
        Assets.playSound("impact")
        cutscene:wait(16/30)
        Assets.playSound("swing")

        kris:spin(2)
        noelle:spin(2)
        berdly:spin(2)

        cutscene:wait(16/30)
        Assets.playSound("bell")
        
        kris:spin(0)
        noelle:spin(0)
        berdly:spin(0)
        kris.sprite:set("pose")
        noelle.sprite:set("pose")
        berdly.sprite:set("pose")

        cutscene:wait(15/30)
        cutscene:setSpeaker("berdly")
        cutscene:text("* Onward, [wait:5]my fellow smart students!!", "smug_c")

        cutscene:resetSprites()
        
        kris:setFacing("right")
        noelle:setFacing("right")
        berdly:setFacing("right")
        cutscene:attachCamera()
        cutscene:interpolateFollowers()
        cutscene:attachFollowers()
    end,
}