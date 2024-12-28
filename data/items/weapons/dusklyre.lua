local item, super = Class(Item, "dusklyre")

function item:init()
    super.init(self)

    self.name = "Dusk Lyre"

    self.type = "weapon"
    self.icon = "ui/menu/icon/lyre"

    self.effect = ""
    self.shop = ""
    self.description = "Darkness in the form of a lyre.\nMeant to cast spells through song."

    self.price = 2
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {
        attack = 9
    }
    self.bonus_name = nil
    self.bonus_icon = nil

    self.can_equip = {
        angel = true,
    }

    self.reactions = {
        angel = "Here we are!",
        noelle = "The strings feel fluid...",
    }
end

return item