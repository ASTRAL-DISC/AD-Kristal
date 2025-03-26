local Bird, super = Class(Event, "bird")

function Bird:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

	local properties = data.properties or {}

	self:setScale(2)

	self.sprite = ActorSprite("bird")
	self.sprite:setOrigin(0.5, 0.5)
	self:addChild(self.sprite)

	self.solid = false
	self.flying = false
	self.sleeping = properties["sleeping"] or false

	if self.sleeping then
		self.sprite:setAnimation("sleep")
		self.solid = true
		local width, height = self.sprite:getSize()
    	self:setHitbox(-10, 1, width, math.floor(height / 4) * 2)
	end
end

function Bird:update()
	super.update(self)
	local player = Game.world.player
    local distance = Utils.dist(player.x, player.y, self.x, self.y)
	local fly_dist = Utils.clampMap(distance, 30, 130, 1, 0)
	if not self.sleeping then
		if fly_dist > 0 and not self.flying then
			self.flying = true
			self:setFlag("dont_load", true)
			self.sprite:setAnimation("fly")
			local snd = Assets.stopAndPlaySound("birdfly", 0.6)
			snd:setPitch(1 + Utils.random(0.15))
			if player.x > self.x then
				self:slideTo(self.x - 200, self.y - Game.world.height, 2, "in-quad", function()
					self:remove()
				end)
			else
				self.flip_x = true
				self:slideTo(self.x + 200, self.y - Game.world.height, 2, "in-quad", function()
					self:remove()
				end)
			end
		end
	end
end

function Bird:onInteract(player, dir)
	if self.sleeping then
		Game.world:startCutscene(function(cutscene)
			for _,z in ipairs(self.sprite.zzz) do
				if z then
					z:remove()
				end
				print(Utils.dump(z))
			end
			self.sprite.z_spawn_rate = 0
			self.sprite:setSprite("wake")
			self:shake(3)
			local snd = Assets.stopAndPlaySound("crow")
			snd:setPitch(1 + Utils.random(0.15))
			cutscene:wait(0.5)
			--self:setFlag("dont_load", true)
			self.solid = false
			if dir ~= "up" then
				self:setLayer(190)
			end
			self.sprite:setAnimation("fly")
			local snd = Assets.stopAndPlaySound("birdfly", 0.6)
			snd:setPitch(1 + Utils.random(0.15))
			if player.x > self.x then
				self:slideTo(self.x - 200, self.y - Game.world.height, 2, "in-quad", function()
					self:remove()
				end)
			else
				self.flip_x = true
				self:slideTo(self.x + 200, self.y - Game.world.height, 2, "in-quad", function()
					self:remove()
				end)
			end
		end)
	end
end

return Bird