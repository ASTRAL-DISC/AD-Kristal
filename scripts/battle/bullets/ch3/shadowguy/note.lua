local Note, super = Class(Bullet)

function Note:init(x, y)
    super:init(self, x, y)

    self:setSprite("bullets/ch3/shadowguy/note", 4/60, true)
	self:setScale(2.5)
	
    self:setHitbox(0, 0, 12, 12)
	self.t = 0
	
	Assets.playSound("note", 4)
end

local count = 0.04

function Note:update()
	super:update(self)
	
	local curve = self.curve
	
	if not curve then return end
	
	self.t = (self.t +  count * DTMULT)
	if self.t > 1 then
		self.t = 1
	end
	
	local ex,ey = curve:evaluate(self.t)
	
	self.x = ex
	self.y = ey - 6
	
	local future = self.t + count
	if future > 1 then future = 1 end
    
	local nx, ny = curve:evaluate(future)
	
	self.rotation = Utils.angle(ex, ey, nx, ny) + math.rad(180)
    
    if future == 1 then self:remove() end
end

return Note