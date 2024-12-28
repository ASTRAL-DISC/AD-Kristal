local Swatchling, super = Class(Recruit, "swatchling")

function Swatchling:init()
    super.init(self)

    self.name = "Swatchling"

    self.recruit_amount = 5

    self.index = 15

    self.description = "Colorful and dandy, you can\nalways count on him to work\nhard."
    self.chapter = 2
    self.level = 9
    self.attack = 9
    self.defense = 9
    self.element = "COLOR"
    self.like = "Paint By Numbers"
    self.dislike = "Mixed Messages"

    self.box_gradient_type = "bright"
    self.box_gradient_color = {0, 1, 1, 1}
    self.box_sprite = {"npcs/castletown/swatchling/walk", -4, 0, 0.1}

    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.swatchling"
    self.place_offset = {15, 18}
end

function Swatchling:getRecruited()
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

return Swatchling