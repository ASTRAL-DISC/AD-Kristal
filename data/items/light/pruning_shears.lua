local item, super = Class(Item, "light/pruning_shears")

function item:init()
    super.init(self)
    
    self.name = "Pruning Shears"

    self.type = "item"
    self.light = true

    self.check = "A sturdy\ntool you got from your father's truck."

    self.usable_in = "all"
    self.result_item = nil
end

function item:onWorldUse()
    Game.world:showText("* You held out the pruning shears.[wait:5]\n* They look kind of rusty.")
    return false
end

return item