local Poppup, super = Class(Recruit, "poppup")

function Poppup:init()
    super.init(self)

    self.name = "Poppup"

    self.recruit_amount = 3

    self.index = 10

    self.description = "Known to say ASOBOH, which\nmeans \"Let's Play!\" ... does it\nknow that?"
    self.chapter = 2
    self.level = 8
    self.attack = 9
    self.defense = 3
    self.element = "VIRUS"
    self.like = "LEEMO FRUIT"
    self.dislike = "ADBLOCK"

    self.box_gradient_type = "bright"
    self.box_gradient_color = {0, 1, 1, 1}
    self.box_sprite = {"npcs/castletown/poppup/idle", 0, 12, 0.1}

    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.poppup"
    self.place_offset = {0, 0}
end

function Poppup:getRecruited()
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

return Poppup