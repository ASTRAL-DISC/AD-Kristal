---@class DEVICE_BORDER : Border
---@overload fun(...) : DEVICE_BORDER
local DEVICE_BORDER, super = Class(Border)

function DEVICE_BORDER:draw()
    love.graphics.setColor(0, 0, 0, BORDER_ALPHA)
    love.graphics.rectangle("fill", -8, -8, SCREEN_WIDTH + 16, SCREEN_HEIGHT + 16)

    love.graphics.setLineStyle("rough")
    love.graphics.setLineWidth(2)

    self.offset = (Kristal.getTime() * 30)
    self.offset = self.offset % 100

    local x_offset = 320 / 2 -- WIP
    local y_offset = 60 / 2

    for i = 2, 22 do
        Draw.setColor(COLORS.green, 0.3 * BORDER_ALPHA)
        love.graphics.line(0, -210 + (i * 50) + y_offset + math.floor(self.offset / 2), BORDER_WIDTH * BORDER_SCALE, -210 + (i * 50) + y_offset + math.floor(self.offset / 2))
        love.graphics.line(-110 + (i * 50) + math.floor(self.offset / 2), 0, -210 + (i * 50) + math.floor(self.offset / 2), BORDER_HEIGHT * BORDER_SCALE) -- WIP. FUCK
    end

    for i = 3, 23 do
        Draw.setColor(COLORS.green, 0.15 * BORDER_ALPHA)
        love.graphics.line(0, -100 + (i * 50) + y_offset - math.floor(self.offset), BORDER_WIDTH * BORDER_SCALE, -100 + (i * 50) + y_offset - math.floor(self.offset))
        love.graphics.line(-240 + (i * 50) - math.floor(self.offset), 0, -140 + (i * 50) - math.floor(self.offset), BORDER_HEIGHT * BORDER_SCALE)
    end
end

return DEVICE_BORDER