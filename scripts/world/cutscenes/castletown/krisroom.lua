return {
    manual_stand = function(cutscene, event, chara, facing)
        cutscene:text("* It's a stand for your Manual.")
        cutscene:text("* I thought you might want to keep it here in case you want to read it!", "blush_smile", "ralsei")
    end,
    moss = function(cutscene, event, chara, facing)
        cutscene:text("* It's some decorative moss. Looks delicious.")
        if cutscene:getCharacter("susie") then
            cutscene:text("* Why the hell does YOUR room get moss!?", "nervous_side", "susie")
        end
    end,
}
