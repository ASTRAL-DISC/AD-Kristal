local GreenSoulBullet, super = Class(Bullet)

function GreenSoulBullet:init(x, y, texture)
    super.init(self, x, y, texture)

    self.block_health = 1
    self.block_tp = 1
end

function GreenSoulBullet:onBlock(block, damage)
    local soul = Game.battle.soul
    
    self.block_health = self.block_health - damage
    if self.block_health <= 0 then
        if soul.bubbled then
            self:shatter(block)
        else
            self:destroy(block)
        end
    end
    return "a", false
end

function GreenSoulBullet:destroy(block)
    if self.block_tp ~= 0 then
        Game:giveTension(self.block_tp)
    end
    self:remove()
end

function GreenSoulBullet:shatter(block)
    self:remove()
    local function createParticle(x, y)
        local sprite = Sprite("effects/particle", x, y)
        sprite:setScale(2)
        sprite.physics.gravity = 0.5
        sprite.physics.direction = math.rad(math.random(360))
        sprite.physics.speed = 10
        Game.battle.timer:after(0.03, function()
            sprite.graphics.grow = 0.1
            sprite:fadeOutAndRemove(0.8)
        end)
        sprite:setOrigin(0.5, 0.5)
        sprite:setLayer(BATTLE_LAYERS["above_bullets"])
        Game.battle:addChild(sprite)
        return sprite
    end

    Game.battle.timer:script(function (wait)
        local every = Game.battle.timer:every(1/30, function ()
            createParticle(self.x, self.y)
        end)
        wait(5/30)
        Game.battle.timer:cancel(every)
    end)
end

return GreenSoulBullet