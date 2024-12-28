local Lancer, super = Class(Map)

function Lancer:onEnter()
    super.onEnter(self)
    if Game.chapter == 4 then
        Game:setFlag("splat", true)
    end
end

function Lancer:onExit()
    if Game:getFlag("splat") then
        Game:setFlag("splat", false)
    end
end

return Lancer