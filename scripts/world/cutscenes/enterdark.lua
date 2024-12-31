return function(cutscene, event)
    local kris = cutscene:getCharacter("kris_lw")
    local susie = cutscene:getCharacter("susie_lw")
    local noelle = cutscene:getCharacter("noelle_lw")
    local berdly = cutscene:getCharacter("berdly_lw")

    cutscene:detachCamera()
    cutscene:detachFollowers()

    if susie then
        if noelle then
            cutscene:slideTo(kris,  620 - 60, 245, 0.25)
            cutscene:slideTo(susie, 620 + 50, 245, 0.25)
            cutscene:slideTo(noelle, 620, 245, 0.25)
        else
            cutscene:slideTo(kris,  620 - 30, 280, 0.25)
            cutscene:slideTo(susie, 620 + 30, 280, 0.25)
        end
    elseif noelle then
        cutscene:slideTo(kris,  620 - 30, 280, 0.25)
        cutscene:slideTo(noelle, 620 + 30, 280, 0.25)
    else
        cutscene:slideTo(kris,  620, 280, 0.25)
    end

    cutscene:panTo(620, 245, 0.25)
    cutscene:wait(0.25)

    if susie then
        if noelle then
            kris.visible = false
            susie.visible = false
            noelle.visible = false
        else
            kris.visible = false
            susie.visible = false
        end
    else
        if noelle then
            kris.visible = false
            noelle.visible = false
        else
            kris.visible = false
        end
    end

    local transition
    local interact_count = event:getFlag("interact_count", 0)
    interact_count = interact_count + 1
    event:setFlag("interact_count", interact_count)

    if #Game.party == 1 then
        if interact_count > 1 and Game:getFlag("junkball") then
            if Game.chapter == 3 then
                transition = DarkTransition(280, {
                    movement_table = {0},
                    has_head_object = true,
                    quick_mode = true,
                    head_object_sprite = "world/events/hometown/junkball/ch3",
                    head_object_off_x = 0,
                    head_object_off_y = -25,
                })
            else
                transition = DarkTransition(280, {
                    movement_table = {0},
                    has_head_object = true,
                    quick_mode = true,
                    head_object_sprite = junkball.sprite.texture_path,
                })
            end
        elseif Game:getFlag("junkball") then
            if Game.chapter == 3 then
                transition = DarkTransition(280, {
                    movement_table = {0},
                    has_head_object = true,
                    head_object_sprite = "world/events/hometown/junkball/ch3",
                    head_object_off_x = 0,
                    head_object_off_y = -25,
                })
            else
                transition = DarkTransition(280, {
                    movement_table = {0},
                    has_head_object = true,
                    head_object_sprite = junkball.sprite.texture_path,
                })
            end
        elseif interact_count > 1 then
            transition = DarkTransition(280, {movement_table = {0}, quick_mode = true})
        else
            transition = DarkTransition(280, {movement_table = {0}})
        end
    elseif interact_count > 1 then
        if Game:getFlag("junkball") then
            if Game.chapter == 3 then
                transition = DarkTransition(280, {
                    has_head_object = true,
                    head_object_sprite = "world/events/hometown/junkball/ch3",
                    quick_mode = true,
                    head_object_off_x = 0,
                    head_object_off_y = -25,
                })
            else
                transition = DarkTransition(280, {
                    has_head_object = true,
                    head_object_sprite = junkball.sprite.texture_path,
                    quick_mode = true,
                })
            end
        else
            transition = DarkTransition(280, {quick_mode = true})
        end
    elseif Game:getFlag("junkball") then
        if Game.chapter == 3 then
            transition = DarkTransition(280, {
                has_head_object = true,
                head_object_sprite = "world/events/hometown/junkball/ch3",
                head_object_off_x = 0,
                head_object_off_y = -25,
            })
        else
            transition = DarkTransition(280, {
                has_head_object = true,
                head_object_sprite = junkball.sprite.texture_path,
            })
        end
    else
        transition = DarkTransition(280)
    end

    transition.layer = 99999

    Game.world:addChild(transition)

    local waiting = true
    local endData = nil

    transition.land_callback = function()
        if Game:getFlag("junkball") then
            if Game.chapter == 3 then
                Game:setFlag("ct_expansion1", true)
            elseif Game.chapter == 4 then
                Game:setFlag("ct_expansion2", true)
            elseif Game.chapter == 5 then
                Game:setFlag("ct_expansion3", true)
            elseif Game.chapter == 6 then
                Game:setFlag("ct_expansion4", true)
            elseif Game.chapter == 7 then
                Game:setFlag("ct_expansion5", true)
            end
        end
        cutscene:loadMap("castletown/entrance")
        local dwexit = Game.world.map:getEvent("dwexit")
        dwexit:remove()
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        local noelle = cutscene:getCharacter("noelle")
        local berdly = cutscene:getCharacter("berdly")
        if susie then
            if noelle then
                kris.visible = false
                susie.visible = false
                noelle.visible = false
            else
                kris.visible = false
                susie.visible = false
            end
        else
            if noelle then
                kris.visible = false
                noelle.visible = false
            else
                kris.visible = false
            end
        end
    end

    transition.end_callback = function(transition, data)
        waiting = false
        endData = data
    end

    cutscene:wait(function() return not waiting end)

    for _, character in ipairs(endData) do
        local char = Game.world:getPartyCharacter(character.party)
        local kx, ky = character.sprite_1:localToScreenPos(character.sprite_1.width / 2, 0)
        char:setScreenPos(kx, transition.final_y)
        char.visible = true
        char:setFacing("down")
    end

    cutscene:interpolateFollowers()

    cutscene:attachCamera()
    cutscene:attachFollowers()
end