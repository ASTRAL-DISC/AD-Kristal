---@class HailStone : Object
---@overload fun(...) : HailStone
local HailStone, super = Class(Object)

function HailStone:init(x, y, target)
    super.init(self, x, y)

    self.target = target

    self.hailstone = Assets.getTexture("effects/icespell/hailstone")
    self.hailstone_b = Assets.getTexture("effects/icespell/hailstone_b")
    self.hailstone_c = Assets.getTexture("effects/icespell/hailstone_c")

    self:setOrigin(0.5)

    self.siner = 0
    self.timer = 0
    self.alpha = 1

    self.count = 20
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
        local x = -math.sin((i / 2) + (self.siner / 8))
        local y = x + i

        Draw.draw(self.hailstone, x * 15, y * 2, 0, (math.sin((self.siner / 8)) * 1), 1, self.hailstone:getWidth() / 2, self.hailstone:getHeight() / 2)
        Draw.draw(self.hailstone_b, x * 20, y * 2, 0, (math.sin((self.siner / 8)) * 0.5), 0.5, self.hailstone_b:getWidth() / 2, self.hailstone_b:getHeight() / 2)
        Draw.draw(self.hailstone_c, -x * 30, y * 2, 0, (math.sin((self.siner / 8)) * 1), 1, self.hailstone_c:getWidth() / 2, self.hailstone_c:getHeight() / 2)
    end
end

return HailStone