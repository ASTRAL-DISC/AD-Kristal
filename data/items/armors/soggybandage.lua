local item, super = Class(Item, "soggybandage")

function item:init()
    super.init(self)

    self.name = "SoggyBandage"
    self.use_name = nil

    self.type = "armor"
    self.icon = "ui/menu/icon/armor"

    self.effect = ""
    self.shop = ""
    self.description = "A stained bandage with an aura.\nWielder is immune to POISON-type attacks."

    self.price = 0
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

	self.bonuses = {
        defense = 8,
    }
    self.bonus_name = "Poison"
    self.bonus_icon = "ui/menu/icon/armor"

	self.can_equip = {
        angel = false
    }

    self.reactions = {
		noelle = "This is very unhygienic...",
        ralsei = "...",
        susie = "Gross and disturbing.",
        angel = "Why would we wear this?!"
	}
end

return item