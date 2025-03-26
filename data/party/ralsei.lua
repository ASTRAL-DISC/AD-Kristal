local character, super = Class(PartyMember, "ralsei")

function character:init()
    super.init(self)

    local ralsei_style = Game:getConfig("ralseiStyle")

    self.name = "Ralsei"

    self:setActor("ralsei")
    self:setQuestActor("quest/ralsei")

    self.quest_sprite = "party/ralsei/quest/walk/down_1"

    self.level = Game.chapter
    if Game.chapter == 1 then
        self.title = "Lonely Prince\nDark-World being.\nHas no subjects."
    elseif Game.chapter == 2 then
        self.title = "Dark Prince\nDark-World being.\nHas friends now."
    elseif Game.chapter >= 3 then
        self.title = "Scout Prince\nHas friends and\nsubjects."
    end

    self.soul_priority = -1
    self.soul_color = {1, 0, 0}

    self.has_act = false
    self.has_spells = true

    self.has_xact = true
    self.xact_name = "R-Action"

    self:addSpell("pacify")
    self:addSpell("heal_prayer")

    if Game.chapter == 3 then
        self.health = 140
    elseif Game.chapter == 4 then
        self.health = 190
    elseif Game.chapter == 5 then
        self.health = 250
    elseif Game.chapter == 6 then
        self.health = 320
    elseif Game.chapter == 7 then
        self.health = 400
    end

    if Game.chapter == 3 then
        self.stats = {
            health = 140,
            attack = 12,
            defense = 2,
            magic = 11
        }
    elseif Game.chapter == 4 then
        self.stats = {
            health = 190,
            attack = 16,
            defense = 2,
            magic = 15
        }
    elseif Game.chapter == 5 then
        self.stats = {
            health = 250,
            attack = 18,
            defense = 2,
            magic = 17
        }
    elseif Game.chapter == 6 then
        self.stats = {
            health = 320,
            attack = 20,
            defense = 2,
            magic = 19
        }
    elseif Game.chapter == 7 then
        self.stats = {
            health = 400,
            attack = 22,
            defense = 2,
            magic = 21
        }
    end

    if Game.chapter == 3 then
        self.max_stats = {
            health = 216,
        }
    elseif Game.chapter == 4 then
        self.max_stats = {
            health = 266,
        }
    elseif Game.chapter == 5 then
        self.max_stats = {
            health = 326,
        }
    elseif Game.chapter == 6 then
        self.max_stats = {
            health = 396,
        }
    elseif Game.chapter == 7 then
        self.max_stats = {
            health = 476,
        }
    end

    self.stronger_absent = {"kris", "susie", "ralsei"}

    self.weapon_icon = "ui/menu/equip/scarf"

    self:setWeapon("red_scarf")
    if Game.chapter >= 2 then
        self:setArmor(1, "amber_card")
        self:setArmor(2, "white_ribbon")
    end

    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    self.color = {0, 1, 0}
    self.dmg_color = {0.5, 1, 0.5}
    self.attack_bar_color = {181/255, 230/255, 29/255}
    self.attack_box_color = {0, 0.5, 0}
    self.xact_color = {0.5, 1, 0.5}

    if ralsei_style == 1 then
        self.menu_icon = "party/ralsei/head_ch1"
    else
        self.menu_icon = "party/ralsei/head"
    end
    self.head_icons = "party/ralsei/icon_nohat"
    self.name_sprite = "party/ralsei/name"

    self.attack_sprite = "effects/attack/slap_r"
    self.attack_sound = "laz_c"
    self.attack_pitch = 1.15

    self.battle_offset = {2, 6}
    self.head_icon_offset = {-4, 0}
    self.menu_icon_offset = nil

    self.gameover_message = {
        "This is not\nyour fate...!",
        "Please,[wait:5]\ndon't give up!"
    }

    self.flags = {
        ["alpha_used"] = 0
    }
end

function character:getTitle()
    if Game.chapter == 1 then
        if self:checkWeapon("ragger") then
            return "LV"..self.level.." Prickly Prince\nDeals damage with\nhis rugged scarf."
        elseif self:checkWeapon("daintyscarf") then
            return "LV"..self.level.." Fluffy Prince\nWeak, but has nice\nhealing powers."
        end
    end
    return super.getTitle(self)
end

function character:onLevelUp(level)
    self:increaseStat("health", 2)
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
        self:increaseStat("magic", 1)
    end
end

function character:onPowerSelect(menu)
    if Utils.random() <= 0.03 then
        menu.ralsei_dog = true
    else
        menu.ralsei_dog = false
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        if Game.chapter == 1 then
            if not menu.ralsei_dog then
                local icon = Assets.getTexture("ui/menu/icon/smile")
                Draw.draw(icon, x-26, y+6, 0, 2, 2)
                love.graphics.print("Kindness", x, y)
                love.graphics.print("100", x+130, y)
            else
                local icon = Assets.getTexture("ui/menu/icon/smile_dog")
                Draw.draw(icon, x-26, y+6, 0, 2, 2)
                love.graphics.print("Dogness", x, y)
                love.graphics.print("1", x+130, y)
            end
        else
            local icon = Assets.getTexture("ui/menu/icon/lollipop")
            Draw.draw(icon, x-26, y+6, 0, 2, 2)
            love.graphics.print("Sweetness", x, y)
            love.graphics.print("97", x+130, y)
        end
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/fluff")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Fluffiness", x, y, 0, 0.8, 1)

        Draw.draw(icon, x+130, y+6, 0, 2, 2)
        if Game.chapter >= 2 then
            Draw.draw(icon, x+150, y+6, 0, 2, 2)
        end
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)
        return true
    end
end

function character:getQuestOffset()
    return 0, -2
end

return character