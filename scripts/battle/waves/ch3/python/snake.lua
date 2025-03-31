local Snake, super = Class(Wave, "snake")

function Snake:init()
    super.init(self)
	
	self.time = 8
    self.enemies = self:getAttackers()
end

local function randomWithStep(first, last, stepSize)
    local maxSteps = math.floor((last-first)/stepSize)
    return first + stepSize * math.random(0, maxSteps)
end

function Snake:spawnSnake()
	local arena = Game.battle.arena

	local pos_t = {
		{arena:getTopLeft()},
		{arena:getTopRight()},
		{arena:getBottomLeft()},
		{arena:getBottomRight()},
	}

	local pos = Utils.pick(pos_t)
	local x, y = pos[1], pos[2]

	local bullet = self:spawnBullet("bullets/ch3/python/snake", x, y)
end

function Snake:spawnApple()
	local arena = Game.battle.arena

	if arena == nil then return end

	local x, y = arena:getTopLeft()
	local x2, y2 = arena:getBottomRight()
	local step = 32

	local ox, oy = randomWithStep(x, x2, step), randomWithStep(y, y2, step)

	local bullet = self:spawnBullet("bullets/ch3/python/apple", ox, oy)

	self.apple = bullet
	return bullet
end

function Snake:onStart()
	self:spawnApple()
	self:spawnSnake()
end

return Snake