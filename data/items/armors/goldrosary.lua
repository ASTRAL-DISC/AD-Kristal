local item, super = Class(Item, "goldrosary")

function item:init()
    super.init(self)

    self.name = "Gold Rosary"
    self.use_name = nil

    self.type = "armor"
    self.icon = "ui/menu/icon/armor"

    self.effect = ""
    self.shop = ""
    self.description = "A cross shaped necklace that acts as a protective charm."

    self.price = 200
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

	self.bonuses = {
        defense = 3,
        magic = 1
    }
    self.bonus_name = nil
    self.bonus_icon = nil

	self.can_equip = {}

    self.reactions = {
		mteen = "Um, yeah, that's mine.",
		noelle = "Oh! This is fancy...",
        ralsei = "I... I feel weird.",
        susie = "Looks familiar.",
        berdly = "Interesting trinket.",
        angel = "Guess we're wearing merch?"
	}
end

function item:convertToLightEquip(chara)
    return "light/cross_necklace"
end

return item