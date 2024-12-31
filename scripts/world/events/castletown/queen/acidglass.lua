local AcidGlass, super = Class(Event, "acidglass")

function AcidGlass:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

	self:setScale(1)
    self:setOrigin(0.5, 0.5)
	
	self.solid = false
    
    self:setSprite("world/events/castletown/queen/acid")

    self.no_reflection = true
end

return AcidGlass