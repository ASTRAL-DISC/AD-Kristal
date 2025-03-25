local character, super = Class(PartyMember, "angel")

function character:init()
    super.init(self)

    -- Display name
    self.name = "ANGEL"

    -- Actor (handles sprites)
    self:setActor("angel")

    -- Display level (saved to the save file)
    self.level = Game.chapter
    -- Default title / class (saved to the save file)
    self.title = "APPARITION\nBreathes life into\na tangible form."

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 1
    -- The color of this character's soul (optional, defaults to red)
    self.soul_color = {1, 0, 0}

    -- Whether the party member can act / use spells
    self.has_act = true
    self.has_spells = true

    -- Whether the party member can use their X-Action
    self.has_xact = false
    -- X-Action name (displayed in this character's spell menu)
    self.xact_name = nil

    -- Spells
    self:addSpell("heal_prayer")

    -- Current health (saved to the save file)
    self.health = 499

    -- Base stats (saved to the save file)
    self.stats = {
        health = 499,
        attack = 9,
        defense = 9,
        magic = 9
    }

    -- Max stats from level-ups
    self.max_stats = {
        health = 999
    }

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/lyre"

    -- Equipment (saved to the save file)
    self:setWeapon("dusklyre")
    self:setArmor(1, "dawncrown")

    -- Character color (for action box outline and hp bar)
    self.color = {1, 0, 0}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {1, 0, 0}
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = {1, 0, 0}
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = {1, 0, 0}
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {1, 0, 0}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/angel/head"
    -- Path to head icons used in battle
    self.head_icons = "party/angel/icon"
    -- Name sprite (optional)
    self.name_sprite = "party/angel/name"

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
    elseif index == 2 then
        local icon = Assets.getTexture("world/events/savepoint_1")
        Draw.draw(icon, x-26, y+6, 0, 1, 1)
        love.graphics.print("LIGHT:", x, y)
        love.graphics.print("999", x+130, y)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("POWER:", x, y)
        love.graphics.print("999", x+130, y)
        return true
    end
end

return character