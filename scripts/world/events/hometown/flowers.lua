local Flowers, super = Class(Event, "flowers")

function Flowers:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

	self:setScale(1)
    self:setOrigin(0.5, 0.5)
	
	self.solid = true
    if Game.chapter == 1 then
        self:setSprite("world/events/hometown/flowers/roses")
    elseif Game.chapter == 2 then
        self:setSprite("world/events/hometown/flowers/tulips")
    elseif Game.chapter == 3 then
        self:setSprite("world/events/hometown/flowers/sunflower")
    else
        self:setSprite("world/events/hometown/flowers/carnations")
    end
end

function Flowers:onInteract(chara, dir)
	if Game.chapter == 3 then
	    Game.world:startCutscene(function(cutscene)
            cutscene:text("* (It's a sunflower in\na glass container.)")
        end)
    else
        Game.world:startCutscene(function(cutscene)
            cutscene:text("* (It's a bunch of carnations in\na glass container.)")
        end)
    end
    return true
end

return Flowers