local RudyChair, super = Class(Event, "rudychair")

function RudyChair:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})

	self:setScale(1)
    self:setOrigin(0.5, 0.5)
	
	self.solid = true

    self:setSprite("world/events/hometown/hospital_chair")

    local width, height = self:getSize()
    self:setHitbox(0, math.ceil(height / 4) * 2, width, math.floor(height / 4) * 2)
    
    if Game.chapter == 7 then
        self:remove()
    end
end

function RudyChair:onInteract(chara, dir)
	Game.world:startCutscene("hometown/hospital.chair")
    return true
end

return RudyChair