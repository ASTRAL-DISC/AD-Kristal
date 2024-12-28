local item, super = Class(Item, "safetybelt")

function item:init()
    super.init(self)

    self.name = "Safety Belt"
    self.use_name = nil

    self.type = "armor"
    self.icon = "ui/menu/icon/armor"

    self.effect = ""
    self.shop = ""
    self.description = "Rollercoaster safety armor that fills you up with ADRENALINE." -- Needs mechanic

    self.price = 0
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

	self.bonuses = {
        defense = 7,
        magic = 2,
    }
    self.bonus_name = "Adrenaline"
    self.bonus_icon = "ui/menu/icon/up"

	self.can_equip = {
        noelle = false,
        susie = false
    }

    self.reactions = {
		noelle = "I-I'll pass, ok?",
        berdly = "Buckle up!",
        ralsei = "Hoping for no loops...",
        susie = "...",
        angel = "Neat! Where's the ride?!"
	}
end

return item