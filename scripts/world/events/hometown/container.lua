local Container, super = Class(Event, "container")

function Container:init(data)
	super.init(self, data.x, data.y, {data.w, data.h})

    local properties = data.properties or {}

    self:setOrigin(0.5, 0.5)
    self:setScale(1)

	self.sprite = properties["sprite"] or nil
	self.sprite_name = properties["sprite"] or "golden"

    if not self.sprite then
		self:setSprite("world/events/hometown/containers/golden")
	else
    	self:setSprite("world/events/hometown/containers/" .. self.sprite)
	end

    self:addChild(self.sprite)

	local width, height = self:getSize()
    self:setHitbox(0, math.ceil(height / 4) * 2, width, math.floor(height / 4) * 2)

    self.solid = false
end

function Container:onInteract(player, dir)
	Game.world:startCutscene(function(cutscene)
		cutscene:text("* (It's a " ..self.sprite_name.. " flower,\n[wait:5]protected in a container...)")
	end)

    return true
end

return Container