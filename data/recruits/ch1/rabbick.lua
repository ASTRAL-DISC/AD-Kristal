local Rabbick, super = Class(Recruit, "rabbick")

function Rabbick:init()
    super.init(self)

    self.name = "Rabbick"

    self.recruit_amount = 3

    self.index = 4

    self.description = "A real dust bunny. Known to\nplay dirty, but loves to play\nclean."
    self.chapter = 1
    self.level = 4
    self.attack = 4
    self.defense = 5
    self.element = "RABBIT:DUST"
    self.like = "Dusty Places"
    self.dislike = "Vacuum"

    self.box_gradient_type = "dark"
    self.box_gradient_color = {1, 0, 1, 1}
    self.box_sprite = {"npcs/castletown/rabbick/idle", 0, 40, 0}
    
    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.rabbick"
    self.place_offset = {0, 0}
end

return Rabbick