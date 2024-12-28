local spell, super = Class(Spell, "blade_reflection")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "BladeReflect."
    -- Name displayed when cast (optional)
    self.cast_name = "BLADE REFLECTION"

    -- Battle description
    self.effect = "Stun\nenemies"
    -- Menu description
    self.description = "The blade shines brightly, stunning all enemies temporarily."

    -- TP cost
    self.cost = 66

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "enemies"

    -- Tags that apply to this spell
    self.tags = {"stun", "damage"}
end

function spell:getTPCost(chara)
    local cost = super.getTPCost(self, chara)
    if chara and chara:getFlag("gamma_used", 4) then
        cost = Utils.round(cost / 2)
    end
    return cost
end

function spell:onCast(user, target)
    local damage = self:getDamage(user, target)
    target:hurt(damage, user)
end

function spell:getDamage(user, target)
    local damage = math.ceil((user.chara:getStat("magic") * 5) + (user.chara:getStat("attack") * 11) - (target.defense * 3))
    return damage
end

return spell