return {
    mike_flowers = function (cutscene, event)
        if not Game.chapter == 3 then return end

        local x, y = cutscene:getMarker("mike")

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
        bouquet.physics.speed_y = -6
    end,
}