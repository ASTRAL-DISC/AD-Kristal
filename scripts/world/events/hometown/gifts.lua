local Gifts, super = Class(Event, "gifts")

function Gifts:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})

	self:setScale(1)
    self:setOrigin(0.5, 0.5)
	
	self.solid = false
    if Game.chapter == 3 then
        self:remove()
    elseif Game.chapter == 4 then
        self:setSprite("world/events/hometown/gifts/fantasy_book")
    elseif Game.chapter == 7 then
        self:setSprite("world/events/hometown/gifts/red_lily")
    else
        self:setSprite("world/events/hometown/gifts/fantasy_book")
    end
end

return Gifts