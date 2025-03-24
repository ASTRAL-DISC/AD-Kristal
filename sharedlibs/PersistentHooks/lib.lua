local Lib = {}

function Lib:init()
    self:loadDebugHooks()
    self:loadEncounterHooks()
    self:loadBattleHooks()
end

function Lib:loadDebugHooks()
    -- DebugSystem Custom Menus
    Utils.hook(DebugSystem, "registerSubMenus", function(orig, self)
        orig(self)

        self:registerOption("main", "Heal Party", "Heal the whole party to max health.", function ()
            if Game.battle then
                for _,party in ipairs(Game.battle.party) do
                    party:heal(math.huge)
                end
            else
                for i, chara in ipairs(Game.party) do
                    local prev_health = chara:getHealth()
                    chara:heal(math.huge, false)
                    local amount = chara:getHealth() - prev_health
        
                    if not Game:isLight() and Game.world.healthbar then
                        local actionbox = Game.world.healthbar.action_boxes[i]
                        local text = HPText("+" .. amount, Game.world.healthbar.x + actionbox.x + 69, Game.world.healthbar.y + actionbox.y + 15)
                        text.layer = WORLD_LAYERS["ui"] + 1
                        Game.world:addChild(text)
                    end
                end
        
                Assets.stopAndPlaySound("power")
            end
        end)

        self:registerOption("main", "Give Money", "Give money to party.", function ()
            self.window = DebugWindow("Enter Money", "Enter the money amount you'd like.", "input", function (text)
                local money = tonumber(text)
                if money then
                    if Game:isLight() then
                        Game.lw_money = Game.lw_money + money
                    else
                        Game.money = Game.money + money
                    end
                    Assets.stopAndPlaySound("cash")
                end
            end)
            self.window:setPosition(Input.getCurrentCursorPosition())
            self:addChild(self.window)
        end)
    end)
end

function Lib:loadEncounterHooks()
    -- HailGuard (Used once per encounter, as a spell)
    Utils.hook(Encounter, "init", function(orig, self)
        orig(self)

        self.hail_used = false
    end)

    Utils.hook(Encounter, "onBattleEnd", function(orig, self)
        orig(self)

        if self.hail_used == true then
            self.hail_used = false
        end
    end)
end

function Lib:loadBattleHooks()
    -- HailGuard (Used with a cooldown, as a Power Act)
    Utils.hook(Battle, "addMenuItem", function(orig, self, tbl)
        local tbl = orig(self, tbl)
        for _,battler in ipairs(self.party) do
            if battler.shield > 0 then
                if tbl.name == "HailGuard" then
                    tbl.unusable = true
                    tbl.color = {0.5, 0.5, 0.5, 1}
                    tbl.description = "Cooldown"
                end
            end
        end
        return tbl
    end)
end

return Lib