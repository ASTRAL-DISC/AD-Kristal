local item, super = Class(Item, "vesper_ring")

function item:init()
    super.init(self)

    self.name = "VesperRing"

    self.type = "weapon"
    self.icon = "ui/menu/icon/ring"

    self.effect = ""
    self.shop = ""
    self.description = "A red metallic ring with sleigh bells on it.\nAwakens the wearer." -- WIP

    self.price = 2
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {
        attack = 16,
        magic = 14
    }
    self.bonus_name = "Wake" -- WIP
    self.bonus_icon = "ui/menu/icon/ring"

    self.can_equip = {
        noelle = true,
    }

    self.reactions = {
        susie = "Not jolly enough.",
        ralsei = "There's a strange aura...",
        noelle = "I... I feel a power surging...",
        berdly = "It's not even Christmas!",
        mteen = "Noelle's, right?",
        angel = "*jingle jingle* Ha!"
    }
end

return item