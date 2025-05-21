local FRIEND, super = Class(ActorSprite)

function FRIEND:init(actor)
    super.init(self, actor)

    self.path = "npcs/ch6/friend/cat"
    --self.type = self.path.."/cat"

    -- Idle
    self.glitches = FRIENDGlitches(-14, 30, 0.5, 0, 0)
    self.glitches.id = "glitches"
    self.glitches:setScale(0.95)
    self.glitches.layer = 11
    self:addChild(self.glitches)

    self.face = FRIENDPart(self.path.."/face", 49, 48, 1, 0, 0)
    self.face.id = "face"
    self.face.swing_range = {math.rad(-3), math.rad(1)}
    self.face.layer = 12
    self:addChild(self.face)

    self.head = FRIENDPart(self.path.."/head", 38, 26, 1, 0, 0)
    self.head.id = "head"
    self.head.swing_range = {math.rad(-2), math.rad(2)}
    self.head.layer = 10
    self:addChild(self.head)

    self.arm_l = FRIENDPart(self.path.."/arm", 54, 75, 0.7, 0, 0)
    self.arm_l.id = "arm_l"
    self.arm_l.layer = 9
    self.arm_l.swing_range = {math.rad(-8), math.rad(10)}
    self:addChild(self.arm_l)

    self.leg_l = FRIENDPart(self.path.."/leg", 28, 79, 1, 0, 0)
    self.leg_l.id = "leg_l"
    self.leg_l.layer = 9
    self.leg_l.swing_range = {math.rad(-8), math.rad(10)}
    self:addChild(self.leg_l)

    self.tail = FRIENDPart(self.path.."/tail", -5, 45, -1, 0, 0)
    self.tail.id = "tail"
    self.tail.layer = 8
    self.tail.swing_range = {math.rad(-6), math.rad(6)}
    self:addChild(self.tail)

    self.body = FRIENDPart(self.path.."/body", 28, 60, 0.5, 0, 0)
    self.body.id = "body"
    self.body.layer = 7
    self.body.swing_range = {math.rad(-6), math.rad(8)}
    self:addChild(self.body)

    self.arm_r = FRIENDPart(self.path.."/arm", 32, 58, 0, 0, 0)
    self.arm_r.id = "arm_r"
    self.arm_r.layer = 6
    self.arm_r.swing_range = {math.rad(-10), math.rad(6)}
    self:addChild(self.arm_r)

    self.leg_r = FRIENDPart(self.path.."/leg", 14, 64, 1, 0, 0)
    self.leg_r.id = "leg_r"
    self.leg_r.layer = 6
    self.leg_r.swing_range = {math.rad(-10), math.rad(9)}
    self:addChild(self.leg_r)

    -- deltarune adds these parts in a very specific order which apparently influences swing speed
    self.parts = {
        self.leg_r,
        self.arm_r,
        self.body,
        self.tail,
        self.leg_l,
        self.arm_l,
        self.head,
        self.face,
        self.glitches
    }

    self.swing_speed = 1
    self.swing_range = {math.rad(-10), math.rad(10)}
    for i,part in ipairs(self.parts) do
        part.swing_speed = 1 + (i-1)/5
    end

    self.timer = Timer()
    self:addChild(self.timer)

    self.siner = 0
end

function FRIEND:update()
    super.update(self)

    --[[if (not self.anim) or (self.anim == "idle") then
        self.siner = self.siner + 1 * DTMULT

        self.face:setPosition(self.face.x, self.face.y + math.cos(self.siner / 3.99999))
        self.head:setPosition(self.head.x, self.head.y + math.cos(self.siner / 4))
        self.glitches:setPosition(self.glitches.x, self.glitches.y + math.cos(self.siner / 4))

        self.body:setPosition(self.body.x, self.body.y + math.cos(self.siner / 4))
        self.tail:setPosition(self.tail.x + math.cos(self.siner / 3), self.tail.y + math.cos(self.siner / 4.2))

        self.arm_l:setPosition(self.arm_l.x + math.sin(self.siner / 4), self.arm_l.y)
        self.arm_r:setPosition(self.arm_r.x + math.sin(self.siner / 3), self.arm_r.y + math.cos(self.siner / 2.8))

        self.leg_l:setPosition(self.leg_l.x, self.leg_l.y + math.cos(self.siner / 2.8))
        self.leg_r:setPosition(self.leg_r.x, self.leg_r.y + math.cos(self.siner / 2.7))
    end]]
