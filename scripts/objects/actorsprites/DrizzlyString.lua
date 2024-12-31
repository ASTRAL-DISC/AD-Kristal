-- code taken from the SpamtonNeo library by Vitellary
local DrizzlyString, super = Class(Object)

function DrizzlyString:init(x, y, fg, top_x)
    super.init(self, x, y, fg and 3 or 2, 400)
    self.layer = fg and -20 or -25
    self.fg = fg
    self.top_x = x - (top_x or x)
    self.color = fg and COLORS.green or {0, 0.2, 0}
    self.inherit_color = true
    self.swing_speed = 1
    self.siner = math.pi * 2 * 30
    self.line_rotation = -math.pi/2
end

function DrizzlyString:update()
    super.update(self)
    if self.swing_speed > 0 then
        self.siner = self.siner + self.swing_speed * DTMULT
    end
end

function DrizzlyString:draw()
    super.draw(self)
    love.graphics.setColor(self:getDrawColor())
    love.graphics.setLineWidth(self.width)
    love.graphics.line(math.cos(self.siner/30) * 2, 0, self.top_x, -400)
end

return DrizzlyString