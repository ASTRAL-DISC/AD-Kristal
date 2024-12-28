local item, super = Class(Item, "gammarune")

function item:init()
    super.init(self)

    self.name = "GAMMA RUNE"
    self.use_name = nil

    self.type = "key"
    self.icon = nil

    self.effect = ""
    self.shop = "Odd\nartifact"
    self.description = "An odd artifact containing GAMMA magic."

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
    if target.id ~= "kris" then
        Assets.playSound("ui_cant_select")
		return false
    elseif target.id == "kris" then
        local gamma_used = target:getFlag("gamma_used", 0)
        gamma_used = gamma_used + 1
        target:setFlag("gamma_used", gamma_used)
        Game.world:startCutscene(function(cutscene)
            Assets.playSound("rune_break")
            Game.inventory:removeItem("gammarune")
            target:increaseStat("magic", 3)
            cutscene:text("* You broke the rune in half, [wait:5]releasing the GAMMA magic inside.")
            if not Game:getFlag("gamma_awaken") then
                Game:setFlag("gamma_awaken", true)
                cutscene:text("* You can now use SPELLS.")
                target.has_spells = true
            end
            if gamma_used == 1 then
                cutscene:text("* You learned PierceHymn.")
                --target:addSpell("piercehymn")
            elseif gamma_used == 2 then
                cutscene:text("* You learned Coldshine.") -- WIP
                --target:addSpell("coldshine")
            elseif gamma_used == 3 then
                cutscene:text("* You learned Blade Reflection.")
                target:addSpell("blade_reflection")
            end
        end)
    end
    return false
end

return item