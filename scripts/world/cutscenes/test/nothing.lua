return {
    newsletters = function (cutscene, event)
        if Game.chapter == 3 then
            --[[local x, y = cutscene:getMarker("mike")

            Game.world:spawnNPC("mike", x, y, {animation = "miku/flowers_walk"})
            local mike = cutscene:getCharacter("mike")

            local bouquet = Sprite("misc/bouquet", mike.width/2, mike.height/2 - 5)
            bouquet:setScale(1)
            bouquet:setOrigin(0.5, 0.5)
            bouquet:setLayer(mike.layer + 1)

            cutscene:wait(2)

            cutscene:wait(cutscene:slideTo(mike, "spawn", 3, "linear"))
            mike.sprite:stop()

            cutscene:wait(1)
                
            mike:setAnimation("miku/flowers_throw")
            cutscene:wait(function() return mike.sprite.frame == 4 end)
            mike:addChild(bouquet)
            bouquet.physics.speed_y = -6]]

            local x, y = cutscene:getMarker("spawn")
            local x2, y2 = cutscene:getMarker("bouquet")

            Game.world:spawnNPC("nick", x, y, {facing = "down"})
            local nick = cutscene:getCharacter("nick")

            local bouquet = Sprite("misc/bouquet", x2 + nick.width, y2)
            bouquet:setScale(2)
            bouquet:setOrigin(0.5, 0.5)
            bouquet:setLayer(nick.layer + 1)

            cutscene:wait(3)
            Assets.playSound("fall")
            Game.world:addChild(bouquet)
            bouquet.physics.speed_y = 9
            bouquet.physics.friction = 0.04

            cutscene:wait(function() return bouquet.y > 130 end)
            nick:setSprite("shock_look")
            nick:shake(4)

            cutscene:wait(0.3)
            bouquet:explode()
            nick:explode()
        elseif Game.chapter == 4 then
            cutscene:text("* I guess we'll just walk home...?\n* In the rain?", "surprise_smile", "noelle_lw")
        elseif Game.chapter == 5 then
            local x, y = cutscene:getMarker("spawn")

            Game.world:spawnNPC("berdly_lw", x, y, {sprite = "sit_book"})
            Game.world:spawnNPC("kris_lw", x, y - 3, {sprite = "sit_front"})

            local berdly = cutscene:getCharacter("berdly_lw")
            local kris = cutscene:getCharacter("kris_lw")

            kris.layer = berdly.layer + 1

            local function createSeed(x, y)
                local seed = Sprite("effects/dandelion_seed", x, y)
                seed:setScale(0.8)
                seed:setOrigin(0.5, 0.5)
                seed:setLayer(kris.layer + 1)
                seed.physics.direction = math.rad(math.random(70)) - 280
                seed.graphics.spin = 0.02 + Utils.random(1)
                seed.physics.speed = 0.8
                Game.world.timer:after(0.5, function()
                    seed.graphics.grow = 0.008
                    seed:fadeOutAndRemove(2)
                end)
                kris:addChild(seed)
                Assets.playSound("leaf_dodge", 0.1, (1.5 + Utils.round(Utils.random(1), 0.2)))
            end
    
            cutscene:wait(2)
            kris:setSprite("sit_front_down")
            kris:shake(0, 2)
            Assets.playSound("wing")

            cutscene:wait(1)
            kris:setAnimation("sit_front_dandelion")

            cutscene:wait(function() return kris.sprite.frame == 4 end)
            Assets.playSound("whistlebreath", 0.6, 1.4)
            local every = Game.world.timer:every(2/30, function()
                createSeed(kris.width/2 + 23, kris.height/2 - 8)
            end)

            cutscene:wait(function() return kris.sprite.frame == 6 end)
            kris.sprite:pause()

            cutscene:wait(0.8)
            Game.world.timer:cancel(every)
            kris.sprite:setFrame(7)

            cutscene:wait(0.2)
            berdly:setSprite("sit_book_squint")

            cutscene:wait(4)
        end
    end,
}