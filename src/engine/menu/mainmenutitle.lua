---@class MainMenuTitle : StateClass
---
---@field menu MainMenu
---
---@field logo love.Image
---@field has_target_saves boolean
---
---@field options table
---@field selected_option number
---
---@overload fun(menu:MainMenu) : MainMenuTitle
local MainMenuTitle, super = Class(StateClass)

function MainMenuTitle:init(menu)
    self.menu = menu

    self.logo = Assets.getTexture("ad/logo_disc")
    self.disc = Assets.getTexture("ad/disc")
    self.trademark = Assets.getTexture("ad/logo_nihilab")

    self.selected_option = 1

    self.siner = 0
end

function MainMenuTitle:registerEvents()
    self:registerEvent("enter", self.onEnter)
    self:registerEvent("keypressed", self.onKeyPressed)
    self:registerEvent("update", self.update)
    self:registerEvent("draw", self.draw)
end

-------------------------------------------------------------------------------
-- Callbacks
-------------------------------------------------------------------------------

function MainMenuTitle:onEnter(old_state)
    self.has_target_saves = TARGET_MOD and Kristal.hasAnySaves(TARGET_MOD) or false

    if TARGET_MOD then
        self.options = {
            {"play",    self.has_target_saves and "LOAD DISC" or "INSERT DISC"},
            {"options", "OPTIONS"},
            {"credits", "CREDITS"},
            {"website", "WEBSITE"},
            {"quit",    "QUIT"},
        }
    else
        self.options = {
            {"play",      "Play a mod"},
            {"modfolder", "Open mods folder"},
            {"options",   "Options"},
            {"credits",   "Credits"},
            {"wiki",      "Open wiki"},
            {"quit",      "Quit"},
        }
    end

    if not TARGET_MOD then
        self.menu.selected_mod = nil
        self.menu.selected_mod_button = nil
    end

    self.menu.heart_target_x = 396
    self.menu.heart_target_y = 188 + 32 * (self.selected_option - 1)
end

function MainMenuTitle:onKeyPressed(key, is_repeat)
    if Input.isConfirm(key) then
        Assets.stopAndPlaySound("ui_select")

        local option = self.options[self.selected_option][1]

        if option == "play" then
            if not TARGET_MOD then
                self.menu:setState("MODSELECT")
				if MainMenu.mod_list:getSelectedMod() and MainMenu.mod_list:getSelectedMod().soulColor then
					MainMenu.heart.color = MainMenu.mod_list:getSelectedMod().soulColor
				end
            else
                if not Kristal.loadMod(TARGET_MOD, 1) then
                    error("Failed to load mod: " .. TARGET_MOD)
                end
            end

        elseif option == "modfolder" then
            -- FIXME: the game might freeze when using love.system.openURL to open a file directory
            if (love.system.getOS() == "Windows") then
                os.execute('start /B \"\" \"'..love.filesystem.getSaveDirectory()..'/mods\"')
            else
                love.system.openURL("file://"..love.filesystem.getSaveDirectory().."/mods")
            end

        elseif option == "options" then
            self.menu:setState("OPTIONS")

        elseif option == "credits" then
            self.menu:setState("CREDITS")

        elseif option == "wiki" then
            love.system.openURL("https://kristal.cc/wiki")

        elseif option == "website" then
            love.system.openURL("https://astraldisc.com/")

        elseif option == "quit" then
            love.event.quit()
        end

        return true
    end

    local old = self.selected_option
    if Input.is("up"   , key)                              then self.selected_option = self.selected_option - 1 end
    if Input.is("down" , key)                              then self.selected_option = self.selected_option + 1 end
    if Input.is("left" , key) and not Input.usingGamepad() then self.selected_option = self.selected_option - 1 end
    if Input.is("right", key) and not Input.usingGamepad() then self.selected_option = self.selected_option + 1 end
    if self.selected_option > #self.options then self.selected_option = is_repeat and #self.options or 1 end
    if self.selected_option < 1             then self.selected_option = is_repeat and 1 or #self.options end

    if old ~= self.selected_option then
        Assets.stopAndPlaySound("ui_move")
    end

    self.menu.heart_target_x = 396
    self.menu.heart_target_y = 188 + (self.selected_option - 1) * 32
end

function MainMenuTitle:update()
    self.siner = self.siner + 1 * DTMULT
end

function MainMenuTitle:draw()
    Draw.setColor(1, 1, 1, 1)

    local logo_img = self.menu.selected_mod and self.menu.selected_mod.logo or self.logo
    local scale = math.sin(self.siner / 20) * 1

    --Draw.draw(logo_img, SCREEN_WIDTH/2 - logo_img:getWidth()/2, 105 - logo_img:getHeight()/2)
    Draw.draw(self.disc, SCREEN_WIDTH/2 - self.disc:getWidth()/2 + 10, SCREEN_HEIGHT/2, 0, scale, 1, self.disc:getWidth()/2, self.disc:getHeight()/2)
    Draw.setColor(1, 1, 1, 0.5)
    Draw.draw(self.trademark, SCREEN_WIDTH - self.trademark:getWidth() - 4, SCREEN_HEIGHT - self.trademark:getHeight() - 4)

    Draw.setColor(0, 0.8, 0, 1)

    for i, option in ipairs(self.options) do
        Draw.printShadow(option[2], 415, 169 + 32 * (i - 1))
    end
end

-------------------------------------------------------------------------------
-- Class Methods
-------------------------------------------------------------------------------

function MainMenuTitle:selectOption(id)
    for i, options in ipairs(self.options) do
        if options[1] == id then
            self.selected_option = i

            self.menu.heart_target_x = 396
            self.menu.heart_target_y = 188 + (self.selected_option - 1) * 32

            return true
        end
    end

    return false
end

return MainMenuTitle
