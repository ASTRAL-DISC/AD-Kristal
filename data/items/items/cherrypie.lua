local item, super = Class(HealItem, "cherrypie")

function item:init()
    super.init(self)

    self.name = "CherryPie"
    self.use_name = "CHERRY PIE"

    self.type = "item"

    self.effect = "Heals\n90HP"
    self.shop = "Homemade\nHeals 90HP"
    self.description = "A delicious looking pie with a LOT of red filling. +90HP"

    self.heal_amount = 90

    self.price = 35
    self.can_sell = true

    self.target = "ally"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.reactions = {
      	susie = "*bite* I'm a zombie!!",
      	ralsei = "AH! Made a mess...",
	}
end

return item