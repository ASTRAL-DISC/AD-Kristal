return {
    locked = function(cutscene, event)
        cutscene:text("* (The door is locked.)")
    end,
    locked2 = function(cutscene, event)
        cutscene:text("* (It's locked.)")
    end,
    placeholder = function(cutscene, event)
        cutscene:text("* Placeholder! [wait:5]Placeholder!")
    end,
}