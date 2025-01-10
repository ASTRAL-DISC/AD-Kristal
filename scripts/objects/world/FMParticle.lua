-- original code by Dobby233Liu
local FMParticle, super = Class(Sprite)

function FMParticle:init(x, y)
    super.init(self, "effects/fountainmake/flash", x, y, nil, nil, nil)

    self:setOrigin(0.5, 0.5)
    self:play(5/30, true)

    self.scale_x = 0.07
    self.scale_y = 0.07
    self.color = COLORS["white"]
    self.physics.speed_x = (-1 + Utils.random(2)) * 10
    self.physics.speed_y = (2 + Utils.random(-1)) * 2
    self.physics.gravity = (0.06 - Utils.random(0.02))
    self.physics.gravity_direction = math.rad(360 + (85 + Utils.random(10)))
    self.physics.friction = 0.05
    self:setHitbox(0, 0, self.width, self.height)

    self.size = 1
    self.graphics.grow = 0.06

    self.afterimage_delay = 0
end

function FMParticle:update()
    if self.afterimage_delay == 5 then
        local afterimage = AfterImage(self, 0.5)
        self:addChild(afterimage)
        self.afterimage_delay = 0
    else
        self.afterimage_delay = self.afterimage_delay + 1
    end
    
    super.update(self)

    self.size = self.size + 0.5 * DTMULT
    local _, y = self:localToScreenPos()
    if y <= -20 - self.size then
        self:remove()
        return
    end
end

function FMParticle:draw()
    super.draw(self)

    if DEBUG_RENDER and self.collider then
        self.collider:draw(0, 0, 1)
    end
end

return FMParticle