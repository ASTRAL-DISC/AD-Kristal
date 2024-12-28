local item, super = Class(Item, "console_axe")

function item:init()
    super.init(self)

    self.name = "Console Axe"
    self.use_name = nil

    self.type = "weapon"
    self.icon = "ui/menu/icon/axe"

    self.effect = ""
    self.shop = ""
    self.description = "A LED axe, perfect for gaming.\nIncreases resistance to ELEC-type attacks."

    self.price = 0
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

	self.bonuses = {
        defense = 3,
        magic = 1,
    }
    self.bonus_name = "Console"
    self.bonus_icon = "ui/menu/icon/up"

	self.can_equip = {}

    self.reactions = {
		noelle = "",
        berdly = "",
        ralsei = "",
        susie = "...",
        angel = ""
	}
end

return item