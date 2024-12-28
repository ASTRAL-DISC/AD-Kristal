local item, super = Class(Item, "neon_halberd")

function item:init()
    super.init(self)

    self.name = "Neon Halberd"

    self.type = "weapon"
    self.icon = "ui/menu/icon/halberd"

    self.effect = ""
    self.shop = ""
    self.description = "A green laser halberd with yellow eyes\nembedded into the blade."

    self.price = 2
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {}
    self.bonus_name = nil
    self.bonus_icon = nil

    self.can_equip = {
        berdly = true,
    }
    
    self.reactions = {
        susie = "...Did you take this from Berdly?",
        ralsei = "Umm... No, thanks.",
        noelle = "It keeps looking at me...",
        berdly = "Jealous, Kris?",
    }
end

return item