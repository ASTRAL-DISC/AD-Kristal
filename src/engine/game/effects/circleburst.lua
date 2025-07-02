---@class CircleBurst : Object
---@overload fun(...) : CircleBurst
local CircleBurst, super = Class(Object)

function CircleBurst:init(x, y, color, radius, init_radius, speed, fade_speed, lifetime, thickness)
    super.init(self, x, y)

    self.alpha = 1

    self.color = color or {1, 1, 1}
    self.radius = radius or 80
    self.init_radius = init_radius or 0
    self.speed = speed or 2
    self.fade_speed = fade_speed or 0.05
    self.lifetime = lifetime or 20
    self.thickness = thickness or 4

    self.layer = BATTLE_LAYERS["above_bullets"]

    self.timer = 0
end

function CircleBurst:update()
    self.timer = self.timer + DTMULT

    self.init_radius = Utils.approach(self.init_radius, self.radius, self.speed * DTMULT)

    if self.timer >= self.lifetime and self.init_radius >= self.radius then
        self.alpha = self.alpha - self.fade_speed * DTMULT
    end

    if self.alpha < 0 then
        self:remove()
    end

    super.update(self)
end

function CircleBurst:draw()
    Draw.setColor(self.color, self.alpha)
    love.graphics.setLineWidth(self.thickness)
    love.graphics.circle("line", 0, 0, self.init_radius, 32)

    super.draw(self)
end

return CircleBurst