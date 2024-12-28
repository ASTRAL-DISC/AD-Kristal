local item, super = Class(Item, "hope_fragment")

function item:init()
    super.init(self)

    self.name = "HopeFragment"
    self.use_name = nil

    self.type = "key"

    self.icon = nil

    self.effect = ""
    self.shop = ""
    self.description = "A piece of HOPE that was left behind."

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

function item:getCollected()
    return Game:getFlag("hope_fragments", 0)
end

function item:getDescription()
    local desc = super.getDescription(self)
    if self:getCollected() > 0 then
        if self:getCollected() == 3 then
            if Game:getFlag("blitz_quest") then
                desc = "Pieces of HOPE that were left behind.\nYou found them all."
            else
                desc = "Pieces of HOPE that were left behind.\nNow where to use these?"
            end
        else
            desc = "Pieces of HOPE that were left behind.\nYou have found [" .. self:getCollected() .. "]."
        end
    end
    return desc
end

function item:getName()
    local name = super.getName(self)
    if self:getCollected() > 1 then
        name = "HopeFragments"
    end
    return name
end

return item