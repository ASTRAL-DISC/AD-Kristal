local item, super = Class(Item, "light/chocolate")

function item:init()
    super:init(self)

    self.name = "Chocolate"
    
    self.type = "item"

    self.icon = nil

    self.light = true

    self.check = "A chocolate bar bought from a local store.\n* It's cheap."

    self.usable_in = "all"

    self.buy_price = 0
    self.sell_price = 0
end

function item:onWorldUse()
    Game.world:startCutscene(function(cutscene)
        cutscene:text("* You took the chocolate from \nyour pocket.[wait:5]")
        cutscene:text("* You remember these as one of those cheap chocolates with a soapy aftertaste.")
        cutscene:text("* ...[wait:10]\n* Your dad used to buy them frequently.")
        cutscene:text("* Eat it anyway?")

        local dropped
        dropped = cutscene:choicer({"Yes", "No"}) == 1 --setting as "2" inverts "Yes" and "No" like it is in Chapter 1.

        if dropped then
            Game.inventory:removeItem(self)
            Assets.playSound("item")
            cutscene:text("* You felt nostalgic and ate the entire bar in one go.")

        else
            cutscene:text("* You looked at the chocolate bar with disgust.")
        end
    end)
    return false
end

function item:convertToDark(inventory)
    local chocolate = inventory:addItem("chocolate")
    chocolate.flags = self.flags
    return true
end

return item