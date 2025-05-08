-- original library by Bor
local Shine, super = Class(Event, "shine")

function Shine:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})

    self:setOrigin(0.5, 0.5)
    self:setSprite("world/events/shine", 1/4)

    self.solid = true
end

return Shine