local QuestTransition, super = Class(Object)

function QuestTransition:init()
    super.init(self)

    self.timer = 0
end

function QuestTransition:update()
    self.timer = self.timer + DT

    if self.timer >= 3.4 then
        self:remove()
        return
    end

    super.update(self)
end

function QuestTransition:draw()
    Draw.setColor(0, 0, 0)

    if self.timer < 0.2 then
        Draw.setColor(0.6, 0.5, 0.6, 1)

        love.graphics.setBlendMode("multiply", "premultiplied")
        love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        love.graphics.setBlendMode("alpha")
    elseif self.timer < 0.3 then
        Draw.setColor(0.1, 0.2, 0.3, 1)

        love.graphics.setBlendMode("multiply", "premultiplied")
        love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        love.graphics.setBlendMode("alpha")
    elseif self.timer < 1 then
        Draw.setColor(0, 0, 0, 1)

        love.graphics.setBlendMode("multiply", "premultiplied")
        love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        love.graphics.setBlendMode("alpha")
    elseif self.timer < 1.1 then
        Draw.setColor(0.1, 0.2, 0.3, 1)

        love.graphics.setBlendMode("multiply", "premultiplied")
        love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        love.graphics.setBlendMode("alpha")
    elseif self.timer < 1.2 then
        Draw.setColor(0.6, 0.5, 0.6, 1)

        love.graphics.setBlendMode("multiply", "premultiplied")
        love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        love.graphics.setBlendMode("alpha")
    elseif self.timer < 1.3 then
        Draw.setColor(1, 1, 1, 1)
    end

    super.draw(self)
end

return QuestTransition