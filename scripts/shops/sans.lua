local Sans, super = Class(Shop, "sans")

function Sans:init()
    super.init(self)

    Game.money = Game.lw_money

    self.background = "ui/shop/sans"

    self.currency_text = "$%d"
    self.encounter_text = "[emote:idle]* heya, [wait:5]kid.[wait:5]\n* welcome to sans's."
    self.leaving_text = "[emote:wink]* take it easy."
    self.buy_confirmation_text = "Buy it for\n%s ?"
    self.buy_refuse_text = "[emote:eyelids_side]didn't\nneed it\nanyway."
    self.buy_text = "[emote:wink]bone apettit."
    self.buy_storage_text = "[emote:talk]there\nwe go."
    self.buy_too_expensive_text = "[emote:closed]you don't\nhave money\nfor this."
    self.buy_no_space_text = "[emote:side]you're\ncarrying\ntoo much."
    --self.buy_confirming = true

    self.deny_text = {
        ["SELLMENU"] = {
            "[emote:eyelids_side]* sorry,[wait:5] not happening.[wait:5]\n[emote:talk]* i need to pay bills.",
            "[emote:wink]* all proceeds go to my socks collection."
        }
    }

    self:registerItem("light/chocolate", {stock = 1})
    self:registerItem("light/apple")
    self:registerItem("manual", {price = 8, description = "ITEM\nAn apple that \nisn't an apple", name = "Pineapple"})
    self:registerItem("manual", {price = 10, name = "Crab Apple", description = "ITEM\nA grouchy\napple\n(Expensive)"})
    
    self:registerTalk("About You") --1
    self:registerTalk("Store") --2
    self:registerTalk("See brother") --3
    self:registerTalk("We know each other") --4

    if Game.inventory:hasItem("light/chocolate") then
        self:registerTalkAfter("Chocolate", 1, "chocolate", nil, COLORS.white)
    end

    if Game.chapter == 3 then
        self:registerTalkAfter("Mom (NEW)", 1, "mom_new", nil, COLORS.yellow)
        self:registerTalkAfter("Mom", 1, "mom", nil, COLORS.white)
        self:registerTalkAfter("What's up (NEW)", 3, nil, nil, COLORS.yellow)
        self:registerTalkAfter("What's up", 3, "wassup_new", nil, COLORS.white)
        self:registerTalkAfter("Different timelines (NEW)", 4, nil, nil, COLORS.yellow)
        self:registerTalkAfter("Different timelines", 4, "timelines_new", nil, COLORS.white)
    elseif Game.chapter == 4 then
        self:registerTalkAfter("Dad (NEW)", 2, "dad_new", nil, COLORS.yellow)
        self:registerTalkAfter("Dad", 2, nil, nil, COLORS.white)
    end

    self.shopkeeper:setActor("shopkeepers/sans")
    self.shopkeeper.sprite:setPosition( -24, 12)
    self.shopkeeper.slide = false
    self.shop_music = nil
end

function Sans:postInit()
    -- Mutate talks
    self:processReplacements()
    -- Make a sprite for the background
    if self.background and self.background ~= "" then
        self.background_sprite = Sprite(self.background, 0, 0)
        self.background_sprite:setScale(2, 2)
        self.background_sprite.layer = SHOP_LAYERS["background"]
        self:addChild(self.background_sprite)
    end
    -- Construct the UI
    self.large_box = UIBox()
    local left, top = self.large_box:getBorder()
    self.large_box:setOrigin(0, 1)
    self.large_box.x = left - 8
    self.large_box.y = SCREEN_HEIGHT - 24
    self.large_box.width = SCREEN_WIDTH - (top * 2) + 16
    self.large_box.height = 192
    self.large_box:setLayer(SHOP_LAYERS["large_box"])
    self.large_box.visible = false
    self:addChild(self.large_box)
    self.left_box = UIBox()
    local left, top = self.left_box:getBorder()
    self.left_box:setOrigin(0, 1)
    self.left_box.x = left - 8
    self.left_box.y = SCREEN_HEIGHT - 24
    self.left_box.width = 366
    self.left_box.height = 192
    self.left_box:setLayer(SHOP_LAYERS["left_box"])
    self:addChild(self.left_box)
    self.right_box = UIBox()
    local left, top = self.right_box:getBorder()
    self.right_box:setOrigin(1, 1)
    self.right_box.x = 616
    self.right_box.y = 456
    self.right_box.width = 184
    self.right_box.height = 192
    self.right_box:setLayer(SHOP_LAYERS["right_box"])
    self:addChild(self.right_box)
    self.info_box = UIBox()
    local left, top = self.info_box:getBorder()
    local right_left, right_top = self.right_box:getBorder()
    self.info_box:setOrigin(1, 1)
    self.info_box.x = SCREEN_WIDTH - left + 8
    -- find a more elegant way to do this...
    self.info_box.y = SCREEN_HEIGHT - top - self.right_box.height - (right_top * 2) + 30
    self.info_box.width = 184
    self.info_box.height = 176
    self.info_box:setLayer(SHOP_LAYERS["info_box"])
    self.info_box.visible = false
    self:addChild(self.info_box)

    local emoteCommand = function(text, node)
        self:onEmote(node.arguments[1])
    end

    self.dialogue_text = DialogueText(nil, 30, 270, 372, 226, {
        font = self:getFont(),
        indent_string = self:getIndentString()
    })

    self.dialogue_text:registerCommand("emote", emoteCommand)

    self.dialogue_text:setLayer(SHOP_LAYERS["dialogue"])
    self:addChild(self.dialogue_text)
    self:setDialogueText(self.encounter_text)

    self.right_text = DialogueText("", 30 + 420, 260, 176, 206, {
        font = self:getFont(),
        indent_string = self:getIndentString()
    })

    self.right_text:registerCommand("emote", emoteCommand)

    self.right_text:setLayer(SHOP_LAYERS["dialogue"])
    self:addChild(self.right_text)
    self:setRightText("")

    self.talk_dialogue = {self.dialogue_text, self.right_text}
