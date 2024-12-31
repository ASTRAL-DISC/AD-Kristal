return {
    noelleroom = function(cutscene, event)
        local ralsei = cutscene:getCharacter("ralsei")
        local noelle = cutscene:getCharacter("noelle")
        if event.interact_count == 1 then
            if not noelle then
                if ralsei then
                    cutscene:setSpeaker("ralsei")
                    cutscene:text("* Ah, [wait:5]this is Noelle's room!", "blush_smile")
                    cutscene:text("* You, [wait:5]err... [wait:5]shouldn't open it yet.", "pleased")
                    cutscene:text("* Best to keep the surprise for when Noelle is here, [wait:5]right?", "wink")
                else
                    cutscene:text("* (You get the feeling you shouldn't open this door yet.)")
                end
            else
                --WIP DIALOGUE
                cutscene:setSpeaker("noelle")
                cutscene:text("* This... [wait:5]this is my room...?", "blush")
                cutscene:text("* You... [wait:5]made a room for me?", "smile_side")
                cutscene:text("* Can I see?", "smile_closed_b")
                cutscene:setSpeaker("ralsei")
                cutscene:text("* Yes, [wait:5]go right ahead!", "blush_smile")
                Game.world.map:getHitbox("noellecollision").collidable = false
                Game:setFlag("noelle_unlock", true)
            end
        elseif not Game:getFlag("noelle_unlock") then
            cutscene:text("* (It seems you can't open this door for now...)")
        else
            cutscene:text("* (It seems you can't open this door for now...)")
        end
    end,
}