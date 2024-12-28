local item, super = Class(HealItem, "crystalsugar")

function item:init()
    super.init(self)

    self.name = "CrystalSugar"
    self.use_name = "CRYSTAL SUGAR"

    self.type = "item"

    self.effect = "Heals\n50HP"
    self.shop = "Crystallized\ncandy\nHeals 50HP"
    self.description = "Edible cluster of crystal candy on a stick. +50HP"

    self.heal_amount = 50

    self.price = 30
    self.can_sell = true

    self.target = "ally"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.reactions = {
		susie = "Crunchy!!",
		ralsei = "Delicious!!",
    	noelle = "Too sweet...",
	}
end

return item