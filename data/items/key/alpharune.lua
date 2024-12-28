local item, super = Class(Item, "alpharune")

function item:init()
    super.init(self)
    
    self.name = "ALPHA RUNE"
    self.use_name = nil

    self.type = "key"
    self.icon = nil

    self.effect = ""
    self.shop = "Odd\nartifact"
    self.description = "An odd artifact containing ALPHA magic."

    self.price = 0
    self.can_sell = false

    self.target = "ally"
    self.usable_in = "world"
    self.result_item = nil
    self.instant = false

    self.bonuses = {}
    self.bonus_name = nil
    self.bonus_icon = nil

    self.can_equip = {}

    self.reactions = {}
end

function item:onWorldUse(target)
    if target.id ~= "ralsei" then
        Assets.playSound("ui_cant_select")
		return false
    elseif target.id == "ralsei" then
        local alpha_used = target:getFlag("alpha_used", 0)
        alpha_used = alpha_used + 1
        target:setFlag("alpha_used", alpha_used)
        Game.world:startCutscene(function(cutscene)
            if not Game:getFlag("ralsei_reaction") then
                Game:setFlag("ralsei_reaction", true)
                cutscene:setSpeaker("ralsei")
                cutscene:text("* Oh, [wait:5]Kris! [wait:5]\n* You found an [color:green]AlphaRune[color:reset]!", "shock")
                cutscene:text("* By finding these runes, [wait:5]we can improve our magic abilities...", "neutral")
                cutscene:text("* And grow stronger as a team!", "blush_smile")
                cutscene:text("* Of course, [wait:5]there are different runes for different magic types.", "small_smile")
                cutscene:text("* Each person resonates with the rune that contains their type.", "wink")
                cutscene:text("* I'm sure you'll find one that resonates with you, [wait:5]someday...", "blush_smile")
                cutscene:setSpeaker()
            end
            Assets.playSound("rune_break")
            Game.inventory:removeItem("alpharune")
            cutscene:text("* Ralsei broke the rune in half, [wait:5]releasing its ALPHA magic.")
            if alpha_used == 1 then
                cutscene:text("* Ralsei learned Lunar Wave.")
                --target:addSpell("lunar_wave")
            elseif alpha_used == 2 then
                cutscene:text("* Ralsei learned ???.") --WIP
            elseif alpha_used == 3 then
                cutscene:text("* Ralsei learned Oceanmare.") --WIP
            end
        end)
    end
    return false
end

return item