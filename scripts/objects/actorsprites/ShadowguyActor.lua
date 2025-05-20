-- original library by KateBulka
local ShadowguyActor, super = Class(ActorSprite)

function ShadowguyActor:init(actor)
    super.init(self, actor)

	self.draw_children_below = 0
	self.draw_children_above = 1

	local gun = Sprite("enemies/ch3/shadowguy/gun", -22, 24)
	gun.visible = false
	gun.layer = self.layer - 4
	gun.rotation_origin_x = 0.5
	gun.rotation_origin_y = 0.5

	self.gun = gun
	self:addChild(gun)
end

return ShadowguyActor