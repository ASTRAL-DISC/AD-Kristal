-- built from the original FuseMenu by Simbel
local ChallengeMenu, super = Class(Object)

function ChallengeMenu:init()
	super.init(self, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)

	self.parallax_x = 0
	self.parallax_y = 0

	self.state = "CHALLENGE"

	self.selected = 1
	self.selected_confirm = 1
	self.selected_page = 1
    self.old_selection = self.selected

	self.offset = 0

	self.left_arrow = Assets.getTexture("ui/flat_arrow_left")
	self.right_arrow = Assets.getTexture("ui/flat_arrow_right")

	self.heart = Assets.getTexture("player/heart")
	self.heart_x = 80
	self.heart_y = 198
	self.heart_timer = nil
	self.heart_timer_on = false
	self.heart_change_state = false

	self.arrow_timer = 0
	self.arrows_x = {20, 604.5} --Yes, the .5 is for Toby code accuracy how could you tell?

	self.arrow_dir = "l-r"

	self.challenges = {}
	for _,v in pairs(Game:getFlag("challenges")) do
		table.insert(self.challenges, Kristal.callEvent("createChallenge", v))
	end
end

function ChallengeMenu:getMaxPages()
    return math.ceil(#self.challenges / 5)
end

function ChallengeMenu:update()
    if Input.pressed("confirm") then
        if self.state == "CHALLENGE" then
			local challenge = self.challenges[self.selected]
			if challenge.id == "empty" then
				Assets.stopAndPlaySound("ui_cant_select")
			else
				self.state = "CONFIRM"
				self.heart_change_state = true
				self.heart_timer_on = true
				Game.world.timer:cancel(self.heart_timer)
				self.heart_timer = Game.world.timer:tween(0.3, self, {heart_x=self.selected_confirm==1 and 350 or 450}, "out-quint", function()
					self.heart_timer_on = false
				end)
				Game.world.timer:tween(0.3, self, {heart_y=408}, "out-quint", function()
					self.heart_change_state = false
				end)
			end
		elseif self.state == "CONFIRM" then
			if self.selected_confirm == 1 then
				local challenge = self.challenges[self.selected]
				local id = challenge.encounter
				Game:encounter(id)
				Game:setFlag("current_challenge", challenge.id)
				Game.world:closeMenu()
				self:remove()
			else
				if not self.heart_change_state then
					local placement_num = self.selected%5
					if placement_num == 0 then
						placement_num = 5
					end
					self.state = "CHALLENGE"
					self.heart_change_state = true
					self.heart_timer_on = true
					Game.world.timer:cancel(self.heart_timer)
					self.heart_timer = Game.world.timer:tween(0.3, self, {heart_y = 198 + 40 * (placement_num - 1)}, "out-quint", function()
						self.heart_timer_on = false
					end)
					Game.world.timer:tween(0.3, self, {heart_x = 80}, "out-quint", function()
						self.heart_change_state = false
					end)
				end
			end
		end
    end
	if Input.pressed("cancel", true) then
		if self.state == "CHALLENGE" then
			Game.world:closeMenu()
			self:remove()
		elseif self.state == "CONFIRM" then
			if not self.heart_change_state then
				local placement_num = self.selected%5
				if placement_num == 0 then
					placement_num = 5
				end
				self.state = "CHALLENGE"
				self.heart_change_state = true
				self.heart_timer_on = true
				Game.world.timer:cancel(self.heart_timer)
				self.heart_timer = Game.world.timer:tween(0.3, self, {heart_y = 198 + 40 * (placement_num - 1)}, "out-quint", function()
					self.heart_timer_on = false
				end)
				Game.world.timer:tween(0.3, self, {heart_x = 80}, "out-quint", function()
					self.heart_change_state = false
				end)
			end
		end
	end
	if Input.pressed("down", true) then
		if self.state == "CHALLENGE" then
			if self.selected < #self.challenges and self.selected%5 ~= 0 then
				self.selected = self.selected + 1
				self.heart_timer_on = false
				Game.world.timer:cancel(self.heart_timer)
			end
		end
	elseif Input.pressed("up", true) then
		if self.state == "CHALLENGE" then
			if self.selected > 1 and self.selected%5 ~= 1 then
				self.selected = self.selected - 1
				self.heart_timer_on = false
				Game.world.timer:cancel(self.heart_timer)
			end
		end
	end
	if self:getMaxPages() > 1 then
		if Input.pressed("left", true) then
			if self.state == "CHALLENGE" then
				self.selected_page = self.selected_page - 1
				self.selected = 1 + (self.selected_page-1) * 5
				if self.selected_page < 1 then
					self.selected_page = self:getMaxPages()
					self.selected = self.selected + self:getMaxPages() * 5
				end
			elseif self.state == "CONFIRM" then
				self.selected_confirm = self.selected_confirm + 1
				self.heart_timer_on = false
				Game.world.timer:cancel(self.heart_timer)
			end
		elseif Input.pressed("right", true) then
			if self.state == "CHALLENGE" then
				self.selected_page = self.selected_page + 1
				self.selected = 1 + (self.selected_page-1) * 5
				if self.selected_page > self:getMaxPages() then
					self.selected_page = 1
					self.selected = self.selected - self:getMaxPages() * 5
				end
			elseif self.state == "CONFIRM" then
				self.selected_confirm = self.selected_confirm - 1
				self.heart_timer_on = false
				Game.world.timer:cancel(self.heart_timer)
			end
		end
	end

	if self.state == "CHALLENGE" then
		local placement_num = self.selected%5
		if placement_num == 0 then
			placement_num = 5
		end
		if not self.heart_timer_on then
			self.heart_timer_on = true
			self.heart_timer = Game.world.timer:tween(0.3, self, {heart_y = 198 + 40 * (placement_num - 1)}, "out-quint", function()
				self.heart_timer_on = false
			end)
		end
	elseif self.state == "CONFIRM" then
		if self.selected_confirm == 1 then
			if not self.heart_timer_on then
				self.heart_timer_on = true
				self.heart_timer = Game.world.timer:tween(0.3, self, {heart_x=350}, "out-quint", function()
					self.heart_timer_on = false
				end)
			end
		else
			if not self.heart_timer_on then
				self.heart_timer_on = true
				self.heart_timer = Game.world.timer:tween(0.3, self, {heart_x=450}, "out-quint", function()
					self.heart_timer_on = false
				end)
			end
		end
	end

	self.arrow_timer = self.arrow_timer + DTMULT

	if self.arrow_timer%5 == 0 then
		if self.arrow_dir == "l-r" then
			if self.arrows_x[1] < 24 then
				self.arrows_x[1] = self.arrows_x[1] + 2
				self.arrows_x[2] = self.arrows_x[2] - 2
			else
				self.arrow_dir = "to-r-l"
			end
		elseif self.arrow_dir == "r-l" then
			if self.arrows_x[1] > 20 then
				self.arrows_x[1] = self.arrows_x[1] - 2
				self.arrows_x[2] = self.arrows_x[2] + 2
			else
				self.arrow_dir = "to-l-r"
			end
		elseif Utils.startsWith(self.arrow_dir, "to-") then
			self.arrow_dir = self.arrow_dir:sub(4)
		end
	end
end

function ChallengeMenu:draw()
	love.graphics.setColor(0, 0, 0)

	if self.state == "CHALLENGE" then
		love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, 121)
	end

	love.graphics.rectangle("fill", 60+2, 130+2, 520-3, 276-3)

	love.graphics.setColor(1, 1, 1)
	love.graphics.setLineWidth(4)
	love.graphics.rectangle("line", 60+2, 130+2, 520-3, 276-3)

	love.graphics.setColor(0.5, 0.5, 0.5)
	love.graphics.print("Challenge", 114, 140)
	love.graphics.print("Prize", 330, 140)
	love.graphics.setColor(1, 1, 1)

	love.graphics.setLineWidth(3)

	love.graphics.line(90, 181, 551, 181)

	love.graphics.setColor(1, 1, 1)
	love.graphics.print("Page "..self.selected_page.." / "..self:getMaxPages(), 478, 140, 0, 0.5, 1)

	if self.state == "CHALLENGE" then
		love.graphics.setColor(1, 1, 1)
		love.graphics.draw(self.left_arrow, self.arrows_x[1], 256, 0, 2, 2)
		love.graphics.draw(self.right_arrow, self.arrows_x[2], 256, 0, 2, 2)
	end

	for i = 1 + ((self.selected_page - 1) * 5), 5 + ((self.selected_page - 1) * 5) do
		local challenge = self.challenges[i]
		if i <= #self.challenges then
			local placement_num = i%5
			if placement_num == 0 then
				placement_num = 5
			end
			local name = challenge.challenge
			local prize = challenge.prize
			if type(challenge.prize) == "number" then
				prize = "$" ..challenge.prize
			end
			local description = challenge.description

			if challenge.id == "empty" then
                Draw.setColor(COLORS.dkgray)
                love.graphics.print(name, 110, 190 + (40 * (placement_num - 1)))
				Draw.setColor(COLORS.white)
				love.graphics.print(prize, 330, 190 + (40 * (placement_num - 1)))
				love.graphics.print("", 20, 20)
			else
				if self.selected == i and self.state == "CHALLENGE" then
					love.graphics.setColor(1, 1, 1)
					love.graphics.print(description, 20, 20)
				end
			
				if Utils.getIndex(Game:getFlag("challenges_completed"), challenge.id) or challenge.claimed then
					love.graphics.setColor(1, 1, 0)
					love.graphics.print("Claimed!", 330, 190 + (40 * (placement_num - 1)))
				else
					love.graphics.setColor(1, 1, 1)
					love.graphics.print(prize, 330, 190 + (40 * (placement_num - 1)))
				end
				
				if self.selected == i then
					love.graphics.setColor(1, 1, 0)
				else
					love.graphics.setColor(1, 1, 1)
				end
				
				love.graphics.print(name, 110, 190 + (40 * (placement_num - 1)), 0, 0.8, 1)
			
				love.graphics.setColor(1, 1, 1)
			end
		end
	end

	if self.state == "CONFIRM" then
		love.graphics.setColor(0, 0, 0)
		love.graphics.rectangle("fill", 0, 377, SCREEN_WIDTH, SCREEN_HEIGHT)

		love.graphics.setLineWidth(4)
		love.graphics.setColor(1, 1, 1)
		love.graphics.line(0, 377, SCREEN_WIDTH, 377)

		love.graphics.print("Challenge?", 60, 400)

		if self.selected_confirm == 1 then
			love.graphics.setColor(1, 1, 0)
		else
			love.graphics.setColor(1, 1, 1)
		end

		love.graphics.print("Yes", 380, 400)

		if self.selected_confirm == 2 then
			love.graphics.setColor(1, 1, 0)
		else
			love.graphics.setColor(1, 1, 1)
		end

		love.graphics.print("No", 480, 400)
	end

	love.graphics.setColor(1, 0, 0)

	love.graphics.draw(self.heart, self.heart_x, self.heart_y)

	super.draw(self)
end

return ChallengeMenu