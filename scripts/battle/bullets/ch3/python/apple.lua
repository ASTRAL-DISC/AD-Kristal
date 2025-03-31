local Apple, super = Class(HealBullet, "bullets/ch3/python/apple")

function Apple:init(x, y)
    super.init(self, x, y, "bullets/ch3/python/apple")

    self.timer = Timer()
    self.apple = true

    self:setScale(0)
    self.timer:tween(0.5, self, {scale_x = 2, scale_y = 2}, 'out-sine')

    self:addChild(self.timer)
end

function Apple:onWaveSpawn(wave)
	self.wave = wave
end

function Apple:remove(...)
	self.wave.apple = nil
	return super.remove(self, ...)
end

return Apple