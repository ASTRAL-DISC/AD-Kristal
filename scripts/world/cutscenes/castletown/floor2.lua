return {
    renovating = function(cutscene, event, chara, facing)
        if event.interact_count > 1 then
            cutscene:text("* Sorry,[wait:5] work in progress!", "wink", "ralsei")
        else
            cutscene:text("* Hey Ralsei,[wait:5] what's up here?", "smirk", "susie")
            cutscene:text("* Oh,[wait:5] just more rooms I'm renovating!", "blush_smile", "ralsei")
            cutscene:text("* ...[wait:5] so is your room up there?", "nervous", "susie")
            cutscene:text("* Er,[wait:5] yes![wait:5] I still,[wait:5] um,[wait:5] haven't dusted it though...", "pleased", "ralsei")
            cutscene:text("* Yeah,[wait:5] like we need to see your nerdy glasses collection anyway.", "nervous", "susie")
        end
    end,
}