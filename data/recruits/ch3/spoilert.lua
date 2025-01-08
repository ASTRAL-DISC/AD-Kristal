local Spoilert, super = Class(Recruit, "spoilert")

function Spoilert:init()
    super.init(self)

    self.name = "Spoilert"

    self.recruit_amount = 3

    self.index = 19

    self.description = "This innocent looking pal\nknows all about your favorite\ncharacter's fate. Beware!"
    self.chapter = 3
    self.level = 15
    self.attack = 10
    self.defense = 11
    self.element = "CHAOS:RUDE"
    self.like = "Leaks"
    self.dislike = "Non Disclosure Agreements"

    self.box_gradient_type = "dark"

    self.box_gradient_color = {0, 1, 0.5, 1}

    self.box_sprite = {"enemies/ch3/spoilert/idle", -2, 16, 0.1}

    self.recruited = 0
    self.cafe_cutscene = "castletown/cafeplace.spoilert"
    self.place_offset = {0, 0}
end

function Spoilert:getRecruited()
    if Game.chapter > 3 then
        if not Game:getFlag("offscript") then
            return true
        else
            return false
        end
    elseif Game.chapter == 3 then
        return self.recruited
    end
end

return Spoilert