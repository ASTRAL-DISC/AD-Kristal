return {
    intro = function(cutscene, event)
        local noelle = cutscene:getCharacter("noelle")
        local ralsei = cutscene:getCharacter("ralsei")
        local susie = cutscene:getCharacter("susie")
        local kris = cutscene:getCharacter("kris")

        cutscene:text("* Whoa, [wait:5]you have games in your room?", "surprise", "susie")

        cutscene:text("* Um...[wait:5]\n* A-Apparently?", "smile_closed", "noelle")
        cutscene:text("* I... [wait:5]really like games.", "blush_smile", "noelle")
        
        cutscene:text("* You could say a little bluebird told me about that!", "wink", "ralsei")
        cutscene:text("* (Should've known...)", "smile_closed_b", "noelle")

        cutscene:text("* The hell's with the special treatment to princess over here?[wait:2][react:1]", "teeth", "susie", {reactions = {
            noelle = {"(\"Princess\"???)", "rightmid", "mid", "blush_big_smile", "noelle"},
        }})
        cutscene:text("* Me and Kris like to play too!", "shy_b", "susie")
        cutscene:text("* Why'd you put those only in her room?", "teeth_b", "susie")

        cutscene:text("* So you could, [wait:5]um...\n[wait:5]* Play it together?", "blush_pleased", "ralsei")

        cutscene:text("* ", "shock", "susie")
        cutscene:text("* ", "blush_side", "noelle")
        cutscene:text("* Well ok, [wait:5]sure.", "smile", "susie")

        cutscene:text("* (Susie! [wait:5]You can't just INVITE yourself over...)", "owo_angry", "ralsei")
        cutscene:text("* (Oh yeah right)", "nervous", "susie")

        cutscene:text("* Noelle, [wait:5]if it ain't a BOTHER...", "shy_b", "susie")
        cutscene:text("* Could we, [wait:5]uh...\n[wait:5]* Come here to...", "blush", "susie")

        cutscene:text("* YES!! [wait:5]Um... [wait:5]I mean...!", "blush_big_smile", "noelle")
        cutscene:text("* Y-yeah... absolutely.", "blush_surprise_smile", "noelle")

        cutscene:text("* Nice!", "surprise_smile", "susie")
        cutscene:text("* Prepare to have your ass BEAT at, [wait:5]uh...", "smile", "susie")
        cutscene:text("* Whatever... [wait:5]games you have.", "nervous", "susie")
        cutscene:text("* (Can't wait...)", "blush_big_smile", "noelle")
    end,

    famicom = function(cutscene, event, chara, facing)
        cutscene:text("* A famicom.")
    end,

    controller = function(cutscene, event)
        Game.world:openMenu(MinigameMenu(SCREEN_WIDTH, SCREEN_HEIGHT, "rarecats"), "objects")
    end,
}