-- modified from J.A.R.U's LightFairy
---@class DustSpeck : Object
---@overload fun(...) : DustSpeck
local DustSpeck, super = Class(Object)

function DustSpeck:init(x, y, color, scale)
    super.init(self, x, y)

    self.sprite = Sprite("effects/particle")
    self.color = color or {1, 1, 1}
    self.scale = scale or 2
    self.sprite:setColor(self.color)
    self.sprite:setOrigin(0.5)
    self:setScale(self.scale)
    self:addChild(self.sprite)

    self.siner = Utils.random(8000)
    self.sinx = (Utils.random(20) + 18)
    self.siny = (Utils.random(20) + 18)
	
    self.period = (0.1 + Utils.random(6))

    self.sprite.alpha = 0.2
end

function DustSpeck:update()
    self.x = self.x + (math.sin((self.siner / self.sinx)) * self.period) * DTMULT
    self.y = self.y + (math.sin((self.siner / self.siny)) * self.period) * DTMULT
    self.siner = self.siner + DTMULT
    
    super.update(self)

    self.sprite.alpha = math.cos(Kristal.getTime() * self.period) * 1
end

return DustSpeck