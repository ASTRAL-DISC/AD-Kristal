local item, super = Class(Item, "cat_earmuffs")

function item:init()
    super.init(self)

    self.name = "CatEarmuffs"
    self.use_name = nil

    self.type = "armor"
    self.icon = "ui/menu/icon/armor"

    self.effect = ""
    self.shop = "Cat's Eye\ndecorated\nearmuffs"
    self.description = "The right combination between comfortable and cute!"

    self.price = 220
    self.can_sell = true

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

	self.bonuses = {
        defense = 8
    }
    self.bonus_name = "Gamer Moves UP"
    self.bonus_icon = "ui/menu/icon/up"

	self.can_equip = {
        susie = false,
        ralsei = false,
        berdly = false
    }

    self.reactions = {
		susie = "Yeah, not happening.",
		ralsei = "Aw, my horns get in the way...",
        noelle = "(Cute...!)",
        mteen = "How do you even find this stuff?",
        berdly = "Earmuffs... Disappointing."
	}
end

return item