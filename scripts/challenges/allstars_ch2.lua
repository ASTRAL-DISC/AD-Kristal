local Challenge, super = Class(Challenge, "allstars_ch2")

function Challenge:init()
    super.init(self)

    self.challenge = "Ch2 All Stars"
    self.prize = "TensionGem"
    self.prize_id = "tensiongem"
    self.description = "Face everyone in a row!\nIt'll take some stamina..."
    self.encounter = nil
    self.claimed = true
end

return Challenge