local HeadHathy, super = Class(Recruit, "head_hathy")

function HeadHathy:init()
    super.init(self)

    self.name = "Head Hathy"

    self.recruit_amount = 3

    self.index = 8

    self.description = "Although stronger than Hathy,\nseems to have fewer friends."
    self.chapter = 1
    self.level = 5
    self.attack = 5
    self.defense = 5
    self.element = "HEART:ICE"
    self.like = "Peace And Quiet "
    self.dislike = "Being Alone"

    self.box_gradient_type = "dark"
    self.box_gradient_color = {1, 0, 1, 1}
    self.box_sprite = {"npcs/castletown/headhathy/idle", 0, 12, 0.1}
    
    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.head_hathy"
    self.place_offset = {0, 0}
end

return HeadHathy