local TasqueManager, super = Class(Recruit, "tasque_manager")

function TasqueManager:init()
    super.init(self)

    self.name = "Tasque Manager"

    self.recruit_amount = 1

    self.index = 17

    self.description = "Loves to coordinate outfits.\nStrongly dslikes clowns."
    self.chapter = 2
    self.level = 10
    self.attack = 10
    self.defense = 7
    self.element = "CAT:ORDER"
    self.like = "New Wave Synth Pop"
    self.dislike = "Mismatched Socks"

    self.box_gradient_type = "bright"
    self.box_gradient_color = {0, 1, 1, 1}
    self.box_sprite = {"npcs/castletown/tm/spared_static", 0, 0, 0}

    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.tasque_manager"
    self.place_offset = {0, 0}
end

function TasqueManager:getRecruited()
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

return TasqueManager