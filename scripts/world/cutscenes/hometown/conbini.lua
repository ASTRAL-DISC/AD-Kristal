return {
    sans = function(cutscene, event)
        cutscene:setSpeaker("sans_lw")
        cutscene:text("* hey, [wait:5]what's up?", "neutral")
        cutscene:setSpeaker()
        local choice = cutscene:choicer({"Buy Things", "Talk", "See Brother", "Nothing"})
        if choice == 1 then
            Game.world:shopTransition("sans")
        elseif choice == 2 then
            cutscene:setSpeaker("sans_lw")
            cutscene:text("* so cool!", "wink")
            cutscene:text("* so cool!", "wink")
            cutscene:text("* so cool!", "wink")
            cutscene:text("* so cool!", "wink")
            cutscene:text("* so cool!", "wink")
            local susie = cutscene:getCharacter("susie")
            local noelle = cutscene:getCharacter("noelle")
            if susie then
                cutscene:setSpeaker("susie")
                cutscene:text("* SHUT THE FUCK UP", "teeth_b")
                cutscene:setSpeaker("sans_lw")
                cutscene:text("* so cool...", "eyelids_side")
            elseif noelle then
                cutscene:setSpeaker("noelle")
                cutscene:text("* Will you, [wait:5]um... [wait:5]stop any time soon?", "confused_surprise_b")
                cutscene:setSpeaker("sans_lw")
                cutscene:text("* ... [wait:5]stop with what?", "neutral")
            end
        elseif choice == 3 then
            cutscene:setSpeaker("sans_lw")
            cutscene:text("* ...", "neutral")
            cutscene:text("* no", "half_closed")
        elseif choice == 4 then
            cutscene:setSpeaker("sans_lw")
            cutscene:text("* hm, [wait:5]ok.", "wink")
        end
    end,
    trash = function(cutscene, event)
        cutscene:setSpeaker("sans_lw")
        cutscene:text("* that's just trash, [wait:5]buddy.[wait:5][react:1]", "neutral", {reactions = {
			{"testing my font\nreal quick", "right", "mid", "wink", "sans_lw"}
		}})
    end,
    baskets = function(cutscene, event)
        cutscene:text("* (You can't reach the top, [wait:5]rendering it impossible to get\na basket.)")
        cutscene:text("* (You'll never be able to buy something at this state...)")
    end,
    magazines = function(cutscene, event)
        cutscene:text("* Ice-E's Pizza Pin-Ups Mangazine.")
        cutscene:text("* HOt and fresh chease, [wait:5]pepperonie, [wait:5]Just like in your Dream's...")
    end,
    magazines2 = function(cutscene, event)
        cutscene:text("* It's a zine for Jockington\nfans. [wait:5]Seems popular.")
    end,
    valentines = function(cutscene, event)
        cutscene:text("* It's a bunch of cards and heart shaped chocolates.")
        cutscene:text("* \"Get well soon!\"[wait:5]\n* \"I'm glad your bike crashed\"")
    end,
    eggs = function(cutscene, event)
        cutscene:text("* LOOSE EGGS $1")
        cutscene:text("* (It's too much responsibility for an egg.)")
    end,
    freezer = function(cutscene, event)
        cutscene:text("* (Various frozen bagels and treats.)")
    end,
    rack = function(cutscene, event)
        cutscene:text("* (It's a rack of candy, [wait:5]jerky, [wait:5]and various nuts.)")
    end,
    fruits = function(cutscene, event)
        cutscene:text("* (Grapes, [wait:5]melons, [wait:5]oranges, [wait:5]and the scent of fresh pineapples...)")
    end,
    fruitsfake = function(cutscene, event)
        cutscene:text("* (It looks like a normal basket of fruit, [wait:5]but when you reach in...)")
        cutscene:text("* (... [wait:5]It's incredibly deep and holds all sorts of things.)")
    end,
    palmtree = function(cutscene, event)
        cutscene:text("* (It looks like a normal palm tree, [wait:5]but it's chock-full of useful groceries.)")
    end,
}