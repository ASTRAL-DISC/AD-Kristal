local character, super = Class(PartyMember, "berdly")

function character:init()
    super.init(self)

    -- Display name
    self.name = "Berdly"

    -- Actor (handles sprites)
    self:setActor("berdly")
    self:setLightActor("berdly_lw")
    self:setDarkTransitionActor("berdly_dark_transition")
    self:setQuestActor("quest/berdly")

    self.quest_sprite = "party/berdly/quest/walk/down_1"

    -- Display level (saved to the save file)
    self.level = Game.chapter
    -- Default title / class (saved to the save file)
    self.title = "Neon Soldier\nWill save you in\nthe nick of time!"

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 0
    -- The color of this character's soul (optional, defaults to red)
    self.soul_color = Utils.hexToRgb("#31b081")

    -- Whether the party member can act / use spells
    self.has_act = false
    self.has_spells = true

    -- Whether the party member can use their X-Action
    self.has_xact = true
    -- X-Action name (displayed in this character's spell menu)
    self.xact_name = "B-Action"

    -- Spells
    --self:addSpell("typhoon_dance")

    -- Current health (saved to the save file)
    self.health = 320

    -- Base stats (saved to the save file)
    self.stats = {
        health = 320,
        attack = 5,
        defense = 2,
        magic = 9
    }

    -- Max stats from level-ups
    self.max_stats = {
        health = 400
    }

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/halberd"

    -- Equipment (saved to the save file)
    self:setWeapon("neon_halberd")
    self:setArmor(1, "smartscouter")
    self:setArmor(2, "royalpin")

    -- Default light world equipment item IDs (saves current equipment)
    --self.lw_weapon_default = "light/pen"
    --self.lw_armor_default = "light/glasses"

    -- Character color (for action box outline and hp bar)
    self.color = Utils.hexToRgb("#31b081")
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = Utils.hexToRgb("#31b081")
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = Utils.hexToRgb("#31b081")
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = Utils.hexToRgb("#1d7957")
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = Utils.hexToRgb("#31b081")

    -- Head icon in the equip / power menu
    self.menu_icon = "party/berdly/head"
    -- Path to head icons used in battle
    self.head_icons = "party/berdly/icon"
    -- Name sprite (optional)
    self.name_sprite = "party/berdly/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/slap_n"
    -- Sound played when this character attacks
    self.attack_sound = "laz_c"
    -- Pitch of the attack sound
    self.attack_pitch = 1

    -- Battle position offset (optional)
    self.battle_offset = {0, 0}
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = {
        "And so the class No.3's knees touch the ground...",
        "This is no time to be losing, Kris!!",
    }

    -- Character flags (saved to the save file)
    self.flags = {}
end

--[[function character:getTitle()
    if self:checkWeapon("thornring") then
        return "LV"..self.level.." Ice Trancer\nReceives pain to\nbecome stronger."
    elseif self:getFlag("iceshocks_used", 0) > 0 then
        return "LV"..self.level.." Frostmancer\nFreezes the enemy."
    else
        return "LV1 "..self.title
    end
end]]

function character:onLevelUp(level)
    self:increaseStat("health", 4)
    if level % 4 == 0 then
        self:increaseStat("attack", 2)
        self:increaseStat("magic", 2)
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        local icon = Assets.getTexture("ui/menu/icon/magic")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Smarts", x, y)
        if self:checkWeapon("smart_scouter") then
            love.graphics.print("80", x+130, y)
        else
            love.graphics.print("40", x+130, y)
        end
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/exclamation")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Peskiness", x, y, 0, 0.8, 1)
        love.graphics.print("100", x+130, y)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)

        Draw.draw(icon, x+90, y+6, 0, 2, 2)
        Draw.draw(icon, x+110, y+6, 0, 2, 2)
        if Game.chapter >= 5 then -- if the chapter is >= 5, then...
			Draw.draw(icon, x+130, y+6, 0, 2, 2) -- draw the texture again, at a position past the first time you drew it
		end
        return true
    end
end

function character:getQuestOffset()
    return 0, -2
end

return character