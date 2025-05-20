-- code by J.A.R.U. and Agent 7
---@class DojoBG : Object
---@overload fun(...) : DojoBG
local DojoBG, super = Class(Object)

function DojoBG:init(color, fill)
    super.init(self)
    self.color = color
    self.fill = fill or {0, 0, 0}
	self.offset = 0
    self.speed = 0.5
    self.size = 50
    self.layer = BATTLE_LAYERS["bottom"]
    Game.battle.discoball = Discoball()
    Game.battle:addChild(Game.battle.discoball)
end

function DojoBG:update()
    super.update(self)
    self.fade = Game.battle.transition_timer / 10
    self.offset = self.offset + self.speed * DTMULT
	
    if self.offset >= 100 then
        self.offset = self.offset - 100
    end
end

function DojoBG:draw()
    super.draw(self)

    local r,g,b,a = unpack(self.fill)
    Draw.setColor(r,g,b, a or self.fade)
    love.graphics.rectangle("fill", -10, -10, SCREEN_WIDTH+10, SCREEN_HEIGHT+10)

    local r,g,b,a = unpack(self.color)
    Draw.setColor(r,g,b, a or self.fade)
    for x = 0, 1, 50 do
        for y = 0, 1, 50 do
            local dojo = Assets.getTexture("bg/battle/dojo")
            Draw.draw(dojo, SCREEN_WIDTH/2, (SCREEN_HEIGHT/2)-75, 0, (2 + math.sin(self.offset/2) * 0.008), (2 + math.cos(self.offset/2) * 0.008), dojo:getWidth()/2, dojo:getHeight()/2)
        end
    end

    Draw.setColor(0, 0, 0, Game.battle.background_fade_alpha)
    Draw.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
end

return DojoBG