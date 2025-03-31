local item, super = Class(LightEquipItem, "light/glasses")

function item:init()
    super.init(self)
    
    self.name = "Glasses"

    self.type = "armor"

    self.light = true
    self.check = "Armor 2 DF\n* A pair of glasses. Common."

    self.usable_in = "all"
    self.result_item = nil

    self.bonuses = {
        defense = 2
    }

    self.dark_item = "smartscouter"
end

return item