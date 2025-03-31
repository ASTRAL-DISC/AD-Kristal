local item, super = Class(Item, "smartscouter")

function item:init()
    super.init(self)

    self.name = "Smart Scouter"

    self.type = "armor"
    self.icon = "ui/menu/icon/armor"

    self.effect = ""
    self.shop = ""
    self.description = "Futuristic orange tinted lens that boost your smarts."

    self.price = 2
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {
        defense = 2,
    }
    self.bonus_name = nil
    self.bonus_icon = nil

    self.can_equip = {
        susie = false,
    }
    
    self.reactions = {
        susie = "Not wearing that nerdy crap!",
        ralsei = "3 lenses at once?!",
        noelle = "Feels uncomfortable...",
        berdly = "Reeks of intelligence!"
    }
end

function item:convertToLightEquip(chara)
    return "light/glasses"
end

return item