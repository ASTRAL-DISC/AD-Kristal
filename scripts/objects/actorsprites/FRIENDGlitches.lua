local Glitches, super = Class("FRIENDPart")

function Glitches:init(x, y, ox, oy, rot)
    super.init(self, "npcs/ch6/friend/cat/glitches", x, y, 17, 26)
    self.animating = true
    self.anim_timer = 0
    self.anim_speed = 0.2

    if ox > 1 or oy > 1 then
        self.sprite:setRotationOriginExact(ox, oy)
    else
        self.sprite:setRotationOrigin(ox, oy)
    end
    self.sprite:setScaleOrigin(self.sprite:getRotationOrigin())
    self.swing_rotation = rot or 0
end

function Glitches:update()
    if self.animating then
        self.anim_timer = self.anim_timer + DT
        if self.anim_timer > self.anim_speed then
            self.anim_timer = self.anim_timer - self.anim_speed
            self.sprite:setFrame(self.sprite.frame % 3 + 1)
        end
    end
    super.update(self)
end

function Glitches:setFrame(num)
    self.sprite:setFrame(num)
end

return Glitches