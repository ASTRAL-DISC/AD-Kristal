---@class GreenSoulCircle : Object
---@overload fun(...) : GreenSoulCircle
local GreenSoulCircle, super = Class(Object)

function GreenSoulCircle:init(x, y, color)
    super.init(self, x, y)
	
    self.layer = BATTLE_LAYERS["above_bullets"]
	
    self.sprite = Sprite("player/circle", 0, 0)
    self:addChild(self.sprite)
    self:setSize(self.sprite:getSize())
	self.sprite.color = color or {0, 0.5, 0}
	
    self.physics = nil
end

return GreenSoulCircle