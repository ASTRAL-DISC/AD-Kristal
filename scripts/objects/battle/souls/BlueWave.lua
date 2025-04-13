local BlueWave, super = Class(Wave)

function BlueWave:init()
    super.init(self)
end

function BlueWave:onStart()
    local arena = Game.battle.arena
    local soul = Game.battle.soul
    
    soul.wave = self

    if not Game.battle.soul.transitioning then
        Game.battle:swapSoul(BlueSoul())
    end
end

function BlueWave:update()
    local arena = Game.battle.arena
    local soul = Game.battle.soul
    
    soul.wave = self
end

function BlueWave:beforeEnd()
    if not Game.battle.soul.transitioning then
        Game.battle:swapSoul(Soul())
    end
end

return BlueWave