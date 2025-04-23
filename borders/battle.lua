local Battle, super = Class(Border)

function Battle:draw()
    love.graphics.setColor(0, 0, 0, BORDER_ALPHA)
    love.graphics.rectangle("fill", -8, -8, SCREEN_WIDTH+16, SCREEN_HEIGHT+16)

    love.graphics.setLineStyle("rough")
    love.graphics.setLineWidth(2)

    self = {}
    self.offset = (Kristal.getTime() * 30)
    self.offset = self.offset % 100

    for i = 2, 22 do
        love.graphics.setColor(66 / 255, 0, 66 / 255, BORDER_ALPHA / 2)
        love.graphics.line(0, -210 + (i * 50) + math.floor(self.offset / 2), BORDER_WIDTH * BORDER_SCALE, -210 + (i * 50) + math.floor(self.offset / 2))
        love.graphics.line(-200 + (i * 50) + math.floor(self.offset / 2), 0, -200 + (i * 50) + math.floor(self.offset / 2), BORDER_HEIGHT * BORDER_SCALE)
    end

    for i = 3, 23 do
        love.graphics.setColor(66 / 255, 0, 66 / 255, BORDER_ALPHA)
        love.graphics.line(0, -100 + (i * 50) - math.floor(self.offset), BORDER_WIDTH * BORDER_SCALE, -100 + (i * 50) - math.floor(self.offset))
        love.graphics.line(-100 + (i * 50) - math.floor(self.offset), 0, -100 + (i * 50) - math.floor(self.offset), BORDER_HEIGHT * BORDER_SCALE)
    end

    love.graphics.setColor(0, 1, 0, BORDER_ALPHA)

    local width = 5

    love.graphics.setLineWidth(width)

    local left = 160 - width + 3
    local top = 30 - width + 2

    love.graphics.rectangle("line", left, top, 640 + (width * 2) - 5, 480 + (width * 2) - 5)
end

return Battle