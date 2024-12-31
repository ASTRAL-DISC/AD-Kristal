return {
    bench = function(cutscene, event)
        if Game.chapter == 5 then
            cutscene:text("* (...)")
        else
            cutscene:text("* (Gerson Boom Memorial Bench)")
            cutscene:text("\"* Throughout my career, [wait:5]some of my best ideas came from dreams.\"")
            cutscene:text("\"* Take a rest here. [wait:5]If anyone asks -- [wait:5]you're writing!\"")
        end
    end,
    gerson = function(cutscene, event)
        cutscene:text("* GERSON\n[wait:5]* RENOWNED HISTORIAN, [wait:5]AUTHOR, [wait:5]AND TEACHER")
    end,
    crystal = function(cutscene, event)
        cutscene:text("* CRYSTAL\n[wait:5]* A SNOWY GEMSTONE FOR A PROUD MOTHER")
    end,
    muttler = function(cutscene, event)
        cutscene:text("* MUTTLER\n[wait:5]* A BIG BONE FOR THE LEADER OF THE PACK")
    end,
    shyra = function(cutscene, event)
        cutscene:text("* SHYRA\n[wait:5]* A KARAOKE MICROPHONE FOR A BRAVE SINGER")
    end,
    chara = function(cutscene, event)
        if event.interact_count == 1 then
            cutscene:setSpeaker(event)
            cutscene:text("* Greetings.", "smirk")
            cutscene:text("* Is my place of choice too weird for you?", "smirk_look")
            cutscene:text("* Actually, [wait:5]I am just here for some \"testing\".", "neutral")
            cutscene:text("* In case you know what this means.", "smirk_look")
            cutscene:text("* I am one of the only people in this town for the time being...", "nervous")
            cutscene:text("* Do you not like humans?", "neutral")
            cutscene:text("* Would you rather I was some other type of NPC, [wait:5]instead?", "smirk")
            cutscene:text("* Or...", "smirk_closed")
            cutscene:wait(0.5)
            Game.world.music:pause()
            cutscene:text("[voice:none][speed:0.3]* ...Something else?", "scary")
            Game.world.music:resume()
            cutscene:text("* Haha... [wait:5]I am only kidding.", "smirk")
            cutscene:text("* Perhaps. [wait:5]In another world...", "smirk_look")
            cutscene:text("* Far from your own.", "neutral")
            cutscene:text("* But not too far.", "smirk_look")
        elseif event.interact_count == 2 then
            cutscene:setSpeaker(event)
            cutscene:text("* Do you wish to ask me something?", "neutral")
            cutscene:text("* You can only ask one thing at this time.[wait:5]\n* Pick wisely.", "smirk")
            cutscene:setSpeaker()
            local choice = cutscene:choicer({"Asriel", "You"})
            if choice == 1 then
                cutscene:setSpeaker(event)
                cutscene:text("* Oh. [wait:5]Your brother.", "smirk_closed")
                cutscene:text("* He told me a lot about you.", "smirk_look")
                cutscene:text("* He would reminisce to me about the time you got caught getting...", "smirk_look")
                cutscene:text("* ...\"sick fruit juice\" from the local church.", "nervous")
                cutscene:text("* He was singing in the choir, [wait:5]while your family attended mass...", "smirk_closed")
                cutscene:text("* You took the opportunity to sneak behind the altar.", "smirk")
                cutscene:text("* No one said anything because children will simply not stay still.", "neutral")
                cutscene:text("* You went for the wine, [wait:5]cup in hand.", "smirk")
                cutscene:text("* Asriel ran after you, [wait:5]and you two circled the table a few times.", "neutral")
                cutscene:text("* He was perfectly off-key.", "smirk_look")
                cutscene:text("* Or yelped in terror.", "scary")
                cutscene:text("* I was not there, [wait:5]but he is a rather jumpy individual.", "smirk")
                cutscene:text("* Was it worth it?", "neutral")
                cutscene:text("* You did not even get to drink any...", "smirk_closed")
            elseif choice == 2 then
                cutscene:setSpeaker(event)
                cutscene:text("* Me?", "neutral")
                cutscene:text("* There is not much to say.[wait:5] I am simply Asriel's college friend.", "smirk_look")
                cutscene:text("* I have a sweet tooth, [wait:5]like yourself.", "neutral")
                cutscene:text("* And I like being placed in lone graveyards for strange purposes.", "smirk_closed")
                cutscene:text("* I am just a human.", "neutral")
                cutscene:text("* And the more I talk about myself, [wait:5]the more you get uncomfortable.", "smirk")
                cutscene:text("* You learn to get over\nit eventually.", "scary")
                cutscene:text("* The fear, [wait:5]I mean.", "smirk_look")
                cutscene:text("* You learn to pick the ones around you better.", "smirk")
                cutscene:text("* There are many bad people in the world, [wait:5]as I am sure you know...", "neutral")
                cutscene:text("* Those who would hurt you without a second thought.", "scary")
                cutscene:text("* But even so, [wait:5]sometimes you will find...", "smirk_look")
                cutscene:text("* Little rays of sunshine. [wait:5]Like your brother.", "neutral")
                cutscene:text("* And a few others...", "neutral")
                cutscene:text("* As hard as it is, [wait:5]it is nice to look for such a thing.", "smirk")
                cutscene:text("* ...", "neutral")
                cutscene:text("* You understand. [wait:5]Do you not?", "smirk_look")
            end
        elseif event.interact_count == 3 then
            cutscene:setSpeaker(event)
            cutscene:text("* It seems I have exhausted my dialogue options.", "neutral")
            cutscene:text("* Perhaps if you come back later on, [wait:5]in another \"chapter\"...", "smirk")
            cutscene:text("* I might have something new to tell.", "smirk_look")
            cutscene:text("* Or not be here at all.", "neutral")
            cutscene:text("* I am not supposed to be here, [wait:5]not yet.", "smirk")
        else
            cutscene:setSpeaker(event)
            cutscene:text("* Get out of here, [wait:5]for now.", "smirk_closed")
        end
    end,
}