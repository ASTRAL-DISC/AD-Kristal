local Challenge, super = Class(Challenge, "cloverrematch")

function Challenge:init()
    super.init(self)

    self.challenge = "Clover Rematch"
    self.prize = "ClubsSandwich"
    self.prize_id = "clubssandwich"
    self.description = "It's not Clover's birthday anymore!\nShe won't go easy on you now!"
    self.encounter = nil
    self.claimed = true
end

return Challenge