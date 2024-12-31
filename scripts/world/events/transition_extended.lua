---@class TransitionExtended : Transition
---@overload fun(...) : TransitionExtended
---@field target table Inherited from parent class
local TransitionExtended, super = Class(Transition, "transition_extended")

function TransitionExtended:init(data)
    super.init(self, data.x, data.y, data.width, data.height, data.properties)

    -- New property for the open / close door SFX
    self.door = data.properties["door"] or false

    -- If none of these properties are found, the transition will happen using the map property instead
    self.ch3map = data.properties.ch3map
    self.ch4map = data.properties.ch4map
    self.ch5map = data.properties.ch5map
    self.ch6map = data.properties.ch6map
    self.ch7map = data.properties.ch7map
end

function TransitionExtended:onEnter(chara)
    --[[self.ch3map = Game:getFlag("ct_expansion1") and self.ch3map or "castletown/main"
    self.ch4map = Game:getFlag("ct_expansion2") and self.ch4map or "castletown/main2"
    self.ch5map = Game:getFlag("ct_expansion3") and self.ch5map or "castletown/main2"
    self.ch6map = Game:getFlag("ct_expansion4") and self.ch6map or "castletown/main2"
    self.ch7map = Game:getFlag("ct_expansion5") and self.ch7map or "castletown/main2"]]

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

    if chara.is_player then
        if self.door then
            self.world.timer:script(function(wait)
                Assets.playSound("dooropen")
                wait(0.4)
                Assets.playSound("doorclose")
            end)
        end
    end

    -- Call parent class
    super.onEnter(self, chara)
end

return TransitionExtended