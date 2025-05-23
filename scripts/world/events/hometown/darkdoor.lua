local DarkDoor, super = Class(Event, "darkdoor")

function DarkDoor:init(data)
    super.init(self, data.center_x, data.center_y, {data.width, data.height})

    self:setOrigin(0.5, 0.5)
    self:setSprite("world/events/hometown/darkdoor_closed")
end

return DarkDoor