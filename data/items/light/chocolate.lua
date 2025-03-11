local item, super = Class(Item, "light/chocolate")

function item:init()
    super.init(self)

    self.name = "Chocolate"
    
    self.type = "item"

    self.icon = nil

    self.light = true

    self.check = "A chocolate bar bought from a local store.\n* It's cheap."
    self.shop = "Cheap,\nnostalgic\nchoco-bar."

    self.usable_in = "all"

    self.buy_price = 2
    self.sell_price = 0
end

function item:onWorldUse()
    Game.world:startCutscene(function(cutscene)
        cutscene:text("* You took the chocolate from \nyour pocket.")
        cutscene:text("* You remember it as one of those cheap chocolates with a soapy aftertaste.")
        cutscene:text("* ...[wait:5]\n* Your dad used to buy them frequently.")
        cutscene:text("* Eat it anyway?")

        local eat = cutscene:choicer({"Yes", "No"}) == 1

        if eat then
            Game.inventory:removeItem(self)
            Assets.playSound("swallow")
            cutscene:text("* You felt nostalgic and ate the entire bar in one go.")
        else
            cutscene:text("* You looked at the chocolate bar with disgust.")
        end
    end)
    return false
end

--[[function item:convertToDark(inventory)
    local chocolate = inventory:addItem("chocolate")
    chocolate.flags = self.flags
    return true
end]]

return item