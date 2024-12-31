---@class FMPillar : Object
---@overload fun(...) : FMPillar
local FMPillar, super = Class(Object)

function FMPillar:init(fountain_x, fountain_y)
    super.init(self, fountain_x, fountain_y, 0, 0)

    self.fountain_x = fountain_x
    self.fountain_y = fountain_y
    
    self.timer = 0

    self.xballtimer = 0
    self.yballtimer = 0
    self.balltimer = 0

    self.ballcon = 1

    self.inverttimer = 0
    self.releasetimer = 0

    self.whitecolor = {1, 1, 1}

    self.mult = 1/3
end

function FMPillar:drawEllipse(left, top, right, bottom)
    local rx = (right - left) / 2
    local ry = (bottom - top) / 2
    local x = left + rx
    local y = top  + ry
    love.graphics.ellipse("fill", x, y, rx, ry, 24)
end

function FMPillar:update()
    super.update(self)
end

function FMPillar:draw()
    super.draw(self)

    local cenx = 0
    local ceny = 0

    if self.ballcon == 1 then
        self.xballtimer = self.xballtimer + self.xballtimer + DTMULT -- toby what
        self.yballtimer = self.yballtimer + DTMULT
        self.balltimer = self.balltimer + DTMULT
        Draw.setColor(1, 1, 1)
        self:drawEllipse((cenx - self.xballtimer) * 2, (ceny - 1) * 2, (cenx + self.xballtimer) * 2, (ceny + 1) * 2)
        if (self.xballtimer >= 80) then
            self.balltimer = 0
            self.yballtimer = 1
            self.ballcon = 2
            self.whitecolor = {1, 1, 1}
        end
    end

    if (self.ballcon == 2) then
        self.balltimer = self.balltimer + 1
        if (self.balltimer > 160) then
            self.inverttimer = self.inverttimer + 1
        end
        if (self.inverttimer >= 90) then
            self.releasetimer = self.releasetimer + 1
        end
        if (self.inverttimer >= 0 and self.inverttimer < 60) then
            self.whitecolor = Utils.mergeColor({1, 1, 1}, {0, 0, 0}, (self.inverttimer / 60))
        end
        self.xballtimer = self.xballtimer * 0.5
        if (self.releasetimer <= 10) then
            if (self.xballtimer <= 20) then
                self.xballtimer = 20
            end
            if (self.xballtimer < (self.yballtimer / 6)) then
                self.xballtimer = self.yballtimer / 6
            end
            if (self.yballtimer >= 98) then
                self.yballtimer = 99 + Utils.random(5)
            end
            self.yballtimer = self.yballtimer * 3
        else
            self.yballtimer = self.yballtimer * 3
            if (self.releasetimer >= 20) then
                self.ballcon = 3
                --fountain_sound = audio_play_sound(snd_deep_noise, 50, true)
                -- when self.ballcon gets set to 3, a new ball gets spawned every frame lower down. i'm leaving that out for now
            end
        end

        Draw.setColor(1, 1, 1)
        self:drawEllipse((cenx - self.xballtimer - 2) * 2 * self.mult, (ceny - self.yballtimer) * 2, (cenx + self.xballtimer + 2) * 2 * self.mult, (ceny + 1) * 2)
        Draw.setColor(self.whitecolor)
        self:drawEllipse((cenx - self.xballtimer) * 2 * self.mult, (ceny - self.yballtimer) * 2, (cenx + self.xballtimer) * 2 * self.mult, (ceny + 1) * 2)
    end
end

return FMPillar