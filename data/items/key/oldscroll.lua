local item, super = Class(Item, "oldscroll")

function item:init()
    super.init(self)

    self.name = "Old Scroll"
    self.use_name = nil

    self.type = "key"
    self.icon = nil

    self.effect = ""
    self.shop = ""
    self.description = "A scroll with a strange incantation written inside."

    self.price = 0
    self.can_sell = false

    self.target = "none"
    self.usable_in = "world"
    self.result_item = nil
    self.instant = false

    self.bonuses = {}
    self.bonus_name = nil
    self.bonus_icon = nil

    self.can_equip = {}
    
    self.reactions = {}
end

function item:onWorldUse()
    if Game:getFlag("incantation") and Game:hasPartyMember("noelle") then
        Game.world:showText("* You gave the Old Scroll to Noelle.")
        Game.world:startCutscene("ch4/beltrowel.incantation")
    elseif Game:hasPartyMember("noelle") then
        Game.world:showText("* You try to give the Old Scroll to Noelle.")
        Game.world:startCutscene("ch4/beltrowel.old_scroll")
    else
        Game.world:showText("* You need someone to sing it.")
    end
    return false
end

return item