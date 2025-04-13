local GreenSoulShield, super = Class(Object)

function GreenSoulShield:init(x, y, sound)
    super.init(self, x, y)
	
    self.layer = BATTLE_LAYERS["above_bullets"]

    self.sprite = Sprite("player/shield", 0, 0)
    self.sprite:setColor({0.25, 0.25, 1})
    self.sprite:setScaleOrigin(0.5)
    self:addChild(self.sprite)
    self:setSize(self.sprite:getSize())

    self.sound = sound or "bell"

	self.rotation_origin_x = 0.5
	self.rotation_origin_y = 0.5
	
    self.physics = nil
	
	self.rotation_hitboxes = {
		["up"] 		= {self.width - 1, 0, 4, self.height},
		["right"]	= {0, 0, self.width, 4},
		["down"]	= {0, self.height - 1, self.width, 4},
		["left"]	= {0, 0, 4, self.height},
	}

	self:turn("right")
end

function GreenSoulShield:block(bullet)
    if Game.battle.soul.bubbled then
        Assets.stopAndPlaySound("glassbreak_echo", 1.2)
    else
        Assets.stopAndPlaySound(self.sound)
    end
    bullet:onBlock()
end

function GreenSoulShield:update()
    for _,bullet in ipairs(Game.stage:getObjects(GreenSoulBullet)) do
        if bullet:collidesWith(self.collider) then
            self:block(bullet)
            self.sprite:setColor({1, 0.18, 0})
            Game.battle.timer:tween(0.2, self.sprite, {color = {0.25, 0.25, 1}})
        end
    end
end

function GreenSoulShield:turn(direction)
	self.collider = Hitbox(self, unpack(self.rotation_hitboxes[direction or "right"]))
end

function GreenSoulShield:draw()
    super.draw(self)

    if DEBUG_RENDER and self.collider then
        self.collider:draw(1, 0, 0)
    end
end

function GreenSoulShield:bubble()
    if self.sprite then
        self.sprite:remove()
    end
    self.sprite = Sprite("player/shield_full", 0, 0)
    self.sprite:setColor({0.25, 0.25, 1})
    self.sprite:setScale(0)
    self.sprite:setScaleOrigin(0.5)
    self:addChild(self.sprite)
    self:setSize(self.sprite:getSize())

    self.collider = CircleCollider(self, self.width/2, self.height/2, 10)

    Game.battle.timer:tween(0.5, self.sprite, {scale_x = 1, scale_y = 1}, "out-back")
    Game.battle.timer:tween(0.5, self.collider, {radius = 30}, "out-quint")
end

function GreenSoulShield:unbubble()
    if self.sprite then
        self.sprite:remove()
    end
    self.sprite = Sprite("player/shield", 0, 0)
    self.sprite:setColor({0.25, 0.25, 1})
    self.sprite:setScale(0)
    self.sprite:setScaleOrigin(0.5)
    self:addChild(self.sprite)
    self:setSize(self.sprite:getSize())
    Game.battle.timer:tween(0.5, self.sprite, {scale_x = 1, scale_y = 1}, "out-quint")

    self:turn("right")
end

return GreenSoulShield