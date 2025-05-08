local Bunker, super = Class(Event, "bunker")

function Bunker:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})

	self:setScale(0.5)
    self:setOrigin(0.5, 0.5)
	
	self.solid = false
    if Game:getFlag("bunker_opened") then
        self:setSprite("world/events/hometown/bunker/open")
    elseif Game:getFlag("bunker_no_vines") then
        self:setSprite("world/events/hometown/bunker/open_b")
    else
        self:setSprite("world/events/hometown/bunker/closed")
    end
end

function Bunker:onInteract(chara, dir)
    if Game.chapter == 6 then
        Game.world:startCutscene("hometown/bunker.unlocked")
    else
        Game.world:startCutscene("hometown/bunker.locked")
    end
end

return Bunker