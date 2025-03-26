local StarMenu, super = Class(Object)

function StarMenu:init(save_id, marker)
    super.init(self, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)

    self.parallax_x = 0
    self.parallax_y = 0

    self.draw_children_below = 0

    self.font = Assets.getFont("depixelschmal", 18)

    self.heart_sprite = Assets.getTexture("player/heart")

    self.box = UIBox(200, 130, 240, 109)
    self.box.layer = -1
    self:addChild(self.box)

    self.leaderbox = UIBox(self.box.x, self.box.y + 178, 50, 50)
    self.leaderbox.layer = -1
    self:addChild(self.leaderbox)

    self.allybox = UIBox(self.leaderbox.x + 120, self.box.y + 178, 120, 50)
    self.allybox.layer = -1
    self:addChild(self.allybox)

    self.marker = marker

    -- MAIN, SAVED
    self.state = "MAIN"

    self.selected_x = 1

    self.save_id = save_id or Game.save_id
    self.saved_file = Kristal.getSaveFile(save_id)
end

function StarMenu:update()
    if self.state == "MAIN" then
        if Input.pressed("cancel") then
            Assets.playSound("quest/error")
            self:remove()
            Game.world:closeMenu()
        end
        if Input.pressed("left") or Input.pressed("right") then
            self.selected_x = self.selected_x == 1 and 2 or 1
            Assets.playSound("quest/select")
        end
        if Input.pressed("confirm") then
            if self.selected_x == 1 then
                self.state = "SAVED"

                Kristal.saveGame(self.save_id, Game:save(self.marker))
                self.saved_file = Kristal.getSaveFile(self.save_id)

                Assets.playSound("quest/saved")
            elseif self.selected_x == 2 then
                Assets.playSound("quest/error")
                self:remove()
                Game.world:closeMenu()
            end
        end
    elseif self.state == "SAVED" then
        if Input.pressed("confirm") or Input.pressed("cancel") then
            self:remove()
            Game.world:closeMenu()
        end
    end

    super.update(self)
end

function StarMenu:draw()
    love.graphics.setFont(self.font)

    if self.state == "SAVED" then
        Draw.setColor(PALETTE["world_text_selected"])
    else
        Draw.setColor(PALETTE["world_text"])
    end

    local data = self.saved_file or {}
    local name      = data.name      or "[EMPTY]"
    local level     = data.level     or 0
    local playtime  = data.playtime  or 0
    local room_name = data.room_name or ""

    love.graphics.print(name,         self.box.x,       self.box.y - 5)
    love.graphics.print("LV "..level, self.box.x + 60, self.box.y - 5)

    for i, ally in ipairs(Game.party) do
        local party_sprite = ally:getActor():createSprite()
        party_sprite:setFacing("down")
        party_sprite:setOrigin(0.5, 0.5)
        party_sprite:setScale(2)
        if i ~= 1 then
            party_sprite:setPosition(20 + (i - 2) * 40, self.allybox.height/2)
            self.allybox:addChild(party_sprite)
        end
    end

    self.party_caption = Assets.getTexture("ui/menu/quest/caption_party")
    Draw.draw(self.party_caption, self.allybox.x + 2, self.allybox.y - 28, 0, 2, 2)

    local minutes = math.floor(playtime / 60)
    local seconds = math.floor(playtime % 60)
    local time_text = string.format("%d:%02d", minutes, seconds)
    love.graphics.print(time_text, self.box.x + 180, self.box.y - 5)

    love.graphics.print(room_name, self.box.x, self.box.y + 30)

    if self.state == "MAIN" then
        love.graphics.print("Save",   self.box.x + 30,  self.box.y + 90)
        love.graphics.print("Return", self.box.x + 140, self.box.y + 90)

        Draw.setColor(Game:getSoulColor())
        Draw.draw(self.heart_sprite, self.box.x + 2 + (self.selected_x - 1) * 110, self.box.y + 91)
        Draw.setColor({1, 1, 1})
        local kris = Assets.getTexture("party/kris/quest/spin_1")
        Draw.draw(kris, self.leaderbox.x + 12, self.leaderbox.y + 8, 0, 2, 2)
    elseif self.state == "SAVED" then
        love.graphics.print("File saved.", self.box.x + 30, self.box.y + 90)
        Draw.setColor({1, 1, 1})
        local frames = Assets.getFrames("party/kris/quest/spin")
        local frame = math.floor(Kristal.getTime() * 4) % #frames + 1
        Draw.draw(frames[frame], self.leaderbox.x + 12, self.leaderbox.y + 8, 0, 2, 2)
    end

    Draw.setColor(1, 1, 1)

    super.draw(self)
end

return StarMenu