local Lib = {}

function Lib:init()
    self:loadEncounterHooks()
    self:loadBattleHooks()
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