return {
    bloxer = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* I like to punch blocks.")
        end
    end,

    hathy = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* (Hathy seems fine.)")
        end
    end,

    head_hathy = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* (Head Hathy seems to be enjoyinhg the music.)")
        end
    end,

    ponman = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* These songs are making me sleepy...")
        end
    end,

    jigsawry = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* I'm fitting in!")
        end
    end,

    rabbick = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* Sukkiri...")
        end
    end,

    rudinn_ranger = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* I like blades!")
        end
    end,

    rudinn = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* Did you know our king is still imprisoned? [wait:5]I have no opinions about this.")
        end
    end,

    ambyulance = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* Wee-woo!")
        end
    end,

    maus = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* *squeak*")
        end
    end,

    mauswheel = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* *dizzy squeak*")
        end
    end,

    poppup = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* ASOBOH...")
        end
    end,

    swatchling = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* We hope you are enjoying the cafe, [wait:5]dear masters.")
        end
    end,

    tasque = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            Assets.playSound("electric_meow")
            cutscene:text("* *meow*")
        end
    end,

    tasque_manager = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            Assets.playSound("whip")
            cutscene:text("* Whip it into shape!")
        end
    end,

    virovirokun = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* I feel a lot better now!")
        end
    end,

    werewerewire = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* (It is torn between appreciating the music and fighting you...)")
        end
    end,

    werewire = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            Assets.playSound("electric_talk")
            cutscene:text("* Zzt...")
        end
    end,

    spoilert = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* I went to the movie premiere in the CINEMA! [wait:5]The plot twist caught me OFF GUARD!!")
        end
    end,

    shadowguy = function(cutscene, event, adjacent)
        cutscene:setSpeaker(event)
        local adjacent = cutscene:getEvent(adjacent.id)
        if adjacent.recruit then
            cutscene:text("* I'm sitting with " .. adjacent.recruit.name .. " here.")
        else
            cutscene:text("* Thanks for gettin' rid of my ol' Boss, [wait:5]boss!")
            cutscene:text("* Now I don't gotta worry about payin' bills.")
        end
    end,
}
