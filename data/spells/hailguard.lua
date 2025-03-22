local spell, super = Class(Spell, "hailguard")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "HailGuard"
    -- Name displayed when cast (optional)
    self.cast_name = nil

    -- Battle description
    self.effect = "Shields\nAll"
    -- Menu description
    self.description = "Raises a temporary hail shield to all party members."

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
        battler:addShield(self.shield_amounts[battler.chara.id])

        Game.battle.timer:after(2/30, function()
            local x, y = user.width/2, user.height/2

            local bg = Sprite("effects/snowglobe/background", x, y)
            bg:setColor(0, 0.5, 1)
            bg.alpha = 0
            bg:setScale(1)
            bg:setOrigin(0.5, 0.5)
            bg:fadeTo(1, 1)
            bg.layer = battler.layer - 1
            battler.bg = bg
            battler:addChild(bg)

            local orb = Sprite("effects/snowglobe/gradient", x, y)
            orb:setColor(0, 0, 1)
            orb.alpha = 0
            orb:setScale(1)
            orb:setOrigin(0.5, 0.5)
            orb:fadeTo(0.5, 1)
            orb.layer = battler.layer + 100
            battler.orb = orb
            battler:addChild(orb)

            local mask = Sprite("effects/snowglobe/gradient", x, y)
            --mask:setColor(0.5, 0.5, 1)
            battler:addChild(mask)
            battler.mask = mask
            battler.mask.layer = orb.layer + 1
            mask.alpha = 0
            mask:fadeTo(1, 1)
            battler.mask.visible = false
            mask.origin_x = 0.5
            mask.origin_y = 0.5

            local snow = Sprite("world/events/darkfountain/bg", x, y)
            snow:setColor(0.5, 1, 1)
            battler:addChild(snow)
            snow.alpha = 0
            snow:fadeTo(1, 1)
            battler.snow = snow
            battler.snow.layer = orb.layer + 1
            snow:setWrap(true)
            snow.physics.speed_x = 1
            snow.physics.speed_y = 1
            snow.origin_x = 0.5
            snow.origin_y = 0.5
            battler.snow.mask_fx = snow:addFX(MaskFX(mask))

            local snow2 = Sprite("world/events/darkfountain/bg", x, y)
            snow2:setColor(0, 1, 1)
            battler:addChild(snow2)
            snow2.alpha = 0
            snow2:fadeTo(0.5, 1)
            battler.snow2 = snow2
            battler.snow2.layer = bg.layer + 1
            snow2:setWrap(true)
            snow2.physics.speed_x = -1
            snow2.physics.speed_y = -1
            snow2.origin_x = 0.5
            snow2.origin_y = 0.5
            battler.snow2.mask_fx = snow2:addFX(MaskFX(mask))

            Game.battle.timer:after(20/30, function()
                bg:fadeOutAndRemove(1)
                orb:fadeOutAndRemove(1)
                mask:fadeOutAndRemove(1)
                snow:fadeOutAndRemove(1)
                snow2:fadeOutAndRemove(1)
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