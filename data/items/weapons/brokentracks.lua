local item, super = Class(Item, "brokentracks")

function item:init()
    super.init(self)

    self.name = "BrokenTracks"

    self.type = "weapon"
    self.icon = "ui/menu/icon/sword"

    self.effect = ""
    self.shop = ""
    self.description = "Coaster tracks crafted into a sword.\nWielder has multiple chances to attack."

    self.price = 0
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {
        attack = 8
    }
    self.bonus_name = nil
    self.bonus_icon = nil

    self.can_equip = {
        kris = true,
    }

    self.reactions = {
        susie = "Looks like junk, sorry.",
        ralsei = "It compliments your palette, Kris!",
        noelle = "D-Don't swing that around!",
        berdly = "ME?! Jealous?! ...",
    }

    self.bolt_count = 3
    self.bolt_speed = 6
    self.critical_bonus = 5
end

return item