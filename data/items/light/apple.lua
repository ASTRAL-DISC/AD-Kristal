local item, super = Class(Item, "light/apple")

function item:init()
    super.init(self)

    self.name = "Apple"

    self.type = "item"
    self.light = true

    self.check = "Good ol' apple."

    self.usable_in = "all"
    
    self.result_item = nil

    self.flags = {
        ["bite_count"] = 0
    }

    self.buy_price = 5
    self.sell_price = 0
end

function item:onWorldUse()
    Game.world:startCutscene(function(cutscene)
        if self:getFlag("bite_count") == 0 then
            Assets.playSound("swallow")
            cutscene:text("* You bit the apple.")
            self:addFlag("bite_count")
            return false
        elseif self:getFlag("bite_count") == 1 then
            Assets.playSound("swallow")
            cutscene:text("* You bit the apple again.")
            self:addFlag("bite_count")
            return false
        elseif self:getFlag("bite_count") == 2 then
            Assets.playSound("swallow")
            cutscene:text("* You bit absent-mindedly until you got to the core.")
            if Game.world:getCharacter("susie") and #Game.party > 1 then
                cutscene:setSpeaker("susie")
                cutscene:text("* You, [wait:5]uh, [wait:5]gonna eat that?", "nervous")
                cutscene:text("* Cuz. [wait:5]Y'know, [wait:5]if you're just gonna trash it...", "nervous_side")
                cutscene:text("* Nice! [wait:5]Thanks!", "surprise_smile")
                cutscene:setSpeaker()
                cutscene:text("* You threw the apple at Susie.\n[wait:5]* She chomped down on it instantly.")
            else
                cutscene:text("* You tossed it.")
            end
            Game.inventory:removeItem(self)
            self:setFlag("bite_count", 0)
            return true
        end
    end)
end

return item