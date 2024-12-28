local item, super = Class(Item, "mecheyes")

function item:init()
    super.init(self)

    self.name = "Mech. Eyes"
    self.use_name = nil

    self.type = "key"
    self.icon = nil

    self.effect = ""
    self.shop = ""
    self.description = "Mechanical eyes you got from the priest.\nMight belong to someone else."
    
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