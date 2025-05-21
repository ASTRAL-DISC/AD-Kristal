local Challenge, super = Class(Challenge, "jigsawjoe")

function Challenge:init()
    super.init(self)

    self.challenge = "Jigsaw Joe"
    self.prize = "Joe's Life Savings"
    self.prize_id = 1
    self.description = "Learn how to spare like a champ."
    self.encounter = nil
    self.claimed = true
end

return Challenge