local Bloxer, super = Class(Recruit, "bloxer")

function Bloxer:init()
    super.init(self)

    self.name = "Bloxer"

    self.recruit_amount = 3

    self.index = 5

    self.description = "A shape changing fighter.\nIronically, blocking is not its\nforte."
    self.chapter = 1
    self.level = 4
    self.attack = 4
    self.defense = 5
    self.element = "FIGHT"
    self.like = "Cross-Trainers"
    self.dislike = "Formal Shoewear"

    self.box_gradient_type = "dark"
    self.box_gradient_color = {1, 0, 1, 1}
    self.box_sprite = {"npcs/castletown/bloxer/spared", -6, 12, 0}
    
    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.bloxer"
    self.place_offset = {0, 0}
end

return Bloxer