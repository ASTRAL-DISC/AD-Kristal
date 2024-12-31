return {
    deer = function(cutscene, event)
        local noelle = cutscene:getCharacter("noelle")
        if event.interact_count == 1 then
            cutscene:text("* (It's a light display of a strange looking reindeer family...)")
            if noelle then
                cutscene:setSpeaker("noelle")
                cutscene:text("* Ah, [wait:5]yes! [wait:5]The Gyftrot family!", "smile_closed")
                cutscene:text("* We got these from a cousin of ours as a gift.", "smile")
                cutscene:text("* I remember when you tried to \"steal\" the fairy lights from it!", "smile_closed_b")
                cutscene:text("* I caught you from the window! [wait:5]When you spotted me, [wait:5]you just...", "confused_surprise_b")
                cutscene:text("* Kept staring at me... [wait:5]Waving...", "confused_surprise")
                cutscene:text("* I rushed to get Mom to make you stop because it was creeping me out.", "confused_surprise_b")
                cutscene:text("* You were gone by the time she went outside...", "smile_side")
                cutscene:text("* To this day, [wait:5]Mom still thinks I made it up!", "smile_closed_b")
            end
        elseif event.interact_count == 2 then
            if noelle then
                cutscene:setSpeaker("noelle")
                cutscene:text("* Sadly, [wait:5]the big one's left eye blinked out recently.", "confused_surprise_b")
                cutscene:text("* For some reason, [wait:5]it's...", "frown")
                cutscene:text("* Kind of creepier like this??", "smile_closed_b")
                cutscene:text("* I don't know, [wait:5]it makes me not want to look at it for too long.", "smile_side")
            end
        else
            cutscene:text("* (You got tangled up here once.)")
        end
    end,
}