local item, super = Class(HealItem, "starrydonut")

function item:init()
    super.init(self)

    self.name = "StarryDonut"
    self.use_name = "STARRY DONUT"

    self.type = "item"

    self.effect = "Heals\n70HP"
    self.shop = "Sparkly\ndonut\nHeals 70HP"
    self.description = "A donut covered in star-like sprinkles.\nReminds you of a certain painting. +70HP"

    self.heal_amount = 70

    self.price = 20
    self.can_sell = true

    self.target = "ally"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.reactions = {
      	susie = "Oh, like that one painting.",
      	ralsei = "Truly artistic!",
	}
end

return item