local Tasque, super = Class(Recruit, "tasque")

function Tasque:init()
    super.init(self)

    self.name = "Tasque"

    self.recruit_amount = 5

    self.index = 11

    self.description = "This cat loves you!"
    self.chapter = 2
    self.level = 8
    self.attack = 8
    self.defense = 8
    self.element = "CAT:ELEC"
    self.like = "Cat Food"
    self.dislike = "Cat Food"

    self.box_gradient_type = "bright"
    self.box_gradient_color = {0, 1, 1, 1}
    self.box_sprite = {"npcs/castletown/tasque/idle", -3, 15, 0.1}

    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.tasque"
    self.place_offset = {0, 0}
end

function Tasque:getRecruited()
    if Game.chapter >= 3 then
        if not Game:getFlag("snowgraved") then
            return true
        else
            return false
        end
    else
        return self.recruited
    end
end

return Tasque