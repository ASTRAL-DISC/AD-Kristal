local Werewerewire, super = Class(Recruit, "werewerewire")

function Werewerewire:init()
    super.init(self)

    self.name = "Werewerewire"

    self.recruit_amount = 1

    self.index = 16

    self.description = "It absorbed the wire with\nfighting spirit. Gets flustered\neasily."
    self.chapter = 2
    self.level = 14
    self.attack = 11
    self.defense = 11
    self.element = "ELEC:FIGHT"
    self.like = "Supercharged Fighting"
    self.dislike = "Interpersonal Relationships"

    self.box_gradient_type = "bright"
    self.box_gradient_color = {0, 1, 1, 1}
    self.box_sprite = {"npcs/castletown/werewerewire/idle", 0, 0, 0.1}

    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.werewerewire"
    self.place_offset = {0, 0}
end

function Werewerewire:getRecruited()
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

return Werewerewire