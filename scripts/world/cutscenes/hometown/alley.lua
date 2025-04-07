return {
    saucer = function(cutscene, event)
        if cutscene:getCharacter("susie") then
            cutscene:text("* Hey Kris, [wait:5]this free milk? [wait:5]It's amazing.", "surprise_smile", "susie")
            cutscene:text("* It just magically refreshes itself over night.", "smile", "susie")
        else
            cutscene:text("* (It's a saucer of milk.)")
        end
    end,

    trashcan = function(cutscene, event)
        cutscene:text("* (It's a dirty trash can.)")
    end,

    trashflowers = function(cutscene, event)
        cutscene:text("* (It's a trash can full of well-kept flowers.)")
    end,

    spraypaint = function(cutscene, event)
        cutscene:text("* (Spray-painted hieroglyphs.)[wait:5]\n* (Who knows what they represent...)")
    end,
}