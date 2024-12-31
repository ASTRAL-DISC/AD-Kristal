local Patient, super = Class(Event, "patient")

function Patient:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

	self:setScale(1)
    self:setOrigin(0.5, 0.5)
	
	self.solid = false
    if Game.chapter == 3 and Game:getFlag("snowgraved") then
        self:setSprite("world/events/hometown/patient/berdly")
    elseif Game.chapter == 3 then
        self:setSprite("world/events/hometown/patient/bunbun")
    else
        self:remove()
    end
end

return Patient