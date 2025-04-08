local Interior, super = Class(Map)

function Interior:onEnter()
    if Game.chapter == 4 and Game:getFlag("ch4_rain") then
        Game.stage:setWeather("rain", true, true, Game.world)
    end

    self.stained = Assets.getTexture("world/hometown/church/bg_stainedlight")
    self.overlay = Assets.getTexture("world/hometown/church/bg_overlay")
    self.shadow = Assets.getTexture("world/hometown/church/bg_shadow")

    self:getImageLayer("stainedlight").visible = false
    self:getImageLayer("overlay").visible = false
    self:getImageLayer("shadow_over").visible = false
end

function Interior:onExit()
    if Game.stage:hasWeather("rain") then
        Game.stage:resetWeather()
    end
end

function Interior:draw()
    super.draw(self)

    love.graphics.setBlendMode("add")
    Draw.setColor(1, 1, 1, 0.08)
    Draw.draw(self.stained, 0, 0, 0, 1, 1)
    love.graphics.setBlendMode("alpha")

    --love.graphics.setBlendMode("multiply", "premultiplied")
    Draw.setColor(1, 1, 1, 0.51)
    Draw.draw(self.overlay, 0, 0, 0, 1, 1)
    
    --love.graphics.setBlendMode("multiply", "premultiplied")
    Draw.setColor(1, 1, 1, 0.3)
    Draw.draw(self.shadow, 0, 0, 0, 1, 1)
    --love.graphics.setBlendMode("alpha")
end

return Interior