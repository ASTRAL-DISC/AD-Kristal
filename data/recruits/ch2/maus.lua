local Maus, super = Class(Recruit, "maus")

function Maus:init()
    super.init(self)

    self.name = "Maus"

    self.recruit_amount = 3

    self.index = 13

    self.description = "It dreams of reenacting scenes\nfrom cat and mouse cartoons."
    self.chapter = 2
    self.level = 6
    self.attack = 8
    self.defense = 2
    self.element = "MOUSE:ELEC"
    self.like = "Clicking"
    self.dislike = "Clicking On Poppup"

    self.box_gradient_type = "bright"
    self.box_gradient_color = {0, 1, 1, 1}
    self.box_sprite = {"npcs/castletown/maus/idle", 0, 40, 0.1}

    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.maus"
    self.place_offset = {0, 0}
end

function Maus:getRecruited()
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

return Maus