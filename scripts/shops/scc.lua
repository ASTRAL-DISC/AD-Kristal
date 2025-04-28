local SCC, super = Class(Shop, "scc")

function SCC:init()
    super.init(self)

    self.shopkeeper:remove()

    self.shopkeeper = MultiShopkeeper()
    self.shopkeeper:setPosition(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)
    self.shopkeeper.layer = SHOP_LAYERS["shopkeeper"]
    self:addChild(self.shopkeeper)

    self.menu_options = {
        {"Play Music",  "MUSICMENU" },
        {"Lancer",      "LANCERMENU" },
        {"Talk",        "TALKMENU"},
        {"Exit",        "LEAVE"   }
    }

    self.encounter_text = "[emote:sweet_talk][miniface:sweet/talk, -3, -6]Welcome to...[emote:sweet_idle]\n[wait:5][emote:capn_talk][miniface:capn/talk, -3, 2]The Music Room![emote:capn_idle]\n[wait:5][emote:kk_talk][miniface:kk/talk, -3, -2]We don't sell\nanything![emote:kk_idle]"
    self.shop_text = "[emote:sweet_talk][miniface:sweet/talk, -3, -6]Crash![emote:sweet_idle]\n[wait:5][emote:capn_talk][miniface:capn/talk, -3, 2]Bang![emote:capn_idle]\n[wait:5][emote:kk_talk][miniface:kk/talk, -3, -2]Boom![emote:kk_idle]"
    self.leaving_text = "[emote:sweet_talk][miniface:sweet/talk, -3, -6]See ya![emote:sweet_idle]\n[wait:5][emote:capn_talk][miniface:capn/talk, -3, 2]Smell ya![emote:capn_idle]\n[wait:5][emote:kk_talk][miniface:kk/talk, -3, -2]Hear ya![emote:kk_idle]"
    self.lancer_text = "[emote:kk_talk][miniface:kk/talk]Good song.[emote:kk_idle]"
    self.musicwip_text = "[emote:sweet_talk][miniface:sweet/talk, -3, -6]It's still a WIP![emote:sweet_idle]\n[wait:5][emote:capn_talk][miniface:capn/talk, -3, 2]You know what that\nis, right?[emote:capn_idle]\n[wait:5][emote:kk_talk][miniface:kk/talk, -3, -2]Be patient![emote:kk_idle]"

    self.shopkeeper.actors = {
        self.shopkeeper:addActor("shopkeepers/sweet"),
        self.shopkeeper:addActor("shopkeepers/capn"),
        self.shopkeeper:addActor("shopkeepers/kk")
    }

    -- Sweet
    self.shopkeeper.actors[1]:setPosition(0, 0)

    -- Capn
    self.shopkeeper.actors[2]:setPosition(0, 0)
    self.shopkeeper.actors[2].layer = self.shopkeeper.actors[1].layer - 1

    -- K_K
    self.shopkeeper.actors[3]:setPosition(0, 0)
    self.shopkeeper.actors[3].layer = self.shopkeeper.actors[1].layer + 1

    self.background = "ui/shop/scc"
    self.shop_music = "cyber_shop"
    self.hide_storage_text = true
end

function SCC:postInit()
    super.super.postInit(self)
    self.background_sprite:play(5/30, true)
end

function SCC:onEmote(emote)
    if emote:sub(1, 6) == "sweet_" then
        self.shopkeeper.actors[1]:set(emote:sub(7, -1))
    elseif emote:sub(1, 5) == "capn_" then
        self.shopkeeper.actors[2]:set(emote:sub(6, -1))
    elseif emote:sub(1, 3) == "kk_" then
        self.shopkeeper.actors[3]:set(emote:sub(4, -1))
    end

    --kind of a band-aid but it makes them talk somewhat correctly
    if emote == "sweet_talk" then
        self.dialogue_text.talk_sprite = self.shopkeeper.actors[1]
    elseif emote == "capn_talk" then
        self.dialogue_text.talk_sprite = self.shopkeeper.actors[2]
    elseif emote == "kk_talk" then
        self.dialogue_text.talk_sprite = self.shopkeeper.actors[3]
    elseif emote == "sweet_idle" then
        self.shopkeeper.actors[1]:set("idle")
    elseif emote == "capn_idle" then
        self.shopkeeper.actors[2]:set("idle")
    elseif emote == "kk_idle" then
        self.shopkeeper.actors[3]:set("idle")
    end
end

