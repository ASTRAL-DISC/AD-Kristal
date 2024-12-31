return {
    closet = function(cutscene, event)
        cutscene:text("* (Managed to cram everything into the closet. [wait:5]Even the rug.)")
    end,
    drawing = function(cutscene, event)
        cutscene:text("* (It's a yellowed, [wait:5]poorly-drawn picture of a green turtle.)")
        cutscene:text("* (It's signed \'Alvin\'.)")
    end,
}