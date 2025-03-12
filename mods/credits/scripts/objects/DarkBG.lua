local DarkBG, super = Class(Object)

function DarkBG:init()
    super.init(self, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)

    self.parallax_x = 0
    self.parallax_y = 0
end

function DarkBG:draw()
    super.draw(self)
    
    love.graphics.setLineStyle("rough")
    love.graphics.setLineWidth(2)

    self.offset = (Kristal.getTime() * 30)
    self.offset = self.offset % 100

    for i = 2, 22 do
        Draw.setColor(66 / 255, 0, 66 / 255, 1 / 2)
        love.graphics.line(0, -210 + (i * 50) + math.floor(self.offset / 2), SCREEN_WIDTH, -210 + (i * 50) + math.floor(self.offset / 2))
        love.graphics.line(-200 + (i * 50) + math.floor(self.offset / 2), 0, -200 + (i * 50) + math.floor(self.offset / 2),  SCREEN_HEIGHT)
    end

    for i = 3, 23 do
        love.graphics.setColor(66 / 255, 0, 66 / 255, 1)
        love.graphics.line(0, -100 + (i * 50) - math.floor(self.offset), SCREEN_WIDTH, -100 + (i * 50) - math.floor(self.offset))
        love.graphics.line(-100 + (i * 50) - math.floor(self.offset), 0, -100 + (i * 50) - math.floor(self.offset), SCREEN_HEIGHT)
    end

    Draw.setColor(1, 1, 1, 1)
end

return DarkBG