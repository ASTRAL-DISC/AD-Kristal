---@class QuestMenu : Object
---@overload fun(...) : QuestMenu
local QuestMenu, super = Class(Object)

function QuestMenu:init()
    super.init(self, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)

    self.draw_children_below = 0

    self.layer = 1 -- TODO

    self.parallax_x = 0
    self.parallax_y = 0

    self.state = "MAIN"
    self.heart_sprite = Assets.getTexture("player/heart")

    self.move = Assets.newSound("quest/select")
    self.select = Assets.newSound("quest/heal")
    self.error = Assets.newSound("quest/error")
    self.cancel = Assets.newSound("quest/error")

    self.font = Assets.getFont("depixelschmal", 18)
    self.fontbig = Assets.getFont("depixelschmal", 26)

    self.selected_x = 1
	self.selected_y = 1

    self.bg = UIBox(200, 120, 240, 240)
    self.bg.layer = -1
    self:addChild(self.bg)

    self.selected_party = 1
    self.on_select = nil

    self.box = nil
    self.box_offset_x = 0
    self.box_offset_y = 0
end
function QuestMenu:onAdd(parent)
    super.onAdd(self, parent)
    self.select:stop()
    self.select:play()
end

function QuestMenu:close()
    Game.world.menu = nil
    self:remove()
    self.cancel:stop()
    self.cancel:play()
end

function QuestMenu:getSelected()
    return Game.party[self.selected_party]
end

function QuestMenu:updateSelectedParty()
    self.selected_party = (self.selected_party - 1) % #Game.party + 1
end

function QuestMenu:update()
    if Input.pressed("cancel") and self.state == "MAIN" then
        Game.world:closeMenu()
        return
    end
    if self.state == "MAIN" then
        local old_selected_y = self.selected_y

        if Input.pressed("down") then
            self.selected_y = self.selected_y + 1
            self.move:stop()
            self.move:play()
        end
        if Input.pressed("up") then
            self.selected_y = self.selected_y - 1
            self.move:stop()
            self.move:play()
        end
        self.selected_y = Utils.clamp(self.selected_y, 1, 3)
        if self.selected_y ~= old_selected_y then
            self.move:stop()
            self.move:play()
        end
        if Input.pressed("confirm") then
            if self.selected_y == 1 then
                self.state = "PARTY"
                self.select:stop()
                self.select:play()
            elseif self.selected_y == 2 then
                self.state = "QUEST"
                self.select:stop()
                self.select:play()
            elseif self.selected_y == 3 then
                if not Game:getFlag("quest_done") then
                    Game.world:startCutscene("ch5/quest/simulation.quit")
                else
                    Game.world:closeMenu()
                    Game.world.timer:after(1, function ()
                        Game.world:mapTransition("test/room1", "spawn")
                    end)
                end
            end
        end
    elseif self.state == "PARTY" then
        self:getSelected()
        local old_selected = self.selected_party
        if Input.pressed("left") then
            self.selected_party = self.selected_party - 1
        elseif Input.pressed("right") then
            self.selected_party = self.selected_party + 1
        end
        self:updateSelectedParty()
        if old_selected ~= self.selected_party then
            self.move:stop()
            self.move:play()
            if self.on_select then
                self.on_select(self.selected_party, old_selected)
            end
        end
        if Input.pressed("confirm") then
            if self.selected_party == 1 then
                self.state = "KRIS"
                self.select:stop()
                self.select:play()
            elseif self.selected_party == 2 then
                self.state = "NOELLE"
                self.select:stop()
                self.select:play()
            elseif self.selected_party == 3 then
                self.state = "BERDLY"
                self.select:stop()
                self.select:play()
            end
        end
        if Input.pressed("cancel") then
            self.state = "MAIN"
            self.cancel:stop()
            self.cancel:play()
        end
    elseif self.state == "KRIS" or self.state == "NOELLE" or self.state == "BERDLY" then
        if Input.pressed("cancel") then
            self.state = "PARTY"
            self.cancel:stop()
            self.cancel:play()
        end
    end
end

