local spell, super = Class(Spell, "polar_revive")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "PolarRevive"
    -- Name displayed when cast (optional)
    self.cast_name = "POLAR REVIVE"

    -- Battle description
    self.effect = "Revive\ndowned"
    -- Menu description
    self.description = "Revives one ally to full health."

    -- TP cost
    self.cost = 55

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"

    -- Tags that apply to this spell
    self.tags = {"heal", "ice"}
end

function spell:getCastMessage(user, target)
    if target.is_down == true then
        return "* "..user.chara:getName().." cast "..self:getCastName().."!"
    else
        return "* "..user.chara:getName().." cast "..self:getCastName().."![wait:5]\n* But it had no effect..."
    end
end

function spell:onCast(user, target)
    if target.is_down == true then
        target:heal(999)
    else
        ---no effect
    end
end

return spell