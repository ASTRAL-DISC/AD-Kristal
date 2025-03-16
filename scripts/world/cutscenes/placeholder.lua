return {
    door = function(cutscene, event)
        cutscene:text("* (The door is locked.)")
    end,

    locked = function(cutscene, event)
        cutscene:text("* (It's locked.)")
    end,

    text = function(cutscene, event)
        if event then
            cutscene:text("* Hi! [wait:5]This is still placeholder!", nil, event)
        else
            cutscene:text("* Placeholder!")
        end
    end,
}