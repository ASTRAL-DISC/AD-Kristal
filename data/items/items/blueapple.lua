local item, super = Class(HealItem, "blueapple")

function item:init()
    super.init(self)

    self.name = "Blue Apple"
    self.use_name = "BLUE APPLE"

    self.type = "item"

    self.effect = "Healing\nvaries"
    self.shop = "Apple that's\nblue\nHeals ??HP"
    self.description = "An odd, blue apple. Might taste good. +??HP"

    self.heal_amount = 70

    self.heal_amounts = {
        ["kris"] = 100,
        ["susie"] = 100,
        ["ralsei"] = 80,
        ["noelle"] = 70,
        ["berdly"] = 60,
        ["mteen"] = 40
    }

    self.price = 40
    self.can_sell = true

    self.target = "ally"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.reactions = {
		susie = "Smells like Kris.",
		ralsei = "(Reminds me of Kris...)",
        noelle = "It looks like Kris...",
        berdly = "Annoyingly Kris-like.",
        mteen = "Haha, Kris...",
	}
end

return item