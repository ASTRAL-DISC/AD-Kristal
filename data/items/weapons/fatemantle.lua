local item, super = Class(Item, "fatemantle")

function item:init()
    super.init(self)

    self.name = "FateMantle"

    self.type = "weapon"
    self.icon = "ui/menu/icon/scarf"

    self.effect = ""
    self.shop = ""
    self.description = "A delicate scarf-mantle.\nReduces TP cost of WATER spells." -- WIP?

    self.price = 0
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {
        attack = 17,
        magic = 10
    }
    self.bonus_name = nil
    self.bonus_icon = nil

    self.can_equip = {
        ralsei = true,
    }

    self.reactions = {
        susie = "Too dainty for me.",
        ralsei = "...", -- WIP
        noelle = "This looks expensive...",
        angel = "Aw, we wanted to wear it!",
    }

    self.bolt_count = 4
    self.bolt_speed = 8
    self.bolt_acceleration = 2
end

function item:onHit(battler, score, bolts, close)
    battler:setAnimation("battle/attack")
    super.onHit(battler, score, bolts, close)
end

return item