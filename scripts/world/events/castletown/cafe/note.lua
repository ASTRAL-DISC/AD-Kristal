-- original code by Sam
local Note, super = Class(Event, "note")

function Note:init(data)
    super.init(self, data.x, data.y, {20, 20})

    self.speed = 60
    self.note_position = 0

    self:setScale(1)
    self:setOrigin(0.5, 1)
end

function Note:update()
    super.update(self)

    self.note_position = self.note_position + (self.speed * DTMULT)

    -- If it's going too fast, slow it down
   -- if self.note_position then
   --     self.note_position = 0
    --end
end

function Note:draw()
    super.draw(self)

    love.graphics.draw(Assets.getTexture("effects/note"), math.rad(self.note_position), math.rad(-self.note_position), 0, 1, 1, 6, 6)
end

return Note