end

function Sans:onStateChange(old, new)
    Game.key_repeat = false
    self.buy_confirming = false
    self.sell_confirming = false
    if new == "MAINMENU" then
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
        self.info_box.visible = false
        self.dialogue_text.width = 372
        self:setDialogueText(self.shop_text)
        self:setRightText("")
        --sprite:setAnimation("idle")
    elseif new == "BUYMENU" then
        self:setDialogueText("")
        self:setRightText(self.buy_menu_text)
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
        self.info_box.visible = true
        self.info_box.height = -8
        self.box_ease_timer = 0
        self.box_ease_beginning = -8
        if #self.items > 0 then
            self.box_ease_top = 220 - 48
        else
            self.box_ease_top = -8
        end
        self.box_ease_method = "outExpo"
        self.box_ease_multiplier = 1
        self.current_selecting = 1
    elseif new == "SELLMENU" then
        self:setDialogueText("")
        if not self.state_reason then
            self:setRightText(self.sell_menu_text)
        end
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
        self.info_box.visible = false
    elseif new == "SELLING" then
        Game.key_repeat = true
        self:setDialogueText("")
        if self.state_reason and type(self.state_reason) == "table" then
            if self.sell_options_text[self.state_reason[2]] then
                self:setRightText(self.sell_options_text[self.state_reason[2]])
            else
                self:setRightText("Invalid\nmenu\ntext")
            end
        else
            self:setRightText("Invalid\nstate\nreason")
        end
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
        self.info_box.visible = false
        self.item_current_selecting = 1
        self.item_offset = 0
    elseif new == "TALKMENU" then
        self:setDialogueText("")
        self:setRightText(self.talk_text)
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
        self.info_box.visible = false
        if self.state_reason ~= "DIALOGUE" then
            self.current_selecting = 1
        end
        self:processReplacements()
        self:onTalk()
    elseif new == "LEAVE" then
        self:setRightText("")
        self.large_box.visible = true
        self.left_box.visible = false
        self.right_box.visible = false
        self.info_box.visible = false
        self:onLeave()
    elseif new == "LEAVING" then
        self:setRightText("")
        self:setDialogueText("")
        self.large_box.visible = true
        self.left_box.visible = false
        self.right_box.visible = false
        self.info_box.visible = false
        self:leave()
    elseif new == "DIALOGUE" then
        self.dialogue_text.width = 598
        self:setRightText("")
        self.large_box.visible = true
        self.left_box.visible = false
        self.right_box.visible = false
        self.info_box.visible = false
    end
    -----------------------------ADDED STUFF----------------------------
    local buymenutext = Utils.pick({ 1, 2 })
    if (buymenutext == 1) then
        self.buy_menu_text = "[emote:eyelids]do you\neven have\nmoney?"
    elseif (buymenutext == 2) then
        self.buy_menu_text = "[emote:idle]anything you\nlike?"
    end
    local shopmenutext = Utils.pick({ 1, 2 })
    if (shopmenutext == 1) then
        self.shop_text = "[emote:wink]* it's ok, [wait:5]i won't judge."
    elseif (shopmenutext == 2) then
        self.shop_text = "[emote:idle]* here to buy?[wait:5]\n* that's a surprise."
    end
    local talkmenutext = Utils.pick({ 1, 2 })
    if (talkmenutext == 1) then
        self.talk_text = "[emote:eyelids_side]not like I'm doing anything."
    elseif (talkmenutext == 2) then
        self.talk_text = "[emote:idle]since when\nwere you\nso chatty?"
    end
