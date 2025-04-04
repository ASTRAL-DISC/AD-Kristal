local Boombox, super = Class(Event, "boombox")

function Boombox:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

	self:setScale(1)
    self:setOrigin(0.5, 1)
	
	self.solid = true
    self:setSprite("world/events/hometown/boombox")

    local width, height = self:getSize()
    self:setHitbox(0, math.ceil(height / 4) * 2, width, math.floor(height / 4) * 2)
end

return Boombox