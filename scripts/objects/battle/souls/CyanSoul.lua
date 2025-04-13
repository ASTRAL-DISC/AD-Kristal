local CyanSoul, super = Class(Soul)

function CyanSoul:init(x, y, mode)
    super.init(self, x, y)

    self.mode = (mode == "horizontal" and mode) or "vertical"

    self.first_half_sprite = "player/heart_half"
    self.second_half_sprite = "player/heart_other_half"

    self.color = {0, 1, 1}
    self.sprite:setSprite(self.first_half_sprite)
    self.collider = CircleCollider(self, 0, 0, 6)

    self.half = Sprite(self.second_half_sprite)
    self.half:setColor({0.15, 0.15, 0.15})
    self.half:setOrigin(0.5, 0.5)
    Game.battle.arena:addChild(self.half)
    
    self.cooldown = 0

    self.wave = nil
end

function CyanSoul:switch()
    if self.cooldown >= 0.5 then
        local x, y = self.half:getRelativePosFor(self)

        self:setPosition(x + self.x, y + self.y)
        self.sprite.scale_x = self.sprite.scale_x * -1
        self.half.scale_x = self.half.scale_x * -1

        local afterimage = AfterImage(self, 0.4)
        afterimage.graphics.grow = 0.18
        afterimage:setLayer(self.layer - 1)
        self:addChild(afterimage)

        Assets.stopAndPlaySound("noise")
        Assets.stopAndPlaySound("wing")
    end
end

function CyanSoul:update()
    super.update(self)

    self.cooldown = Utils.approach(self.cooldown, 0, DT)
end

function CyanSoul:onRemove()
    self.half:remove()
    super.onRemove(self)
end

function CyanSoul:onWaveStart()
    local wave = self.wave
    local arena = Game.battle.arena
end

function CyanSoul:doMovement()
    local speed = self.speed
    local arena = Game.battle.arena
    local wave = self.wave

    if wave then
        super.doMovement(self)
    end
    
    if arena then
        local off_x, off_y = self:getRelativePosFor(arena)

        off_x = (self.mode == "vertical" and (off_x * -1)) or off_x
        off_y = (self.mode == "horizontal" and (off_y * -1)) or off_y
    
        local arena_width, arena_height = arena.width, arena.height
    
        arena_width = (self.mode == "vertical" and arena_width) or 0
        arena_height = (self.mode == "horizontal" and arena_height) or 0
    
        self.half:setPosition(off_x + arena_width, off_y + arena_height)
    end

    if Input.pressed("confirm") then
        if self.cooldown == 0 then
            self.cooldown = 0.5
            self:switch()
        else
            Assets.stopAndPlaySound("ui_cant_select")
            self:shake(3)
        end
    end
end

return CyanSoul