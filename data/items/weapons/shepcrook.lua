local item, super = Class(Item, "shepcrook")

function item:init()
    super.init(self)

    self.name = "ShepCrook"

    self.type = "weapon"
    self.icon = "ui/menu/icon/staff"

    self.effect = ""
    self.shop = ""
    self.description = "A wooden crook with a bell attached.\nIts soundwaves induce sleepiness."

    self.price = 10
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {}
    self.bonus_name = nil
    self.bonus_icon = nil

    self.can_equip = {
        mteen = true,
    }
    
    self.reactions = {
        ralsei = "My eyes feel heavy...",
        noelle = "Can we rest for a bit...?",
        mteen = "*ring ring* Haha!",
    }
end

return item