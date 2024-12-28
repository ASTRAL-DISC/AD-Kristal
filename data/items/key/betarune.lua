local item, super = Class(Item, "betarune")

function item:init()
    super.init(self)
    
    self.name = "BETA RUNE"
    self.use_name = nil

    self.type = "key"
    self.icon = nil

    self.effect = ""
    self.shop = "Odd\nartifact"
    self.description = "An odd artifact containing BETA magic."

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
    if target.id ~= "susie" then
        Assets.playSound("ui_cant_select")
		return false
    elseif target.id == "susie" then
        local beta_used = target:getFlag("beta_used", 0)
        beta_used = beta_used + 1
        target:setFlag("beta_used", beta_used)
        Game.world:startCutscene(function(cutscene)
            if not Game:getFlag("susie_reaction") then
                Game:setFlag("susie_reaction", true)
                cutscene:setSpeaker("susie")
                cutscene:text("* Huh? [wait:5]Why're you giving this to me?", "neutral")
                cutscene:text("* And I'm supposed to break it?\n[wait:5]* Uh, [wait:5]ok.", "surprise")
                cutscene:text("* Doesn't look like candy, [wait:5]but...", "nervous")
                cutscene:setSpeaker()
            end
            Assets.playSound("rune_break")
            Game.inventory:removeItem("betarune")
            cutscene:text("* Susie broke the rune in half, [wait:5]releasing the BETA magic inside.")
            if beta_used == 1 then
                cutscene:text("* Susie learned MaximumCure.")
                target:addSpell("maximum_cure")
            elseif beta_used == 2 then
                cutscene:text("* Susie learned Anti-Buster.") --WIP
            elseif beta_used == 3 then
                cutscene:text("* Susie learned ???.") --WIP
            end
        end)
    end
    return false
end

return item