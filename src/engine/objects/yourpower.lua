-- taken from Dark Place
---@class YourPower : Object
---@overload fun(...) : YourPower
local YourPower, super = Class(Object)

function YourPower:init(x, y)
    self.texture = Assets.getTexture("player/heart")
    super.init(self, x, y, self.texture:getWidth(), self.texture:getHeight())

    self:setOrigin(0.5, 0.5)
    self:setColor(COLORS.red)

    self.siner = 0
end

function YourPower:update()
    self.siner = self.siner + 1.5 * DTMULT
end

function YourPower:draw()
    local r,g,b,a = self:getDrawColor()
    local function drawSprite(x_scale, y_scale, alpha)
        Draw.setColor(r, g, b, a * alpha)
        Draw.draw(self.texture,
        self.width / 2, self.height / 2, nil,
        self.scale_x * x_scale, self.scale_y * y_scale,
        self.width * self.origin_x, self.width * self.origin_y)
    end

    drawSprite(1, 1, self.siner / 8)
    drawSprite(self.siner / 4, self.siner / 4, 1 + 0.6 - self.siner / 16)
    drawSprite(self.siner / 8, self.siner / 8, 1 + 0.6 - self.siner / 24)

    super.draw(self)
end

function YourPower:shine()
    self.siner = 3
end

return YourPower