local QueenSpeakers, super = Class(Event, "queenspeakers")

function QueenSpeakers:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})

	self:setScale(1)
    self:setOrigin(0.5, 0.5)

    self.solid = false
    self:setSprite("world/events/castletown/queen/speakers")
    self.sprite:play(0.2, true)
end

return QueenSpeakers