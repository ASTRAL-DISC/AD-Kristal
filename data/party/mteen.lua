local character, super = Class(PartyMember, "mteen")

function character:init()
    super.init(self)

    self.name = "M.Teen"

    self:setActor("mteen")
    --self:setLightActor("mteen_lw")

    self.level = Game.chapter
    self.title = "Caretaker\nGuides the herd to\nrighteousness."

    self.soul_priority = 0
    self.soul_color = {1, 0, 0}

    self.has_act = false
    self.has_spells = true

    self.has_xact = true
    self.xact_name = "MT-Action"

    self:addSpell("heal_prayer")
    self:addSpell("sleep_mist")
    self:addSpell("ice_shock")

    self.health = 130

    self.stats = {
        health = 130,
        attack = 10,
        defense = 3,
        magic = 8
    }

    self.max_stats = {
        health = 188
    }

    self.weapon_icon = "ui/menu/equip/staff"

    self:setWeapon("shepcrook")
    self:setArmor(1, "goldrosary")
    self:setArmor(2, "mousetoken")

    self.lw_weapon_default = "light/bent_pencil"
    self.lw_armor_default = "light/cross_necklace"

    self.color = {0.9, 0.7, 1}
    self.dmg_color = {0.9, 0.7, 1}
    self.attack_bar_color = {0.9, 0.7, 1}
    self.attack_box_color = {0.9, 0.7, 1}
    self.xact_color = {0.9, 0.7, 1}

    self.menu_icon = "party/mteen/head"
    self.head_icons = "party/mteen/icon"
    self.name_sprite = "party/mteen/name"

    self.attack_sprite = "effects/attack/slap_n"
    self.attack_sound = "laz_c"
    self.attack_pitch = 1

    self.battle_offset = {0, 4}
    self.head_icon_offset = nil
    self.menu_icon_offset = nil

    self.gameover_message = {
        "Y-Yo...[wait:5]\nAre you okay?!",
        "Stay with\nme, [wait:5]here! [wait:5]Hey!"
    }
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