function SCC:onStateChange(old, new)
	if not (old == "DIALOGUE" and new == "TALKMENU") then
        self.background_sprite:play(5/30, true)
		super.onStateChange(self, old, new)
    else
        self.background_sprite:play(5/30, true)
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
        self.info_box.visible = false
        self.dialogue_text.width = 372
        self.dialogue_text:setText(self.shop_text)
        self.right_text:setText("")
		self:setState("MAINMENU")
        self.dialogue_text:resetState()
    end
    if new == "LANCERMENU" then
        self:clearMiniface()
        self.background_sprite:play(5/30, true)
        self.state = "MAINMENU"
        Assets.playSound("splat")
        self.dialogue_text:setText(self.lancer_text)
	elseif new == "MUSICMENU" then
        self:clearMiniface()
        self.state = "MUSICMENU"
        self.background_sprite:stop()
        if self.music:isPlaying() then
            self.music:stop()
        end
        self.dialogue_text:setText("")
        self.right_text:setText("")
    elseif (old == "MUSICMENU" and new == "MAINMENU") then
        self:clearMiniface()
        self.background_sprite:play(5/30, true)
        if not self.music:isPlaying() then
            self.music:play()
        end
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
        self.info_box.visible = false
        self.dialogue_text.width = 372
        self.dialogue_text:setText(self.shop_text)
        self.right_text:setText("")
		self:setState("MAINMENU")
        self.dialogue_text:resetState()
    elseif new == "CUTSCENE" then
        self:clearMiniface()
        self.large_box.visible = true
        self.left_box.visible = false
        self.right_box.visible = false
        self.info_box.visible = false
        self.dialogue_text.width = 598
        self:setDialogueText("")
        self:setRightText("")
    end
end

