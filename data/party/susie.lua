local character, super = Class(PartyMember, "susie")

function character:init()
    super.init(self)

    self.name = "Susie"

    self:setActor("susie")
    self:setLightActor("susie_lw")
    self:setDarkTransitionActor("susie_dark_transition")
    self:setQuestActor("quest/susie")

    self.quest_sprite = "party/susie/quest/walk/down_1"

    self.level = Game.chapter
    self.title = "Dark Knight\nDoes damage using\ndark energy."

    self.soul_priority = 1
    self.soul_color = {1, 0, 0}

    self.has_act = false
    self.has_spells = true

    self.has_xact = true
    self.xact_name = "S-Action"

    self:addSpell("rude_buster")
    if Game.chapter >= 2 then
        self:addSpell("ultimate_heal")
    end

    if Game.chapter == 3 then
        self.health = 190
    elseif Game.chapter == 4 then
        self.health = 230
    elseif Game.chapter == 5 then
        self.health = 290
    elseif Game.chapter == 6 then
        self.health = 360
    elseif Game.chapter == 7 then
        self.health = 440
    elseif Game:getFlag("epilogue") then
        self.health = 530
    end

    if Game.chapter == 3 then
        self.stats = {
            health = 190,
            attack = 18,
            defense = 2,
            magic = 3
        }
    elseif Game.chapter == 4 then
        self.stats = {
            health = 230,
            attack = 20,
            defense = 2,
            magic = 5
        }
    elseif Game.chapter == 5 then
        self.stats = {
            health = 290,
            attack = 22,
            defense = 2,
            magic = 7
        }
    elseif Game.chapter == 6 then
        self.stats = {
            health = 360,
            attack = 24,
            defense = 4,
            magic = 9
        }
    elseif Game.chapter == 7 then
        self.stats = {
            health = 440,
            attack = 27,
            defense = 5,
            magic = 12
        }
    elseif Game:getFlag("epilogue") then
        self.stats = {
            health = 530,
            attack = 30,
            defense = 6,
            magic = 14
        }
    end

    -- Max stats from level-ups
    if Game.chapter == 3 then
        self.max_stats = {
            health = 230,
        }
    elseif Game.chapter == 4 then
        self.max_stats = {
            health = 290,
        }
    elseif Game.chapter == 5 then
        self.max_stats = {
            health = 360,
        }
    elseif Game.chapter == 6 then
        self.max_stats = {
            health = 440,
        }
    elseif Game.chapter == 7 then
        self.max_stats = {
            health = 530,
        }
    end

    self.stronger_absent = {"kris", "susie", "ralsei"}

    self.weapon_icon = "ui/menu/equip/axe"

    self:setWeapon("mane_ax")
    if Game.chapter >= 2 then
        self:setArmor(1, "amber_card")
        self:setArmor(2, "amber_card")
    end

    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    self.color = {1, 0, 1}
    self.dmg_color = {0.8, 0.6, 0.8}
    self.attack_bar_color = {234/255, 121/255, 200/255}
    self.attack_box_color = {0.5, 0, 0.5}
    self.xact_color = {1, 0.5, 1}

    self.menu_icon = "party/susie/head"
    self.head_icons = "party/susie/icon"
    self.name_sprite = "party/susie/name"

    self.attack_sprite = "effects/attack/mash"
    self.attack_sound = "laz_c"
    self.attack_pitch = 0.9

    self.battle_offset = {3, 1}
    self.head_icon_offset = nil
    self.menu_icon_offset = nil

    self.gameover_message = nil
    
    self.flags = {
        ["auto_attack"] = false,
        ["eyes"] = false,
        ["beta_used"] = 0,
    }
end

function character:getTitle()
    if self:hasSpell("maximum_cure") then
        return "LV"..self:getLevel().." Healing Booster\nMaximizes healing.\nCool, huh?"
    elseif Game:getFlag("moss_found#3") then
        return "LV"..self:getLevel().." Moss Enthusiast\nInterested in the big\npicture of moss."
    else
        return "LV"..self:getLevel().." "..self.title
    end
end

function character:getMenuIcon()
    if self:getFlag("eyes") then
        return "party/susie/head_eyes"
    else
        return "party/susie/head"
    end
end

function character:onTurnStart(battler)
    if self:getFlag("auto_attack", false) then
        Game.battle:pushForcedAction(battler, "AUTOATTACK", Game.battle:getActiveEnemies()[1], nil, {points = 150})
    end
end

function character:onAttackHit(enemy, damage)
    if damage > 0 then
        Assets.playSound("impact", 0.8)
        Game.battle:shakeCamera(4)
    end
end

function character:onLevelUp(level)
    self:increaseStat("health", 2)
    if level % 2 == 0 then
        self:increaseStat("health", 1)
    end
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
        self:increaseStat("magic", 1)
    end
end

function character:getGameOverMessage(main)
    return {
        "Come on,[wait:5]\nthat all you got!?",
        main.name..",[wait:5]\nget up...!"
    }
end

function character:canEquip(item, slot_type, slot_index)
    if item then
        return super.canEquip(self, item, slot_type, slot_index)
    else
        local item
        if slot_type == "weapon" then
            item = self:getWeapon()
        elseif slot_type == "armor" then
            item = self:getArmor(slot_index)
        else
            return true
        end
        return false
    end
end

function character:getReaction(item, user)
    if item or user.id ~= self.id then
        return super.getReaction(self, item, user)
    else
        return "Hey, hands off!"
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        local icon = Assets.getTexture("ui/menu/icon/demon")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Rudeness", x, y)
        if Game.chapter == 1 then
            love.graphics.print("99", x+130, y)
        else
            love.graphics.print("89", x+130, y)
        end
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/demon")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        if Game.chapter == 1 then
            love.graphics.print("Crudeness", x, y, 0, 0.8, 1)
            love.graphics.print("100", x+130, y)
        else
            love.graphics.print("Purple", x, y, 0, 0.8, 1)
            love.graphics.print("Yes", x+130, y)
        end
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)

        Draw.draw(icon, x+90, y+6, 0, 2, 2)
        Draw.draw(icon, x+110, y+6, 0, 2, 2)
        return true
    end
end

function character:getQuestOffset()
    return 0, -2
end

return character