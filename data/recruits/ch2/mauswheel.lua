local Mauswheel, super = Class(Recruit, "mauswheel")

function Mauswheel:init()
    super.init(self)

    self.name = "Mauswheel"

    self.recruit_amount = 1

    self.index = 18

    self.description = "You recruited 3 big mice and\nyou're stuck with it."
    self.chapter = 2
    self.level = 13
    self.attack = 10
    self.defense = 11
    self.element = "MOUSE:MOUSE:MOUSE"
    self.like = "Pretending To Be A Tire"
    self.dislike = "Losing Momentum"

    self.box_gradient_type = "bright"
    self.box_gradient_color = {0, 1, 1, 1}
    self.box_sprite = {"npcs/castletown/mauswheel/idle", -3, 0, 0.1}

    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.mauswheel"
    self.place_offset = {0, 0}
end

function Mauswheel:getRecruited()
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

return Mauswheel