function QuestMenu:draw()
    -- Draw the black background
    Draw.setColor(PALETTE["world_text"])
    love.graphics.setFont(self.font)

    if self.state == "MAIN" then
        love.graphics.setFont(self.fontbig)
        love.graphics.print("PARTY", self.bg.x + 75, self.bg.y + 50)
        love.graphics.print("QUEST", self.bg.x + 75, self.bg.y + 100)
        love.graphics.print("QUIT", self.bg.x + 75, self.bg.y + 150)
        love.graphics.setFont(self.font)
        Draw.setColor(Game:getSoulColor())
        Draw.draw(self.heart_sprite, self.bg.x + 40, self.bg.y + 55 + (self.selected_y - 1) * 50)
        Draw.setColor(PALETTE["world_text"])
        self.menu_caption = Assets.getTexture("ui/menu/quest/caption_menu")
        Draw.draw(self.menu_caption, self.bg.x + 2, self.bg.y - 28, 0, 2, 2)
    elseif self.state == "PARTY" then
        self.party_caption = Assets.getTexture("ui/menu/quest/caption_party")
        Draw.draw(self.party_caption, self.bg.x + 2, self.bg.y - 28, 0, 2, 2)
        for i, ally in ipairs(Game.party) do
            local party_name = ally:getName()
            local ox, oy = ally:getQuestOffset()
            Draw.draw(Assets.getTexture(ally.quest_sprite), self.bg.x + 27 + (i - 1) * 80 + (ox * 2), self.bg.y + 40 + (oy * 2), 0, 2, 2)
            if self.selected_party ~= i then
                Draw.setColor(1, 1, 1, 0.4)
            else
                Draw.setColor(1, 1, 1, 1)
            end
            if i ~= 1 then
                love.graphics.print(party_name, self.bg.x - 60 + i * 80, self.bg.y + 90, 0, 0.8, 1)
            else
                love.graphics.print(party_name, self.bg.x - 60 + i * 80, self.bg.y + 90)
            end
            Draw.setColor(PALETTE["world_text"])
            if self.selected_party == i then
                love.graphics.print(ally:getTitle(), 245, self.bg.y + 135)
            end
        end
        Draw.setColor(Game:getSoulColor())
        Draw.draw(self.heart_sprite, self.bg.x + 30 + (self.selected_party - 1) * 82, self.bg.y + 10)
    elseif self.state == "KRIS" then
        self.kris_caption = Assets.getTexture("ui/menu/quest/caption_kris")
        Draw.draw(self.kris_caption, self.bg.x + 2, self.bg.y - 28, 0, 2, 2)
        local kris = Game.party[1]
        local ox, oy = kris:getQuestOffset()
        Draw.draw(Assets.getTexture(kris.quest_sprite), self.bg.x + 18 + (ox * 2), self.bg.y + 30 + (oy * 2), 0, 3, 3)
        local weapon_name = kris:getWeapon():getName()
        local armor_name = kris:getArmor(1):getName()
        local armor_name2 = kris:getArmor(2):getName()
        love.graphics.print("WEAPON: "..weapon_name, self.bg.x + 80, self.bg.y + 20, 0, 0.8, 1)
        love.graphics.print("ARMOR: "..armor_name, self.bg.x + 80, self.bg.y + 60, 0, 0.8, 1)
        love.graphics.print("ARMOR: "..armor_name2, self.bg.x + 80, self.bg.y + 80, 0, 0.8, 1)
        Draw.setColor(PALETTE["world_text_selected"])
        love.graphics.print(kris:getTitle(), 245, self.bg.y + 135)
    elseif self.state == "NOELLE" then
        self.noelle_caption = Assets.getTexture("ui/menu/quest/caption_noelle")
        Draw.draw(self.noelle_caption, self.bg.x + 2, self.bg.y - 28, 0, 2, 2)
        local noelle = Game.party[2]
        local ox, oy = noelle:getQuestOffset()
        Draw.draw(Assets.getTexture(noelle.quest_sprite), self.bg.x + 18 + (ox * 2), self.bg.y + 30 + (oy * 2), 0, 3, 3)
        local weapon_name = noelle:getWeapon():getName()
        local armor_name = noelle:getArmor(1):getName()
        local armor_name2 = noelle:getArmor(2):getName()
        love.graphics.print("WEAPON: "..weapon_name, self.bg.x + 80, self.bg.y + 20, 0, 0.8, 1)
        love.graphics.print("ARMOR: "..armor_name, self.bg.x + 80, self.bg.y + 60, 0, 0.8, 1)
        love.graphics.print("ARMOR: "..armor_name2, self.bg.x + 80, self.bg.y + 80, 0, 0.8, 1)
        Draw.setColor(PALETTE["world_text_selected"])
        love.graphics.print(noelle:getTitle(), 245, self.bg.y + 135)
    elseif self.state == "BERDLY" then
        self.berdly_caption = Assets.getTexture("ui/menu/quest/caption_berdly")
        Draw.draw(self.berdly_caption, self.bg.x + 2, self.bg.y - 28, 0, 2, 2)
        local berdly = Game.party[3]
        local ox, oy = berdly:getQuestOffset()
        Draw.draw(Assets.getTexture(berdly.quest_sprite), self.bg.x + 18 + (ox * 2), self.bg.y + 30 + (oy * 2), 0, 3, 3)
        local weapon_name = berdly:getWeapon():getName()
        local armor_name = berdly:getArmor(1):getName()
        local armor_name2 = berdly:getArmor(2):getName()
        love.graphics.print("WEAPON: "..weapon_name, self.bg.x + 80, self.bg.y + 20, 0, 0.8, 1)
        love.graphics.print("ARMOR: "..armor_name, self.bg.x + 80, self.bg.y + 60, 0, 0.8, 1)
        love.graphics.print("ARMOR: "..armor_name2, self.bg.x + 80, self.bg.y + 80, 0, 0.8, 1)
        Draw.setColor(PALETTE["world_text_selected"])
        love.graphics.print(berdly:getTitle(), 245, self.bg.y + 135)
    end

    Draw.setColor(PALETTE["world_text"])

    love.graphics.print("Money", self.bg.x, self.bg.y + 220)
    love.graphics.print(Game:getConfig("darkCurrencyShort") .. " " .. Game.money, self.bg.x + 190, self.bg.y + 220)

    super.draw(self)
end

return QuestMenu