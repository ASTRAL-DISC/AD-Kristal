local character, super = Class(PartyMember, "angel")

function character:init()
    super.init(self)
    
    self.name = "ANGEL"

    self:setActor("angel")

    self.level = Game.chapter
    self.title = "APPARITION\nBreathes life into\na tangible form."

    self.soul_priority = 1
    self.soul_color = {1, 0, 0}

    self.has_act = true
    self.has_spells = true

    self.has_xact = false
    self.xact_name = nil

    -- Spells
    self:addSpell("heal_prayer")

    self.health = 499

    self.stats = {
        health = 499,
        attack = 9,
        defense = 9,
        magic = 9
    }

    self.max_stats = {
        health = 999
    }

    self.weapon_icon = "ui/menu/equip/lyre"

    self:setWeapon("dusklyre")
    self:setArmor(1, "dawncrown")

    self.color = {1, 0, 0}
    self.dmg_color = {1, 0, 0}
    self.attack_bar_color = {1, 0, 0}
    self.attack_box_color = {1, 0, 0}
    self.xact_color = {1, 0, 0}

    self.menu_icon = "party/angel/head"
    self.head_icons = "party/angel/icon"
    self.name_sprite = "party/angel/name"

    self.attack_sprite = "effects/attack/slap_n"
    self.attack_sound = "laz_c"
    self.attack_pitch = 1

    self.battle_offset = {0, 4}
    self.head_icon_offset = nil
    self.menu_icon_offset = nil

    self.gameover_message = nil
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