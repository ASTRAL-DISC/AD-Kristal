local item, super = Class(LightEquipItem, "light/cross_necklace")

function item:init()
    super.init(self)

    self.name = "Cross Necklace"

    self.type = "armor"

    self.light = true

    self.check = "Armor 2 DF\n* A faux gold, cross shaped necklace."

    self.usable_in = "all"
    self.result_item = nil

    self.bonuses = {
        defense = 2
    }
    
    self.dark_item = "goldrosary"
end

return item