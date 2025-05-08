---@class TransitionSpecial : Transition
---@overload fun(...) : TransitionSpecial
---@field target table Inherited from parent class
local TransitionSpecial, super = Class(Transition, "transition_special")

function TransitionSpecial:init(data)
    super.init(self, data.x, data.y, {data.width, data.height}, data.properties)

    -- If none of these properties are found, the transition will happen using the map property instead
    self.ch3map = data.properties.ch3map
    self.ch4map = data.properties.ch4map
    self.ch5map = data.properties.ch5map
    self.ch6map = data.properties.ch6map
    self.ch7map = data.properties.ch7map
end

function TransitionSpecial:onEnter(chara)
    if not self.target.map then
        if Game.chapter == 3 then
            self.target.map = self.ch3map
        elseif Game.chapter == 4 then
            self.target.map = self.ch4map
        elseif Game.chapter == 5 then
            self.target.map = self.ch5map
        elseif Game.chapter == 6 then
            self.target.map = self.ch6map
        elseif Game.chapter == 7 then
            self.target.map = self.ch7map
        end
    end

    -- Call parent class
    super.onEnter(self, chara)
end

return TransitionSpecial