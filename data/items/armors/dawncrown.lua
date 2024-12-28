local item, super = Class(Item, "dawncrown")

function item:init()
    super.init(self)

    self.name = "Dawn Crown"
    self.use_name = nil

    self.type = "armor"
    self.icon = "ui/menu/icon/armor"

    self.effect = ""
    self.shop = ""
    self.description = "Made of blinding LIGHT rays.\nMeant to crown the absolute."

    self.price = 0
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

	self.bonuses = {
        defense = 9,
        magic = 9
    }
    self.bonus_name = nil
    self.bonus_icon = nil

	self.can_equip = {
        noelle = false,
    }

    self.reactions = {
        angel = "Bask in our shining power!",
		noelle = "I can't bear to look...!",
	}
end

return item