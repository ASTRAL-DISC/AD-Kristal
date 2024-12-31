local BedSheet, super = Class(Event, "bedsheet")

function BedSheet:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

	self:setScale(1)
    self:setOrigin(0.5, 0.5)
	
	self.solid = false
    if Game.world.map.id == "hometown_dark/torhouse/kris_rm" then
        self:setSprite("world/events/hometown/bedsheet/dark_2")
    else
        self:setSprite("world/events/hometown/bedsheet/light_2")
    end
end

return BedSheet