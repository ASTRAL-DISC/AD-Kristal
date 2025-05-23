local Gunfight, super = Class(Wave, "gunfight")

function Gunfight:init()
    super.init(self)
	
	self.time = 8
    self.enemies = self:getAttackers()
    self.shoots = {}
end

local function update(self, wait, enemy)
	-- local enemy = self.enemy
	enemy:setAnimation("shooting")
	
	for i = 1, 12 do
		local actor = enemy.sprite
		local gun = actor.gun

		gun.rotation = math.rad(math.random(-32, 64))
		local x, y = gun:getRelativePos(0, 7, Game.battle)

		local bullet = self:spawnBullet("ch3/shadowguy/bullet", x, y)
		bullet.physics.direction = gun.rotation
		bullet.physics.speed = -7
		bullet.rotation = gun.rotation
		
		local x, y = gun:getRelativePos(-4, 7, Game.battle)

		local shoot = Sprite("enemies/ch3/shadowguy/shoot", x, y)
		shoot:setOrigin(0.5)
		shoot:setRotationOrigin(0.5)
		shoot:setScale(2)
		shoot.rotation = gun.rotation
		shoot.layer = 8999
		
		self.timer:script(function(wait)
			wait()
			wait()
			wait()
			shoot:remove()
		end)
		
        table.insert(self.shoots, shoot)
		Game.battle:addChild(shoot)
		
		-- local bullet = self:spawnBullet("shadowmen/bullet", x, y)
		
		gun.x = gun.x - 2
		enemy.x = enemy.x - 2
		wait()
		gun.x = gun.x + 2
		enemy.x = enemy.x + 2
		
		wait(0.125)
	end
	
	enemy:setAnimation("prepare")
	wait(0.5)
end

function Gunfight:onStart()
	for _, enemy in ipairs(self.enemies) do
		enemy.ogPos = enemy.x
		enemy:setAnimation("shooting")
	
		self.timer:tween(0.5, enemy, {x = enemy.x + 64}, "out-sine", function()
			self.timer:script(function(wait)
				while true do
					update(self, wait, enemy)

					wait()
				end
			end)
		end)
	end
end

function Gunfight:onEnd()
    for _,shoot in ipairs(self.shoots) do
        shoot:remove()
    end
	for _, enemy in ipairs(self.enemies) do
		enemy:setAnimation("prepare")
		
		local timer = Timer()
		timer:tween(0.5, enemy, {x = enemy.ogPos}, "in-out-sine", function()
			enemy:setAnimation("idle")
			enemy.ogPos = nil
			timer:remove()
		end)
		
		enemy:addChild(timer)
	end
end

return Gunfight