local item, super = Class(Item, "corruptstole")

function item:init()
    super.init(self)

    self.name = "CorruptStole"
    self.use_name = nil

    self.type = "armor"
    self.icon = "ui/menu/icon/armor"

    self.effect = ""
    self.shop = ""
    self.description = "A worn out priest's stole.\nProtects against BETA magic." -- WIP

    self.price = 0
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

	self.bonuses = {
        defense = 6,
    }
    self.bonus_name = "BETA"
    self.bonus_icon = "ui/menu/icon/beta"

	self.can_equip = {}

    self.reactions = {
		noelle = "I must look ridiculous...",
        ralsei = "You can use it as a scarf!",
        susie = "Why do I feel weaker?!",
        mteen = "Huh.", -- WIP
        berdly = "Not great at oratory.", -- WIP, this is ass
        angel = "We feel... corruption." -- WIP, this is ass
	}
end

function item:onEquip(character, replacement)
    if character.id == "susie" then
        character:increaseStat("magic", -5)
    elseif character.id == "ralsei" then
        character:increaseStat("magic", 5)
    end
    return true
end

function item:onUnequip(character, replacement)
    if character.id == "susie" then
        character:increaseStat("magic", 5)
    elseif character.id == "ralsei" then
        character:increaseStat("magic", -5)
    end
    return true
end

return item