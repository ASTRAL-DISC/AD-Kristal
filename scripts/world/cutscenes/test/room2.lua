return {
    completion = function (cutscene, event)
        local interact_count = event:getFlag("interact_count", 0)
        interact_count = interact_count + 1
        event:setFlag("interact_count", interact_count)

        local save = "saves/astraldisc/ch"..Game.chapter.."/completion_" .. Game.save_id .. ".json"

        if interact_count > 1 then
            if love.filesystem.getInfo(save) then
                love.filesystem.remove(save)
                Assets.playSound("moss_fanfare", 1, 0.7)
                cutscene:text("* Your [color:yellow][COMPLETION FILE][color:reset] was erased...")
            else
                Assets.playSound("moss_fanfare", 1, 0.6)
                cutscene:text("* Your [color:yellow][COMPLETION FILE][color:reset] cannot be found! [wait:5]Too bad!")
            end
        else
            if love.filesystem.getInfo(save) then
                love.filesystem.remove(save)
                Assets.playSound("moss_fanfare", 1, 0.7)
                cutscene:text("* Your [color:yellow][COMPLETION FILE][color:reset] was erased...")
            else
                local data = Game:save()
                love.filesystem.write(save, JSON.encode(data))
                Assets.playSound("moss_fanfare")
                cutscene:text("* You've got a [color:yellow][COMPLETION FILE][color:reset]!")
                cutscene:text("* Use it wisely.")
            end
        end
    end,

    credits = function (cutscene, event)
        cutscene:text("* See credits sequence?")
        local choice = cutscene:choicer({"Yes", "No"}) == 1
        if choice then
            Game.state = "EXIT"
            Game.fader:fadeOut(function()
                Kristal.swapIntoMod("credits")
            end, {speed = 0.1})
        else
            cutscene:text("* Maybe another time.")
        end
    end
}