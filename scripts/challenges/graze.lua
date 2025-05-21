local Challenge, super = Class(Challenge, "graze")

function Challenge:init()
    super.init(self)

    self.challenge = "Graze Challenge 1"
    self.prize = 100
    self.prize_id = 100
    self.description = "Get 100% TP without getting hit!\nYou can do it, boss!"
    self.encounter = nil
    self.claimed = true
end

return Challenge