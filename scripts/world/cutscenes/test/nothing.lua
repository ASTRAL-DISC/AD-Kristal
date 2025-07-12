return {
    portrait_overlay = function (cutscene, event)
        cutscene:text("* Would thou mindeth", "neutral", "rouxls")
        cutscene:text("* Testingeth", "eyes_closed", "rouxls")
        Game:setFlag("cowboy_rouxls", true)
        cutscene:text("* Mine Cowboyeth Hat", "smile_wide", "rouxls")
        cutscene:text("* Yee", "eyes_closed", "rouxls")
        cutscene:text("* HAW--", "smile_wide", "rouxls", {auto = true})
        Game:setFlag("cowboy_rouxls", false)
        cutscene:text("* [sound:splat]...", "smile_wide", "rouxls")
        cutscene:text("* ... [wait:5]Where IS it", "baffled_look", "rouxls")
        cutscene:text("* Eated it", "smile", "susie")
    end,
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
    actorsprite = function (cutscene, event)
        cutscene:panTo(0, 0, 0)
        Game.world.music:stop()
        local fade_rect = Rectangle(0, 0, Game.world.width, Game.world.height)
        fade_rect:setColor(0.3, 0.3, 0.3)
        fade_rect.alpha = 1
        Game.world:spawnObject(fade_rect, "below_ui")
        cutscene:wait(0.5)

        local noelle = Game.world:spawnNPC("noelle", SCREEN_WIDTH/2, SCREEN_HEIGHT/2 + 30)
        noelle:setLayer(WORLD_LAYERS["above_ui"])
        noelle:setAnimation({"exasperated", 0.3, true})

        local friend = Game.world:spawnNPC("friend", SCREEN_WIDTH/2 + 50, SCREEN_HEIGHT/2 + 60)
        friend:setLayer(noelle.layer + 1)
        friend:setAnimation("idle")

        local siner = 0
        cutscene:during(function ()
            siner = siner + 1 * DTMULT
            local sin = math.sin(2 + (siner / 48))
            local cos = math.cos(2 + (siner / 48))
            friend:setPosition(friend.x + sin * 2, friend.y + cos * 2)
            friend:setScale(2 * sin)
            if friend.scale_x < 0 then
                friend:setLayer(noelle.layer - 1)
            else
                friend:setLayer(noelle.layer + 1)
            end
        end)

        Game.world.timer:script(function(wait)
            while true do
                for _, part in ipairs(friend.sprite.parts) do
                    if part.id ~= "face" then
                        Game.world.timer:tween(0.8, part, {alpha = 0}, "linear")
                        Game.world.timer:tween(0.8, part, {alpha = 1}, "linear")
                        wait(0.8)
                        Game.world.timer:tween(0.8, part, {alpha = 1}, "linear")
                        Game.world.timer:tween(0.8, part, {alpha = 0}, "linear")
                        wait(0.8)
                    end
                end
            end
        end)

        cutscene:wait(function() return Input.pressed("confirm") end); Input.clear("confirm")
    end
}