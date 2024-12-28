local item, super = Class(Item, "destinyveil")

function item:init()
    super.init(self)

    self.name = "DestinyVeil"
    self.use_name = nil

    self.type = "armor"
    self.icon = "ui/menu/icon/armor"

    self.effect = ""
    self.shop = ""
    self.description = "A golden crown adorned by a veil.\nResistance against DELTA magic."

    self.price = 0
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

	self.bonuses = {
        defense = 13,
    }
    self.bonus_name = "DELTA"
    self.bonus_icon = "ui/menu/icon/delta"

	self.can_equip = {
        noelle = false
    }

    self.reactions = {
		noelle = "H-How would I fight without magic?",
        ralsei = "I've been promoted!",
        susie = "Look at my crown! LOOK.", -- WIP
        angel = "Now THIS is useful."
	}
    
    self.noelle_magic = nil
end

function item:onEquip(character, replacement)
    if character.id == "noelle" then
        self.noelle_magic = character:getStat("magic")
        character:increaseStat("magic", 0)
    end
    return true
end

function item:onUnequip(character, replacement)
    if character.id == "noelle" then
        if self.noelle_magic then
            character:increaseStat("magic", character:getStat("magic"))
        end
    end
    return true
end

return item