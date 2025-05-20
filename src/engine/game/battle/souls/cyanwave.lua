---@class CyanWave : Wave
---@overload fun(...) : CyanWave
local CyanWave, super = Class(Wave)

function CyanWave:init()
    super.init(self)

    self.offset = 0
    self.divider_col = nil

    self.draw_divider = false
end

function CyanWave:onStart()
    local arena = Game.battle.arena
    local soul = Game.battle.soul
    Game.battle:swapSoul(CyanSoul())
    
    soul.wave = self

    self.layer = BATTLE_LAYERS["below_soul"]

    self.draw_divider = true
    self.divider_col = Solid(true, arena.width/2 - 2, 0, 4, arena.height)
    arena:addChild(self.divider_col)

    if not soul.transitioning then
        soul:setPosition(soul.x - 10, soul.y)
    end
end

function CyanWave:update()
    local arena = Game.battle.arena
    local soul = Game.battle.soul
    
    soul.wave = self
end

function CyanWave:draw()
    local arena = Game.battle.arena

    if self.draw_divider == true then
        love.graphics.setLineWidth(4)
        Draw.setColor({0, 0.25, 0})
        love.graphics.line(arena:getCenter() + self.offset, arena.top, arena:getCenter() + self.offset, arena.bottom)
    end
end

function CyanWave:beforeEnd()
    Game.battle:swapSoul(Soul())
end

return CyanWave