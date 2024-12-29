local character, super = Class(PartyMember, "mteen")

function character:init()
    super.init(self)

    -- Display name
    self.name = "M.Teen"

    -- Actor (handles sprites)
    self:setActor("mteen")
    --self:setLightActor("noelle_lw")

    -- Display level (saved to the save file)
    self.level = Game.chapter
    -- Default title / class (saved to the save file)
    self.title = "Caretaker\nGuides the herd to\nrighteousness."

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 0
    -- The color of this character's soul (optional, defaults to red)
    self.soul_color = {1, 0, 0}

    -- Whether the party member can act / use spells
    self.has_act = false
    self.has_spells = true

    -- Whether the party member can use their X-Action
    self.has_xact = true
    -- X-Action name (displayed in this character's spell menu)
    self.xact_name = "MT-Action"

    -- Spells
    self:addSpell("heal_prayer")
    self:addSpell("sleep_mist")
    self:addSpell("ice_shock")

    -- Current health (saved to the save file)
    self.health = 130

    -- Base stats (saved to the save file)
    self.stats = {
        health = 130,
        attack = 10,
        defense = 3,
        magic = 8
    }

    -- Max stats from level-ups
    self.max_stats = {
        health = 188
    }

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/staff"

    -- Equipment (saved to the save file)
    self:setWeapon("shepcrook")
    self:setArmor(1, "goldrosary")
    self:setArmor(2, "mousetoken")

    -- Default light world equipment item IDs (saves current equipment)
    self.lw_weapon_default = "light/bent_pencil"
    self.lw_armor_default = "light/cross_necklace"

    -- Character color (for action box outline and hp bar)
    self.color = {0.9, 0.7, 1}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {0.9, 0.7, 1}
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = {0.9, 0.7, 1}
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = {0.9, 0.7, 1}
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {0.9, 0.7, 1}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/mteen/head"
    -- Path to head icons used in battle
    self.head_icons = "party/mteen/icon"
    -- Name sprite (optional)
    self.name_sprite = "party/mteen/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/slap_n"
    -- Sound played when this character attacks
    self.attack_sound = "laz_c"
    -- Pitch of the attack sound
    self.attack_pitch = 1

    -- Battle position offset (optional)
    self.battle_offset = {0, 4}
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = nil

    -- Character flags (saved to the save file)
end

function character:onLevelUp(level)
    self:increaseStat("health", 4)
    if level % 4 == 0 then
        self:increaseStat("attack", 1)
        self:increaseStat("magic", 1)
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        local icon = Assets.getTexture("ui/menu/icon/smile")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Friendliness", x, y)
        love.graphics.print("60", x+130, y)
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/exclamation")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Fearfulness", x, y, 0, 0.8, 1)
        love.graphics.print("24", x+130, y)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)
        Draw.draw(icon, x+90, y+6, 0, 2, 2)
        return true
    end
end

return character