local character, super = Class(PartyMember, "kris")

function character:init()
    super.init(self)

    -- Display name
    self.name = "Kris"

    -- Actor (handles overworld/battle sprites)
    self:setActor("kris")
    self:setLightActor("kris_lw")
    self:setDarkTransitionActor("kris_dark_transition")
    --self:setPastActor("kris_past")

    -- Display level (saved to the save file)
    self.level = Game.chapter
    -- Default title / class (saved to the save file)
    if Game.chapter == 1 then
        self.title = "Leader\nCommands the party\nwith various ACTs."
    elseif Game.chapter >= 2 then
        self.title = "Tactician\nCommands the party\nby ACTs. Sometimes."
    elseif Game.chapter >= 4 then
        self.title = "Strategist\nCommands the party\nin many ways."
    end

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 2
    -- The color of this character's soul (optional, defaults to red)
    self.soul_color = {1, 0, 0}

    -- Whether the party member can act / use spells
    self.has_act = true
    self.has_spells = false

    -- Whether the party member can use their X-Action
    self.has_xact = true
    -- X-Action name (displayed in this character's spell menu)
    self.xact_name = "K-Action"

    -- Current health (saved to the save file)
    if Game.chapter == 3 then
        self.health = 160
    elseif Game.chapter == 4 then
        self.health = 210
    elseif Game.chapter == 5 then
        self.health = 270
    elseif Game.chapter == 6 then
        self.health = 340
    elseif Game.chapter == 7 then
        self.health = 420
    end

    -- Base stats (saved to the save file)
    if Game.chapter == 3 then
        self.stats = {
            health = 160,
            attack = 14,
            defense = 2,
            magic = 0
        }
    elseif Game.chapter == 4 then
        self.stats = {
            health = 210,
            attack = 16,
            defense = 2,
            magic = 0
        }
    elseif Game.chapter == 5 then
        self.stats = {
            health = 270,
            attack = 18,
            defense = 2,
            magic = 0
        }
    elseif Game.chapter == 6 then
        self.stats = {
            health = 340,
            attack = 20,
            defense = 2,
            magic = 0
        }
    elseif Game.chapter == 7 then
        self.stats = {
            health = 420,
            attack = 22,
            defense = 2,
            magic = 0
        }
    end

    -- Max stats from level-ups
    if Game.chapter == 3 then
        self.max_stats = {
            health = 210,
            attack = 16,
        }
    elseif Game.chapter == 4 then
        self.max_stats = {
            health = 265,
            attack = 18,
        }
    elseif Game.chapter == 5 then
        self.max_stats = {
            health = 310,
            attack = 20,
        }
    elseif Game.chapter == 6 then
        self.max_stats = {
            health = 380,
			attack = 22,
        }
    elseif Game.chapter == 7 then
        self.max_stats = {
            health = 440,
			attack = 24,
        }
    end
    
    -- Party members which will also get stronger when this character gets stronger, even if they're not in the party
    self.stronger_absent = {"kris", "susie", "ralsei"}

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/sword"

    -- Equipment (saved to the save file)
    self:setWeapon("wood_blade")
    if Game.chapter >= 2 then
        self:setArmor(1, "amber_card")
        self:setArmor(2, "amber_card")
    end

    -- Default light world equipment item IDs (saves current equipment)
    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    -- Character color (for action box outline and hp bar)
    self.color = {0, 1, 1}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {0.5, 1, 1}
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = {0, 162/255, 232/255}
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = {0, 0, 1}
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {0.5, 1, 1}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/kris/head"
    -- Path to head icons used in battle
    self.head_icons = "party/kris/icon"
    -- Name sprite
    self.name_sprite = "party/kris/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/cut"
    -- Sound played when this character attacks
    self.attack_sound = "laz_c"
    -- Pitch of the attack sound
    self.attack_pitch = 1

    -- Battle position offset (optional)
    self.battle_offset = {2, 1}
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = nil

    -- Character flags (saved to the save file)
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

return character