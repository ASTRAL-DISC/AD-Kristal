local CircleBurst, super = Class(Object)

function CircleBurst:init(x, y, color, radius, line_width)
    super.init(self, x, y)

    self.alpha = 1

    self.color = color or {1, 1, 1}
    self.radius = radius or 100
    self.line_width = line_width or 4

    self.layer = BATTLE_LAYERS["above_bullets"]

    self.timer = 0
end

function CircleBurst:update()
    self.timer = self.timer + DTMULT

    if self.timer >= 20 then
        self.alpha = self.alpha - 0.1 * DTMULT
    end

    if self.alpha < 0 then
        self:remove()
    end

    super.update(self)
end

function CircleBurst:draw()
    Draw.setColor(self.color, self.alpha)
    love.graphics.setLineWidth(self.line_width)
    love.graphics.circle("line", 0, 0, self.radius + ((self.timer - 20) * 10), 32)

    super.draw(self)
end

return CircleBurst