end

function Sans:draw()
    self:drawBackground()
    super.super.super.draw(self)
    love.graphics.setFont(self.font)
    if self.state == "MAINMENU" then
        love.graphics.setColor(COLORS.white)
        for i = 1, #self.menu_options do
            love.graphics.print(self.menu_options[i][1], 480, 220 + (i * 40))
        end
        love.graphics.setColor(Game:getSoulColor())
        love.graphics.draw(self.heart_sprite, 450, 230 + (self.main_current_selecting * 40))
    elseif self.state == "BUYMENU" then
        -- Item type (item, key, weapon, armor)
        for i = 1, math.max(4, #self.items) do
            local item = self.items[i]
            if not item then
                -- If the item is null, add some empty space
                love.graphics.setColor(COLORS.dkgray)
                love.graphics.print("--------", 60, 220 + (i * 40))
            elseif item.options["stock"] and (item.options["stock"] <= 0) then
                -- If we've depleted the stock, show a "sold out" message
                love.graphics.setColor(COLORS.gray)
                love.graphics.print("--SOLD OUT--", 60, 220 + (i * 40))
            else
                love.graphics.setColor(item.options["color"])
                love.graphics.print(item.options["name"], 60, 220 + (i * 40))
                if not self.hide_price then
                    love.graphics.setColor(COLORS.white)
                    love.graphics.print(string.format(self.currency_text, item.options["price"] or 0), 60 + 240,
                        220 + (i * 40))
                end
            end
        end
        love.graphics.setColor(COLORS.white)
        love.graphics.print("Exit", 60, 220 + ((math.max(4, #self.items) + 1) * 40))
        love.graphics.setColor(Game:getSoulColor())
        if not self.buy_confirming then
            love.graphics.draw(self.heart_sprite, 30, 230 + (self.current_selecting * 40))
        else
            love.graphics.draw(self.heart_sprite, 30 + 420, 230 + 80 + 10 + (self.current_selecting_choice * 30))
            love.graphics.setColor(COLORS.white)
            local lines = Utils.split(
                    string.format(self.buy_confirmation_text,
                        string.format(self.currency_text, self.items[self.current_selecting].options["price"] or 0)),
                    "\n")
            for i = 1, #lines do
                love.graphics.print(lines[i], 60 + 400, 420 - 160 + ((i - 1) * 30))
            end
            love.graphics.print("Yes", 60 + 420, 420 - 80)
            love.graphics.print("No", 60 + 420, 420 - 80 + 30)
        end
        love.graphics.setColor(COLORS.white)
        if (self.current_selecting <= #self.items) then
            local current_item = self.items[self.current_selecting]
            local box_left, box_top = self.info_box:getBorder()
            local left = self.info_box.x - self.info_box.width - (box_left / 2) * 1.5
            local top = self.info_box.y - self.info_box.height - (box_top / 2) * 1.5
            local width = self.info_box.width + box_left * 1.5
            local height = self.info_box.height + box_top * 1.5
            Draw.pushScissor()
            Draw.scissor(left, top, width, height)
            love.graphics.setColor(COLORS.white)
            love.graphics.print(current_item.options["description"], left + 32, top + 20)
            if current_item.item.type == "armor" or current_item.item.type == "weapon" then
                for i = 1, #Game.party do
                    local offset_x = 0
                    local offset_y = 0
                    -- TODO: more than 3 party member support
                    if i == 1 then
                        offset_x = 0
                        offset_y = 0
                    elseif i == 2 then
                        offset_x = 100
                        offset_y = 0
                    elseif i == 3 then
                        offset_x = 0
                        offset_y = 45
                    end
                    local party_member = Game.party[i]
                    local can_equip = party_member:canEquip(current_item.item)
                    local head_path = ""
                    love.graphics.setFont(self.plain_font)
                    love.graphics.setColor(COLORS.white)
                    if can_equip then
                        head_path = Assets.getTexture(party_member:getHeadIcons() .. "/head")
                        if current_item.item.type == "armor" then
                            love.graphics.draw(self.stat_icons["defense_1"], offset_x + 470, offset_y + 127 + top)
                            love.graphics.draw(self.stat_icons["defense_2"], offset_x + 470, offset_y + 147 + top)
                            for j = 1, 2 do
                                self:drawBonuses(party_member, party_member:getArmor(j), current_item.options["bonuses"],
                                    "defense", offset_x + 470 + 21, offset_y + 127 + ((j - 1) * 20) + top)
                            end
                        elseif current_item.item.type == "weapon" then
                            love.graphics.draw(self.stat_icons["attack"], offset_x + 470, offset_y + 127 + top)
                            love.graphics.draw(self.stat_icons["magic"], offset_x + 470, offset_y + 147 + top)
                            self:drawBonuses(party_member, party_member:getWeapon(), current_item.options["bonuses"],
                                "attack", offset_x + 470 + 21, offset_y + 127 + top)
                            self:drawBonuses(party_member, party_member:getWeapon(), current_item.options["bonuses"],
                                "magic", offset_x + 470 + 21, offset_y + 147 + top)
                        end
                    else
                        head_path = Assets.getTexture(party_member:getHeadIcons() .. "/head_error")
                    end
                    love.graphics.draw(head_path, offset_x + 426, offset_y + 132 + top)
                end
            end
            Draw.popScissor()
            love.graphics.setColor(COLORS.white)
            if not self.hide_storage_text then
                love.graphics.setFont(self.plain_font)
                local current_storage = Game.inventory:getDefaultStorage(current_item.item)
                local space = Game.inventory:getFreeSpace(current_storage)
                if space <= 0 then
                    love.graphics.print("NO SPACE", 521, 430)
                else
                    love.graphics.print("Space:" .. space, 521, 430)
                end
            end
        end
    elseif self.state == "SELLMENU" then
        love.graphics.setColor(Game:getSoulColor())
        love.graphics.draw(self.heart_sprite, 50, 230 + (self.sell_current_selecting * 40))
        love.graphics.setColor(COLORS.white)
        love.graphics.setFont(self.font)
        for i, v in ipairs(self.sell_options) do
            love.graphics.print(v[1], 80, 220 + (i * 40))
        end
        love.graphics.print("Return", 80, 220 + ((#self.sell_options + 1) * 40))
    elseif self.state == "SELLING" then
        if self.item_current_selecting - self.item_offset > 5 then
            self.item_offset = self.item_offset + 1
        end
        if self.item_current_selecting - self.item_offset < 1 then
            self.item_offset = self.item_offset - 1
        end
        local inventory = Game.inventory:getStorage(self.state_reason[2])
        if inventory and inventory.sorted then
            if self.item_offset + 5 > #inventory then
                if #inventory > 5 then
                    self.item_offset = self.item_offset - 1
                end
            end
            if #inventory == 5 then
                self.item_offset = 0
            end
        end
        love.graphics.setColor(Game:getSoulColor())
        love.graphics.draw(self.heart_sprite, 30, 230 + ((self.item_current_selecting - self.item_offset) * 40))
        if self.sell_confirming then
            love.graphics.draw(self.heart_sprite, 30 + 420, 230 + 80 + 10 + (self.current_selecting_choice * 30))
            love.graphics.setColor(COLORS.white)
            local lines = Utils.split(
                    string.format(self.sell_confirmation_text,
                        string.format(self.currency_text, inventory[self.item_current_selecting]:getSellPrice())), "\n")
            for i = 1, #lines do
                love.graphics.print(lines[i], 60 + 400, 420 - 160 + ((i - 1) * 30))
            end
            love.graphics.print("Yes", 60 + 420, 420 - 80)
            love.graphics.print("No", 60 + 420, 420 - 80 + 30)
        end
        love.graphics.setColor(COLORS.white)
        if inventory then
            for i = 1 + self.item_offset, self.item_offset + math.min(5, inventory.max) do
                local item = inventory[i]
                love.graphics.setFont(self.font)
                if item then
                    love.graphics.setColor(COLORS.white)
                    love.graphics.print(item:getName(), 60, 220 + ((i - self.item_offset) * 40))
                    if item:isSellable() then
                        love.graphics.print(string.format(self.currency_text, item:getSellPrice()), 60 + 240,
                            220 + ((i - self.item_offset) * 40))
                    end
                else
                    love.graphics.setColor(COLORS.dkgray)
                    love.graphics.print("--------", 60, 220 + ((i - self.item_offset) * 40))
                end
            end
            local max = inventory.max
            if inventory.sorted then
                max = #inventory
            end
            love.graphics.setColor(COLORS.white)
            if max > 5 then
                for i = 1, max do
                    local percentage = (i - 1) / (max - 1)
                    local height = 129
                    local draw_location = percentage * height
                    local tocheck = self.item_current_selecting
                    if self.sell_confirming then
                        tocheck = self.current_selecting_choice
                    end
                    if i == tocheck then
                        love.graphics.rectangle("fill", 372, 292 + draw_location, 9, 9)
                    elseif inventory.sorted then
                        love.graphics.rectangle("fill", 372 + 3, 292 + 3 + draw_location, 3, 3)
                    end
                end
                -- Draw arrows
                if not self.sell_confirming then
                    local sine_off = math.sin((Kristal.getTime() * 30) / 6) * 3
                    if self.item_offset + 4 < (max - 1) then
                        love.graphics.draw(self.arrow_sprite, 370, 149 + sine_off + 291)
                    end
                    if self.item_offset > 0 then
                        love.graphics.draw(self.arrow_sprite, 370, 14 - sine_off + 291 - 25, 0, 1, -1)
                    end
                end
            end
        else
            love.graphics.print("Invalid storage", 60, 220 + (1 * 40))
        end
    elseif self.state == "TALKMENU" then
        love.graphics.setColor(Game:getSoulColor())
        love.graphics.draw(self.heart_sprite, 30, 230 + (self.current_selecting * 40))
        love.graphics.setColor(COLORS.white)
        love.graphics.setFont(self.font)
        for i = 1, math.max(4, #self.talks) do
            local v = self.talks[i]
            if v then
                love.graphics.setColor(v[2].color)
                love.graphics.print(v[1], 60, 220 + (i * 40))
            else
                love.graphics.setColor(COLORS.dkgray)
                love.graphics.print("--------", 60, 220 + (i * 40))
            end
        end
        love.graphics.setColor(COLORS.white)
        love.graphics.print("Exit", 60, 220 + ((math.max(4, #self.talks) + 1) * 40))
    end
    if self.state == "MAINMENU" or
        self.state == "BUYMENU" or
        self.state == "SELLMENU" or
        self.state == "SELLING" or
        self.state == "TALKMENU" then
        love.graphics.setColor(COLORS.white)
        love.graphics.setFont(self.font)
        love.graphics.print(string.format(self.currency_text, Game.money), 440, 420)
    end
    love.graphics.setColor(0, 0, 0, self.fade_alpha)
    love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
end

function Sans:startTalk(talk)
    if talk == "About You" then
        self:startCutscene("sans.aboutyou")
        self:setFlag("mom_new", true)
    elseif talk == "Chocolate (NEW)" then
        self:startCutscene("sans.chocolate")
        self:setFlag("chocolate", true)
    elseif talk == "Chocolate" then
        self:startCutscene("sans.nochocolate")
    elseif talk == "Mom (NEW)" then
        self:startCutscene("sans.mom")
        self:setFlag("mom", true)
    elseif talk == "Mom" then
        self:startCutscene("sans.placeholder")
    elseif talk == "Store" then
        self:startCutscene("sans.store")
    elseif talk == "See brother" then
        self:startCutscene("sans.brother")
    elseif talk == "What's up (NEW)" then
        self:startCutscene("sans.wassup_new")
        self:setFlag("wassup_new", true)
    elseif talk == "What's up" then
        self:startCutscene("sans.wassup")
    elseif talk == "We know each other" then
        self:startCutscene("sans.iknowyou")
    elseif talk == "Different timelines (NEW)" then
        self:startCutscene("sans.timelines_new")
        self:setFlag("timelines_new", true)
    elseif talk == "Different timelines" then
        self:startCutscene("sans.timelines")
    end
end

function Sans:buyItem(current_item)
    if (current_item.options["price"] or 0) > Game.lw_money then
        self:setRightText(self.buy_too_expensive_text)
    else
        Game.money = Game.lw_money - (current_item.options["price"] or 0)

        if current_item.options["stock"] then
            current_item.options["stock"] = current_item.options["stock"] - 1
            self:setFlag(current_item.options["flag"], current_item.options["stock"])
        end
        local new_item = Registry.createItem(current_item.item.id)
        new_item:load(current_item.item:save())
        if Game.inventory:addItem(new_item) then
            Assets.playSound("item")
            self:setRightText(self.buy_text)
        else
            self:setRightText(self.buy_no_space_text)
        end

        if Game.inventory:hasItem("light/chocolate") then
            self:setFlag("chocolate_new", true)
            self:registerTalkAfter("Chocolate (NEW)", 1, "chocolate_new", nil, COLORS.yellow)
            self:registerTalkAfter("Chocolate", 1, "chocolate", nil, COLORS.white)
        end
    end
end

function Sans:onLeave()
    self:startDialogue(self.leaving_text, "LEAVING")
    Game.lw_money = Game.money
    Game:setFlag("exit_shop", true)
end

return Sans