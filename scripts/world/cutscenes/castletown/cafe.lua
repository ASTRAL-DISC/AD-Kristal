return {
    swatch = function(cutscene, event)
        cutscene:setSpeaker("swatch")
        cutscene:text("* Good evening, [wait:5]boss. [wait:5]Please, [wait:5]relax and enjoy yourself...")
        local choice = cutscene:choicer({"Check\nRecruits", "Recommendation", "Exit"})
        if choice == 1 then
            cutscene:after(function()
                Game.world:openMenu(RecruitMenuPlace())
            end)
        elseif choice == 2 then
            if event.interact_count == 1 then
                cutscene:text("* For the young human, [wait:5]we recommend a chocolate blueberry latte...")
                cutscene:text("* Boss, [wait:5]please try not to use all of the sugar.")
            elseif event.interact_count == 2 then
                if Game:getPartyIndex("noelle") == 2 then
                    cutscene:text("* For the young deer, [wait:5]we recommend the star fruit smoothie...")
                    cutscene:text("* Its stellar shape is very reminiscent of yuletide.")
                elseif Game:getPartyIndex("susie") == 2 then
                    cutscene:text("* For the young monster, [wait:5]we recommend the blackberry tart...")
                    cutscene:text("* This way, [wait:5]even if you eat it quickly, [wait:5]you won't notice the stains.")
                end
            else
                if Game:getPartyIndex("ralsei") == 3 then
                    cutscene:text("* For the young prince, [wait:5]we recommend the vanilla green tea.")
                    cutscene:text("* ... [wait:5]There's not much to go off besides your color.")
                elseif Game:getPartyIndex("berdly") == 3 then
                    cutscene:text("* For the young bluebird, [wait:5]we recommend the chocolate strawberry birds.")
                    cutscene:text("* ... [wait:5]There is a likeness.")
                elseif Game:getPartyIndex("noelle") == 3 then
                    cutscene:text("* For the young deer, [wait:5]we recommend the star fruit smoothie...")
                    cutscene:text("* Its stellar shape is very reminiscent of yuletide.")
                end
                cutscene:after(function()
                    event.interact_count = 0
                end)
            end
        else
            --
        end
    end,

    jukebox = function(cutscene, event)
        cutscene:text("* A working jukebox.")
        cutscene:text("* Would you like to play a song?")

        local choice = cutscene:choicer({"Yes", "No"})
        if choice == 1 then
            Assets.playSound("ui_select")
            cutscene:after(function()
                Game.world:openMenu(JukeboxMenu())
            end)
        else
            cutscene:text("* You decided to leave the jukebox in its undamaged\nstate.")
        end
    end,

    vee = function(cutscene, event)
        local vee = cutscene:getCharacter("vee")
        local rhyth = cutscene:getCharacter("rhyth")
        local lola = cutscene:getCharacter("lola")
        cutscene:setSpeaker(event)
        cutscene:text("[miniface:talk]Hey. [wait:5]We're kinda here to test\nout our minifaces.")
        cutscene:setSpeaker("rhyth")
        cutscene:text("[miniface:talk]YEAH!! [wait:5]That's right!")
        cutscene:setSpeaker("lola")
        cutscene:text("[miniface:talk]Not so loud, [wait:5]Rhyth...\n[wait:5][miniface:talk, 0, -4]Let's see if this works...?")
        cutscene:setSpeaker()
        cutscene:text("[func:vee_anim][miniface:vee/talk, 0, -5]Vee.[func:vee_stop]\n[wait:5][func:lola_anim][miniface:lola/talk, 0, -4]Lola...[func:lola_stop]\n[wait:5][func:rhyth_anim][miniface:rhyth/talk, 0, -3]Rhyth!![func:rhyth_stop]", {
            functions = {
                --this doesn't work
                vee_anim = function()
                    cutscene:setSpeaker("vee")
                end,
                vee_stop = function()
                    cutscene:setSpeaker()
                end,
                lola_anim = function()
                    cutscene:setSpeaker("lola")
                end,
                lola_stop = function()
                    cutscene:setSpeaker()
                end,
                rhyth_anim = function()
                    cutscene:setSpeaker("rhyth")
                end,
                rhyth_stop = function()
                    cutscene:setSpeaker()
                end,
            }
        })
        cutscene:setSpeaker(event)
        cutscene:text("[miniface:talk]We are...")
        cutscene:setSpeaker()
        cutscene:text("[wait:5][instant][miniface:vee/talk, 0, -5]The Jacksons!\n[miniface:lola/talk, 0, -4]The Jacksons!\n[miniface:rhyth/talk, 0, -4]The Jacksons!")
    end,

    lola = function(cutscene, event)
        cutscene:setSpeaker(event)
        cutscene:text("[miniface:talk]Hello, [wait:5]lightners...\n[wait:5][miniface:talk]Do you mind if some friends\nuse this textbox for a bit?")
        cutscene:text("[miniface:talk]No? [wait:5]You are too kind...\n[wait:5][miniface:talk]Here they are!")
        cutscene:setSpeaker()
        cutscene:text("[miniface:sweet/talk, -3, -6]Sweet!\n[wait:5][miniface:capn/talk, -3, 2]Cap'n!\n[wait:5][miniface:kk/talk, -3, -2]Cakes!")
    end,

    rhyth = function(cutscene, event)
        cutscene:setSpeaker(event)
        cutscene:text("[miniface:talk]Back for a rematch?!")
        cutscene:setSpeaker("lola")
        cutscene:text("[miniface:talk]Do you only ever say that...?")
        cutscene:setSpeaker(event)
        cutscene:text("[miniface:talk]Yes")
    end,
}
