return {
    junkball = function(cutscene, event)
        local black = Rectangle(0, 0, Game.world.width, Game.world.height)
        black:setColor(0, 0, 0)
        black.alpha = 0
        Game.world:spawnObject(black, "below_ui")
        Game.world.timer:tween(1, black, {alpha = 1})

        cutscene:wait(1.5)
        cutscene:text("* (Before you left, [wait:5]you gathered up everything in the house...)")
        cutscene:wait(0.5)
        cutscene:wait(cutscene:mapTransition("hometown/torhouse_robbed/floor1", "kris", "down"))
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
			cutscene:text("* (You will sleep later.)")
		end
    end,

    birdcage = function(cutscene, event)
        cutscene:text("* It's a birdcage. [wait:5]When the door's closed, [wait:5]there's no escape.")
    end,

    stain = function(cutscene, event)
        cutscene:text("* It's stained.")
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