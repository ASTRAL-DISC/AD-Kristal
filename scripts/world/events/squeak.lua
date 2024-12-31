local Squeak, super = Class(Event, "squeak")

function Squeak:init(data)
    super.init(self, data)
end

function Squeak:onInteract(player, dir)
    Assets.playSound("squeak")
    return true
end

return Squeak