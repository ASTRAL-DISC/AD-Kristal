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
    Game.world:startCutscene(function(cutscene)
        if self:getFlag("interact_count") == 0 then
            Assets.playSound("swallow")
            cutscene:text("* You nibbled the apple.")
            self:addFlag("interact_count")
            return false
        elseif self:getFlag("interact_count") == 1 then
            Assets.playSound("swallow")
            cutscene:text("* You nibbled the apple again.")
            self:addFlag("interact_count")
            return false
        elseif self:getFlag("interact_count") == 2 then
            Assets.playSound("swallow")
            cutscene:text("* You nibbled absent-mindedly until you got to the core.")
            if Game.world:getCharacter("susie") and #Game.party > 1 then
                cutscene:setSpeaker("susie")
                cutscene:text("* You, [wait:5]uh, [wait:5]gonna eat that?", "nervous")
                cutscene:text("* Cuz. [wait:5]Y'know, [wait:5]if you're just gonna trash it...", "nervous_side")
                cutscene:text("* Nice! [wait:5]Thanks!", "surprise_smile")
                cutscene:setSpeaker()
                cutscene:text("* You threw the apple at Susie. [wait:5]She chomped down on it instantly.")
            else
                cutscene:text("* You tossed it.")
            end
            Game.inventory:removeItem(self)
            self:setFlag("interact_count", 0)
            return true
        end
    end)
end

return item