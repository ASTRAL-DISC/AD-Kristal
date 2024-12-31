local Ding, super = Class(Event, "ding")

function Ding:init(data)
    super.init(self, data)
end

function Ding:onInteract(player, dir)
    Assets.stopAndPlaySound("bell")
    return true
end

return Ding