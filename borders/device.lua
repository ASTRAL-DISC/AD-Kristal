local Device, super = Class(Border)

function Device:draw()
    love.graphics.setColor(0, 0, 0, BORDER_ALPHA)
    love.graphics.rectangle("fill", -8, -8, SCREEN_WIDTH + 16, SCREEN_HEIGHT + 16)

    love.graphics.setLineStyle("rough")
    love.graphics.setLineWidth(2)

    self.offset = (Kristal.getTime() * 30)
    self.offset = self.offset % 100

    for i = 2, 22 do
        Draw.setColor(COLORS.green, 0.3 * BORDER_ALPHA)
        love.graphics.line(0, -230 + (i * 50) + math.floor(self.offset / 2), BORDER_WIDTH * BORDER_SCALE, -230 + (i * 50) + math.floor(self.offset / 2))
        love.graphics.line(-240 + (i * 50) + math.floor(self.offset / 2), 0, -240 + (i * 50) + math.floor(self.offset / 2), BORDER_HEIGHT * BORDER_SCALE)
    end

    for i = 3, 23 do
        Draw.setColor(COLORS.green, 0.15 * BORDER_ALPHA)
        love.graphics.line(0, -120 + (i * 50) - math.floor(self.offset), BORDER_WIDTH * BORDER_SCALE, -120 + (i * 50) - math.floor(self.offset))
        love.graphics.line(-140 + (i * 50) - math.floor(self.offset), 0, -140 + (i * 50) - math.floor(self.offset), BORDER_HEIGHT * BORDER_SCALE)
    end

    Draw.setColor(0, 0, 0, 0.3 * BORDER_ALPHA)

    local offset = (Kristal.getTime() * 30)
    local rect_amount = 9
    local rect_height = 6
    for i = 1, rect_amount do
        -- Oscillation effect
        local final_rect_height = (2 + math.sin(offset / 30)) * i * rect_height
        love.graphics.rectangle("fill", 0, 0, BORDER_WIDTH * BORDER_SCALE, final_rect_height)
    end

    for i = 1, rect_amount do
        -- Oscillation effect
        local final_rect_height = (2 + math.sin(offset / 30)) * i * rect_height
        love.graphics.rectangle("fill", 0, BORDER_HEIGHT * BORDER_SCALE, BORDER_WIDTH * BORDER_SCALE, -final_rect_height)
    end
end

return Device