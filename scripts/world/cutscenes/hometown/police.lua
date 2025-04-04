return {
    table = function(cutscene, event)
        if Game:getFlag("undyne_break_table") then
            cutscene:text("* (A broken table. [wait:5]An hysterical officer was the culprit.)")
        else
            cutscene:text("* (A sturdy table for a sturdier officer.)")
        end
    end,

    jail = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        if susie then
            cutscene:text("* Hey! [wait:5]Dare you to lock yourself up in there.", "smile", susie)
        end
        local choice = cutscene:textChoicer("* Surrender yourself?", { "Not yet", "Yes" })
        if choice == 2 then
            if susie then
                cutscene:detachFollowers()
                susie:walkTo("susie", 0.7, "right")
            end

            local jail = cutscene:getEvent("jail")
            jail.sprite:setFrame(2)
            jail.bottom.visible = true
            Assets.playSound("dooropen")
            Game.world.map:getHitbox("jail_collision").collidable = false

            cutscene:wait(0.8)

            local player = Game.world.player
            cutscene:wait(cutscene:walkTo(player, "gaybaby", 1, "down"))

            cutscene:wait(1)

            Game.world.music:stop()

            if susie then
                susie:setSprite("walk_unhappy")
                susie:setFacing("right")
            end

            jail.sprite:setFrame(1)
            jail.bottom.visible = false
            Game.world.map:getHitbox("jail_collision").collidable = true
            Assets.playSound("doorclose")
            cutscene:wait(6)

            if susie then
                cutscene:text("* ... [wait:5]Now what", "nervous_side", susie, {auto = true})
            else
                cutscene:text("* Now what", nil, nil, {auto = true})
            end
            susie.layer = player.layer + 1
            player:explode()

            if susie then
                susie:setSprite("shock_right")
                susie:shake(3)
            end

            cutscene:wait(0.4)
            Assets.stopSound("badexplosion")

            Game:gameOver(0, 0)
            Game.gameover.soul:remove()
            Game.gameover.soul = nil
            Game.gameover.screenshot = nil
            Game.gameover.timer = 150
            Game.gameover.current_stage = 4
        end
    end

}