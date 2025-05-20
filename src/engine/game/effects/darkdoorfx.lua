-- original code by Dobby233Liu
---@class DarkDoorFX : Object
---@overload fun(...) : DarkDoorFX
-- Dark World entrance shadow effect with arbitary shape, to be put under the
-- black rectangle.
local DarkDoorFX, super = Class(Object)

---@param sprite string # Image should be in white.
function DarkDoorFX:init(x, y, width, height, sprite, options)
    super.init(self, x, y, width, height)

    options = options or {}

    self:setColor(options.color or {0x29/255, 0x29/255, 0x34/255})
    self.alpha = 0

    if not sprite then
        self.sprite = Assets.getTexture("kristal/doorblack")
    else
        self.sprite = Assets.getTexture("misc/darkportal/" .. sprite)
    end

    self:setScale(2)
    if self.width <= 0 then self.width = self.sprite:getWidth() end
    if self.height <= 0 then self.height = self.sprite:getHeight() end

    self.siner = 0
end

function DarkDoorFX:draw()
    self.alpha = Utils.approach(self.alpha, 1, 0.01 * DTMULT)
    self.siner = self.siner + 1*DTMULT

    local comp_scale = 2
    local amt = math.sin(self.siner / 16) * 0.01
    local r,g,b,a = self:getDrawColor()
    local w,h = self:getSize()
    love.graphics.setColor(r, g, b, a * (amt + 0.2))

    for i = 1, 5 do
        Draw.draw(self.sprite, 0, h, 0, 1, -(3 / i + amt) * comp_scale, 0, h)
    end

    local stretch = amt * 3 * comp_scale
    Draw.draw(self.sprite, -stretch*w/2, -stretch*h, 0, 1+stretch, 1+stretch)

    stretch = amt * 2 * comp_scale
    Draw.draw(self.sprite, -stretch*w/2, -stretch*h, 0, 1+stretch, 1+stretch)

    super.draw(self)
end

return DarkDoorFX