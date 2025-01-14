-- original library by KateBulka
local BlueBullet, super = Class(Bullet)

function BlueBullet:init(x, y, texture)
	super.init(self, x, y, texture)
	self:setColor(66 / 255, 1, 1)
    self.layer = BATTLE_LAYERS["soul"] - 1
end

local function condition(soul)
	return (soul.moving_x ~= 0 or soul.moving_y ~= 0)
end

function BlueBullet:onCollide(soul)
	if condition(soul) then
		return super.onCollide(self, soul)
	end
end

function BlueBullet:update()
	super.update(self)
	
	local soul = Game.battle.soul
	
	if not condition(soul) then
		self.grazed = true
	end
end

return BlueBullet
