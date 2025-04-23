local Quest, super = Class(Border)

function Quest:draw()
    love.graphics.setColor(0, 0, 0, BORDER_ALPHA)
    love.graphics.rectangle("fill", -8, -8, SCREEN_WIDTH + 16, SCREEN_HEIGHT + 16)

    love.graphics.setColor(0, 1, 0, BORDER_ALPHA)

    local width = 5

    love.graphics.setLineWidth(width)

    local left = 160 - width + 3
    local top = 30 - width + 2

    love.graphics.rectangle("line", left, top, 640 + (width * 2) - 5, 480 + (width * 2) - 5)
end

return Quest