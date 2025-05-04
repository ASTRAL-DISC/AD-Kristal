local NoDisc = {}

function NoDisc:enter()
    self.stage = Stage()

    self.state = "MAIN"

    self.text = Text("NO DISC FOUND.\nPLEASE INSERT DISC AND RESTART THE DEVICE.", 0, 400 + 32, SCREEN_WIDTH, SCREEN_HEIGHT, {
        font = "plain",
        align = "center",
        color = COLORS.green,
        style = "GONER",
    })
    self.stage:addChild(self.text)
end

function NoDisc:update()
    self.stage:update()
end

function NoDisc:draw()
    love.graphics.setLineStyle("rough")
    love.graphics.setLineWidth(2)

    self.offset = (Kristal.getTime() * 30)
    self.offset = self.offset % 100

    for i = 2, 22 do
        Draw.setColor(COLORS.green, 0.3)
        love.graphics.line(0, -210 + (i * 50) + math.floor(self.offset / 2), SCREEN_WIDTH, -210 + (i * 50) + math.floor(self.offset / 2))
        love.graphics.line(-100 + (i * 50) + math.floor(self.offset / 2), 0, -200 + (i * 50) + math.floor(self.offset / 2), SCREEN_HEIGHT)
    end

    for i = 3, 23 do
        Draw.setColor(COLORS.green, 0.15)
        love.graphics.line(0, -100 + (i * 50) - math.floor(self.offset), SCREEN_WIDTH, -100 + (i * 50) - math.floor(self.offset))
        love.graphics.line(-200 + (i * 50) - math.floor(self.offset), 0, -100 + (i * 50) - math.floor(self.offset), SCREEN_HEIGHT)
    end
    
    Draw.setColor(1, 1, 1, 1)

    self.stage:draw()
end

return NoDisc
