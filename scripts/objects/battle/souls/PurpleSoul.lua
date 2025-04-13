local PurpleSoul, super = Class(Soul)

function PurpleSoul:init(x, y)
    super.init(self, x, y)

    self.color = {213/255, 53/255, 217/255}
	
	-- Variables that can be changed
	self.current_string = 2
    self.goal_x = self.x
    self.goal_y = self.y
    self.wave = nil
end

function PurpleSoul:onStart()
    local arena = Game.battle.arena
    local wave = self.wave

    self.current_string = wave.soul_start_string
end

function PurpleSoul:update()
    super.update(self)

    local arena = Game.battle.arena

    if self.orientation == "hor" then
        for i = 1, self.string_count do
            if self.current_string == i then
                self.goal_y = arena.top + self.string_pos[i] - 1 + self.offset
            end
        end
    elseif self.orientation == "ver" then
        for i = 1, self.string_count do
            if self.current_string == i then
                self.goal_x = arena.top + self.string_pos[i] - 1 + self.offset
            end
        end
    end
end

function PurpleSoul:doMovement()
    local speed = self.speed
    local arena = Game.battle.arena
    local wave = self.wave

    self.debounce = false

    if wave then
        local move_x, move_y = 0, 0

        if wave.orientation == "hor" then
            if Input.down("cancel") then speed = speed / 2 end -- Focus mode.
            
            if Input.down("left") then move_x = move_x - 1 end
            if Input.down("right") then move_x = move_x + 1 end

            if not self.debounce then
                if Input.pressed("up") then
                    self:moveString(-1)
                    self.debounce = true
                end
                if Input.pressed("down") then
                    self:moveString(1)
                    self.debounce = true
                end
            end

            local next_y = arena.top + wave.string_pos[self.current_string]
            local move_y = next_y - self.y

            if math.abs(move_y) <= self.speed * DTMULT then
                move_y = 0
                self.y = next_y
                self.debounce = false
            end

            move_y = move_y == 0 and 0 or move_y/math.abs(move_y)

            self:move(move_x * speed, move_y * (speed * 2), DTMULT)
        elseif wave.orientation == "ver" then
            if Input.down("cancel") then speed = speed / 2 end -- Focus mode.

            if Input.pressed("left") then self:moveString(-1) end
            if Input.pressed("right") then self:moveString(1) end
            
            if Input.down("up") then move_y = move_y - 1 end
            if Input.down("down") then move_y = move_y + 1 end

            local next_x = arena.left + wave.string_pos[self.current_string]
            local move_x = next_x - self.x

            if math.abs(move_x) <= self.speed * DTMULT then
                move_x = 0
                self.x = next_x
            end

            move_x = move_x == 0 and 0 or move_x/math.abs(move_x)

            self:move(move_x * (speed * 2), move_y * speed, DTMULT)
        end

        self.moving_x = move_x
        self.moving_y = move_y
    end
end

function PurpleSoul:moveString(string)
    self.current_string = self.current_string + string

    self:stringStuff()
end

function PurpleSoul:setString(string)
    self.current_string = string

    self:stringStuff()
end

function PurpleSoul:stringStuff()
    local speed = self.speed
    local arena = Game.battle.arena
    local wave = self.wave
    
    if wave then
        if (self.current_string < 1) then self.current_string = 1 end
        if (self.current_string > wave.string_count - 1) then self.current_string = wave.string_count end
    end
end

function PurpleSoul:draw()
    local r, g, b, a = self:getDrawColor()
    local heart_texture = Assets.getTexture(self.sprite.texture_path)
    local heart_w, heart_h = heart_texture:getDimensions()

    super.draw(self)
    self.color = {r, g, b}
end

return PurpleSoul