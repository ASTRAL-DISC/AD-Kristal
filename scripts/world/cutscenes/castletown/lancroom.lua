return {
    -- if (global.plot >= 200 && scr_get_total_recruits(2) >= 9) instance_destroy()
    --[[
    lancer = function(cutscene, me, chara, facing)
        if me.interact_count <= 1 then
            cutscene:text("* Lancer!![wait:5] Hey,[wait:5] Lancer!![wait:5] How you feeling!?", "9", "susie")
            cutscene:text("* (huff,[wait:5] puff...) One-hundred percent,[wait:5] my purplish pal!", "3", "lancer")
            cutscene:text("* Uhh,[wait:5] you sure? You're breathing kinda heavy.", "K", "susie")
            cutscene:text("* Haha![wait:5] Just a little winded from jumping from Kris's POCKET!", "2", "lancer")
            cutscene:text("* Feel free to clown around town. I'll be in your ITEMs!", "3", "lancer")
            cutscene:text("* No idea what you mean,[wait:5] but,[wait:5] sure.", "A", "susie")
        else
            cutscene:text("* Susie,[wait:5] Susie![wait:5] Can you carry me on your back again?", "3", "lancer")
            cutscene:text("* Heh,[wait:5] sure![wait:5] If you can stay on when I'm at full speed!", "Y", "susie")
            cutscene:text("* Wow!![wait:5] The Susie-train!![wait:5] Castle Town's most exciting attraction!!!", "1", "lancer")
            cutscene:text("* ...", "J", "ralsei")
            cutscene:text("* YOU AND KRIS STOP FORMING A LINE!!", "H", "susie")
        end
    end,
    ]]
    music_player = function(cutscene, event, chara, facing)
        cutscene:text("* (It's a music player.)[wait:5]\n* (Listen to the contents?)")
        local choice = cutscene:choicer({"Listen", "Do Not"})
        if choice == 1 then
            cutscene:playSound("splat")
            cutscene:text("* (...)")
            cutscene:text("* (It's full of cartoon splat noises.)")
        else
            cutscene:text("* (You did not listen.)")
        end
    end
}