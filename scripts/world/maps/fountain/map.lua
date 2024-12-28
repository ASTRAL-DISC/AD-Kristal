local Fountain, super = Class(Map)

function Fountain:onEnter()
    Game.world:startCutscene("fountain")
end

return Fountain