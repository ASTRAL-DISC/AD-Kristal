local MinigameMenu, super = Class(Object)

function MinigameMenu:init(width, height, minigame)
	super.init(self, 0, 0, width, height)

	Input.clear("confirm")

	self.minigame = minigame
	self.minigame_name = Registry.createMinigame(minigame).name
	self.text = "Play MINIGAME?"
	self.gamedesc = Registry.createMinigame(minigame).description

	self.layer = 100
	self.alpha = 0

	self.parallax_x = 0
	self.parallax_y = 0

	self.selected_index = 1

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

	self.font = Assets.getFont("main")
	self.font2 = Assets.getFont("plain")

	self.rectangle = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
	self.rectangle:setColor(0.08, 0.08, 0.08, 0)
	self:addChild(self.rectangle)

	self.options = {
		{
			accept = "Yes",
			refuse = "No",
		},
	}

	self.music = Game:getActiveMusic()
	self.old_volume = self.music.volume
	self.old_pitch = self.music.pitch

	self.music.volume = 0.4
	self.music.pitch = 0.95

	self:drawBorders()
end

function MinigameMenu:drawBorders()
	self.border = Sprite("effects/overlay/rhombus_border", 0, 320)
	self.border:setScale(2)
	self.border:setColor(0, 0, 0)
	self.border.alpha = 0
    self.border.wrap_texture_x = true
	self.border.layer = 0.14
    self.border.physics.speed_x = 2
	self:addChild(self.border)

	self.border_up = Sprite("effects/overlay/rhombus_border", 0, 80)
	self.border_up:setScale(2)
	self.border_up:setColor(0, 0, 0)
	self.border_up.alpha = 0
	self.border_up.flip_y = true
    self.border_up.wrap_texture_x = true
	self.border_up.layer = 0.14
    self.border_up.physics.speed_x = -2
	self:addChild(self.border_up)
end

function MinigameMenu:getDrawColor()
	local r, g, b, a = super.getDrawColor(self)
	return 1, 1, 0, self.alpha
end

function MinigameMenu:draw()
	super.draw(self)

	Draw.setColor(0.5, 0.5, 0.5, self.alpha)
	love.graphics.setFont(Assets.getFont("small", 48))
	love.graphics.printf(self.minigame_name, -179, 68, 1000, "center", 0)

	love.graphics.setFont(self.font)
	
	Draw.setColor(1, 1, 1, self.alpha)
	love.graphics.printf(self.text, -179, 184, 1000, "center", 0)

	Draw.setColor(1, 1, 1, self.alpha)
	if self.selected_index == 1 then
		love.graphics.setColor(self:getDrawColor())
		self.heart.x = 282
		self.heart.y = 228 + 16
	end
	love.graphics.printf(self.options[1].accept, -179, 228, 1000, "center", 0)
	Draw.setColor(1, 1, 1, self.alpha)
	if self.selected_index == 2 then
		Draw.setColor(self:getDrawColor())
		self.heart.x = 289
		self.heart.y = 268 + 16
	end
	love.graphics.printf(self.options[1].refuse, -179, 268, 1000, "center", 0)

	Draw.setColor(0.5, 0.5, 0.5, self.alpha)
	love.graphics.setFont(Assets.getFont("small"))
	love.graphics.printf("INSTRUCTIONS:", -179, 370, 1000, "center", 0)
	love.graphics.setFont(self.font2)
	love.graphics.printf(self.gamedesc, -179, 390, 1000, "center", 0)

	self.heart.alpha = self.alpha
	self.rectangle.alpha = self.alpha * 0.8
	self.border.alpha = self.alpha * 0.6
	self.border_up.alpha = self.alpha * 0.6
end

function MinigameMenu:onKeyPressed()
	if Input.pressed("confirm", false) then
		Input.clear("confirm")
		if self.selected_index == 1 then
			Assets.playSound("ui_select")
			Game:startMinigame(self.minigame)
			self:fadeTo(0, 0.2, function ()
				Game.world:closeMenu()
				Game.world.menu = nil
				self:remove()
				self.music.volume = self.old_volume
				self.music.pitch = self.old_pitch
			end)
		elseif self.selected_index == 2 then
			Assets.playSound("digital", 1, 0.5)
			self:fadeTo(0, 0.2, function ()
				Game.world:closeMenu()
				Game.world.menu = nil
				self:remove()
				self.music.volume = self.old_volume
				self.music.pitch = self.old_pitch
			end)
		end
	end
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

function MinigameMenu:onAdd()
	self:fadeTo(1, 0.2)
	Assets.playSound("digital", 1, 0.9)
end

return MinigameMenu