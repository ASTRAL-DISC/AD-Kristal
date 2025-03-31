local item, super = Class(LightEquipItem, "light/pen")

function item:init()
    super.init(self)
    
    self.name = "Pen"

    self.type = "weapon"

    self.light = true
    self.check = "Weapon 2 AT\n* A pen with glow in the dark ink. Reliable."

    self.usable_in = "all"
    self.result_item = nil

    self.bonuses = {
        attack = 2
    }

    self.dark_item = "neon_halberd"
end

return item