local Ponman, super = Class(Recruit, "ponman")

function Ponman:init()
    super.init(self)

    self.name = "Ponman"

    self.recruit_amount = 3

    self.index = 3

    self.description = "A simple organism that takes\nlife one square at a time."
    self.chapter = 1
    self.level = 3
    self.attack = 4
    self.defense = 5
    self.element = "ORDER"
    self.like = "Sleeping"
    self.dislike = "Moving Backwards"

    self.box_gradient_type = "dark"
    self.box_gradient_color = {1, 0, 1, 1}
    self.box_sprite = {"npcs/castletown/ponman/idle", 0, 12, 0.1}
    
    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.ponman"
    self.place_offset = {0, 0}
end

return Ponman