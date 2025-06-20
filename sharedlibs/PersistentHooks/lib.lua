local Lib = {}

function Lib:init()
    self:loadEncounterHooks()
    self:loadBattleHooks()
end

function Lib:loadEncounterHooks()
    -- HailGuard (Used once per encounter)
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
    -- HailGuard (Used once per battle, as a Power Act)
    Utils.hook(Battle, "addMenuItem", function(orig, self, tbl)
        local tbl = orig(self, tbl)
        if self.encounter.hail_used and tbl.name == "HailGuard" then
            tbl.unusable = true
            tbl.color = {0.5, 0.5, 0.5, 1}
            tbl.description = "Cooldown\nPer Battle"
        end
        return tbl
    end)

    -- Discoball
    Utils.hook(Battle, "onStateChange", function(orig, self, old, new)
        orig(self, old, new)
        
        if self.discoball then
            if new == "TRANSITION" then
                self.discoball.y = 0
            elseif new == "ACTIONSELECT" then
                self.discoball.tweendir = 1
            elseif new == "ENEMYDIALOGUE" or new == "DEFENDINGBEGIN" then
                self.discoball.tweendir = -1
            elseif new == "VICTORY" or new == "TRANSITIONOUT" then
                if self.discoball.y == 0 then
                    self.discoball.y = 0
                else
                    self.discoball.tweendir = 1
                end
            end
        end
    end)
end

return Lib