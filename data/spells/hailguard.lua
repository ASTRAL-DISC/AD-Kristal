local spell, super = Class(Spell, "hailguard")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "HailGuard"
    -- Name displayed when cast (optional)
    self.cast_name = "HAILGUARD"

    -- Battle description
    self.effect = "Shield\nAll Once"
    -- Menu description
    self.description = "Raises a hail shield to all allies.\nCan only be used once per battle."

    -- TP cost
    self.cost = 60

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "party"

    -- Tags that apply to this spell
    self.tags = {"shield", "ice"}

    self.shield_amounts = {
		kris = 50,
		noelle = 30,
		ralsei = 25,
		susie = 40,
		berdly = 55,
        mteen = 30
	}
end

function spell:onCast(user, target)
    for _,battler in ipairs(target) do
        battler:addShield(self.shield_amounts[battler.chara.id], "iceshield")

        Game.battle.timer:after(2/30, function()
            local x, y = battler:getRelativePos(battler.width/2, battler.height/2 - 25, Game.battle)
            local hail = HailStone(x, y, battler)

            Game.battle:addChild(hail)

            Game.battle.timer:after(8/30, function()
                hail:fadeOutAndRemove(1.5)
            end)
        end)
    end
	Game.battle.encounter.hail_used = true
end

function spell:getBattleDescription()
    local effect = super.getBattleDescription(self)
    if Game.battle.encounter.hail_used == true then
        effect = "Cooldown\nPer Battle"
    else
        effect = effect
    end
    return effect
end

function spell:isUsable(chara)
    if Game.battle.encounter.hail_used == true then
        return false
    else
        return true
    end
end

return spell