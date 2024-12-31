---@class FMEffect : Object
---@overload fun(...) : FMEffect
local FMEffect, super = Class(Object)

function FMEffect:init(fountain_x, fountain_y)
    super.init(self, fountain_x, fountain_y, 0, 0)

    self.fountain_x = fountain_x
    self.fountain_y = fountain_y
    
    self.timer = 0

    self.xballtimer = 0
    self.yballtimer = 0
    self.balltimer = 0

    self.ballcon = 1
end

function FMEffect:drawEllipse(left, top, right, bottom)
    local rx = (right - left) / 2
    local ry = (bottom - top) / 2
    local x = left + rx
    local y = top  + ry
    love.graphics.ellipse("fill", x, y, rx, ry, 24)
end

function FMEffect:update()
    super.update(self)
end

function FMEffect:draw()
    super.draw(self)

    local cenx = 0
    local ceny = 0

    if self.ballcon == 1 then
        self.xballtimer = self.xballtimer + self.xballtimer + DTMULT -- toby what
        self.yballtimer = self.yballtimer + DTMULT
        self.balltimer = self.balltimer + DTMULT
        --cenx = x + 18
        --ceny = y + 57
        Draw.setColor(1, 1, 1)
        self:drawEllipse((cenx - self.xballtimer) * 2, (ceny - 1) * 2, (cenx + self.xballtimer) * 2, (ceny + 1) * 2)
        if (self.xballtimer >= 80) then
            self.balltimer = 0
            self.yballtimer = 1
            self.ballcon = 2
            self.whitecolor = {1, 1, 1}
        end
    end
end

return FMEffect