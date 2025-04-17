-- by Nyako, from Testmod
local BlueSoul, super = Class(Soul)

function BlueSoul:init(x, y)
    super.init(self, x, y)

    self.color = COLORS.blue
    self.speed = 5

    self.jumpstage = 2
    self.slam_pain = false

    self.speed_x = 0
    self.speed_y = 0

    self.rotation = math.rad(0)

    self.can_invert = true
    self.cooldown = 0
end

function BlueSoul:invertGravity()
    if self.cooldown >= 1 then
        if self.rotation == math.rad(0) then
            self.rotation = math.rad(180)
            self.speed_y = 11
        else
            self.rotation = math.rad(0)
            self.speed_y = 11
        end

        local afterimage = AfterImage(self, 0.5)
        afterimage.graphics.grow = 0.3
        afterimage:setLayer(self.layer - 1)
        self:addChild(afterimage)

        Assets.stopAndPlaySound("boost", 0.7, 1.2)
        Assets.stopAndPlaySound("jump")
        self.color = {0, 0, 1 * 0.5}
    end
end

function BlueSoul:update()
    super.update(self)

    self.cooldown = Utils.approach(self.cooldown, 0, DT)

    if self.cooldown == 0 and not self.can_invert then
        self.can_invert = true
        local flash = FlashFade(self.sprite.texture, -10, -10)
        flash.flash_speed = 0.7
        flash.alpha = 0
        flash.layer = 100
        self:addChild(flash)
        Assets.stopAndPlaySound("bell_bounce_short")
        self.color = COLORS.blue
    end
end

function BlueSoul:doMovement()
    local speed = (self.speed + 1)

    if (Input.down("cancel")) then
        speed = (self.speed + 1) / 2
    end

    local move_x, move_y = 0, 0

    if (self.rotation >= math.rad(45) and self.rotation < math.rad(135)) or
         (self.rotation >= math.rad(225) and self.rotation < math.rad(315)) then
        if (Input.down("up")) then self:move(0, -speed, DTMULT) move_y = -1 end
        if (Input.down("down")) then self:move(0, speed, DTMULT) move_y =  1 end
    else
        if (Input.down("left")) then self:move(-speed, 0, DTMULT) move_x = -1 end
        if (Input.down("right")) then self:move(speed, 0, DTMULT) move_x =  1 end
    end

    if (Input.down(Utils.facingFromAngle(self.rotation - math.rad(90))) and self.speed_y == 0 and self.jumpstage == 1) then
        self.jumpstage = 2;
        self.speed_y = -6;
    end

    if (self.jumpstage == 2) then
        if ((not Input.down(Utils.facingFromAngle(self.rotation - math.rad(90)))) and self.speed_y <= -1) then
            self.speed_y = -1
        end

        if ((self.speed_y > 0.5) and (self.speed_y < 8)) then
            self.speed_y = self.speed_y + 0.6 * DTMULT
        end
        if ((self.speed_y > -1) and (self.speed_y <= 0.5)) then
            self.speed_y = self.speed_y + 0.2 * DTMULT
        end
        if ((self.speed_y > -4) and (self.speed_y <= -1)) then
            self.speed_y = self.speed_y + 0.5 * DTMULT
        end
        if ((self.speed_y <= -4)) then
            self.speed_y = self.speed_y + 0.2 * DTMULT
        end
    end

    local new_speed_x = math.cos(math.rad(math.deg(self.rotation) + 90))
    local new_speed_y = math.sin(math.rad(math.deg(self.rotation) + 90))

    if (math.abs(new_speed_x) < 0.001) then new_speed_x = 0 end
    if (math.abs(new_speed_y) < 0.001) then new_speed_y = 0 end

    local moved, collided = self:move(new_speed_x, new_speed_y, self.speed_y * DTMULT)

    if (collided) then
        if (self.speed_y > 10) then
            Assets.stopAndPlaySound("hurt")
            Assets.stopAndPlaySound("impact")
            Game.battle:shakeCamera(self.speed_y / 3, self.speed_y / 3, 1)
        end
        self.speed_y = 0
        self.jumpstage = 1
    elseif (not collided and self.jumpstage == 1) then
        self.jumpstage = 2
        self.speed_y = 0.5
    end

    self.moving_x = move_x
    self.moving_y = move_y

    if Input.pressed("confirm") then
        if self.cooldown == 0 then
            self.cooldown = 1
            self.can_invert = false
            self:invertGravity()
        else
            Assets.stopAndPlaySound("ui_cant_select")
            self:shake(3)
        end
    end
end

return BlueSoul