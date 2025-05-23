---@class RareCats : MinigameHandler
local RareCats, super = Class("MinigameHandler")

function RareCats:init()
    super.init(self)

    self.name = "Rare Cats"
    self.description = "Click on CATS to get POINTS!\nShare your SCORE with FRIENDs!\nGet them ALL... And?"

    self.state = "TRANSITION" -- TRANSITION, INTRO, MAIN, WIN, LOSE, TRANSITIONOUT1, TRANSITIONOUT2, TRANSITIONOUT3

    self.timer = Timer()
    self:addChild(self.timer)

    self.music = Music()

    self.bg = Rectangle(SCREEN_WIDTH/2, SCREEN_HEIGHT/2, 0, 0)
    self.bg:setOrigin(0.5, 0.5)
    self.bg.color = {0, 0, 0}
    self:addChild(self.bg)

    self.state_timer = 0

    self.score = 0
    self.cats_clicked = 0

    self.font = Assets.getFont("main", 32)
    self.font2 = Assets.getFont("small", 32)

    self.hud_alpha = 1
    self.hud_x, self.hud_y = 230, 500
	
    self.spawn_cat = false
    self.cat_limit = Utils.pick({20, 40, 60, 80, 100})

    self.hold_timer = 0
end

function RareCats:postInit()
    self:pauseWorldMusic()
    Assets.playSound("glitchy_meows", 0.4)
end

function RareCats:update()
    if self.score < 0 then
        self.score = 0
    end
    self.state_timer = self.state_timer + DT
    if self.state == "TRANSITION" then
        self.bg.width = SCREEN_WIDTH * self.state_timer
        self.bg.height = SCREEN_HEIGHT * self.state_timer
        if self.state_timer > 1 then
            self:setState("INTRO")
        end
    elseif self.state == "INTRO" then
        if not Kristal.showCursor() then
            Kristal.showCursor()
        end
		
        self.score = 0
        self.cats_clicked = 0
        self.spawn_cat = false
		
        if self.state_timer < 1 then
            if self.hud_y > 420 then
                self.hud_y = self.hud_y - 4 * DTMULT
            end
        else
            self:setState("MAIN")
        end
    elseif self.state == "MAIN" then
        self.hud_y = 420
        if not self.spawn_cat then
            self:summonCat()
        end
        if Input.down("cancel") then
            self.hold_timer = Utils.approach(self.hold_timer, 2, DT)

            if self.hold_timer >= 2 then
                if self.cat then
                    self.cat:remove()
                end
                if self.music then
                    self.music:stop()
                end
                Assets.playSound("digital", 1, 0.5)
                if self.state_timer > 1 then
                    self:setState("TRANSITIONOUT1")
                end
            end
        else
            self.hold_timer = 0
        end
    elseif self.state == "WIN" or self.state == "LOSE" then
        self.hud_y = 500
        if self.cat then
            self.cat:remove()
        end
    elseif self.state == "TRANSITIONOUT1" then
        if self.state_timer > 1 then
            self:setState("TRANSITIONOUT2")
        end
    elseif self.state == "TRANSITIONOUT3" then
        if self.state_timer > 1 then
            Assets.playSound("glitchy_meows", 0.4)
            self.cat_limit = Utils.pick({20, 40, 60, 80, 100})
            self:setState("INTRO")
        end
    elseif self.state == "TRANSITIONOUT2" then
        self.bg.width = SCREEN_WIDTH * (1 - self.state_timer)
        self.bg.height = SCREEN_HEIGHT * (1 - self.state_timer)
        if self.state_timer > 1 then
            self:endMinigame()
            return
        end
    end
	
    super.update(self)
end

