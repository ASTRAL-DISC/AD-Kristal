local Challenge, super = Class(Challenge, "tmsays")

function Challenge:init()
    super.init(self)

    self.challenge = "Tasque Manager Says"
    self.prize = 250
    self.prize_id = 250
    self.description = "Winning's as easy as A-B-C!\nYou've got three chances, boss!"
    self.encounter = nil
    self.claimed = true
end

return Challenge