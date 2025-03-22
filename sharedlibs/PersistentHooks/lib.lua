local Lib = {}

function Lib:init()

end

function Lib:loadEncounterHooks()
    -- HailGuard (Used once per encounter, meant for Power Acts)
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

return Lib