local item, super = Class(HealItem, "cinematolly")

function item:init()
    super.init(self)

    self.name = "Cinematolly"
    self.use_name = "CINEMATOLLY"

    self.type = "item"

    self.effect = "Heals\n90HP"
    self.shop = "Licorice\ntreat\nHeals 90HP"
    self.description = "A lollipop curled up like a film scroll.\nTastes like licorice. +90HP"

    self.heal_amount = 90

    self.price = 80
    self.can_sell = true

    self.target = "ally"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.reactions = {
        susie = "Tastes old.",
        ralsei = "Has a vinegar aftertaste...",
        noelle = "(Cute...!)",
        berdly = "Quite old fashioned.",
        mteen = "Licorice?! Ew!",
    }
end

function item:onWorldUse(target)
    if target.id == "mteen" then
        Assets.stopAndPlaySound("ui_cant_select")
		return false
	end
	
	return super.onWorldUse(self, target)
end

return item