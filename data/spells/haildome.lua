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
        local x, y = user.width/2, user.height/2

        local bg = Sprite("effects/snowglobe/background", x, y)
        bg:setColor(0, 0.5, 1)
        bg.alpha = 0
        bg:setScale(1)
        bg:setOrigin(0.5, 0.5)
        bg:fadeTo(1, 1)
        bg.layer = target.layer - 1
        target.bg = bg
        target:addChild(bg)

        local orb = Sprite("effects/snowglobe/gradient", x, y)
        orb:setColor(0, 0, 1)
        orb.alpha = 0
        orb:setScale(1)
        orb:setOrigin(0.5, 0.5)
        orb:fadeTo(0.5, 1)
        orb.layer = target.layer + 100
        target.orb = orb
        target:addChild(orb)

        local mask = Sprite("effects/snowglobe/gradient", x, y)
        --mask:setColor(0.5, 0.5, 1)
        target:addChild(mask)
        target.mask = mask
        target.mask.layer = orb.layer + 1
        mask.alpha = 0
        mask:fadeTo(1, 1)
        target.mask.visible = false
        mask.origin_x = 0.5
        mask.origin_y = 0.5

        local snow = Sprite("world/events/darkfountain/bg", x, y)
        snow:setColor(0.5, 1, 1)
        target:addChild(snow)
        snow.alpha = 0
        snow:fadeTo(1, 1)
        target.snow = snow
        target.snow.layer = orb.layer + 1
        snow:setWrap(true)
        snow.physics.speed_x = 1
        snow.physics.speed_y = 1
        snow.origin_x = 0.5
        snow.origin_y = 0.5
        target.snow.mask_fx = snow:addFX(MaskFX(mask))

        local snow2 = Sprite("world/events/darkfountain/bg", x, y)
        snow2:setColor(0, 1, 1)
        target:addChild(snow2)
        snow2.alpha = 0
        snow2:fadeTo(0.5, 1)
        target.snow2 = snow2
        target.snow2.layer = bg.layer + 1
        snow2:setWrap(true)
        snow2.physics.speed_x = -1
        snow2.physics.speed_y = -1
        snow2.origin_x = 0.5
        snow2.origin_y = 0.5
        target.snow2.mask_fx = snow2:addFX(MaskFX(mask))

        Game.battle.timer:after(20/30, function()
            bg:fadeOutAndRemove(1)
            orb:fadeOutAndRemove(1)
            mask:fadeOutAndRemove(1)
            snow:fadeOutAndRemove(1)
            snow2:fadeOutAndRemove(1)
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