local Challenge, super = Class(Challenge, "graze_tasque")

function Challenge:init()
    super.init(self)

    self.challenge = "Graze Challenge 2"
    self.prize = 300
    self.prize_id = 300
    self.description = "Again, get 100% TP without getting hit!\nI believe in you, boss!"
    self.encounter = nil
    self.claimed = false
end

return Challenge