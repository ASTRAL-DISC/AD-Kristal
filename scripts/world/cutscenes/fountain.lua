-- Taken/adapted from Dark Place + Dark Place Rebirth
return function(cutscene)
    local fountain = Game.world:getEvent("darkfountain")

    local kris = Game.world.player
    local susie = Game:getPartyMember("susie")
    local noelle = Game:getPartyMember("noelle")

    --if not susie or noelle then return end

    local v_susie = "[spacing:1.75][voice:susie]"
    local v_noelle = "[spacing:1.75][voice:noelle]"

    Kristal.hideBorder(1)
    
    local dialogue = DialogueText({""}, 100, 80, (SCREEN_WIDTH - 100 * 2) + 14)
    dialogue:setLayer(WORLD_LAYERS["textbox"])
    dialogue:addFunction("look", function(self, chara, dir)
        cutscene:look(chara, dir)
    end)
    local function showDialogue(text)
        local style = "[noskip][speed:0.3][voice:nil]"
        local _text
        if type(text) == "string" then
            _text = style .. text
        else
            _text = Utils.copy(text)
            for i, v in ipairs(_text) do
                _text[i] = style .. v
            end
        end
        
        dialogue.visible = true
        dialogue:setText(_text)
        cutscene:wait(function() return dialogue:isDone() end)
        dialogue.visible = false
    end
    Game.world:addChild(dialogue)

    cutscene:wait(cutscene:fadeOut(0)) -- remove fadein
    cutscene:fadeIn(3)

    cutscene:detachFollowers()

    local party_walk_wait
    local start_x, start_y
    local walk_x, walk_y
    for _, member in ipairs(Game.party) do
        local chara = cutscene:getCharacter(member.id)
        start_x, start_y = cutscene:getMarker(member.id)
        walk_x, walk_y = cutscene:getMarker(member.id .. "2")
        chara:setPosition(start_x, start_y)
        party_walk_wait = cutscene:walkTo(chara, chara.x, walk_y, 6)
    end

    cutscene:wait(party_walk_wait)
    cutscene:wait(1)
    
    local function sealFountain(map, marker, facing)
        showDialogue("[speed:0.6](It was as if your very SOUL was glowing...)")

        Game.world.music:stop()
        local soul = Game.world:spawnObject(YourPower(kris.x, kris.y - kris.height + 10), "ui")
        soul.color = {1, 0, 0}
        cutscene:playSound("great_shine")
        cutscene:wait(1)
        
        cutscene:playSound("usefountain", 1)
    
        cutscene:wait(50/30)
        fountain.adjust = 1
        local heart_x, heart_y = cutscene:getMarker("heart")
        Game.world.timer:tween(170/30, soul, {y = heart_y})
        Game.world.timer:during(170/30, function()
            fountain.eyebody = fountain.eyebody - (fountain.eyebody * (1 - 0.98) * DTMULT)
        end)
        cutscene:wait(170/30)
        fountain.adjust = 2 -- freeze in place and fade to white
        cutscene:wait(3)
    
        cutscene:playSound("revival")
        soul:shine()
    
        local flash_parts = {}
        local flash_part_total = 12
        local flash_part_grow_factor = 0.5
        for i = 1, flash_part_total - 1 do
            -- width is 1px for better scaling
            local part = Rectangle(SCREEN_WIDTH / 2, 0, 1, SCREEN_HEIGHT)
            part:setOrigin(0.5, 0)
            part.layer = soul.layer - i
            part:setColor(1, 1, 1, -(i / flash_part_total))
            part.graphics.fade = flash_part_grow_factor / 16
            part.graphics.fade_to = math.huge
            part.scale_x = i*i * 2
            part.graphics.grow_x = flash_part_grow_factor * i * 2
            table.insert(flash_parts, part)
            Game.world:addChild(part)
        end
    
        local function fade(step, color)
            local rect = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
            rect:setParallax(0, 0)
            rect:setColor(color)
            rect.layer = soul.layer + 1
            rect.alpha = 0
            rect.graphics.fade = step
            rect.graphics.fade_to = 1
            Game.world:addChild(rect)
            cutscene:wait(1 / step / 30)
        end

        cutscene:wait(50/30)
        fade(0.02, {1, 1, 1})
        cutscene:wait(20/30)
        cutscene:wait(cutscene:fadeOut(100/30, {color = {0, 0, 0}}))
        cutscene:wait(1)

        cutscene:fadeIn(1, {color = {1, 1, 1}})
        Kristal.showBorder(1)
        cutscene:after(function()
            Game.world:loadMap(map, marker, facing)
        end)
    end

    if Game.chapter == 3 then
        showDialogue({
            -- placeholder dialogue
            v_susie.."Kris...",
            v_susie.."I'm gonna be honest with you.",
            v_susie.."I expected everything out of the Dark Worlds...",
            v_susie.."Out of the Knight's schemes...",
            v_susie.."...",
            v_susie.."[func:look,susie,right]But one thing I didn't expect...",
            v_susie.."Was YOU opening a fountain.",
            v_susie.."[func:look,susie,up]Ralsei warned us, remember?",
            v_susie.."...",
            v_susie.."[func:look,susie,right]... You got nothing to say?",
            v_susie.."[func:look,susie,up]...",
            v_susie.."[func:look,susie,left]... Y'know. Can't really be the judge...",
            v_susie.."When I'm enjoying these adventures too.",
            v_susie.."[func:look,susie,up]So, I guess...",
            v_susie.."That makes us kinda even.",
            v_susie.."Just... Don't go around opening fountains, alright?",
            v_susie.."[func:look,susie,right]If you want an adventure with family and friends...",
            v_susie.."[func:look,susie,up]You can always count on me for it.",
            v_susie.."... Anyway. Go do your thing.",
        })

        cutscene:wait(cutscene:walkTo(kris, "sealready", 2))
        sealFountain("castletown/main2", "spawn", "down")
    elseif Game.chapter == 4 then
        showDialogue({
            -- placeholder dialogue
            v_noelle.."...",
            v_noelle.."This... is the fountain...?",
            v_noelle.."I've never... seen it so up close...",
            v_noelle.."This place... It reminds me so much of my dream.",
            v_noelle.."[func:look,noelle,right]...",
            v_noelle.."Dess... she used to tell me about places like this.",
            v_noelle.."[func:look,noelle,up]Regardless of where she is right now, I wonder...",
            v_noelle.."Does she have anything to remember us by?",
            v_noelle.."[func:look,noelle,left]Does she think of me? Of the promises we've made...?",
            v_noelle.."[func:look,noelle,up]And I just hope...",
            v_noelle.."She gets to see the same shining lights and go on the same adventures...",
            v_noelle.."That I keep dreaming about.",
            v_noelle.."[func:look,noelle,left]...",
            v_noelle.."[func:look,noelle,left]Kris... I...",
            v_noelle.."... I would like to be your friend again.",
            v_noelle.."I'd like to explore again. With you.",
            v_noelle.."... And if we can find Dess someday, then...",
            v_noelle.."... I hope...",
            v_noelle.."[func:look,noelle,up]... I-I'm rambling, aren't I...? Sorry.",
            v_noelle.."It seems like you have something important to do...",
        })

        cutscene:wait(cutscene:walkTo(kris, "sealready", 2))
        sealFountain("castletown/main2", "spawn", "down")
    elseif Game.chapter == 5 then
        showDialogue({
            -- placeholder dialogue
            v_noelle.."...",
            v_susie.."[func:look,susie,right]... What?",
            v_noelle.."J-Just to double check...",
            v_noelle.."[func:look,noelle,left]This is all real, isn't it?",
            v_susie.."[func:look,susie,left]... I didn't want to tell you earlier, but...",
            v_susie.."[func:look,susie,right]Yeah.",
            v_noelle.."[func:look,noelle,up]I see...",
            v_noelle.."I wonder...",
            v_noelle.."I wonder why it has to be Kris...?",
            v_noelle.."If any of us can open a Dark Fountain...",
            v_noelle.."... Then can't any of us seal it...?",
            v_susie.."[func:look,susie,right]... You have a point.",
            v_susie.."[func:look,susie,up]Hell if I know why.",
            v_noelle.."[func:look,noelle,left]It's just... It's so strange...",
            v_noelle.."The way these Fountains started appearing...",
            v_noelle.."[func:look,noelle,right]It's like this \"story\" has a set beginning and end.",
            v_susie.."[func:look,susie,right][func:look,noelle,left] Ralsei's prophecy...",
            v_susie.."Do we even HAVE to fulfill it?",
        })

        cutscene:wait(cutscene:walkTo(kris, "sealready", 2))

        for _,member in ipairs(Game.party) do
            cutscene:getCharacter(member.id):setFacing("up")
        end

        showDialogue({
            -- placeholder dialogue
            v_susie.."... Sorry, Kris.",
            v_susie.."You want to get us home, right?",
            v_noelle.."We've spent so long here, the others must be worried...",
            v_susie.."Then...",
            v_susie.."...",
            v_noelle.."[func:look,noelle,left]Susie...?",
            v_susie.."[func:look,susie,right]I'm alright.",
            v_susie.."[func:look,susie,left]There's just... something I need to tell you guys.",
            v_susie.."[func:look,susie,up]... When we get back.",
            v_susie.."[func:look,noelle,up]Go ahead, Kris.",
        })

        cutscene:wait(0.8)

        sealFountain("castletown/main2", "spawn", "down")
    end
end