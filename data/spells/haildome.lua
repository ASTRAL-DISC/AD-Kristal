local spell, super = Class(Spell, "haildome")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "HailDome"
    -- Name displayed when cast (optional)
    self.cast_name = "HAIL DOME"

    -- Battle description
    self.effect = "Raise\nShield"
    -- Menu description
    self.description = "Raises a hail shield to one ally."

    -- TP cost
    self.cost = 40

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"

    -- Tags that apply to this spell
    self.tags = {"shield", "ice"}

    self.shield_amounts = {
		kris = 30,
		noelle = 20,
		ralsei = 15,
		susie = 35,
		berdly = 45,
        mteen = 20
	}
end

function spell:onCast(user, target)
    target:addShield(self.shield_amounts[target.chara.id], "iceshield")
    Game.battle.timer:after(2/30, function()
        local x, y = user.width/2, user.height/2 - 25
        local hail = HailStone(x, y, target)

        target:addChild(hail)

        Game.battle.timer:after(8/30, function()
            hail:fadeOutAndRemove(1.5)
        end)
    end)
end

function spell:getBattleDescription()
    local effect = super.getBattleDescription(self)
    for _,battler in ipairs(Game.battle.party) do
        if battler.shield > 0 then
            effect = "Cooldown"
        else
            effect = effect
        end
    end
    return effect
end

function spell:isUsable(chara)
    if self:getBattleDescription() == "Cooldown" then
        return false
    else
        return true
    end
end

return spell