function SCC:onKeyPressed(key, is_repeat)
    if self.state == "MAINMENU" then
        if Input.isConfirm(key) then
            local selection = self.menu_options[self.main_current_selecting][2]
            if type(selection) == "string" then
                self:setState(selection)
            elseif type(selection) == "function" then
                selection()
            end
        elseif Input.is("up", key) then
            self.main_current_selecting = self.main_current_selecting - 1
            if (self.main_current_selecting <= 0) then
                self.main_current_selecting = #self.menu_options
            end
        elseif Input.is("down", key) then
            self.main_current_selecting = self.main_current_selecting + 1
            if (self.main_current_selecting > #self.menu_options) then
                self.main_current_selecting = 1
            end
        end
    elseif self.state == "TALKMENU" then
        if Input.isConfirm(key) then
            if (self.current_selecting <= #self.talks) then
                local talk = self.talks[self.current_selecting]
                self:setFlag("talk_" .. self.current_selecting, true)
                self:startTalk(talk[1])
            elseif self.current_selecting == math.max(4, #self.talks) + 1 then
                self:setState("MAINMENU")
            end
        elseif Input.isCancel(key) then
            self:setState("MAINMENU")
        elseif Input.is("up", key) then
            self.current_selecting = self.current_selecting - 1
            if (self.current_selecting <= 0) then
                self.current_selecting = math.max(4, #self.talks) + 1
            end
        elseif Input.is("down", key) then
            self.current_selecting = self.current_selecting + 1
            if (self.current_selecting > math.max(4, #self.talks) + 1) then
                self.current_selecting = 1
            end
        end
    elseif self.state == "MUSICMENU" then
        if Input.isCancel(key) then
            self:setState("MAINMENU")
        end
    end
end

function SCC:draw()
    self:drawBackground()

    super.super.draw(self)
    love.graphics.setFont(self.font)
    if self.state == "MAINMENU" then
        Draw.setColor(COLORS.white)
        for i = 1, #self.menu_options do
            love.graphics.print(self.menu_options[i][1], 480, 220 + (i * 40))
        end
        Draw.setColor(Game:getSoulColor())
        Draw.draw(self.heart_sprite, 450, 230 + (self.main_current_selecting * 40))
    elseif self.state == "MUSICMENU" then
        --MUSICMENU draw

        --box
        love.graphics.setLineWidth(4)
        Draw.setColor(PALETTE["world_border"])
        love.graphics.rectangle("line", 12, 252, 617, 217)
        Draw.setColor(PALETTE["world_fill"])
        love.graphics.rectangle("fill", 14, 254, 613, 213)
    elseif self.state == "TALKMENU" then
        Draw.setColor(Game:getSoulColor())
        Draw.draw(self.heart_sprite, 50, 230 + (self.current_selecting * 40))
        Draw.setColor(COLORS.white)
        love.graphics.setFont(self.font)
        for i = 1, math.max(4, #self.talks) do
            local v = self.talks[i]
            if v then
                Draw.setColor(v[2].color)
                love.graphics.print(v[1], 80, 220 + (i * 40))
            else
                Draw.setColor(COLORS.dkgray)
                love.graphics.print("--------", 80, 220 + (i * 40))
            end
        end
        Draw.setColor(COLORS.white)
        love.graphics.print("Exit", 80, 220 + ((math.max(4, #self.talks) + 1) * 40))
    end

    if self.state == "MAINMENU" or
       self.state == "BUYMENU"  or
       self.state == "SELLMENU" or
       self.state == "SELLING"  or
       self.state == "TALKMENU" then
        Draw.setColor(COLORS.white)
        love.graphics.setFont(self.font)
        love.graphics.print(string.format(self.currency_text, self:getMoney()), 440, 420)
    end

    Draw.setColor(0, 0, 0, self.fade_alpha)
    love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
end

function SCC:startTalk(talk)
    if Game.chapter == 3 then
        self.dialogue_text:addFunction("clear", function()
            self:clearMiniface()
        end)
        self:startDialogue({
            "[emote:sweet_talk][miniface:sweet/talk, -3, -6]Crash![emote:sweet_idle]\n[wait:5][emote:capn_talk][miniface:capn/talk, -3, 2]Bang![emote:capn_idle]\n[wait:5][emote:kk_talk][miniface:kk/talk, -3, -2]Boom![emote:kk_idle]",
            "[func:clear][emote:capn_talk][miniface:capn/talk, -3, 0]We love your city, [wait:5]chief![emote:capn_idle]\n[wait:5][emote:sweet_talk][miniface:sweet/talk, -3, 0]Yeah! [wait:5]It's full of strange\npeople![emote:sweet_idle]\n[wait:5][emote:kk_talk][miniface:kk/talk, -3, 0]Strange like us![emote:kk_idle]",
        })
    elseif Game.chapter == 4 then
        self.dialogue_text:addFunction("clear", function()
            self:clearMiniface()
        end)
        self:startDialogue({
            "[emote:sweet_talk][miniface:sweet/talk, -3, -6]Crash![emote:sweet_idle]\n[wait:5][emote:capn_talk][miniface:capn/talk, -3, 2]Bang![emote:capn_idle]\n[wait:5][emote:kk_talk][miniface:kk/talk, -3, -2]Boom![emote:kk_idle]",
            "[func:clear][emote:capn_talk][miniface:capn/talk, -3, 0]We love your city, [wait:5]chief![emote:capn_idle]\n[wait:5][emote:sweet_talk][miniface:sweet/talk, -3, 0]Yeah! [wait:5]It's full of strange\npeople![emote:sweet_idle]\n[wait:5][emote:kk_talk][miniface:kk/talk, -3, 0]Strange like us![emote:kk_idle]",
        })
    elseif Game.chapter == 5 then
        self.dialogue_text:addFunction("clear", function()
            self:clearMiniface()
        end)
        self:startDialogue({
            "[emote:sweet_talk][miniface:sweet/talk, -3, -6]Crash![emote:sweet_idle]\n[wait:5][emote:capn_talk][miniface:capn/talk, -3, 2]Bang![emote:capn_idle]\n[wait:5][emote:kk_talk][miniface:kk/talk, -3, -2]Boom![emote:kk_idle]",
            "[func:clear][emote:capn_talk][miniface:capn/talk, -3, 0]We love your city, [wait:5]chief![emote:capn_idle]\n[wait:5][emote:sweet_talk][miniface:sweet/talk, -3, 0]Yeah! [wait:5]It's full of strange\npeople![emote:sweet_idle]\n[wait:5][emote:kk_talk][miniface:kk/talk, -3, 0]Strange like us![emote:kk_idle]",
        })
    elseif Game.chapter == 6 then
        self.dialogue_text:addFunction("clear", function()
            self:clearMiniface()
        end)
        self:startDialogue({
            "[emote:sweet_talk][miniface:sweet/talk, -3, -6]Crash![emote:sweet_idle]\n[wait:5][emote:capn_talk][miniface:capn/talk, -3, 2]Bang![emote:capn_idle]\n[wait:5][emote:kk_talk][miniface:kk/talk, -3, -2]Boom![emote:kk_idle]",
            "[func:clear][emote:capn_talk][miniface:capn/talk, -3, 0]We love your city, [wait:5]chief![emote:capn_idle]\n[wait:5][emote:sweet_talk][miniface:sweet/talk, -3, 0]Yeah! [wait:5]It's full of strange\npeople![emote:sweet_idle]\n[wait:5][emote:kk_talk][miniface:kk/talk, -3, 0]Strange like us![emote:kk_idle]",
        })
    elseif Game.chapter == 7 then
        self.dialogue_text:addFunction("clear", function()
            self:clearMiniface()
        end)
        self:startDialogue({
            "[emote:sweet_talk][miniface:sweet/talk, -3, -6]Crash![emote:sweet_idle]\n[wait:5][emote:capn_talk][miniface:capn/talk, -3, 2]Bang![emote:capn_idle]\n[wait:5][emote:kk_talk][miniface:kk/talk, -3, -2]Boom![emote:kk_idle]",
            "[func:clear][emote:capn_talk][miniface:capn/talk, -3, 0]We love your city, [wait:5]chief![emote:capn_idle]\n[wait:5][emote:sweet_talk][miniface:sweet/talk, -3, 0]Yeah! [wait:5]It's full of strange\npeople![emote:sweet_idle]\n[wait:5][emote:kk_talk][miniface:kk/talk, -3, 0]Strange like us![emote:kk_idle]",
        })
    end
end

function SCC:onTalk()
	self:startTalk()
end

return SCC