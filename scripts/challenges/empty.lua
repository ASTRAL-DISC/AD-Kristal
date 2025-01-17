local Challenge, super = Class(Challenge, "empty")

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