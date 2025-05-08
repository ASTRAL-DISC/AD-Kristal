local DojoFX, super = Class(Event, "dojofx")

function DojoFX:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})

    self.solid = false

    self.count = 12
    self.light_count = 16
    self.siner = 0
    self.bsiner = 0

    self.discoball = Discoball()
    self.discoball.layer = self.layer + 1
    self.discoball.y = 0
    self:addChild(self.discoball)

    self.spotlight = Spotlight(self.discoball.x, self.discoball.y + 200, {
        width = 150,
        beam_height = 120,
        top_color = {1, 1, 1, 0.5},
        bottom_color = {1, 1, 1, 0.0},
    })
    self:addChild(self.spotlight)
end

function DojoFX:draw()
    self.siner = self.siner + DTMULT
    self.bsiner = self.bsiner + DTMULT

    if self.bsiner >= 80 then
        self.bsiner = self.bsiner - 80
    end
	
    for i = 0, self.light_count - 1 do
        Draw.setColor({self.discoball:HSV(self.discoball.hue, 1, 1)}, 0.5)
        local sino = math.sin(((i / 2) + (self.siner / 48)))
        love.graphics.circle("fill", ((SCREEN_WIDTH/2) + (sino * 200)), ((self.y + 60) + (math.sin((i / 4)) * 20)), (16 + (math.abs(sino) * 12)))
    end
	
    for i = 0, self.count - 1 do
        local x = 4
        local y = ((-240 + self.y) + (i * 80)) - self.bsiner

        local frames = Assets.getFrames("world/events/castletown/dojo/boombox")
        local frame = math.floor(self.siner / 8) + 1
        frame = Utils.clampWrap(frame, #frames)
        Draw.setColor(self.discoball:HSV(self.discoball.hue, 1, 1))
        Draw.draw(frames[frame], x, y, 0, 2, 2)

        local x2 = 570
        local y2 = ((-240 + self.y) + (i * 80)) + self.bsiner

        local frames2 = Assets.getFrames("world/events/castletown/dojo/boombox")
        local frame2 = math.floor(self.siner / 8) + 1
        frame2 = Utils.clampWrap(frame2, #frames2)
        Draw.setColor(self.discoball:HSV(self.discoball.hue, 1, 1))
        Draw.draw(frames2[frame2], x2, y2, 0, 2, 2)
    end
	
    super.draw(self)
end

return DojoFX