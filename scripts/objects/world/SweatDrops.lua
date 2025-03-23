local SweatDrops, super = Class(Sprite)

function SweatDrops:init(x, y, speed_x, speed_y, gravity, friction)
    super.init(self, "effects/sweat_drop", x, y, nil, nil, nil)

    self:setOrigin(0.5, 0.5)
    self.scale_x = 1
    self.scale_y = 1
    self.physics.speed_x = speed_x or (0.1 - Utils.random(-0.1)) * 3
    self.physics.speed_y = speed_y or (-0.2 - Utils.random(-0.2)) * 2
    self.physics.gravity = gravity or 0.03
    self.physics.friction = friction or 0.01
    self:setHitbox(0, 0, self.width, self.height)
end

function SweatDrops:update()
    super.update(self)
    local _, y = self:localToScreenPos()
    if y >= -4 then
        self:fadeOutAndRemove(1)
        return
    end
end

function SweatDrops:draw()
    super.draw(self)

    if DEBUG_RENDER and self.collider then
        self.collider:draw(0, 0, 1)
    end
end

return SweatDrops