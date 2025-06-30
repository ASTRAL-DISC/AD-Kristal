local item, super = Class(Item, "oldscroll")

function item:init()
    super.init(self)

    self.name = "Old Scroll"
    self.use_name = nil

    self.type = "key"
    self.icon = nil

    self.effect = ""
    self.shop = ""
    self.description = "A scroll with a strange incantation written inside."

    self.price = 0
    self.can_sell = false

    self.target = "none"
    self.usable_in = "none"
    self.result_item = nil
    self.instant = false

    self.bonuses = {}
    self.bonus_name = nil
    self.bonus_icon = nil

    self.can_equip = {}
    
    self.reactions = {}
end

return item