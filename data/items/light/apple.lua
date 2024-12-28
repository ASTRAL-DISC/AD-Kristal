local item, super = Class(Item, "light/apple")

function item:init()
    super.init(self)

    self.name = "Apple"

    self.type = "item"
    self.light = true

    self.check = "Just a good ol' apple."

    self.usable_in = "all"
    
    self.result_item = nil

    self.flags = {
        ["interact_count"] = 0
    }
end

function item:onWorldUse()
    if self:getFlag("interact_count") == 0 then
        Assets.playSound("item")
        Game.world:showText("* You nibbled the apple.")
        self:addFlag("interact_count")
        return false
    elseif self:getFlag("interact_count") == 1 then
        Assets.playSound("item")
        Game.world:showText("* You nibbled the apple.")
        self:addFlag("interact_count")
        return false
    elseif self:getFlag("interact_count") == 2 then
        Assets.playSound("item")
        Game.world:showText("* Congratulations! You ate the entire apple.")
        self:setFlag("interact_count", 0)
        return true
    end
end

return item