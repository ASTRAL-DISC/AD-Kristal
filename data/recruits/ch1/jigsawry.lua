local Jigsawry, super = Class(Recruit, "jigsawry")

function Jigsawry:init()
    super.init(self)

    self.name = "Jigsawry"

    self.recruit_amount = 3

    self.index = 6

    self.description = "It cries tears of joy that you\nare its boss."
    self.chapter = 1
    self.level = 1
    self.attack = 4
    self.defense = 5
    self.element = "MOUSE:PUZZ"
    self.like = "Fitting In"
    self.dislike = "Susie's Ax"

    self.box_gradient_type = "dark"
    self.box_gradient_color = {1, 0, 1, 1}
    self.box_sprite = {"npcs/castletown/jigsawry/spared", 0, 12, 0.1}
    
    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.jigsawry"
    self.place_offset = {0, 0}
end

return Jigsawry