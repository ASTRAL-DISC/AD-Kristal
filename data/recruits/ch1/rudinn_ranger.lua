local RudinnRanger, super = Class(Recruit, "rudinn_ranger")

function RudinnRanger:init()
    super.init(self)

    self.name = "Rudinn Ranger"

    self.recruit_amount = 3

    self.index = 7

    self.description = "Obsessed with ranger shows, it\nlets everyone know it's better\nthan Rudinn."
    self.chapter = 1
    self.level = 5
    self.attack = 4
    self.defense = 5
    self.element = "JEWEL:BLADE"
    self.like = "Sucking Up"
    self.dislike = "Show Getting Taped Over"

    self.box_gradient_type = "dark"
    self.box_gradient_color = {1, 0, 1, 1}
    self.box_sprite = {"npcs/castletown/rudinn_ranger/idle", 0, 12, 0}
    
    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.rudinn_ranger"
    self.place_offset = {0, 0}
end

return RudinnRanger