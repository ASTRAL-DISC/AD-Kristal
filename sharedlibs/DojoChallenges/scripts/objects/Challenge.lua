---@class Challenge : Object
local Challenge, super = Class(Object)

function Challenge:init()
    super.init(self)

    self.challenge = "-------------"
    self.prize = "---"
    self.prize_id = nil
    self.description = nil
    self.encounter = nil
    self.claimed = false
end

return Challenge