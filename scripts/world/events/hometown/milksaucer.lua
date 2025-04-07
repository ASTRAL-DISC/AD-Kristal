local MilkSaucer, super = Class(Event, "milksaucer")

function MilkSaucer:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

	self:setScale(1)
    self:setOrigin(0.5, 1)
	
	self.solid = true
    self:setSprite("world/events/hometown/milk_saucer")

    local width, height = self:getSize()
    self:setHitbox(0, math.ceil(height / 4) * 2, width, math.floor(height / 4) * 2)
end

function MilkSaucer:onInteract(player, dir)
    Game.world:startCutscene("hometown/alley.saucer")
end

return MilkSaucer