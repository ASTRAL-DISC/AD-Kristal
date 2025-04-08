local ChurchOverlay, super = Class(Object)

function ChurchOverlay:init(lobby)
    super.init(self, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)

    self.lobby = lobby or nil

    self.stained = Assets.getTexture("world/hometown/church/bg_stainedlight")
    self.stained2 = Assets.getTexture("world/hometown/church/lobby_stainedlight")

    self.overlay = Assets.getTexture("world/hometown/church/bg_overlay")
    self.overlay2 = Assets.getTexture("world/hometown/church/lobby_overlay")

    self.shadow = Assets.getTexture("world/hometown/church/bg_shadow")
    self.shadow2 = Assets.getTexture("world/hometown/church/bg_shadow_c")
end

function ChurchOverlay:draw()
    if not self.lobby then
        love.graphics.setBlendMode("add")
        Draw.setColor(1, 1, 1, 0.08)
        Draw.draw(self.stained, 0, 0, 0, 1, 1)
        love.graphics.setBlendMode("alpha")

        love.graphics.setBlendMode("multiply", "premultiplied")
        Draw.setColor(1, 1, 1)
        Draw.draw(self.overlay, 0, 0, 0, 1, 1)
        love.graphics.setBlendMode("alpha")
        
        love.graphics.setBlendMode("multiply", "premultiplied")
        Draw.setColor(1, 1, 1)
        if not Game:getFlag("ch4_gathered") then
            Draw.draw(self.shadow, 0, 0, 0, 1, 1)
        else
            Draw.draw(self.shadow2, 0, 0, 0, 1, 1)
        end
        love.graphics.setBlendMode("alpha")
    else
        love.graphics.setBlendMode("multiply", "premultiplied")
        Draw.setColor(1, 1, 1)
        Draw.draw(self.overlay2, 0, 0, 0, 1, 1)
        love.graphics.setBlendMode("alpha")

        love.graphics.setBlendMode("add")
        Draw.setColor(1, 1, 1, 0.08)
        Draw.draw(self.stained2, 0, 0, 0, 1, 1)
        love.graphics.setBlendMode("alpha")
    end

    Draw.setColor(1, 1, 1, 1)

    super.draw(self)
end

return ChurchOverlay