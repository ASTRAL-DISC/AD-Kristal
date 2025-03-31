local item, super = Class(LightEquipItem, "light/bent_pencil")

function item:init()
    super.init(self)
    
    self.name = "Bent Pencil"

    self.type = "weapon"

    self.light = true
    self.check = "Weapon 1 AT\n* A bent pencil forming the shape of a sheep."

    self.usable_in = "all"
    self.result_item = nil

    self.bonuses = {
        attack = 1
    }

    self.dark_item = "shepcrook"
end

return item