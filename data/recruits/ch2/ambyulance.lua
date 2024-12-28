local AmbyuLance, super = Class(Recruit, "ambyulance")

function AmbyuLance:init()
    super.init(self)

    self.name = "Ambyu-Lance"

    self.recruit_amount = 4

    self.index = 9

    self.description = "An aggressive antivirus. It's\nnot down with the sickness."
    self.chapter = 2
    self.level = 8
    self.attack = 8
    self.defense = 8
    self.element = "ORDER:ELEC"
    self.like = "Loud Sirens"
    self.dislike = "Funny Sound Effects"

    self.box_gradient_type = "bright"
    self.box_gradient_color = {0, 1, 1, 1}
    self.box_sprite = {"npcs/castletown/ambyulance/idle", -5, 12, 0.1}

    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.ambyulance"
    self.place_offset = {0, 0}
end

function AmbyuLance:getRecruited()
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

return AmbyuLance