return {
    start = function(cutscene, event)
        local black = Rectangle(0, 0, Game.world.width, Game.world.height)
        black:setColor(COLORS.black)
        black.alpha = 1
        Game.world:spawnObject(black, "below_ui")

        --Game.world.music:play("flowbeet", 0.9)
        black:fadeOutAndRemove(1)

        cutscene:wait(2)
        local kris = cutscene:getCharacter("kris")
        cutscene:walkToSpeed(kris, "end", 2)
        cutscene:wait(6.5)
        Game.world.camera:panToSpeed("end", 2)
    end
}