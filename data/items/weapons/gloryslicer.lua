local item, super = Class(Item, "gloryslicer")

function item:init()
    super.init(self)

    self.name = "Gloryslicer"
    self.use_name = nil

    self.type = "weapon"
    self.icon = "ui/menu/icon/sword"

    self.effect = ""
    self.shop = ""
    self.description = "A luminous chakram blade.\nIncreases the damage of certain spells." -- WIP

    self.price = 0
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

	self.bonuses = {
        attack = 5,
    }
    self.bonus_name = nil
    self.bonus_icon = nil

	self.can_equip = {
        kris = true
    }

    self.reactions = {
		susie = "A halo, huh.",
		ralsei = "And you have to throw it?!",
        noelle = "So elegant!",
        mteen = "That looks pretty sharp...",
        berdly = "Goes well with my feathers, no?",
        angel = "Gotta have one of these..."
	}
end

return item