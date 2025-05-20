---@class PurpleWave : Wave
---@overload fun(...) : PurpleWave
local PurpleWave, super = Class(Wave)

function PurpleWave:init()
    super.init(self)
    self.string_count = 3
    self.offset = 0
    self.orientation = "hor"
    self.string_pos = {}
    self.string_sprite = nil
    self.soul_start_string = 2

    self.draw_strings = false
end

function PurpleWave:onStart()
    local arena = Game.battle.arena
    local soul = Game.battle.soul
    Game.battle:swapSoul(PurpleSoul())
    
    soul.wave = self

    self.layer = BATTLE_LAYERS["below_soul"]
    
    for i = 1, self.string_count do
        if self.string_pos[i] == nil then
            self.string_pos[i] = -99999
        end
    end

    self.draw_strings = true
end

function PurpleWave:update()
    local arena = Game.battle.arena
    local soul = Game.battle.soul
    
    soul.wave = self
end

function PurpleWave:draw()
    local arena = Game.battle.arena
    local soul = Game.battle.soul
    local sprite

    if self.draw_strings == true then
        if self.string_sprite == nil then
            love.graphics.setLineWidth(1)
            Draw.setColor({213/255 * 0.5, 53/255 * 0.5, 217/255 * 0.5})
        else
            sprite = Assets.getTexture(self.string_sprite)
        end

        if self.orientation == "hor" then
            for i = 1, self.string_count do
                if self.string_sprite == nil then
                    love.graphics.line(arena.left + 5, arena.top + self.string_pos[i] + self.offset, arena.right - 5, arena.top + self.string_pos[i] + self.offset)
                else
                    Draw.draw(sprite, arena.left, arena.top + self.string_pos[i] + self.offset - (sprite:getHeight()/2))
                end
            end
        elseif self.orientation == "ver" then
            for i = 1, self.string_count do
                if self.string_sprite == nil then
                    love.graphics.line(arena.left + self.string_pos[i] + self.offset, arena.top + 5, arena.left + self.string_pos[i] + self.offset, arena.bottom - 5)
                else
                    Draw.draw(sprite, arena.left + self.string_pos[i] + self.offset - (sprite:getWidth()/2), arena.top)
                end
            end
        end
    end
end

function PurpleWave:setSoulString(string)
    self.soul_start_string = string

    if Game.battle.soul then
        Game.battle.soul:setString(string)
    end
end

function PurpleWave:beforeEnd()
    Game.battle:swapSoul(Soul())
end

return PurpleWave