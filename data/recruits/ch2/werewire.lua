local Werewire, super = Class(Recruit, "werewire")

function Werewire:init()
    super.init(self)

    self.name = "Werewire"

    self.recruit_amount = 6

    self.index = 12

    self.description = "It was controlled by Queen.\nBut, it's stronger and cooler\nnow, so?"
    self.chapter = 2
    self.level = 7
    self.attack = 8
    self.defense = 7
    self.element = "ELEC"
    self.like = "Shock Therapy"
    self.dislike = "Emotional Therapy"

    self.box_gradient_type = "bright"
    self.box_gradient_color = {0, 1, 1, 1}
    self.box_sprite = {"enemies/werewire/recruit", -7, -4, 0.1}

    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.werewire"
    self.place_offset = {0, 0}
end

function Werewire:getRecruited()
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

return Werewire