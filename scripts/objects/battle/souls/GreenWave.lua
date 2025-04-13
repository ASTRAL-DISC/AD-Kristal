local GreenWave, super = Class(Wave)

function GreenWave:init()
    super.init(self)
end

function GreenWave:onStart()
    local arena = Game.battle.arena
    local soul = Game.battle.soul
    
    soul.wave = self

    self:setArenaSize(80)
    Game.battle.timer:tween(1, Game.battle.battle_ui, {y = Game.battle.battle_ui.y + 100}, "out-quint")

    if not Game.battle.soul.transitioning then
        Game.battle:swapSoul(GreenSoul())
    end

    Game.battle.soul.can_move = true
end

function GreenWave:onArenaEnter()
    Game.battle.soul.can_move = false
end

function GreenWave:update()
    local arena = Game.battle.arena
    local soul = Game.battle.soul
    
    soul.wave = self
end

function GreenWave:beforeEnd()
    if not Game.battle.soul.transitioning then
        Game.battle:swapSoul(Soul())
    end
end

function GreenWave:onEnd()
    Game.battle.timer:tween(1, Game.battle.battle_ui, {y = Game.battle.battle_ui.y - 100}, "out-quint")
end

return GreenWave