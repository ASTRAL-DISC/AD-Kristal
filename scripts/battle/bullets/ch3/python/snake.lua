local id = "bullets/ch3/python/snake"
local Snake, super = Class(Bullet, id)

local function playTongue(timer, tongue)
    tongue:play(2 / 30, false, function()
    	timer:after(1, function()
    		playTongue(timer, tongue)
    	end)
    end)
end

local directions = {
	["down"] = {0, 1},
	["right"] = {1, 0},
	["up"] = {0, -1},
	["left"] = {-1, 0},
}

local rotations = {
	["up"] = math.rad(0),
	["right"] = math.rad(90),
	["down"] = math.rad(180),
	["left"] = math.rad(270)
}

function Snake:init(x, y)
    -- Last argument = sprite path
    super.init(self, x, y, id .. "_head")

    self.draw_children_below = -1

    self.move_speed = 0.125 -- the smaller, the faster snake is
    self.can_move = true
    self.direction = nil

    self.grid = 16
    self.timer = Timer()
    self.wave = nil
    self.parts = {}
    self:setScale(0)
    self.alpha = 0

    self:addChild(self.timer)

    -- tongue
    local tongue = Sprite("bullets/ch3/python/snake_tongue", 5, -5)
    tongue:setScale(0.5)
    tongue:setOrigin(0.5, 0)
    tongue.inherit_color = true
    playTongue(self.timer, tongue)

    self.tongue = tongue
    self:addChild(tongue)
end

function Snake:addPart(after)
	local lastPart = self.parts[#self.parts]

	local body = self.wave:spawnBullet("bullets/ch3/python/snake_part", self.x, self.y)
	body:setLayer(self.layer - 1)
	body.is_tail = false
	body.direction = nil

	if lastPart then
		body:setSprite("bullets/ch3/python/snake_tail", 0.25, true)
		body.is_tail = true
		lastPart:setSprite("bullets/ch3/python/snake", 0.25, true)
		lastPart.is_tail = false

		if after then
			local direction = lastPart.direction or self.direction or "down"
			local dir = directions[direction]
			local grid = self.grid

			body.x = lastPart.x
			body.y = lastPart.y

			-- body.x = body.x - (dir[1] * grid)
			-- body.y = body.y - (dir[2] * grid)
		end
	end

	table.insert(self.parts, body)
end

function Snake:appear()
	local t = 0.25
	local easing = 'out-expo'

	for k,v in ipairs(self.parts) do
		v:setScale(0)
		v.alpha = 0
	end

	self.timer:script(function(wait)
		local v = self
		local part_idx = 0

		while true do
			self.timer:tween(t, v, {scale_x = 2, scale_y = 2, alpha = 1}, easing)

			part_idx = part_idx + 1
			v = self.parts[part_idx]

			if not v then
				break
			else
				wait(t)
			end
		end
	end)
end

function Snake:onWaveSpawn(wave)
	self.wave = wave

	self:addPart()
	self:addPart()
	self:addPart()
	self:addPart()

	self:onStart()
end

function Snake:onStart()
	self:appear()
	-- self:moveRoute("right", "right", "down", "down", "down", "down", "right", "up", "up", "right")
end

function Snake:onApple()
    local collided = nil

    Object.startCache()
    for _,bullet in ipairs(Game.stage:getObjects(Bullet)) do
		if bullet ~= self and bullet.apple and bullet:collidesWith(self.collider) then
			collided = bullet
			break
		end
    end
    Object.endCache()

    if not collided then return end

	local member = Utils.pick(self.wave.enemies)
	member:heal(collided.heal)

    collided:remove()
    self:addPart(true)

	self.timer:script(function(wait)
		local v = self
		local part_idx = 0
		local t = 0.1

		while (true) do
			v:setColor(71 / 255, 1, 0)
			self.timer:tween(t, v.color, {1, 1, 1})

			part_idx = part_idx + 1
			v = self.parts[part_idx]

			if not v then
				break
			else
				wait(t)
			end
		end
	end)
end

function Snake:moveSnake(direction)
	local direction = direction or "down"

	local dir = directions[direction]
	local grid = self.grid
	local speed = self.move_speed

	self.can_move = false
	self.rotation = rotations[direction] or math.rad(0)
	self.direction = direction
	-- if #self.parts > 0 then
	-- 	self.parts[#self.parts],rotation = rotation[direction]
	-- end

	self.timer:script(function(wait)
		local done = false
		local part_idx = 0
		local v = self
		local cantMove = true

		while (not done) do
			local this = v
			this.direction = direction
			
			if v.is_tail then
				v.rotation = rotations[direction] or math.rad(0)
			end

			self.timer:tween(speed, v, {x = v.x + dir[1] * grid, y = v.y + dir[2] * grid})

			part_idx = part_idx + 1
			v = self.parts[part_idx]

			if v == nil then
				break
			else
				wait(speed)

				if cantMove then
					self:onApple()
					self.can_move = true
					cantMove = false
				end
			end
		end
	end)

	return speed
end

function Snake:moveRoute(...)
	local route = {...}
	local move_idx = 0

	self.timer:script(function(wait)
		while true do
			move_idx = move_idx + 1

			local move = route[move_idx]

			if move == nil then
				break
			else
				local t = self:moveSnake(move)

				wait(t)
			end
		end
	end)
end

function Snake:update()
	super.update(self)

	if not self.wave or not self.can_move then return end

	local targ = self.wave.apple or Game.battle.soul

	if targ == nil then return end

	local x, y = self.x, self.y
	local sx, sy = targ.x + 8, targ.y + 8

	if math.random() >= 0.51 then --horizontal
		if sx > x then -- right
			self:moveSnake("right")
		else
			self:moveSnake("left")
		end
	else
		if sy > y then -- down
			self:moveSnake("down")
		else
			self:moveSnake("up")
		end
	end
end

function Snake:remove(...)
	for k,part in ipairs(self.parts) do
		part:remove()
	end

	return super.remove(self, ...)
end

return Snake