---@class DefaultBG : Object
---@overload fun(...) : DefaultBG
local DefaultBG, super = Class(Object)

function DefaultBG:init(color, back_color, fill)
    super.init(self)
    self.color = color
    self.back_color = back_color or color
    self.fill = fill or {0, 0, 0}
	self.offset = 0
    self.speed = 1
    self.size = 50
	self.layer = BATTLE_LAYERS["bottom"]
	self.alpha_fx = self:addFX(AlphaFX())
end

function DefaultBG:update(dt)
    super.update(self, dt)
    self.fade = Game.battle.transition_timer / 10
	self.offset = self.offset + self.speed*DTMULT

    if self.offset > self.size*2 then
        self.offset = self.offset - self.size*2
    end
	
	self.alpha_fx.alpha = Game.battle.transition_timer / 10
end

function DefaultBG:draw()
    super.draw(self)

    self:drawFill()
	self:drawBack()
	self:drawFront()

    Draw.setColor(0, 0, 0, Game.battle.background_fade_alpha)
    Draw.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
end

function DefaultBG:drawFill()
    local r,g,b,a = unpack(self.fill)
    love.graphics.setColor(r,g,b, a or self.fade)
    love.graphics.rectangle("fill", -8, -8, SCREEN_WIDTH+16, SCREEN_HEIGHT+16)
end

function DefaultBG:drawBack()
    local r,g,b,a = unpack(self.back_color)
    love.graphics.setColor(r,g,b, a or self.fade/2)
	for x = -100, 740, 50 do
		for y = -100, 580, 50 do
			defaultbg = Assets.getTexture("bg/battle/default")
			love.graphics.draw(defaultbg, x + self.offset/2, y + self.offset/2 + 10)
		end
	end
end

function DefaultBG:drawFront()
    local r,g,b,a = unpack(self.color)
    love.graphics.setColor(r,g,b, a or self.fade)
	for x = 0, 740, 50 do
		for y = 0, 580, 50 do
			defaultbg = Assets.getTexture("bg/battle/default")
			love.graphics.draw(defaultbg, x - self.offset, y - self.offset)
		end
	end
end

return DefaultBG