local Plush, super = Class(Event, "plush")

function Plush:init(data)
    super.init(self, data)

    local properties = data.properties or {}

    self.sprite = properties["sprite"]
    self.plushflag = properties["plushflag"] or nil

    self:setSprite("world/events/plushies/" .. self.sprite)
	
	self.solid = true

    self:addChild(self.sprite)

    local width, height = self:getSize()
    self:setHitbox(0, math.ceil(height / 4) * 2, width, math.floor(height / 4) * 2)

    self:setScale(1)
    self.sprite:setScaleOrigin(0.5, 0.5)
    self.sprite.x = self.sprite.width / 2
    self.sprite.y = self.sprite.height / 2
    self:setOrigin(0.5, 1)
end

function Plush:onInteract(player, dir)
    Assets.playSound("squeaky")
    Game.world.timer:tween(0.1, self.sprite, {scale_x = self.sprite.scale_x - 0.4}, "in-out-circ", function ()
        Game.world.timer:tween(0.1, self.sprite, {scale_y = self.sprite.scale_y - 0.4}, "in-out-circ")
    end)
    Game.world.timer:after(0.1, function()
        Game.world.timer:tween(0.4, self.sprite, {scale_x = self.sprite.scale_x + 0.4, scale_y = self.sprite.scale_y + 0.4}, "in-out-back")
    end)
    if self.plushflag then
        Game:setFlag(self.plushflag, true)
    end

    return true
end

return Plush