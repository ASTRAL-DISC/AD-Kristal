return {
    wrongway = function(cutscene, event)
        cutscene:text("* (Not the right way.)")
    end,

    house1 = function(cutscene, event)
        Assets.playSound("knock")
        cutscene:text("* (Knock knock knock...)")
        -- Changes each chapter, something offensive about humans lol
        cutscene:text("* Oooo, [wait:5]is that a humannnn?!")
        cutscene:text("* If humans are made of bones...")
        cutscene:text("* Where do skeletons come from...?")
    end,

    house2 = function(cutscene, event)
        Assets.playSound("knock")
        cutscene:text("* (Knock knock knock...)")
        -- Changes each chapter, Kris getting better at knocking
        cutscene:text("* Hmm... [wait:5]that knocking... [wait:5]it's amateur!")
        cutscene:text("* You've still got a long way to go!")
    end,

    apartments = function(cutscene, event)
        Assets.playSound("knock")
        cutscene:text("* (Knock knock knock...)")
        cutscene:text("* (Yo, [wait:5]Kris! [wait:5]You sound... [wait:5]tired.)")
        cutscene:text("* (Strange that you're, [wait:5]uhh,\n[wait:5]up so early!)")
        cutscene:text("* (You going to church today? [wait:5]T-That's a first.)")
    end,
}