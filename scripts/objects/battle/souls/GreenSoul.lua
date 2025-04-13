local GreenSoul, super = Class(Soul)

function GreenSoul:init(x, y)
    super.init(self, x, y)

    self.color = {0, 192/255, 0}

	self.outline = Sprite("player/heart_outline_outer_black")
    self.outline:setOrigin(0.5, 0.5)
    self.outline.inherit_color = true
	self.outline.alpha = 0
    self:addChild(self.outline)

	self.shield = GreenSoulShield(-self.width * 1.5, -self.height * 1.5)
	self.circle = GreenSoulCircle(-self.width * 1.5, -self.height * 1.5)
	
	self.circle.layer = self.shield.layer - 1
	self:addChild(self.shield)
	self:addChild(self.circle)

	self.directions = {
		["left"] 	= 270,
		["right"] 	= 90,
		["down"] 	= 180,
		["up"] 		= 0,
	}
	
	self.shield_speed = 0.2
	
	self:setShieldRotation("right")
	self.default_direction = self.shield.direction

    self.graze_collider.collidable = false

	self.bubbled = false

	self.drain_rate = 3
    self.drain_timer = 0

	self.teaching = false
end

function GreenSoul:bubble()
	self.bubbled = true
	self.shield:bubble()
	self.shield.graphics.spin = math.rad(10)
	Game.battle.timer:tween(0.2, self.outline, {alpha = 1}, "out-quint")
	Assets.stopAndPlaySound("impact", 0.7)
	Assets.stopAndPlaySound("spearappear", 1.8, 1 + Utils.random(0.15))
end

function GreenSoul:unbubble()
	Assets.stopAndPlaySound("spearappear_choppy", 1.8)
	self.shield:unbubble()
	Game.battle.timer:tween(0.2, self.outline, {alpha = 0}, "out-quint")
	self.bubbled = false
end

function GreenSoul:setShieldRotation(direction)
	local val = self.directions[direction]
	
	if type(val) == "table" then val = val[1] end
	
	self.shield.rotation = math.rad(val)
	self.shield.direction = direction
end

function GreenSoul:turnShield(direction)
	if self.turn_handle then
		Game.battle.timer:cancel(self.turn_handle)
	end

	local val = self.directions[direction]

	if type(val) == "table" then val = val[1] end

	self.shield.direction = direction
	self.turn_handle = Game.battle.timer:tween(self.shield_speed, self.shield, {rotation = self.rotation + Utils.angleDiff(math.rad(val), self.rotation)}, "out-quart")
end

function GreenSoul:update()
    super.update(self)

	if self.transitioning then
		if self.bubbled then
			if Input.down("confirm") then
				Input.clear("confirm")
			end
			self:unbubble()
		end
        return
	end
end

function GreenSoul:doMovement()
	if Input.down("cancel") then
        self.shield_speed = 0.3
    else
		self.shield_speed = 0.2
	end

	for key,_ in pairs(self.directions) do
		if Input.pressed(key) then
			Input.clear(key)
			self:turnShield(key)
		end
	end

	if Input.down("confirm") then
		if Game:getTension() > 0 then
			if self.drain_timer >= self.drain_rate then
				Game:removeTension(DTMULT * 1.1)
				if not self.bubbled then
					self:bubble()
				end
			else
				self.drain_timer = self.drain_timer + 1
			end
		elseif Game:getTension() <= 0 and self.bubbled then
			self:unbubble()
		end
	end

	if Input.released("confirm") and self.bubbled then
		self:unbubble()
	end
	
    if Input.pressed("confirm") and Game:getTension() <= 0 then
        Assets.playSound("ui_cant_select", 1)
    end
end

return GreenSoul