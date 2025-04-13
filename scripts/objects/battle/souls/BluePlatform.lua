-- by Agent 7
local BluePlatform, super = Class(Object)

function BluePlatform:init(x, y, width, slippery)
    super.init(self, x, y, width, 12)

    self.layer = BATTLE_LAYERS["above_arena"]

    if width then
        self:setHitbox(0, 0, width, 6)
    end

    -- Damage applied to the soul when its squished against another solid by this one
    self.squish_damage = 80

    self.slippery = slippery or false

    self.lock = false
end

function BluePlatform:update()
    super.update(self)
    local soul = Game.battle.soul
    if soul and soul:includes(BlueSoul) then
        if self:collidesWith(soul) then
            if soul.speed_y >= 0 and soul.y <= (self.y - (11*DT)) then -- This is mostly the same logic used in UT
                if not self.slippery then
                    self.lock = true
                end
                soul.speed_y = 0
                soul.jumpstage = 1
            end
        else
            self.lock = false
        end
        --[[if soul.speed_y < 0 then
            if self.collider then self.collider = nil end
        else
            self:setHitbox(0, 0, self.width, 1)
        end]]
    end
    if self.slippery then self.lock = false end
end

function BluePlatform:move(x, y, speed)
    local movex, movey = x * (speed or 1), y * (speed or 1)

    Object.startCache()
    local collided_x = self:doMoveAmount(movex, 1, 0)
    local collided_y = self:doMoveAmount(movey, 0, 1)
    Object.endCache()

    return collided_x or collided_y
end

function BluePlatform:moveTo(x, y)
    return self:move(x - self.x, y - self.y)
end

function BluePlatform:doMoveAmount(amount, x_mult, y_mult)
    local sign = Utils.sign(amount)

    local soul_collided = false

    Object.startCache()
    for i = 1, math.ceil(math.abs(amount)) do
        local moved = sign
        if (i > math.abs(amount)) then
            moved = (math.abs(amount) % 1) * sign
        end

        self.x = self.x + (moved * x_mult)
        self.y = self.y + (moved * y_mult)
        if self.lock then
            local soul = Game.battle.soul
            soul.x = soul.x + (moved * x_mult)
            soul.y = soul.y + (moved * y_mult)
        end
        Object.uncache(self)

    end
    Object.endCache()

    return soul_collided
end

function BluePlatform:onSquished(soul)
    --[[if soul.inv_timer == 0 and self.squish_damage and self.squish_damage ~= 0 then
        local battler = Utils.pick(Game.battle:getActiveParty())
        if battler then
            battler:hurt(self.squish_damage)
        end

        soul.inv_timer = (4/3)
    end]]

    if self.squish_damage and self.squish_damage ~= 0 then
        local battler = Utils.pick(Game.battle:getActiveParty())
        if battler then
            battler:hurt(self.squish_damage)
        end
    end

    soul:explode()

    Game.battle.encounter:onWavesDone()
end

function BluePlatform:draw()
    super.draw(self)
    love.graphics.setLineWidth(1)
    love.graphics.setColor(COLORS.white)
    love.graphics.rectangle("line", 0,0, self.width, 6)
    love.graphics.setColor(self.slippery and COLORS.fuchsia or COLORS.green)
    love.graphics.rectangle("line", 0,-4, self.width, 6)
end

return BluePlatform