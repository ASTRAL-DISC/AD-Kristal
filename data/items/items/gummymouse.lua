local item, super = Class(HealItem, "gummymouse")

function item:init()
    super.init(self)

    self.name = "Gummy Mouse"
    self.use_name = "GUMMY MOUSE"

    self.type = "item"

    self.effect = "Heals\n90HP"
    self.shop = "Magic crystal\nwith mouse\nHeals 90HP"
    self.description = "A tiny mouse encased in a magical fruit gum crystal. +90HP"

    self.heal_amount = 90

    self.price = 75
    self.can_sell = true

    self.target = "ally"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.reactions = {
		susie = "Was there something inside?",
		ralsei = "Umm, sorry, I'm no snake!",
        noelle = "A D-DEAD MOUSE?!",
        berdly = "Scrumptious!!",
        mteen = "Tastes funny...",
        angel = "Huh?"
	}
end

function item:onWorldUse(target)
    if target.id == "ralsei" or target.id == "noelle" then
        Assets.stopAndPlaySound("ui_cant_select")
		return false
	elseif target.id == "noelle" then
        Assets.stopAndPlaySound("noelle_scared")
		return false
	end
	
	return super.onWorldUse(self, target)
end

return item