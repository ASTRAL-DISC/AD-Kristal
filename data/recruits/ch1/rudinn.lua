local Rudinn, super = Class(Recruit, "rudinn")

function Rudinn:init()
    super.init(self)

    self.name = "Rudinn"

    self.recruit_amount = 3

    self.index = 1

    self.description = "Said to be someone's best\nfriend, but maybe not. Shine\non, you lazy diamond!"
    self.chapter = 1
    self.level = 2
    self.attack = 4
    self.defense = 5
    self.element = "JEWEL"
    self.like = "Shiny Things"
    self.dislike = "Effort"

    self.box_gradient_type = "dark"
    self.box_gradient_color = {1, 0, 1, 1}
    self.box_sprite = {"npcs/castletown/rudinn/idle", 0, 12, 0.1}
    
    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.rudinn"
    self.place_offset = {0, 0}
end

return Rudinn