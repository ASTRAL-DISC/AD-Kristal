local Cards, super = Class("light/cards", true)

function Cards:init(inventory)
    super.init(self)
end

function Cards:getName()
    if Utils.containsValue(self.cards, "lancer") and not Utils.containsValue(self.cards, "rouxls_kaard") then
        return "Jack of Spades"
    elseif not Utils.containsValue(self.cards, "lancer") and Utils.containsValue(self.cards, "rouxls_kaard") then
        return "Rules Card"
    else
        return super.getName(self)
    end
end

function Cards:getCheck()
    if Utils.containsValue(self.cards, "lancer") and not Utils.containsValue(self.cards, "rouxls_kaard") then
        return "The Jack of Spades from some forgotten card game."
    elseif not Utils.containsValue(self.cards, "lancer") and Utils.containsValue(self.cards, "rouxls_kaard") then
        return "The Rules Card from some forgotten card game."
    else
        return super.getCheck(self)
    end
end

function Cards:onWorldUse()
    if Utils.containsValue(self.cards, "lancer") and not Utils.containsValue(self.cards, "rouxls_kaard") then
        Game.world:showText("* You held the card.[wait:5]\n* It's slightly roughed up around the edges.")
    elseif not Utils.containsValue(self.cards, "lancer") and Utils.containsValue(self.cards, "rouxls_kaard") then
        Game.world:showText("* You held the card.[wait:5]\n* The text looks weird... [wait:5]or maybe it's just the font used.")
    else
        Game.world:showText("* You held the cards.[wait:5]\n* They felt flimsy between your\nfingers.")
    end
    return false
end

return Cards