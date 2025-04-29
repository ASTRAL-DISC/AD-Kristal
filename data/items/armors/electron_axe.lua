local item, super = Class(Item, "electron_axe")

function item:init()
    super.init(self)

    self.name = "Electron Axe"
    self.use_name = nil

    self.type = "weapon"
    self.icon = "ui/menu/icon/axe"

    self.effect = ""
    self.shop = ""
    self.description = "A LED axe. Increases resistance to ELEC-type attacks."

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
    self.bonus_name = "Elec"
    self.bonus_icon = "ui/menu/icon/armor"

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