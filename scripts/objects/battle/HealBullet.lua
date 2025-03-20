-- original library by KateBulka
local HealBullet, super = Class(Bullet)

function HealBullet:init(x, y, texture)
	super.init(self, x, y, texture)
	self:setColor(0, 1, 0)
    self.layer = BATTLE_LAYERS["soul"] - 1
	self.tp = 0
	self.damage = 0
	self.heal = 15
end

function HealBullet:onCollide(soul)
	local member = Utils.pick(Game.battle.party)
	member:heal(self.heal)
	
	self:remove()
end

return HealBullet
