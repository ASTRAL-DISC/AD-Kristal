local item, super = Class(Item, "clipboard")

function item:init()
    super.init(self)

    self.name = "Clipboard"
    self.use_name = nil

    self.type = "key"
    self.icon = nil

    self.effect = ""
    self.shop = ""
    self.description = "Seems to be a status report.\nAs much as you want to read it..."

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