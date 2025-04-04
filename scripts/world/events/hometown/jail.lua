local Jail, super = Class(Event, "jail")

function Jail:init(data)
    super.init(self, data.x, data.y, data.width, data.height)
	
	self.solid = false
    self.sprite = Sprite("world/events/hometown/police_bars")
    self.sprite:setScale(2)
    self:addChild(self.sprite)

    self.bottom = Sprite("world/events/hometown/police_bars_bottom_open")
    self.bottom:setScale(2)
    self.bottom.visible = false
    self:addChild(self.bottom)
end

return Jail