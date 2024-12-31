return {
    junkball = function(cutscene, event)
        local black = Rectangle(0, 0, Game.world.width, Game.world.height)
        black:setColor(0, 0, 0)
        black.alpha = 0
        Game.world:spawnObject(black, "below_ui")
        Game.world.timer:tween(1, black, {alpha = 1})

        cutscene:wait(1.5)
        cutscene:text("* (Before you left, [wait:5]you gathered up everything in the room...)")
        cutscene:wait(0.5)
        cutscene:wait(cutscene:mapTransition("hometown/torhouse/outside", "entry", "down"))
        black:fadeOutAndRemove(1)

        Game:setFlag("junkball", true)
        local player = Game.world.player
        local junkball = Junkball()
        junkball:setSprite("world/events/hometown/junkball/ch3")
        junkball:setParent(player)
        junkball:setLayer(player.layer + 1)
        junkball.x = player.width/2
        junkball.y = 6
        junkball:setScale(1)
        cutscene:wait(0.5)
        cutscene:text("* (...and turned it into a heavy, [wait:5]wagon-ball.)")
        Game.lock_movement = false
    end,
    bathroom = function(cutscene, event)
        cutscene:text("* (No need for it right now.)")
    end,
    torieldoor = function(cutscene, event)
        cutscene:text("* (You hear your mother\nwhispering to herself...)")
        if Game:getFlag("stormeyed") then
        end
        cutscene:wait(1)
        local black = Rectangle(0, 0, Game.world.width, Game.world.height)
        black:setColor(0, 0, 0)
        black.alpha = 0
        Game.world:spawnObject(black, "below_ui")
        Game.world.timer:tween(2, black, {alpha = 1})
        cutscene:wait(2)
        Game.world.music:fade(0, 1)
        cutscene:wait(1)
        Game.world.music:stop()
        cutscene:wait(1)
        Game.world.music:play("denial", 0.8, 0.94)
        cutscene:text("* [speed:0.5](... [wait:5]keep these logs as a way to...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](... \"Find\" myself among all this.)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](And to register what has caught my eye...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](I am... [wait:5]so worried about\nKris, [wait:5]lately.)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](There is something they are\nnot telling me.)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](Something that seems to make them uncomfortable.)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](... [wait:5]I always tell them:)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](\"Kris...\")\n[wait:5]* (\"If you need anything,\n[wait:5]simply call.\")", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](\"Kris, [wait:5]will you promise...\")", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](\"... to tell me what might be going on, [wait:5]if you ever find yourself in a...\")", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](\"'scary' situation?\")", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](Why is it that whenever I try to get closer to my child...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](They seem to slip farther away...?)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](They refuse to talk to me.)\n[wait:5]* (I always have to go to them first.)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](And lately, [wait:5]it seems like...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](... Ah, [wait:5]it has just gotten worse... [wait:5]has it not?)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](What am I supposed to do as a mother if I cannot even have a conversation with my child?)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](... [wait:10]Did I fail?)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](Not to mention...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](All of this is getting to me\nin the worst of ways...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](I am not one to keep a dream diary, [wait:5]but...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](Yesterday marked the strangest experience I have ever had.)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](A lucid dream... [wait:5]One so real that I cannot... [wait:5]bring myself\nto believe it.)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](I cannot believe in what I saw.)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](... [wait:5]That was not my child.)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](They would never...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](Suddenly, [wait:5]the thought of them having a knife of their own...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](Sounds...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](... [wait:5]No, [wait:5]no, [wait:5]Tori. [wait:5]Please do\nnot do this.)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](What can a mother do...)", nil, "toriel_lw")
        Game.world.music:fade(0, 1)
        cutscene:wait(1)
        Game.world.music:stop()
        cutscene:text("* [speed:0.5](If she finds herself afraid of her own child?)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](...)", nil, "toriel_lw")
        cutscene:text("* [speed:0.5](... [wait:5]I need to rest.)", nil, "toriel_lw")
        cutscene:wait(2)
        black:fadeOutAndRemove(2)
        cutscene:text("* (You should leave.)")
        Game.world.music:play("crickets", 0)
        Game.world.music:fade(1, 1)
    end,
    wrongway = function(cutscene, event)
        cutscene:text("* (Can't let your mother see you carrying things out of your house.)")
    end,
    wrongway2 = function(cutscene, event)
        cutscene:text("* (Not the way to the school.)")
    end,
    computer = function(cutscene, event)
        cutscene:text("* Placeholder!")
    end,
    drawer1 = function(cutscene, event)
        cutscene:text("* Placeholder!")
    end,
    drawer2 = function(cutscene, event)
        cutscene:text("* Placeholder!")
    end,
    window = function(cutscene, event)
        cutscene:text("* Placeholder!")
    end,
    krisbed = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local bedsheet = cutscene:getEvent("bedsheet")

        cutscene:text("* (It's your bed. [wait:5]Go to sleep?)")

        if cutscene:choicer({"Yes", "No"}) == 1 then
            Game.lock_movement = true
            cutscene:detachCamera()
            kris:walkTo("kris", 1, "left")

            cutscene:wait(1)
            Assets.playSound("wing")
            if Game.world.map.id == "hometown_dark/torhouse/kris_rm" then
                bedsheet:setSprite("world/events/hometown/bedsheet/dark_1")
            else
                bedsheet:setSprite("world/events/hometown/bedsheet/light_1")
            end
            Game.world.music:fade(0.5, 2)
            Game.world.timer:tween(2, Game.world.music, {pitch = 0.95})
            local black = Rectangle(0, 0, Game.world.width, Game.world.height)
            black:setColor(0, 0, 0)
            black.alpha = 0
            Game.world:spawnObject(black, "below_ui")
            Game.world.timer:tween(2, black, {alpha = 0.4})

			cutscene:wait(function() return Input.pressed("confirm") end); Input.clear("confirm")

            Assets.playSound("wing")
            black:fadeOutAndRemove(1)
            Game.world.music:fade(0.8, 1)
            Game.world.timer:tween(1, Game.world.music, {pitch = 1})
            if Game.world.map.id == "hometown_dark/torhouse/kris_rm" then
                bedsheet:setSprite("world/events/hometown/bedsheet/dark_2")
            else
                bedsheet:setSprite("world/events/hometown/bedsheet/light_2")
            end
            cutscene:wait(2)
            kris:walkTo("kris_wake", 2, "down")
            Game.lock_movement = false
            cutscene:attachCamera()
		else
			cutscene:text("* (That's fine.)")
		end
    end,
    birdcage = function(cutscene, event)
        cutscene:text("* Placeholder!")
    end,
    stain = function(cutscene, event)
        cutscene:text("* Placeholder!")
    end,
    mirror = function(cutscene, event)
        cutscene:text("* Placeholder!")
    end,
    shelf = function(cutscene, event)
        cutscene:text("* Placeholder!")
    end,
    cactus = function(cutscene, event)
        cutscene:text("* Placeholder!")
    end,
    books = function(cutscene, event)
        cutscene:text("* Placeholder!")
    end,
    phone = function(cutscene, event)
        cutscene:text("* Placeholder!")
    end,
}