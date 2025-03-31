local character, super = Class(PartyMember, "berdly")

function character:init()
    super.init(self)

    self.name = "Berdly"

    self:setActor("berdly")
    self:setLightActor("berdly_lw")
    self:setDarkTransitionActor("berdly_dark_transition")
    self:setQuestActor("quest/berdly")

    self.quest_sprite = "party/berdly/quest/walk/down_1"

    self.level = Game.chapter
    self.title = "Neon Soldier\nWill save you in\nthe nick of time!"

    self.soul_priority = 0
    self.soul_color = Utils.hexToRgb("#31b081")

    self.has_act = false
    self.has_spells = true

    self.has_xact = true
    self.xact_name = "B-Action"

    --self:addSpell("typhoon_dance")

    self.health = 320

    self.stats = {
        health = 320,
        attack = 5,
        defense = 2,
        magic = 9
    }

    self.max_stats = {
        health = 400
    }

    self.weapon_icon = "ui/menu/equip/halberd"

    self:setWeapon("neon_halberd")
    self:setArmor(1, "smartscouter")
    self:setArmor(2, "royalpin")

    self.lw_weapon_default = "light/pen"
    self.lw_armor_default = "light/glasses"

    self.color = Utils.hexToRgb("#31b081")
    self.dmg_color = Utils.hexToRgb("#31b081")
    self.attack_bar_color = Utils.hexToRgb("#31b081")
    self.attack_box_color = Utils.hexToRgb("#1d7957")
    self.xact_color = Utils.hexToRgb("#31b081")

    self.menu_icon = "party/berdly/head"
    self.head_icons = "party/berdly/icon"
    self.name_sprite = "party/berdly/name"

    self.attack_sprite = "effects/attack/slap_n"
    self.attack_sound = "laz_c"
    self.attack_pitch = 0.96

    self.battle_offset = {0, 0}
    self.head_icon_offset = nil
    self.menu_icon_offset = nil

    self.gameover_message = nil

    self.flags = {
        ["scar"] = false
    }
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

function character:getHeadIcons()
    if self:getFlag("scar") then
        return "party/berdly/icon_scar"
    else
        return "party/berdly/icon"
    end
end

function character:getMenuIcon()
    if self:getFlag("scar") then
        return "party/berdly/head_scar"
    else
        return "party/berdly/head"
    end
end

function character:getGameOverMessage(main)
    return {
        "It's too early\nto give in!",
        "Y-You can't\nlose now, [wait:5]" .. main.name"...!"
    }
end

function character:onLevelUp(level)
    self:increaseStat("health", 4)
    if level % 4 == 0 then
        self:increaseStat("attack", 2)
        self:increaseStat("magic", 2)
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        local icon = Assets.getTexture("ui/menu/icon/smile")
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
        if self:getFlag("scar") then
            love.graphics.print("Battle Scars", x, y, 0, 0.5, 1)
            love.graphics.print("1", x+130, y)
        else
            love.graphics.print("Annoying", x, y, 0, 0.8, 1)
            love.graphics.print("NO", x+130, y)
        end
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)

        Draw.draw(icon, x+90, y+6, 0, 2, 2)
        Draw.draw(icon, x+110, y+6, 0, 2, 2)
        if self:getFlag("scar") then
			Draw.draw(icon, x+130, y+6, 0, 2, 2)
		end
        return true
    end
end

function character:getQuestOffset()
    return 0, -2
end

return character