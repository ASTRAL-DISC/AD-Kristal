local item, super = Class(Item, "gonerlabrys")

function item:init()
    super.init(self)

    self.name = "GonerLabrys"

    self.type = "weapon"
    self.icon = "ui/menu/icon/axe"

    self.effect = ""
    self.shop = ""
    self.description = "A double-headed axe adorned with silvery details.\nIncreases BETA Magic."

    self.price = 2
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {
        attack = 18,
        magic = 6
    }
    self.bonus_name = "BETA"
    self.bonus_icon = "ui/menu/icon/beta"

    self.can_equip = {
        susie = true,
    }

    self.reactions = {} -- WIP
end

return item