function RareCats:draw()
    super.draw(self)

    love.graphics.setColor(1, 1, 1, self.hud_alpha)
    love.graphics.setFont(self.font2)

    local function holdToQuit()
        if Input.active_gamepad then
            love.graphics.setColor(0.3, 0.3, 0.3, self.hud_alpha)
            love.graphics.printf("Hold    to quit", 160, self.hud_y + 30, SCREEN_WIDTH, "center", 0, 0.5, 0.5, 0.5)
            love.graphics.draw(Input.getTexture("cancel"), (SCREEN_WIDTH/2) - 16, self.hud_y - 2, 0, 1, 1)
        else
            love.graphics.setColor(0.3, 0.3, 0.3, self.hud_alpha)
            love.graphics.printf("Hold " .. Input.getText("cancel") .. " to quit", 160, self.hud_y + 30, SCREEN_WIDTH, "center", 0, 0.5, 0.5, 0.5)
        end
    end

    if self.state == "INTRO" or self.state == "MAIN" then
        local score = string.format("%d", self.score)
        local cats_clicked = string.format("%d", self.cats_clicked)

        love.graphics.setColor(0.2, 0.2, 0.2, self.hud_alpha)
        love.graphics.printf("SCORE: "..score, 162, self.hud_y - 18, SCREEN_WIDTH, "center", 0, 0.5, 0.5)
        love.graphics.printf("CATS CLICKED: "..cats_clicked.."/"..self.cat_limit, 162, self.hud_y + 4, SCREEN_WIDTH, "center", 0, 0.5, 0.5)

        love.graphics.setColor(0.5, 0.5, 0.5, self.hud_alpha)
        love.graphics.printf("SCORE: "..score, 160, self.hud_y - 20, SCREEN_WIDTH, "center", 0, 0.5, 0.5)
        love.graphics.printf("CATS CLICKED: "..cats_clicked.."/"..self.cat_limit, 160, self.hud_y + 2, SCREEN_WIDTH, "center", 0, 0.5, 0.5)
        
        holdToQuit()
    end
	
    local function pressToContinue()
        if Input.active_gamepad then
            love.graphics.printf("Press    to retry", 160, 380, SCREEN_WIDTH, "center", 0, 0.5, 0.5, 0.5)
            love.graphics.draw(Input.getTexture("cancel"), (SCREEN_WIDTH/2) - 16, 378, 0, 1, 1)
            love.graphics.printf("Press    to quit", 160, 400, SCREEN_WIDTH, "center", 0, 0.5, 0.5, 0.5)
            love.graphics.draw(Input.getTexture("confirm"), (SCREEN_WIDTH/2) - 20, 398, 0, 1, 1)
        else
            love.graphics.printf("Press " .. Input.getText("confirm") .. " to retry", 160, 380, SCREEN_WIDTH, "center", 0, 0.5, 0.5, 0.5)
            love.graphics.printf("Press " .. Input.getText("cancel") .. " to quit", 160, 400, SCREEN_WIDTH, "center", 0, 0.5, 0.5, 0.5)
        end
    end
	
    if self.state == "WIN" then
        Draw.setColor(1, 1, 1, self.hud_alpha)
        love.graphics.setFont(self.font)
        love.graphics.printf("YOU WIN!", 0, 70, SCREEN_WIDTH, "center")

        local score = string.format("%d", self.score)
        love.graphics.printf("FINAL SCORE: "..score, 0, 220, SCREEN_WIDTH, "center")
	
        love.graphics.setFont(self.font2)
        Draw.setColor(0.5, 0.5, 0.5, self.hud_alpha)
        pressToContinue()
    end

    if self.state == "LOSE" then
        Draw.setColor(1, 1, 1, self.hud_alpha)
        love.graphics.setFont(self.font)
        love.graphics.printf("YOU LOSE!", 0, 70, SCREEN_WIDTH, "center")

        local score = string.format("%d", self.score)
        love.graphics.printf("FINAL SCORE: "..score - 1997, 0, 220, SCREEN_WIDTH, "center")
	
        love.graphics.setFont(self.font2)
        Draw.setColor(0.5, 0.5, 0.5, self.hud_alpha)
        pressToContinue()
    end
end

function RareCats:onKeyPressed(key)
    super.onKeyPressed(self, key)
    if self.state == "WIN" or self.state == "LOSE" then
        if Input.pressed("cancel") then
            self:setState("TRANSITIONOUT1")
        end
        if Input.pressed("confirm") then
            self:setState("TRANSITIONOUT3")
        end
    end
end

function RareCats:setState(state)
    local last_state = self.state
    self.state = state
    self.state_timer = 0
    self:onStateChange(last_state, state)
end

function RareCats:onStateChange(old, new)
    if new == "INTRO" then
    elseif new == "MAIN" then
        self.music:play("minigames/rarecats")
    elseif new == "WIN" then
        Assets.playSound("glitchy_meow", 0.4, 1.8 + Utils.random(0.8))
    elseif new == "LOSE" then
        Assets.playSound("error", 0.8, 0.4 + Utils.random(0.5))
    elseif new == "TRANSITIONOUT1"then
    elseif new == "TRANSITIONOUT2" then
        self:preEndCleanup()
    end
end

function RareCats:summonCat()
    self.spawn_cat = true
    local o = math.floor(math.random() * 1000) + 1
	
    self.cat = RareCatsEntity()
    self.cat.x = math.floor(love.math.random(160, 480))
    self.cat.y = math.floor(love.math.random(160, 320))
    self.cat.physics.speed_x = Utils.pick({-30, 30}) / 10
    self.cat.physics.speed_y = Utils.pick({-30, 30}) / 10
	
    if self.cats_clicked >= self.cat_limit then
        self.music:stop()
        self.cat.visible = false
        self:setState("WIN")
    else
        if o <= 700 then
            --Kristal.Console:log("normal")
            self.cat.type = 1
            self.cat.sprite:set("cat_001/dance")
            self.cat.sprite:play(1/30, true)
            self.cat.point_value = 10
        elseif o <= 879 then		
            --Kristal.Console:log("blue ora")
            self.cat.type = 2
            self.cat.sprite:set("cat_002/dance")
            self.cat.sprite:play(1/30, true)
            self.cat.point_value = 50
        elseif o <= 959 then
            --Kristal.Console:log("rock & roll")
            self.cat.type = 5
            self.cat.sprite:set("cat_005/dance")
            self.cat.sprite:play(1/30, true)
            self.cat.point_value = 250
        elseif o <= 989 then
            --Kristal.Console:log("ANGLE WING!!!!")
            self.cat.type = 6
            self.cat.sprite:set("cat_006/dance")
            self.cat.sprite:play(1/30, true)
            self.cat.point_value = 1000
        elseif o <= 999 then
            --Kristal.Console:log("SUPER HOLY ANGlE WING!!!!")
            self.cat.type = 7
            self.cat.sprite:set("cat_007/dance")
            self.cat.sprite:play(1/30, true)
            self.cat.point_value = 3000
        elseif o == 1000 then
            self:hardReset()
            self.cat.visible = false
        end
    end
	
    self:addChild(self.cat)
end

function RareCats:hardReset()
    self.music:stop()

    Assets.playSound("face", 2, 1)

    self.friend = Sprite("cat_009", 320, 240, nil, nil, "minigames/rarecats")
    self.friend.scale = 0.1
    self.friend.layer = 9999
    self.friend:setOriginExact(47, 52)
    self.friend.graphics.grow = 1
    self:addChild(self.friend)

    self.timer:after(1, function()
        self.friend:remove()
        self:setState("LOSE")
	end)
end

return RareCats