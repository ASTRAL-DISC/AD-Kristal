---@class ColorShadowFX : FXBase
---@overload fun(...) : ColorShadowFX
local ColorShadowFX, super = Class(FXBase)

function ColorShadowFX:init(alpha, color, highlight, scale, priority, no_shadow)
    super.init(self, priority)

    self.alpha = alpha or 0.75
    self.color = color or {0, 0, 0, 0}
    self.highlight = highlight or {0, 0, 0, 0}
    self.scale = scale or 1

    self.shadow_offset = 0 -- for the fountain
    self.no_shadow = no_shadow or false
end

function ColorShadowFX:getAlpha()
    return self.alpha
end

function ColorShadowFX:getColor()
    return self.color[1], self.color[2], self.color[3], self.color[4] or 1
end

function ColorShadowFX:getScale()
    return self.scale
end

function ColorShadowFX:getHighlight()
    return self.highlight[1], self.highlight[2], self.highlight[3], self.highlight[4] or 1
end

function ColorShadowFX:setColor(r, g, b, a)
    if not r then
        self.color = {0, 0, 0, 0}
    else
        self.color = {r, g, b, a or 1}
    end
end

function ColorShadowFX:setHighlight(r, g, b, a)
    if not r then
        self.highlight = {0, 0, 0, 0}
    else
        self.highlight = {r, g, b, a or 1}
    end
end

function ColorShadowFX:isActive()
    return super.isActive(self) and self:getAlpha() > 0
end

function ColorShadowFX:draw(texture)
    local hr, hg, hb, ha = self:getHighlight()

    local alpha = self:getAlpha()

    local cr, cg, cb, ca = self:getColor()

    local canvas
    if alpha < 1 then
        canvas = Draw.pushCanvas(SCREEN_WIDTH, SCREEN_HEIGHT)
    end

    if ha > 0 then
        local last_shader = love.graphics.getShader()
        local shader = Kristal.Shaders["AddColor"]
        love.graphics.setShader(shader)
        shader:send("inputcolor", {hr, hg, hb})
        shader:send("amount", ha * alpha)
        Draw.drawCanvas(texture)
        love.graphics.setShader(last_shader)
    elseif not canvas then
        Draw.drawCanvas(texture)
    end

    local sx, sy = self.parent:getFullScale()

    Draw.setColor(cr, cg, cb, ca)
    Draw.draw(texture, 0, sy * 2)

    if canvas then
        Draw.popCanvas()

        Draw.setColor(1, 1, 1)
        Draw.drawCanvas(texture)

        Draw.setColor(1, 1, 1, alpha)
        Draw.draw(canvas)
    end

    local ox, oy, ow, oh = self:getObjectBounds()
    
    if not self.no_shadow then
        Draw.setColor(0, 0, 0, alpha)
        Draw.draw(texture, ox, oy+oh + (self.shadow_offset * sy), 0, 1, -self:getScale(), ox, oy+oh)
    end
end

return ColorShadowFX