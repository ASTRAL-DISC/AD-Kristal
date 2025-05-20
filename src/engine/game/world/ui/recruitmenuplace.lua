---@class RecruitMenuPlace : RecruitMenu
---@overload fun(...) : RecruitMenuPlace
local RecruitMenuPlace, super = Class(RecruitMenu)

function RecruitMenuPlace:init()
    super.init(self, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
    -- Init placeable
    self.placeable = {}

    for _, obj in ipairs(Game.stage:getObjects(Character)) do
        if obj.id == "recruitplace" then
            table.insert(self.placeable, obj)
        end
    end
    --print(Utils.dump(self.placeable))

    -- Flash effect
    self.flash_fx = ColorMaskFX()
    self.flash_fx:setColor(1, 1, 1)
    self.flash_fx.amount = 0

    self.place_selected = 1
    self.prev_selection = self.place_selected
    self.preview = nil
end

function RecruitMenuPlace:update()
    if self.flash_fx then
        self.flash_fx:setColor(1, 1, 1)
        self.flash_fx.amount = -math.cos((love.timer.getTime() * 30) / 5) * 0.4 + 0.6
    end

    self.old_selection = self.selected

    -- Store the previous selection before updating the current selection
    self.prev_selection = self.place_selected

    -- Move heart cursor during INFO phase
    if Input.pressed("left", true) and self.state == "INFO" then
        self.selected = self.selected - 1
        if self.selected < 1 then
            self.selected = #self.recruits
        end
    end
    if Input.pressed("right", true) and self.state == "INFO" then
        self.selected = self.selected + 1
        if self.selected > #self.recruits then
            self.selected = 1
        end
    end

    -- Move heart cursor during PLACE phase
    if Input.pressed("left", true) and self.state == "PLACE" then
        self.place_selected = self.place_selected - 1 -- Move to the previous placement
        if self.place_selected < 1 then
            self.place_selected = #self.placeable -- Loop back to the last placement
        end

        -- DEBUG
        print("Selected option: " .. self.selected)

    elseif Input.pressed("right", true) and self.state == "PLACE" then
        self.place_selected = self.place_selected + 1 -- Move to the next placement
        if self.place_selected > #self.placeable then
            self.place_selected = 1 -- Loop back to the first placement
        end
        -- Update heart cursor position to the new recruit placement spot
        local selected_recruit = self.placeable[self.selected]

        -- DEBUG
        print("Selected option: " .. self.selected)
    end

    -- Ensure only the currently selected placeable has the flash effect
    if self.prev_selection ~= self.place_selected then
        -- Remove the flash effect from the previously selected placeable
        if self.placeable[self.prev_selection] then
            for i, npc in ipairs(self.placeable) do
                if i == self.prev_selection then
                    if not npc.visible then
                        npc.visible = true
                    end
                    if self.preview then
                        self.preview:remove()
                        self.preview:removeFX(self.flash_fx)
                    end
                end
            end
        end
        
        -- Add flash effect to the newly selected placeable
        if self.placeable[self.place_selected] then
            for i, recruit in pairs(self.recruits) do
                if i == self.selected then
                    for i, npc in ipairs(self.placeable) do
                        if i == self.place_selected then
                            self.preview = Game.world:spawnNPC(recruit.id, npc.x, npc.y, {facing = npc.data.properties.facing})
                            self.preview:addFX(self.flash_fx, "debug_flash")
                            npc.visible = false
                        end
                    end
                end
            end
        end

        -- Update the old selection
        self.prev_selection = self.place_selected
        print("Selected option: " .. self.place_selected)
    end

    if self:getMaxPages() > 1 then
        -- Move heart cursor during SELECT phase
        if Input.pressed("left", true) and self.state == "SELECT" then
            self.selected_page = self.selected_page - 1
            self.selected = self.selected - 9
            if self.selected_page < 1 then
                self.selected_page = self:getMaxPages()
                self.selected = self.selected + self:getMaxPages() * 9
            end
            if self.selected > self:getLastSelectedInPage() then
                self.selected = self:getLastSelectedInPage()
            end
        end

        if Input.pressed("right", true) and self.state == "SELECT" then
            self.selected_page = self.selected_page + 1
            self.selected = self.selected + 9
            if self.selected_page > self:getMaxPages() then
                self.selected_page = 1
                self.selected = self.selected - self:getMaxPages() * 9
            end
            if self.selected > self:getLastSelectedInPage() then
                self.selected = self:getLastSelectedInPage()
            end
        end
    end

    -- Move up or down in the recruit name selection
    if Input.pressed("up", true) and self.state == "SELECT" then
        self.selected = self.selected - 1
        if self.selected < self:getFirstSelectedInPage() then
            self.selected = self:getLastSelectedInPage()
        end
    end
    if Input.pressed("down", true) and self.state == "SELECT" then
        self.selected = self.selected + 1
        if self.selected > self:getLastSelectedInPage() then
            self.selected = self:getFirstSelectedInPage()
        end
    end
    
    if self.old_selection ~= self.selected then
        self:setRecruitInBox(self.selected)
    end
    
    if Input.pressed("confirm", false) then
        -- Go to INFO phase (shows info box)
        if self.state == "SELECT" then
            self.state = "INFO"
            self.recruit_box:setPosition(80, 70)
            self.recruit_box.visible = true

        -- Go to PLACE phase (moves camera to the recruit tables)
        elseif self.state == "INFO" then
            for i,recruit in pairs(self.recruits) do
                if i == self.selected then
                    if recruit.recruit_amount == 1 and Game.world:getCharacter(recruit.id) then
                        Assets.stopAndPlaySound("ui_cant_select")
                    else
                        Assets.playSound("noise")
                        self.state = "PLACE"
                        self.place_selected = 1 -- Initialize selection to the first placeable
                        self.selected = self.old_selection

                        for i, npc in ipairs(self.placeable) do
                            if i == self.place_selected then
                                self.preview = Game.world:spawnNPC(recruit.id, npc.x + recruit.place_offset[1], npc.y + recruit.place_offset[2], {
                                    facing = npc.data.properties.facing,
                                    talksprite = "idle"
                                })
                                npc.visible = false
                                self.preview:addFX(self.flash_fx, "debug_flash")
                            end
                        end

                        self.recruit_box.visible = false
                        local x, y = Game.world.map:getMarker("camera")
                        Game.world.camera:panTo(x, y, 1.5, "out-quint", function ()
                            Game.world:setCameraAttached(false)
                        end)
                    end
                end
            end

        -- Place the recruit
        else
            print("Recruit placed!")
            Assets.playSound("ui_select")

            local npc = self.placeable[self.place_selected]
            local recruit = self.recruits[self.selected]
            npc:setActor(recruit.id)
            npc.recruit = recruit
            npc:setFlag("recruit", recruit.id)
            recruit.x, recruit.y = npc.x + recruit.place_offset[1], npc.y + recruit.place_offset[2]
            npc.visible = true
            for i, npc in ipairs(self.placeable) do
                npc.talksprite = "idle"
            end

            -- DEBUG
            print("Recruit: "..recruit.id)
            print("Flag: "..npc:getFlag("recruit"))
            print("Offset X: " ..recruit.place_offset[1].. " Offset Y: "..recruit.place_offset[2]) -- This is not working idk why
        
            -- Remove FX
            if self.flash_fx then
                self.placeable[self.place_selected]:removeFX(self.flash_fx)
            end

            self.state = "INFO"
            self.recruit_box:setPosition(80, 70)
            self.recruit_box.visible = true
            if self.preview then self.preview:remove() end
        end
    end

    if Input.pressed("cancel", false) then
        -- Go back to the overworld
        if self.state == "SELECT" then
            Game.lock_movement = true
            local tx, ty = Game.world.camera:getTargetPosition()
            Game.world.camera:panTo(tx, ty, 0.5, "out-quint", function ()
                Game.world:setCameraAttached(true)
                Game.lock_movement = false
            end)
            self.recruit_box:remove()
            self:remove()
            Game.world:closeMenu()
        -- Go back to the SELECT menu
        elseif self.state == "INFO" then
            self.state = "SELECT"
            self.selected_page = math.ceil(self.selected / 9)
            self.recruit_box:setPosition(370, 75)
        -- Go back to the INFO menu
        else
            self.state = "INFO"
            self.recruit_box:setPosition(80, 70)
            self.recruit_box.visible = true

            for i, npc in ipairs(self.placeable) do
                if i == self.place_selected then
                    if npc.id == "recruitplace" then
                        npc.visible = true
                    end
                end
            end
            if self.preview then
                self.preview:remove()
            end
        end
    end
    
    -- Update the heart target position
    if self.state == "SELECT" then
        self.heart_target_x = 58
        self.heart_target_y = 114 + (self.selected - (self.selected_page - 1) * 9 - 1) * 35
    elseif self.state == "INFO" then
        self.heart_target_x = 58
        self.heart_target_y = 416
    else -- PLACE phase
        local selected_recruit = self.placeable[self.place_selected]
        
        -- Adjust for the camera position 
        -- This is of course NOT GOOD LOL "820" is a hardcoded value that "kinda works"
        -- But we need to find a way to account for the extra pixels acquired after the camera moved on the x axis
        self.heart_target_x = selected_recruit.x - 800  -- Game.world.camera.x? -> (Doesn't work)
        self.heart_target_y = selected_recruit.y - 12
    end
    
    -- Move the heart closer to the target
    if (math.abs((self.heart_target_x - self.heart.x)) <= 2) then
        self.heart.x = self.heart_target_x
    end
    if (math.abs((self.heart_target_y - self.heart.y)) <= 2) then
        self.heart.y = self.heart_target_y
    end
    self.heart.x = self.heart.x + ((self.heart_target_x - self.heart.x) / 2) * DTMULT
    self.heart.y = self.heart.y + ((self.heart_target_y - self.heart.y) / 2) * DTMULT

    super.super.update(self)
end

function RecruitMenuPlace:draw()
    love.graphics.setFont(self.font)
    
    if self.state == "SELECT" then
        love.graphics.setLineWidth(4)

        -- Right Box
        Draw.setColor(PALETTE["world_border"])
        love.graphics.rectangle("line", 32, 12, 267, 427)
        Draw.setColor(PALETTE["world_fill"])
        love.graphics.rectangle("fill", 32, 12, 267, 427)
        -- Title
        Draw.setColor(COLORS["white"])
        love.graphics.print("Recruits", 80, 30)
        Draw.setColor({0,1,0})

        -- Left Box
        Draw.setColor(PALETTE["world_border"])
        love.graphics.rectangle("line", 332, 12, 287, 427)
        Draw.setColor(PALETTE["world_fill"])
        love.graphics.rectangle("fill", 332, 12, 287, 427)

        -- Text
        local offset = 0
        for i,recruit in pairs(self.recruits) do
            if i <= self:getLastSelectedInPage() and i >= self:getFirstSelectedInPage() then
                Draw.setColor(COLORS["white"])
                if i == self.selected then
                    -- Right Box Text
                    Draw.printAlign(recruit:getName(), 473, 240, "center")
                    love.graphics.print("CHAPTER " .. recruit:getChapter(), 368, 280)
                    Draw.printAlign("LV " .. recruit:getLevel(), 576, 280, "right")
                    if Input.usingGamepad() then
                        love.graphics.print("More Info", 414, 320)
                        Draw.draw(Input.getTexture("confirm"), 380, 323, 0, 2, 2) 
                        love.graphics.print("Quit", 414, 352)
                        Draw.draw(Input.getTexture("cancel"), 380, 353, 0, 2, 2) 
                    else
                        love.graphics.print(Input.getText("confirm") .. ": More Info", 380, 320) -- [Z]
                        love.graphics.print(Input.getText("cancel") .. ": Quit", 380, 352) -- [X]
                    end
                    Draw.setColor(COLORS["yellow"])
                end
                -- Name list of the recruit in the Left Box
                local name = recruit:getName()
                love.graphics.print(name, 80, 100 + offset, 0, math.min(1, 12 / #name), 1)
                offset = offset + 35
            end
        end
        
        -- Arrows
        if self:getMaxPages() > 1 then
            Draw.setColor(1, 1, 1, 1)
            local offset = Utils.round(math.sin(Kristal.getTime() * 5)) * 2
            Draw.draw(self.arrow_left, 22 - offset, 213, 0, 2, 2)
            Draw.draw(self.arrow_right, 295 + offset, 213, 0, 2, 2)
        end

        -- Draw Sprite Box Outline
        love.graphics.setLineWidth(1)
        Draw.setColor(PALETTE["world_border"]) --  TEST COLOR (RED) -> (1, 0, 0, 1)
        love.graphics.rectangle("line", self.recruit_box.x, self.recruit_box.y, self.recruit_box.width + 1, self.recruit_box.height + 1)

    elseif self.state == "INFO" then
        -- Draw Single Box
        love.graphics.setLineWidth(4)
        Draw.setColor(PALETTE["world_border"])
        love.graphics.rectangle("line", 32, 12, 577, 437)
        Draw.setColor(PALETTE["world_fill"])
        love.graphics.rectangle("fill", 34, 14, 573, 433)
        
        -- Draw Single Box Text
        Draw.setColor(COLORS["white"])
        for i,recruit in pairs(self.recruits) do
            Draw.printAlign(self.selected .. "/" .. #self.recruits, 590, 30, "right", 0, 0.5, 1)
            if i == self.selected then
                love.graphics.print("CHAPTER " .. recruit:getChapter(), 300, 30, 0, 0.5, 1)
                love.graphics.print(recruit:getName(), 300, 70)
                love.graphics.setFont(self.description_font)
                Draw.printAlign(Game:hasRecruit(recruit.id) and recruit:getDescription() or "Not yet fully recruited", 301, 120, {["align"] = "left", ["line_offset"] = 4})
                love.graphics.setFont(self.font)
                
                love.graphics.print("LIKE", 80, 240)
                local like = recruit:getLike()
                love.graphics.print(Game:hasRecruit(recruit.id) and like or "?", 180, 240, 0, math.min(1, 21 / #like), 1)
                
                love.graphics.print("DISLIKE", 80, 280, 0, 0.81, 1)
                local dislike = recruit:getDislike()
                love.graphics.print(Game:hasRecruit(recruit.id) and dislike or "?", 180, 280, 0, math.min(1, 21 / #dislike), 1)

                love.graphics.print("?????", 80, 320, 0, 1.15, 1)
                love.graphics.print("?????????", 180, 320)
                love.graphics.print("?????", 80, 360, 0, 1.15, 1)
                love.graphics.print("?????????", 180, 360)
                if Input.usingGamepad() then
                    for i,recruit in pairs(self.recruits) do
                        if i == self.selected then
                            if recruit.recruit_amount == 1 and Game.world:getCharacter(recruit.id) then
                                Draw.setColor(PALETTE["world_gray"])
                                love.graphics.print("         Cannot Place", 80, 400)
                                Draw.setColor(PALETTE["world_text"])
                                love.graphics.print("         Return", 320, 400)
                                Draw.draw(Input.getTexture("cancel"), 80, 402, 0, 2, 2)
                                Draw.draw(Input.getTexture("cancel"), 320, 402, 0, 2, 2)
                            else
                                Draw.setColor(PALETTE["world_text"])
                                love.graphics.print("         Place", 80, 400)
                                love.graphics.print("         Return", 320, 400)
                                Draw.draw(Input.getTexture("confirm"), 80, 402, 0, 2, 2)
                                Draw.draw(Input.getTexture("cancel"), 320, 402, 0, 2, 2)
                            end
                        end
                    end
                else
                    for i,recruit in pairs(self.recruits) do
                        if i == self.selected then
                            if recruit.recruit_amount == 1 and Game.world:getCharacter(recruit.id) then
                                Draw.setColor(PALETTE["world_gray"])
                                love.graphics.print("Cannot Place", 80, 400)
                                Draw.setColor(PALETTE["world_text"])
                                love.graphics.print(Input.getText("cancel") .. ": Return", 320, 400)
                            else
                                Draw.setColor(PALETTE["world_text"])
                                love.graphics.print(Input.getText("confirm") .. ": Place", 80, 400)
	                            love.graphics.print(Input.getText("cancel") .. ": Return", 320, 400)
                            end
                        end
                    end
                end
                love.graphics.print("LEVEL", 525, 240, 0, 0.5, 1)
                Draw.printAlign(recruit:getLevel(), 590, 240, "right", 0, 0.5, 1)
                love.graphics.print("ATTACK", 518, 280, 0, 0.5, 1)
                Draw.printAlign(recruit:getAttack(), 590, 280, "right", 0, 0.5, 1)
                love.graphics.print("DEFENSE", 511, 320, 0, 0.5, 1)
                Draw.printAlign(recruit:getDefense(), 590, 320, "right", 0, 0.5, 1)
                Draw.printAlign("ELEMENT " .. recruit:getElement(), 590, 360, "right", 0, 0.5, 1)
            end
            
            Draw.setColor(1, 1, 1, 1)
            local offset = Utils.round(math.sin(Kristal.getTime() * 5)) * 2
            Draw.draw(self.arrow_left, 22 - offset, 218, 0, 2, 2)
            Draw.draw(self.arrow_right, 602 + offset, 218, 0, 2, 2)

            love.graphics.setLineWidth(1)
            Draw.setColor(PALETTE["world_border"])
            love.graphics.rectangle("line", self.recruit_box.x, self.recruit_box.y, self.recruit_box.width + 1, self.recruit_box.height + 1)
        end
    else
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, 121)
        love.graphics.setColor(PALETTE["world_text"])
        if Input.usingGamepad() then
            love.graphics.print("         Place", 20, 20)
            love.graphics.print("         Return", 40, 40)
            Draw.draw(Input.getTexture("confirm"), 80, 402, 0, 2, 2)
            Draw.draw(Input.getTexture("cancel"), 320, 402, 0, 2, 2)
        else
            love.graphics.print(Input.getText("confirm") .. ": Place   ".. Input.getText("cancel") .. ": Return", 20, 20)
        end
    end

    -- Call grandparent draw event
    super.super.draw(self)
end

return RecruitMenuPlace