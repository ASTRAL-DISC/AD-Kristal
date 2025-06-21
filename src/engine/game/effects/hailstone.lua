---@class HailStone : Object
---@overload fun(...) : HailStone
local HailStone, super = Class(Object)

function HailStone:init(x, y, target)
    super.init(self, x, y)

    self.x = x
    self.y = y

    self.hailstone = Assets.getTexture("effects/icespell/hailstone")

    self:setScale(2)

    self.siner = 0
    self.timer = 0
    self.alpha = 1

    self.count = 20

    self.target = target
end

function HailStone:update()
    super.update(self)
    self.timer = self.timer + DTMULT
    self.siner = self.siner + DTMULT

    self.physics.speed_y = math.sin(self.timer / 8) / 2
    self.siner = self.timer / 2

    if (self.timer >= 80) then
        self:remove()
    end
end

function HailStone:draw()
    super.draw(self)

    for i = 0, self.count - 1 do
        self.x2 = -math.sin((i / 2) + (self.siner / 8))
        self.y2 = self.x2 + i

        if math.cos((i / 2) + (self.siner / 8)) > 0 then
            self:setLayer(self.target.layer - 1)
        else
            self:setLayer(self.target.layer + 1)
        end

        Draw.draw(self.hailstone, self.x2 * 15, self.y2 * 2, 0, (math.sin((self.siner / 8)) * 1), 1, self.hailstone:getWidth() / 2, self.hailstone:getHeight() / 2)
        Draw.draw(self.hailstone, self.x2 * 20, self.y2 * 2, 0, (math.sin((self.siner / 8)) * 0.5), 0.5, self.hailstone:getWidth() / 2, self.hailstone:getHeight() / 2)
        Draw.draw(self.hailstone, -self.x2 * 30, self.y2 * 2, 0, (math.sin((self.siner / 8)) * 1), 1, self.hailstone:getWidth() / 2, self.hailstone:getHeight() / 2)
    end
end

return HailStone