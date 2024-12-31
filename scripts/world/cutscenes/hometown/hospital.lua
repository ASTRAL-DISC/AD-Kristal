return {
    rudy = function(cutscene, event)
        local rudy = cutscene:getCharacter("rudy_lw")
        if Game.chapter == 4 then
            cutscene:setSpeaker("rudy_lw")
            cutscene:text("* Hey Krismas! [wait:5]Back here for a routine check?!", "smile")
            cutscene:text("* I'm feeling great today! [wait:5]Nothin' like a good beauty sleep!", "smile_b")
            cutscene:text("* Surprised I have the energy, [wait:5]but hey, [wait:5]that just means good stuff.", "wink")
            cutscene:text("* You wanna chat?", "neutral")
            local choice = cutscene:choicer({"Noelle", "Current\nSituation", "Your Wife", "Nothing"})
            if choice == 1 then
                cutscene:setSpeaker("rudy_lw")
                cutscene:text("* Noelle... [wait:5]how's she doing lately?", "neutral")
                cutscene:text("* Heard from her that you two have been talking again.", "wink")
                cutscene:text("* With Susie, [wait:5]you three make quite a team!", "smile_b")
                cutscene:text("* So she has less time to visit me...", "serious")
                cutscene:text("* And that's amazing!!", "smile_b")
                cutscene:text("* She'll have more to do than hang out daily at a depressing hospital...", "smile_b")
                cutscene:text("* And... [wait:5]get sad that I'm here.", "sad")
                cutscene:text("* But don't worry too much! [wait:5]This Holiday's rising back up!", "wink")
                cutscene:text("* Soon I'll join your circle! [wait:5]Get ready for this old man, [wait:5]teens!!", "smile_b")
                cutscene:text("* But seriously, [wait:5]Kris. [wait:5]You should come by our house again.", "neutral")
                cutscene:text("* I think... [wait:5]that would make Noelle very happy.", "sad_side")
                cutscene:text("* I miss when you, [wait:5]your brother n' Dess would hang out with her.", "sad_side")
                cutscene:text("* Everything seemed... [wait:5]so easy back then.", "sad")
                cutscene:text("* ...", "serious")
                cutscene:text("* But hey!! [wait:5]You can make up for the lost time!", "smile_b")
                cutscene:text("* Tell me all about your exploring! [wait:5]Just remember to get me some popcorn.", "wink")
                Assets.playSound("rudylaugh")
                rudy:setAnimation({"laugh", 0.1, true})
                cutscene:wait(0.8)
                Assets.playSound("rudycough")
                rudy:setAnimation({"cough", 0.2, true})
                cutscene:wait(0.8)
                rudy:resetSprite()
            elseif choice == 2 then
                cutscene:setSpeaker("rudy_lw")
                cutscene:text("* Still here, [wait:5]huh.", "neutral")
                cutscene:text("* But doctors had very good news lately!", "smile")
                cutscene:text("* Won't go into details, [wait:5]don't wanna bore you with clinical stuff.", "wink")
                cutscene:text("* At least the cough's been getting better--", "smile", {auto = true})
                Assets.playSound("rudycough")
                rudy:setAnimation({"cough", 0.2, true})
                cutscene:wait(1.2)
                rudy:resetSprite()
                cutscene:text("* W-Well, [wait:5]goddamn!! [wait:5]Speak of the devil...!", "smile_b")
                cutscene:text("* But still, [wait:5]try not to worry too much.", "wink")
                cutscene:text("* Noelle already does plenty of that.", "sad_side")
            elseif choice == 3 then
                cutscene:setSpeaker("rudy_lw")
                cutscene:text("* What?[wait:5] What about the MAYOR of the town?", "neutral")
                cutscene:text("* You remember her, [wait:5]right? [wait:5]A fountain of charisma!!", "smile")
                cutscene:text("* One hell of a woman, [wait:5]I'll say.", "wink")
                cutscene:text("* She's always working to make the town a better place, [wait:5]y'know.", "neutral")
                cutscene:text("* Sometimes... [wait:5]a bit too much.", "sad")
                cutscene:text("* I wonder how I managed to land that stoic beauty!", "smile_b")
                cutscene:text("* I just wish... [wait:5]she'd go a little easier on Noelle.", "serious")
                cutscene:text("* She's too analytical for her own good. [wait:5]Dess would know.", "annoyed")
                cutscene:text("* It makes it... [wait:5]hard to have a REAL talk with her.", "sad")
                cutscene:text("* Guess it doesn't help that I'm just great at lifting up the mood.", "sad_side")
                cutscene:text("* This man right here? [wait:5]Sucks at confrontation!", "smile_b")
                cutscene:text("* So things... [wait:5]kinda stay the same.", "sad")
                cutscene:text("* Being a perfect parent's not for everyone...", "sad_side")
                cutscene:text("* But this stuff'll pass. [wait:5]I just know it!", "smile")
            else
                cutscene:setSpeaker("rudy_lw")
                cutscene:text("* What's with you and constantly coming here for nothing?!", "smile_b")
                cutscene:text("* Still, [wait:5]always nice seeing you, [wait:5]Kris.", "wink")
                cutscene:text("* Say hi to your mother for me.", "sad_side")
            end
        end
    end,
    gifts = function(cutscene, event)
        if Game.chapter == 4 then
            if event.interact_count > 1 then
                cutscene:text("* It's a fantasy book. [wait:5]There's a message written on the bookmark.")
                cutscene:text("* It reads: [wait:5]\"I got this for you from the library, [wait:5]so you can keep your mind stimulated\".")
                cutscene:text("* \"Apologies for not coming by more often. [wait:5]Tuesday will be my day off.\"")
                cutscene:text("* \"Get well soon. [wait:5]Make sure\nNoelle gets home early.\"[wait:5]\n            - C")
            else
                cutscene:setSpeaker("rudy_lw")
                cutscene:text("* That book was given to me by Noelle's mother.", "neutral")
                cutscene:text("* Haven't read it yet, [wait:5]but I just KNOW it's gonna be boring!", "smile_b")
                cutscene:text("* My wife likes those kind of things.", "sad_side")
                cutscene:text("* Should read it, [wait:5]will put you right to sleep.[react:1]", "wink", {reactions = {
                    {"(Don't tell her\nI said THAT!)", "right", "bottom", "smile_b", "rudy_lw"}
                }})
                cutscene:text("* Plus, [wait:5]it's nice that she came by for a change.", "sad_side")
            end
        elseif Game.chapter == 7 then
            cutscene:text("* It's a single red lily, [wait:5]neatly cared for.")
        end
    end,
    nurse = function(cutscene, event)
        if Game.chapter == 3 then
            cutscene:setSpeaker("nurse")
            cutscene:text("* Oh, [wait:5]hello. [wait:5]It's quite early for you to be here, [wait:5]isn't it?")
            cutscene:text("* Remember when you brought an\nold camera here to record yourself playing the piano?")
            cutscene:text("* Such a beautiful song... [wait:5]It's a shame the camera ended up breaking afterwards.")
            cutscene:text("* Did it survive the fall? [wait:5]The recording, [wait:5]I mean. [wait:5]It's a good memory.")
        else
            cutscene:setSpeaker("nurse")
            cutscene:text("* Hello, [wait:5]are you here to make an appointment...?")
            cutscene:text("* Just hanging out again? [wait:5]Well, [wait:5]ok.")
        end
    end,
    toy = function(cutscene, event)
        if Game:getFlag("snowgraved") then
            if Game.chapter == 3 then
                cutscene:text("* (One of the blue beads seems like it's been moved.)")
                cutscene:text("* (There's a miscolored, [wait:5]\nyellowish bead next to it.)")
            elseif Game.chapter == 4 then
                cutscene:text("* (One of the blue beads looks damaged.)")
                cutscene:text("* (Maybe they played with it too hard...?)")
                cutscene:text("* (... [wait:5]The thought makes you nauseous.)")
            elseif Game.chapter == 5 then
                cutscene:text("* (The yellowish bead has been removed from the toy.)")
                cutscene:text("* (The blue bead is now alone.)")
            elseif Game.chapter == 6 then
                cutscene:text("* (All of the blue beads seems to be damaged.)")
                cutscene:text("* (The red and green beads march on. [wait:6]They seem closer to their end goal.)")
            elseif Game.chapter == 7 then
                cutscene:text("* (No blue beads to be seen.)")
            end
        elseif Game.chapter == 4 then
            cutscene:text("* (There's a miscolored, [wait:5]\nyellowish bead among the blue ones.)")
        elseif Game.chapter == 6 then
            cutscene:text("* (One of the red beads is farther apart than the others.)")
            cutscene:text("* (The green beads march on, [wait:5]while the yellowish bead sticks by the lone blue bead.)")
            cutscene:text("* (All the beads of the toy seem closer to their end goal.)")
        elseif Game.chapter == 7 then
            cutscene:text("* (The beads have completed their adventure.)")
            cutscene:text("* (Seems like it was a loopy ride.)")
        else
            cutscene:text("* (The beads of the toy march on.)")
        end
    end,
    piano = function(cutscene, event)
        Assets.playSound("pianonoise")
        cutscene:text("* (Plink...)")
    end,
    sink = function(cutscene, event)
        cutscene:text("* (It's a regular sink.)")
    end,
    sink2 = function(cutscene, event)
        cutscene:text("* (It's a clone of the other sink.)")
        cutscene:text("* (Perhaps there was originally one tall sink that was cut in half to create both of them.)")
    end,
    cupboard = function(cutscene, event)
        cutscene:text("* (You looked inside the cupboard.)")
        cutscene:text("* (... a very small obligatory piano is hiding inside.)")
    end,
    painscale = function(cutscene, event)
        cutscene:text("* (It's a classic 1-to-10 pain scale, [wait:5]using ICE-E as a model.)")
        cutscene:text("* (At 0 pain, [wait:5]he's happy.)\n[wait:5]* (At 10 pain, [wait:5]he's happy and sweating.)")
    end,
    patient = function(cutscene, event)
        if Game.chapter == 3 then
            cutscene:text("* (Resting after a long day with\na fever.)")
        else
            cutscene:text("* (This bed looks more comfortable than the one in your room.)")
            cutscene:text("* (You get the urge to climb on\nit and sleep.)")
            cutscene:text("* (Go to sleep?)")
            local choice = cutscene:choicer({"Yes", "No"}) == 1
            if choice then
                if not Game:getFlag("torielcall") then
                    Assets.playSound("phone", 0.7)
                    cutscene:text("* (Ring, [wait:5]ring...)")
                    cutscene:setSpeaker("toriel_lw")
                    cutscene:text("* Kris, [wait:5]honey?", "worried")
                    cutscene:text("* I am just calling to know...", "worried")
                    cutscene:text("* Where exactly you are?", "unimpressed")
                    cutscene:text("* At the hospital? [wait:5]Ah...", "worried")
                    cutscene:text("* Visiting Rudolph, [wait:5]I assume?", "glad")
                    cutscene:text("* I apologize for the sudden call, [wait:5]I just...", "worried")
                    cutscene:text("* Had a strange, [wait:5]\"you are doing something wrong\" feeling.", "angry")
                    cutscene:text("* Do not worry, [wait:5]I am not mad!", "happy")
                    cutscene:text("* Well, [wait:5]I have been... [wait:5]concerned with you, [wait:5]lately.", "worried")
                    cutscene:text("* Just making sure that everything is alright, [wait:5]so...", "worried")
                    cutscene:text("* In case you ever feel a bit down, [wait:5]please.\n[wait:5]* Feel free to call.", "glad")
                    cutscene:text("* Well... [wait:5]That is all! [wait:5]You sound a bit tired.", "happy")
                    cutscene:text("* Come home soon, [wait:5]alright?", "glad")
                    cutscene:text("* ...", "worried")
                    cutscene:setSpeaker()
                    cutscene:text("* (Click...)")
                    Game:setFlag("torielcall", true)
                else
                    cutscene:text("* (Better not.)")
                end
            else
                cutscene:text("* (That'd be a bad idea.)")
            end
        end
    end,
    plaque = function(cutscene, event)
        cutscene:text("* (Patient Name:)[wait:5]\n* (Rudolph \"Rudy\" Holiday)")
        cutscene:setSpeaker("rudy_lw")
        cutscene:text("* Hey Kris, [wait:5]you forget my name or something!?", "smile")
    end,
    sink3 = function(cutscene, event)
        cutscene:text("* (It's a clone of the sinks in the other room.)")
        cutscene:setSpeaker("rudy_lw")
        cutscene:text("* You thirsty? [wait:5]Drink up, [wait:5]Kris!", "smile_b")
        cutscene:text("* Everytime you come here you look at the sink like... [wait:5]you're checking.", "sad_side")
    end,
    chair = function(cutscene, event)
        cutscene:text("* (It's a chair.)")
    end,
}