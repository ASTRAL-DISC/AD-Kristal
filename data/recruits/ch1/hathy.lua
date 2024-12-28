local Hathy, super = Class(Recruit, "hathy")

function Hathy:init()
    super.init(self)

    self.name = "Hathy"

    self.recruit_amount = 3

    self.index = 2

    self.description = "A heart with a big heart.\nAlways supporting others with\nher bullets."
    self.chapter = 1
    self.level = 2
    self.attack = 4
    self.defense = 5
    self.element = "HEART"
    self.like = "Lip Gloss"
    self.dislike = "Drama"

    self.box_gradient_type = "dark"
    self.box_gradient_color = {1, 0, 1, 1}
    self.box_sprite = {"enemies/hathy/idle", 0, 12, 0.1}
    
    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.hathy"
    self.place_offset = {0, 0}
end

return Hathy