local Bird, super = Class(Event, "bird")

function Bird:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

	self:setScale(2)

	self.sprite = ActorSprite("bird")
	self.sprite:setOrigin(0.5, 0.5)
	self:addChild(self.sprite)

	self.solid = false
	self.flying = false
end

function Bird:update()
	super.update(self)
	local player = Game.world.player
    local distance = Utils.dist(player.x, player.y, self.x, self.y)
	local fly_dist = Utils.clampMap(distance, 30, 130, 1, 0)
	if fly_dist > 0 and (not self.flying) then
		self.flying = true
		self.sprite:setAnimation("fly")
		local snd = Assets.stopAndPlaySound("birdfly", 0.6)
        snd:setPitch(1 + Utils.random(0.15))
		if player.x > self.x then
			self:slideTo(self.x - 200, self.y - Game.world.height, 2, "in-quad", function()
				self:remove()
				self:setFlag("dont_load", true)
			end)
		else
			self.flip_x = true
			self:slideTo(self.x + 200, self.y - Game.world.height, 2, "in-quad", function()
				self:remove()
				self:setFlag("dont_load", true)
			end)
		end
	end
end

return Bird