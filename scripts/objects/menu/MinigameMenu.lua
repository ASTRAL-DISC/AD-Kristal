local MinigameMenu, super = Class(Object)

function MinigameMenu:init(width, height, minigame)
	super.init(self, 0, 0, width, height)

	Input.clear("confirm")

	self.minigame = minigame
	self.text = "Play " ..Registry.createMinigame(minigame).name.. "?"

	self.layer = 100
	self.alpha = 0

	self.parallax_x = 0
	self.parallax_y = 0

	self.selected_index = 1

	self.text_y = 30
	self.choices_y = 30
	self.timer = 0

	self.heart = Sprite("player/heart_menu")
	self.heart.visible = true
	self.heart:setOrigin(0.5, 0.5)
	self.heart:setScale(2)
	self.heart:setColor(Game:getSoulColor())
	self.heart.layer = 100
	self.heart.alpha = 0
	self:addChild(self.heart)

	self.heart_target_x = 282
	self.heart_target_y = 258
	self.heart:setPosition(self.heart_target_x, self.heart_target_y)

	self.font = Assets.getFont("plain")

	self.rectangle = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
	self.rectangle:setColor(0, 0, 0, 0)
	self:addChild(self.rectangle)

	self.options = {
		{
			accept = "Yes",
			refuse = "No",
		},
	}
end

function MinigameMenu:getDrawColor()
	local r, g, b, a = super.getDrawColor(self)
	return 1, 1, 0, self.alpha
end

function MinigameMenu:draw()
	super.draw(self)
	
	Draw.setColor(0.5, 0.5, 0.5, self.alpha)
	love.graphics.printf(string.format(self.text, 3), -179, self.text_y + (184), 1000, "center", 0)

	Draw.setColor(1, 1, 1, self.alpha)
	if self.selected_index == 1 then
		love.graphics.setColor(self:getDrawColor())
		self.heart.x = 282
		self.heart.y = self.choices_y + (228) + (16)
	end
	love.graphics.printf(self.options[1].accept, -179, self.choices_y + (228), 1000, "center", 0)
	Draw.setColor(1, 1, 1, self.alpha)
	if self.selected_index == 2 then
		Draw.setColor(self:getDrawColor())
		self.heart.x = 289
		self.heart.y = self.choices_y + (268) + (16)
	end
	love.graphics.printf(self.options[1].refuse, -179, self.choices_y + (268), 1000, "center", 0)

	self.heart.alpha = self.alpha
	self.rectangle.alpha = self.alpha * 0.8
end

function MinigameMenu:close()
	Game.world.menu = nil
    self:remove()
end

function MinigameMenu:update()
	super.update(self)

	self.timer = self.timer + DTMULT
	self.text_y = Utils.ease(10, 30, self.timer/40, "out-cubic")
	self.choices_y = Utils.ease(10, 30, self.timer/40, "out-cubic")
	if Input.pressed("confirm", false) then
		Input.clear("confirm")
		if self.selected_index == 1 then
			Assets.playSound("ui_select")
			Game:startMinigame(self.minigame)
			self:close()
		elseif self.selected_index == 2 then
			Assets.playSound("digital", 1, 0.5)
			self:fadeTo(0, 0.8, function ()
				self:close()
			end)
		end
	end
	if Game.lock_movement == true then
		if Input.pressed("up", false) then
			Assets.playSound("ui_move")
			if self.selected_index > 1 then
				self.selected_index = self.selected_index - 1
			end
		end
		if Input.pressed("down", false) then
			Assets.playSound("ui_move")
			if self.selected_index < 2 then
				self.selected_index = self.selected_index + 1
			end
		end
	end
end

function MinigameMenu:onAdd()
	self:fadeTo(1, 0.5)
	Assets.playSound("digital", 1, 0.9)
end

return MinigameMenu