local Virovirokun, super = Class(Recruit, "virovirokun")

function Virovirokun:init()
    super.init(self)

    self.name = "Virovirokun"

    self.recruit_amount = 4

    self.index = 14

    self.description = "A virus with a slightly\ncriminal streak... and a heart\nof gold."
    self.chapter = 2
    self.level = 7
    self.attack = 8
    self.defense = 6
    self.element = "VIRUS"
    self.like = "Retro Games"
    self.dislike = "Federal Justice System"

    self.box_gradient_type = "bright"
    self.box_gradient_color = {0, 1, 1, 1}
    self.box_sprite = {"npcs/castletown/virovirokun/idle", 0, 12, 0.1}

    self.recruited = true
    self.cafe_cutscene = "castletown/cafeplace.virovirokun"
    self.place_offset = {0, 0}
end

function Virovirokun:getRecruited()
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

return Virovirokun