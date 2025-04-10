local character, super = Class(PartyMember, "kris")

function character:init()
    super.init(self)

    self.name = "Kris"

    self:setActor("kris")
    self:setLightActor("kris_lw")
    self:setDarkTransitionActor("kris_dark_transition")
    self:setPastActor("kris_past")
    self:setDepthsActor("kris_depths")
    self:setQuestActor("quest/kris")

    self.quest_sprite = "party/kris/quest/walk/down_1"

    self.level = Game.chapter
    if Game.chapter == 1 then
        self.title = "Leader\nCommands the party\nwith various ACTs."
    elseif Game.chapter >= 2 then
        self.title = "Tactician\nCommands the party\nby ACTs. Sometimes."
    elseif Game.chapter >= 4 then
        self.title = "Strategist\nCommands the party\nin many ways."
    end

    self.soul_priority = 2
    self.soul_color = {1, 0, 0}

    self.has_act = true
    self.has_spells = false

    self.has_xact = true
    self.xact_name = "K-Action"

    if Game.chapter == 3 then
        self.health = 160
    elseif Game.chapter == 4 then
        self.health = 200
    elseif Game.chapter == 5 then
        self.health = 260
    elseif Game.chapter == 6 then
        self.health = 330
    elseif Game.chapter == 7 then
        self.health = 410
    end

    if Game.chapter == 3 then
        self.stats = {
            health = 160,
            attack = 14,
            defense = 2,
            magic = 0
        }
    elseif Game.chapter == 4 then
        self.stats = {
            health = 200,
            attack = 16,
            defense = 2,
            magic = 0
        }
    elseif Game.chapter == 5 then
        self.stats = {
            health = 260,
            attack = 18,
            defense = 2,
            magic = 0
        }
    elseif Game.chapter == 6 then
        self.stats = {
            health = 330,
            attack = 20,
            defense = 2,
            magic = 0
        }
    elseif Game.chapter == 7 then
        self.stats = {
            health = 410,
            attack = 22,
            defense = 2,
            magic = 0
        }
    end

    if Game.chapter == 3 then
        self.max_stats = {
            health = 200,
            attack = 16,
        }
    elseif Game.chapter == 4 then
        self.max_stats = {
            health = 260,
            attack = 18,
        }
    elseif Game.chapter == 5 then
        self.max_stats = {
            health = 330,
            attack = 20,
        }
    elseif Game.chapter == 6 then
        self.max_stats = {
            health = 410,
			attack = 22,
        }
    elseif Game.chapter == 7 then
        self.max_stats = {
            health = 490,
			attack = 24,
        }
    end

    self.stronger_absent = {"kris", "susie", "ralsei"}

    self.weapon_icon = "ui/menu/equip/sword"

    self:setWeapon("wood_blade")
    if Game.chapter >= 2 then
        self:setArmor(1, "amber_card")
        self:setArmor(2, "amber_card")
    end

    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    self.color = {0, 1, 1}
    self.dmg_color = {0.5, 1, 1}
    self.attack_bar_color = {0, 162/255, 232/255}
    self.attack_box_color = {0, 0, 1}
    self.xact_color = {0.5, 1, 1}

    self.menu_icon = "party/kris/head"
    self.head_icons = "party/kris/icon"
    self.name_sprite = "party/kris/name"

    self.attack_sprite = "effects/attack/cut"
    self.attack_sound = "laz_c"
    self.attack_pitch = 1

    self.battle_offset = {2, 1}
    self.head_icon_offset = nil
    self.menu_icon_offset = nil

    self.gameover_message = nil
    
    self.flags = {
        ["gamma_used"] = 0
    }
end

function character:onLevelUp(level)
    self:increaseStat("health", 2)
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
    end
end

function character:getGameOverMessage(main)
    if main.id == "angel" then
        return {
            "Your time here\nis running out.",
            "... [wait:5]So is mine.",
            "Even if you\ncome back...",
            "I'll take my\nchances.",
        }
    else
        return nil
    end
end

function character:getTitle()
    if Game:getFlag("moss_found#3") then
        return "LV"..self.level.." Moss Engager\nPartakes in the\nessentials of moss."
    elseif Game:getFlag("moss_found#4") then
        return "LV"..self.level.." Moss Expert\nHas extensive knowledge\non moss."
    else
        return "LV"..self.level.." "..self.title
    end
end

function character:onPowerSelect(menu)
    if Utils.random() < ((Game.chapter == 1) and 0.02 or 0.04) then
        menu.kris_dog = true
    else
        menu.kris_dog = false
    end

    if not menu.kris_dog and Utils.random() < 0.08 then
        menu.kris_cat = true
    else
        menu.kris_cat = false
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 and menu.kris_dog then
        local frames = Assets.getFrames("misc/dog_sleep")
        local frame = math.floor(Kristal.getTime()) % #frames + 1
        love.graphics.print("Dog:", x, y)
        Draw.draw(frames[frame], x+120, y+5, 0, 2, 2)
        return true
    elseif index == 1 and menu.kris_cat then
        local frames = Assets.getFrames("misc/cat_sleep")
        local frame = math.floor(Kristal.getTime()) % #frames + 1
        love.graphics.print("Cat:", x, y)
        Draw.draw(frames[frame], x+120, y+5, 0, 2, 2)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
		Draw.draw(icon, x-26, y+6, 0, 2, 2)
		love.graphics.print("Guts:", x, y)

		Draw.draw(icon, x+90, y+6, 0, 2, 2)
        if Game.chapter >= 2 then
            Draw.draw(icon, x+110, y+6, 0, 2, 2)
        end
		if Game.chapter >= 3 then
			Draw.draw(icon, x+130, y+6, 0, 2, 2)
		end
        if Game.chapter >= 4 then
			Draw.draw(icon, x+150, y+6, 0, 2, 2)
		end
        if Game.chapter >= 5 then
			Draw.draw(icon, x+170, y+6, 0, 2, 2)
		end
        if Game.chapter >= 6 then
			Draw.draw(icon, x+90, y+30, 0, 2, 2)
		end
        if Game.chapter >= 7 then
			Draw.draw(icon, x+110, y+30, 0, 2, 2)
		end
		return true
    end
end

function character:getQuestOffset()
    return -1, 0
end

return character