end

function FRIEND:setAnimation(anim, ...)
    self.anim = anim
    if not ignore_actor then
        self.actor:onSetAnimation(self, anim, ...)
    end
end

function FRIEND:getPart(name)
    if isClass(name) then
        return name
    elseif self[name] then
        return self[name]
    else
        error("Part does not exist: "..name)
    end
end

function FRIEND:getPartIndex(part)
    if type(part) == "string" then
        part = self:getPart(part)
    end
    for i,other in ipairs(self.parts) do
        if other == part then
            return i
        end
    end
end

function FRIEND:setPartSprite(name, path)
    local part = self:getPart(name)
    part:setSprite(path)
end

function FRIEND:setPartRotation(name, rotation)
    local part = self:getPart(name)
    part.swing_rotation = rotation
end

function FRIEND:tweenPartRotation(name, rotation, time, ease)
    local part = self:getPart(name)
    self.timer:tween(time or 0.5, part, {swing_rotation = rotation}, ease or "linear")
end

function FRIEND:setPartScale(name, scale_x, scale_y)
    local part = self:getPart(name)
    part:setScale(scale_x, scale_y or scale_x)
end

function FRIEND:tweenPartScale(name, scale_x, scale_y, time, ease)
    local part = self:getPart(name)
    self.timer:tween(time or 0.5, part, {scale_x = scale_x, scale_y = scale_y or scale_x}, ease or "linear")
end

function FRIEND:setPartSwingSpeed(name, speed, keep_spin)
    local part = self:getPart(name)
    part.swing_speed = speed
    if speed == 0 then
        part.siner = 0
    end
    if keep_spin then
        part.swing_rotation = part.sprite.rotation
    end
end

function FRIEND:tweenPartSwingSpeed(name, speed, time, ease)
    local part = self:getPart(name)
    part.swing_speed = speed
    self.timer:tween(time or 0.5, part, {swing_speed = speed}, ease or "linear")
end

function FRIEND:setPartSwingRange(name, min, max)
    local part = self:getPart(name)
    if not max then
        part.swing_range = {-min, min}
    elseif min then
        part.swing_range = {min, max}
    else
        part.swing_range = nil
    end
end

function FRIEND:tweenPartSwingRange(name, min, max, time, ease)
    local part = self:getPart(name)
    if not max then
        min, max = -min, min
    end
    if not part.swing_range then
        part.swing_range = Utils.copy(self.swing_range)
    end
    self.timer:tween(time or 0.5, part.swing_range, {min, max}, ease or "linear")
end

function FRIEND:setPartSine(name, value)
    local part = self:getPart(name)
    part.siner = value or 0
end

function FRIEND:setSwingSpeed(speed)
    self.swing_speed = speed
end

function FRIEND:setSwingRange(min, max)
    if not max then
        self.swing_range = {-min, min}
    else
        self.swing_range = {min, max}
    end
end

function FRIEND:resetPart(name, full)
    local part = self:getPart(name)
    part:reset(full, self:getPartIndex(part))
end

function FRIEND:resetParts(full)
    self.swing_speed = 1
    for i,part in ipairs(self.parts) do
        part:reset(full, i)
    end
end

function FRIEND:setPartVisibility(name, visible)
    local part = self:getPart(name)
    part.visible = visible
end

function FRIEND:setPartAlpha(name, alpha)
    local part = self:getPart(name)
    part.alpha = alpha
end

return FRIEND