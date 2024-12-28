local item, super = Class(HealItem, "ghostfruit")

function item:init()
    super.init(self)

    self.name = "GhostFruit"
    self.use_name = "GHOSTFRUIT"

    self.type = "item"

    self.effect = "Heals\n64HP"
    self.shop = "Succulent\napparition\nHeals 64HP"
    self.description = "If eaten, it will never pass \nto the other side. +64HP"

    self.heal_amount = 64

    self.price = 13
    self.can_sell = true

    self.target = "ally"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.reactions = {
        susie = "The hell?",
        ralsei = "This is rather morbid...",
        noelle = "Feels like a good horror movie!",
        berdly = "The taste disappears too?!",
        mteen = "Catti would love this.",
    }
end

return item