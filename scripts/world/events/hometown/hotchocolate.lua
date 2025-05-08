local HotChocolate, super = Class(Event, "hotchocolate")

function HotChocolate:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})

	self:setScale(1)
    self:setOrigin(0.5, 1)
	
	self.solid = false
    self:setSprite("world/events/hometown/hotchocolate")
    self.sprite:play(0.8, true)
end

return HotChocolate