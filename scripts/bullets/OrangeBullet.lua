local OrangeBullet, super = Class(Bullet)

function OrangeBullet:init(x, y, texture)
	super.init(self, x, y, texture)
	self:setColor(252 / 255, 166 / 255, 0)
    self.layer = BATTLE_LAYERS["soul"] - 1
end

local function condition(soul)
	return (soul.moving_x == 0 and soul.moving_y == 0)
end

function OrangeBullet:onCollide(soul)
	if condition(soul) then
		return super.onCollide(self, soul)
	end
end

function OrangeBullet:update()
	super.update(self)
	
	local soul = Game.battle.soul
	
	if not condition(soul) then
		self.grazed = true
	end
end

return OrangeBullet
