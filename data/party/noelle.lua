local character, super = Class(PartyMember, "noelle")

function character:init()
    super.init(self)

    self.name = "Noelle"

    self:setActor("noelle")
    self:setLightActor("noelle_lw")
    self:setDarkTransitionActor("noelle_dark_transition")
    self:setPastActor("noelle_past")
    self:setQuestActor("quest/noelle")
    self:setDepthsActor("noelle_depths")

    self.quest_sprite = "party/noelle/quest/walk/down_1"

    self.level = Game.chapter
    if Game.chapter >= 4 then
        self.title = "Snowcaster\nMight be able to\nuse cooler moves." --WIP
    else
        self.title = "Snowcaster\nMight be able to\nuse some cool moves."
    end

    self.soul_priority = 1
    self.soul_color = {1, 0, 0}

    self.has_act = false
    self.has_spells = true

    self.has_xact = true
    self.xact_name = "N-Action"

    self:addSpell("heal_prayer")
    self:addSpell("sleep_mist")
    self:addSpell("ice_shock")
    if Game.chapter >= 4 then
        self:addSpell("polar_revive")
        self:addSpell("haildome")
    end

    if Game.chapter == 1 or Game.chapter == 2 then
        self.health = 90
    elseif Game.chapter == 3 then
        self.health = 130
    elseif Game.chapter == 4 then
        self.health = 170
    elseif Game.chapter == 5 then
        self.health = 230
    elseif Game.chapter == 6 then
        self.health = 300
    elseif Game.chapter == 7 then
        self.health = 380
    end

    if Game.chapter == 1 or Game.chapter == 2 then
        self.stats = {
            health = 90,
            attack = 3,
            defense = 1,
            magic = 11
        }
    elseif Game.chapter == 3 then
        self.stats = {
            health = 130,
            attack = 3,
            defense = 1,
            magic = 11
        }
    elseif Game.chapter == 4 then
        self.stats = {
            health = 170,
            attack = 3,
            defense = 2,
            magic = 13
        }
    elseif Game.chapter == 5 then
        self.stats = {
            health = 230,
            attack = 4,
            defense = 4,
            magic = 15
        }
    elseif Game.chapter == 6 then
        self.stats = {
            health = 300,
            attack = 7,
            defense = 7,
            magic = 18
        }
    elseif Game.chapter == 7 then
        self.stats = {
            health = 380,
            attack = 9,
            defense = 9,
            magic = 19
        }
    end

    self.max_stats = {
        health = 999
    }

    self.stronger_absent = {}

    self.weapon_icon = "ui/menu/equip/ring"

    self:setWeapon("snowring")
    self:setArmor(1, "silver_watch")
    if Game.chapter >= 2 then
        self:setArmor(2, "royalpin")
    end

    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    self.color = {1, 1, 0}
    self.dmg_color = {1, 1, 0.3}
    self.attack_bar_color = {1, 1, 153/255}
    self.attack_box_color = {1, 1, 0}
    self.xact_color = {1, 1, 0.5}

    self.menu_icon = "party/noelle/head"
    self.head_icons = "party/noelle/icon"
    self.name_sprite = "party/noelle/name"

    self.attack_sprite = "effects/attack/slap_n"
    self.attack_sound = "laz_c"
    self.attack_pitch = 1.5

    self.battle_offset = {0, 0}
    self.head_icon_offset = nil
    self.menu_icon_offset = nil

    self.gameover_message = nil

    self.flags = {
        ["iceshocks_used"] = 0,
        ["boldness"] = -12,
        ["weird"] = false,
        ["switch"] = false
    }
end

function character:getTitle()
    local prefix = "LV"..self:getLevel().." "
    if self:checkWeapon("thornring") then
        return prefix.."Ice Trancer\nReceives pain to\nbecome stronger."
    elseif self:getFlag("iceshocks_used", 0) > 0 then
        return prefix.."Frostmancer\nFreezes the enemy."
    elseif Game:getFlag("moss_found#4") or Game:getFlag("moss_found#5") then
        return prefix.."Moss Friendly\nAdmires moss from afar."
    elseif DeltaruneSave.snowgrave or self:getFlag("weird") then
        return prefix.."Glacial Mage\nLooks for strength."
    else
        return super.getTitle(self)
    end
end

function character:onLevelUp(level)
    self:increaseStat("health", 4)
    if level % 4 == 0 then
        self:increaseStat("attack", 1)
        self:increaseStat("magic", 1)
    end
end

function character:getGameOverMessage(main)
    if main.id == "kris" then
        return {
            main:getName().."... [wait:5]c-can\nyou hear me?!",
            "Please... [wait:5]This\nisn't funny...!"
        }
    else
        return {
            "Are...[wait:5]\nare you okay?!",
            "Please...[wait:5]\nD-Don't leave me\nalone..."
        }
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        local icon = Assets.getTexture("ui/menu/icon/snow")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Coldness", x, y)
        local coldness = Utils.clamp(47 + (self:getFlag("iceshocks_used", 0) * 7), 47, 100)
        love.graphics.print(coldness, x+130, y)
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/exclamation")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Boldness", x, y, 0, 0.8, 1)
        love.graphics.print(self:getFlag("boldness", -12), x+130, y)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
		Draw.draw(icon, x-26, y+6, 0, 2, 2)
		love.graphics.print("Guts:", x, y)
		if Game.chapter >= 5 then
			Draw.draw(icon, x+90, y+6, 0, 2, 2)
		end
		return true
    end
end

function character:getQuestOffset()
    return -1, -3
end

return character