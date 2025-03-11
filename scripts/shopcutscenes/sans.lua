return {
    aboutyou = function(cutscene)
        cutscene:setTextboxPadding(6, 6)
        cutscene:emote("wink")
        cutscene:text("* about me?[wait:5]\n* just a lazy guy.\n[wait:5]* new in town.", nil, "sans_lw")

        cutscene:emote("talk")
        cutscene:text("* got a job here after getting in contact with the previous owner.", nil, "sans_lw")

        cutscene:emote("closed")
        cutscene:text("* kinda just happened.", nil, "sans_lw")

        cutscene:emote("talk")
        cutscene:text("* huh? [wait:5]you want to know more...?", nil, "sans_lw")

        cutscene:emote("side")
        cutscene:text("* sorry pal, [wait:5]i'm using my break to talk to you.", nil, "sans_lw")
        
        cutscene:emote("eyelids")
        cutscene:text("* we're on the clock here.[wait:5]\n* instead of spending it all learning about some janitor at the cashier...", nil, "sans_lw")

        cutscene:emote("wink")
        cutscene:text("* maybe you could buy some\ngroceries?", nil, "sans_lw") --bone-[wait:5]a-[wait:5]fide.
    end,

    chocolate = function(cutscene)
        cutscene:setTextboxPadding(6, 6)
        cutscene:emote("talk")
        cutscene:text("* huh? [wait:5]you want more chocolate?", nil, "sans_lw")
        cutscene:text("* too bad, [wait:5]kid.[wait:5]\n[emote:eyelids]* that was the last one.", nil, "sans_lw")

        cutscene:emote("eyelids_side")
        cutscene:text("* an angry officer came here and bought a huge amount of chocolate.", nil, "sans_lw")

        cutscene:emote("talk")
        cutscene:text("* you'll have to wait for more stock.", nil, "sans_lw")
    end,

    nochocolate = function(cutscene)
        cutscene:setTextboxPadding(6, 6)
        cutscene:emote("talk")
        cutscene:text("* sorry, [wait:5]we're outta chocolate.", nil, "sans_lw")

        cutscene:emote("eyelids")
        cutscene:text("* ain't that bar enough for now?", nil, "sans_lw")
    end,

    mom = function(cutscene)
        cutscene:setTextboxPadding(6, 6)
        cutscene:emote("eyelids")
        cutscene:text("* your mother...?", nil, "sans_lw")

        cutscene:emote("side")
        cutscene:text("* kid, [wait:5]if there's anyone who knows about her, [wait:5]it's you.", nil, "sans_lw")

        cutscene:emote("talk")
        cutscene:text("* ... [wait:5]what's with that look?", nil, "sans_lw")

        cutscene:emote("closed")
        cutscene:text("* she's a nice lady.[wait:5]\n* comes here often.", nil, "sans_lw")

        cutscene:emote("wink")
        cutscene:text("* there's nothing wrong with a lady coming to buy groceries, [wait:5]right?", nil, "sans_lw")
    end,

    placeholder = function(cutscene)
        cutscene:setTextboxPadding(6, 6)

        cutscene:emote("side")
        cutscene:text("* ...", nil, "sans_lw")
    end,

    store = function(cutscene)
        cutscene:setTextboxPadding(6, 6)

        cutscene:emote("closed")
        cutscene:text("* it's nice here,[wait:5] ain't it?", nil, "sans_lw")

        cutscene:emote("talk")
        cutscene:text("* i mean,[wait:5] hey,[wait:5] you don't see many grocery stores in this town.", nil, "sans_lw")

        cutscene:emote("side")
        cutscene:text("* which is... [wait:5]a very weird thing, [wait:5]don't ya think?", nil, "sans_lw")

        cutscene:emote("eyelids")
        cutscene:text("* heh, [wait:5]kidding.\n[wait:5]* this place is small, [wait:5]i know.[wait:5]\n* welp, [wait:5]it means less competition.", nil, "sans_lw")

        cutscene:emote("wink")
        cutscene:text("* good for me.", nil, "sans_lw")
    end,

    brother = function(cutscene)
        cutscene:setTextboxPadding(6, 6)

        cutscene:emote("talk")
        cutscene:text("* my brother?", nil, "sans_lw")

        cutscene:emote("eyelids_side")
        cutscene:text("* sorry, [wait:5]it'll have to wait.[wait:5]\n* he's not feeling up to it today.", nil, "sans_lw")

        cutscene:emote("closed")
        cutscene:text("* maybe one more day, [wait:5]maybe one\nmore year.", nil, "sans_lw")

        cutscene:emote("eyelids")
        cutscene:text("* could even be tomorrow.\n[wait:5]* who knows.", nil, "sans_lw")

        cutscene:emote("wink")
        cutscene:text("* now, [wait:5]how about you buy something?", nil, "sans_lw")
    end,

    wassup_new = function(cutscene)
        cutscene:setTextboxPadding(6, 6)

        cutscene:emote("wink")
        cutscene:text("* the [color:yellow][wait:5]c[wait:5]e[wait:5]i[wait:5]l[wait:5]i[wait:5]n[wait:5]g[wait:5][color:white].[sound:joke][wait:5]", nil, "sans_lw")

        cutscene:emote("talk")
        cutscene:text("* ...", nil, "sans_lw")

        cutscene:emote("eyelids")
        cutscene:text("* c'mon, [wait:5]not even a smirk?", nil, "sans_lw")

        cutscene:emote("talk")
        cutscene:text("* party pooper.", nil, "sans_lw")
    end,

    wassup = function(cutscene)
        cutscene:setTextboxPadding(6, 6)

        cutscene:emote("closed")
        cutscene:text("* i guess things are fine.", nil, "sans_lw")

        cutscene:emote("side")
        cutscene:text("* surprised you have the time to\nchat this often.", nil, "sans_lw")

        cutscene:emote("wink")
        cutscene:text("* don't you have something more important to be doing right now?", nil, "sans_lw")
    end,

    iknowyou = function(cutscene)
        cutscene:setTextboxPadding(6, 6)

        cutscene:emote("wink")
        cutscene:text("* i mean, [wait:5]yeah.[wait:5]\n* considering we talked yesterday, [wait:5]\ni guess we do know each other.", nil, "sans_lw")

        cutscene:emote("talk")
        cutscene:text("* ...", nil, "sans_lw")

        cutscene:emote("side")
        cutscene:text("* huh. [wait:5]you know me from before?", nil, "sans_lw")

        cutscene:emote("talk")
        cutscene:text("* funny, [wait:5]kid.[wait:5]\n* especially considering i'm new to this town. [wait:5]came here last week.", nil, "sans_lw")

        cutscene:emote("eyelids")
        cutscene:text("* could it be, [wait:5]huh.", nil, "sans_lw")

        cutscene:emote("wink")
        cutscene:text("* did i become a famous celebrity without knowing?", nil, "sans_lw")

        cutscene:emote("side")
        cutscene:text("* ... [wait:5]nah.[wait:5]\n* that seems like way too much work.", nil, "sans_lw")
    end,

    timelines_new = function(cutscene)
        cutscene:setTextboxPadding(6, 6)

        cutscene:emote("closed")
        cutscene:text("* oh, [wait:5]yeah, [wait:5]yeah.[wait:5]\n* i know about this.", nil, "sans_lw")

        cutscene:emote("talk")
        cutscene:text("* i used to be into quantum physics and sci-fi when i was younger.", nil, "sans_lw")

        cutscene:emote("side")
        cutscene:text("* i even remember a dream i had once where there were many clones of myself...", nil, "sans_lw")

        cutscene:emote("talk")
        cutscene:text("* ...", nil, "sans_lw")

        cutscene:emote("eyelids_side")
        cutscene:text("* not gonna lie, [wait:5]that was a very weird experience.", nil, "sans_lw")

        cutscene:emote("wink")
        cutscene:text("* uh,[wait:5] speaking of which...", nil, "sans_lw")

        cutscene:emote("talk")
        cutscene:text("* do you like scary sci-fi stuff, [wait:5]kid?\n[wait:5]* feel like you do.", nil, "sans_lw")
        
        cutscene:emote("side")
        cutscene:text("* ok, [wait:5]ok.[wait:5]\n* did ya know that if you go back \nin time and meet your younger\nself, [wait:5]a temporal paradox happens?", nil, "sans_lw")

        cutscene:emote("eyelids_side")
        cutscene:text("* and you simply disappear.[wait:5]\n* from all timelines.", nil, "sans_lw")

        cutscene:emote("talk")
        cutscene:text("* you go [wait:5]\"poof\".[wait:5]\n* just like that...", nil, "sans_lw")

        cutscene:emote("closed")
        cutscene:text("* and every trace of your existence is completely erased.", nil, "sans_lw")

        cutscene:emote("wink")
        cutscene:text("* ... [wait:5]i have to say... [wait:5]i'd hate if something like that happened to me.[wait:5]\n* what'd be of my brother if he didn't have me around?", nil, "sans_lw")

        cutscene:emote("eyelids_side")
        cutscene:text("* i'm such a good older brother to him.", nil, "sans_lw")
    end,

    timelines = function(cutscene)
        cutscene:setTextboxPadding(6, 6)

        cutscene:emote("talk")
        cutscene:text("* still interested in that, [wait:5]kid?", nil, "sans_lw")

        cutscene:emote("eyelids_side")
        cutscene:text("* reminds me that i got this old quantum physics book...", nil, "sans_lw")

        cutscene:emote("wink")
        cutscene:text("* could let you borrow it, [wait:5]but you might find some pages [color:yellow]humerus[color:reset]... [sound:joke][wait:5]", nil, "sans_lw")

        cutscene:emote("side")
        cutscene:text("* ... [wait:5]i used it as pun writing practice.\n[wait:5]* ignore those if it's not your\ncup o' tea.", nil, "sans_lw")

        cutscene:emote("talk")
        cutscene:text("* huh? [wait:5]when you'll be borrowing it?", nil, "sans_lw")

        cutscene:emote("wink")
        cutscene:text("* gotta remove all the dust first.\n[wait:5]* maybe when you see my brother,\n[wait:5]you can have your afternoon read.", nil, "sans_lw")
    end,
}