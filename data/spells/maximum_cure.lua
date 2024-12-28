local spell, super = Class(Spell, "maximum_cure")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "MaximumCure"
    -- Name displayed when cast (optional)
    self.cast_name = "MAXIMUM CURE"

    -- Battle description
    self.effect = "Heal\nAllies"
    -- Menu description
    self.description = "Heals comrades to the absolute\nbest of Susie's ability."

    -- TP cost
    self.cost = 100

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "party"

    -- Tags that apply to this spell
    self.tags = {"heal"}
end

function spell:onCast(user, target)
    for _,battler in ipairs(Game.battle.party) do
        if battler.chara.id == "noelle" then
            battler:heal(user.chara:getStat("magic") * 2)
        end
        if battler.chara.id == "kris" then
            battler:heal(user.chara:getStat("magic") * 2)
        end
        if battler.chara.id == "ralsei" then
            battler:heal(user.chara:getStat("magic") * 2)
        end
    end
end

return spell