---@class Battle : Battle
---@overload fun(...) : Battle
local Battle, super = Class("Battle", true)

function Battle:updateIntro()
    self.intro_timer = self.intro_timer + 1 * DTMULT
    if self.intro_timer >= 15 then -- TODO: find out why this is 15 instead of 13
        for _,v in ipairs(self.party) do
            v:setAnimation("battle/idle")
        end
		self.seen_encounter_text = false
		if Mod.back_attack then
			self:setState("ENEMYDIALOGUE", "INTRO")
		else
			self:setState("ACTIONSELECT", "INTRO")
			-- self:nextTurn()
		end
    end
end

return Battle