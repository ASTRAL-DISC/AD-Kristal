return {
    locked = function(cutscene, event)
        cutscene:text("* (It's locked.)")
    end,
	unlocked = function(cutscene, event)
        local event = Game.world.map:getEvent("bunker")
        local interact_count = event:getFlag("interact_count", 0)
        interact_count = interact_count + 1
        event:setFlag("interact_count", interact_count)
        if interact_count == 1 then
            local noelle = cutscene:getCharacter("noelle")
            local kris = cutscene:getCharacter("kris")
            --local susie = cutscene:getCharacter("susie")
            cutscene:text("* (It appears to be locked.)")
            cutscene:text("* (However, [wait:5]upon closer inspection...)")
            cutscene:text("* (It seems as if you can bust\nthe door open.)")
            cutscene:text("* (Try it out?)")
            local choice
            choice = cutscene:choicer({"Yes", "No"})
                
            if choice == 1 then
                event:setSprite("world/events/hometown/bunker/open")
                Game:setFlag("bunker_opened", true)
                Assets.playSound("locker")
                cutscene:wait(1)
                if noelle then
                    noelle:setSprite("walk_serious")
                    cutscene:setSpeaker("noelle")
                    cutscene:text("* It... [wait:5]It's open...?", "surprise_frown")
                    cutscene:text("* T-This should be locked...", "surprise_smile")
                    cutscene:text("* Kris... [wait:5]this is creepy, [wait:5]but...", "afraid_b")
                    cutscene:text("* A-At the same time, [wait:5]it's kind of...", "confused_surprise_b")
                    cutscene:text("* ...", "sad_side")
                    cutscene:text("* There are vines on the way, [wait:5]though.", "frown")
                    cutscene:text("* Maybe with the right tool, [wait:5]we could...", "confused_surprise")
                    cutscene:wait(0.3)
                    local x, y = cutscene:getMarker("noelle")
                    cutscene:wait(cutscene:walkTo(noelle, x, y, 1))
                    cutscene:look(noelle, Utils.facingFromAngle(Utils.angle(noelle, kris)))
                    cutscene:look(kris, Utils.facingFromAngle(Utils.angle(kris, noelle)))
                    cutscene:wait(0.2)
                    noelle:setSprite("walk_serious")
                    cutscene:text("* I-I'll wait here! [wait:5]Maybe you can find something useful in town, [wait:5]Kris?", "smile_closed")
                    cutscene:look(noelle, "down")
                    Game:removePartyMember("noelle")
                    Game:setFlag("noelle_wait", true)
                    noelle = noelle:convertToNPC()
                    noelle:setActor("noelle_lw")
                    noelle.cutscene = "bunker.noelle"
                    noelle.idle_sprite = "walk_serious"
                    noelle.sprite:setSprite("walk_serious")
                    noelle.turn = true
                    cutscene:look(kris, "down")
                end
            else
                cutscene:text("* (But your hands grew weak.)")
                if noelle then
                    cutscene:setSpeaker("noelle")
                    cutscene:text("* K-Kris...?", "surprise_smile")
                    cutscene:text("* (They look out of breath...)", "frown")
                    cutscene:text("* It's alright, [wait:5]Kris! [wait:5]M-Maybe we can come back to it... [wait:5]later?", "smile_closed")
                    cutscene:text("* (I've never seen them react like this...)", "confused_surprise")
                end
            end
        else
            if Game:getFlag("bunker_opened") and Game:getFlag("noelle_wait") then
                if not Game.inventory:hasItem("light/pruning_shears") then
                    cutscene:setSpeaker()
                    cutscene:text("* (The way is blocked by thick, [wait:5]old vines.)")
                    cutscene:text("* (You need a tool to go through.)")
                elseif not Game:getFlag("bunker_no_vines") then
                    Assets.playSound("noise")
                    event:setSprite("world/events/hometown/bunker/open_b")
                    cutscene:text("* (The vines were cut out of the way.)")
                    Game:setFlag("bunker_no_vines", true)
                else
                    cutscene:text("* (The passage is clear. [wait:5]Go in?)")
                    local choice2 = cutscene:choicer({"Yes", "No"})
                    if choice2 == 1 then
                        cutscene:text("* (But your legs felt like jelly...)")
                    else
                        cutscene:setSpeaker("noelle")
                        cutscene:text("* K-Kris...? [wait:5]You... [wait:5]don't wanna go in?", "surprise_smile")
                        cutscene:text("* Yeah, [wait:5]you're right, [wait:5]what are we even doing out here...?", "smile_closed_b")
                        cutscene:text("* It's dangerous for us to wander alone like this...", "smile_side")
                        cutscene:text("* (They look... [wait:5]scared...)", "sad_side")
                        local noelle = cutscene:getCharacter("noelle")
                        noelle:convertToFollower(1)
                        Game:addPartyMember("noelle", 2)
                        cutscene:alignFollowers()
                        cutscene:attachFollowers()
                        cutscene:wait(0.5)
                        cutscene:text("* Let's just go back to town, [wait:5]okay?", "smile_closed")
                        Game:setFlag("noelle_wait", false)
                    end
                end
            elseif not Game:getFlag("bunker_opened") then
                cutscene:setSpeaker()
                cutscene:text("* (You could bust this open if\nyou really wanted to.)")
                cutscene:text("* (But you don't. [wait:5]...Not right now.)")
            else
                cutscene:text("* (...Not right now.)")
            end
        end
    end,
    noelle = function(cutscene, event)
        local noelle = cutscene:getCharacter("noelle")
        local kris = cutscene:getCharacter("kris")
        if Game:getFlag("bunker_opened") and Game:getFlag("noelle_wait") then
            if Game.inventory:hasItem("light/pruning_shears") and not Game:getFlag("bunker_no_vines") then
                cutscene:setSpeaker(event)
                noelle:setSprite("walk")
                cutscene:text("* Oh! [wait:5]You found something?", "shock_b")
                cutscene:look(noelle, "up")
                cutscene:text("* Yes, [wait:5]this is perfect! [wait:5]We can cut the vines with this!", "blush_question")
                noelle:setSprite("walk_serious")
                cutscene:look(noelle, Utils.facingFromAngle(Utils.angle(noelle, kris)))
                cutscene:text("* Wait, [wait:5]isn't this your dad's...?", "confused")
                cutscene:text("* I hope Mr. Asgore doesn't mind that we took it...", "confused_surprise_b")
                cutscene:look(noelle, "up")
            elseif Game:getFlag("bunker_no_vines") then
                cutscene:setSpeaker(event)
                cutscene:text("* Oh! [wait:5]You did it!", "shock_b")
                cutscene:text("* Pruning shears, huh? [wait:5]Good thinking!", "smile_closed")
            else
                cutscene:setSpeaker(event)
                cutscene:text("* Don't take too long, [wait:5]okay?", "smile_closed_b")
                cutscene:text("* (Or, [wait:5]er... [wait:5]leave me alone out here...)", "confused_surprise")
            end
        end
    end,
}