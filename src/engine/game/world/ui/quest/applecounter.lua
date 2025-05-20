---@class AppleCounter : Object
---@overload fun(...) : AppleCounter
local AppleCounter, super = Class(Object)

function AppleCounter:init()
    super.init(self, 0, 0, self.width, self.height)
    self:setScale(1)
    self:setOrigin(0, 0)

    self.apple = Assets.getTexture("world/events/quest/apple_icon")

    self.parallax_x = 0
    self.parallax_y = 0

    --self.alpha = 0
    self.font = Assets.getFont("depixelschmal", 18)
end

--[[function AppleCounter:onAdd()
    Game.world.timer:after(0.1, function ()
        self.alpha = 0.4
        Game.world.timer:after(0.2, function ()
            self.alpha = 1
        end)
    end)
end]]

function AppleCounter:draw()
    super.draw(self)

    love.graphics.setFont(self.font)
    self.flag = Game:getFlag("apples", 0)
    local counter = string.format("%d", self.flag)
    if self.flag > 100 then
        love.graphics.print(counter, self.x + 120, self.y + 30)
    else
        love.graphics.print(counter, self.x + 90, self.y + 30)
    end
    Draw.draw(self.apple, self.x + 30, self.y + 30, 0, 2, 2)
    love.graphics.print("x", self.x + 60, self.y + 30)
end

return AppleCounter