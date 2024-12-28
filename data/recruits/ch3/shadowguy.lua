local Shadowguy, super = Class(Recruit, "shadowguy")

function Shadowguy:init()
    super.init(self)

    self.name = "Shadowguy"

    self.recruit_amount = 5

    self.index = 20

    self.description = "Now free of his old boss,\nthis dapper fella is no longer\nchasing shadows."
    self.chapter = 3
    self.level = 16
    self.attack = 10
    self.defense = 11
    self.element = "SHADOW"
    self.like = "Formal Socks"
    self.dislike = "Reading Sheet Music"

    self.box_gradient_type = "dark"

    self.box_gradient_color = {0, 1, 0.5, 1}

    self.box_sprite = {"enemies/ch3/shadowguy/idle", 1, 8, 0.15}

    self.recruited = 0
    self.cafe_cutscene = "castletown/cafeplace.shadowguy"
end

function Shadowguy:getRecruited()
    if Game.chapter > 3 then
        if not Game:getFlag("stormeye") then
            return true
        else
            return false
        end
    elseif Game.chapter == 3 then
        return self.recruited
    end
end

return Shadowguy