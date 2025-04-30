local Plush, super = Class(Event, "plush")

function Plush:init(data)
    super.init(self, data)

    local properties = data.properties or {}

    self.sprite = properties["sprite"]
    self.plushflag = properties["plushflag"] or nil

    self:setSprite("world/events/plushies/" .. self.sprite)
	
	self.solid = true

    self:addChild(self.sprite)

    local width, height = self:getSize()
    self:setHitbox(0, math.ceil(height / 4) * 2, width, math.floor(height / 4) * 2)

    self:setScale(1)
    self.sprite:setScaleOrigin(0.5, 0.5)
    self.sprite.x = self.sprite.width / 2
    self.sprite.y = self.sprite.height / 2
    self:setOrigin(0.5, 1)
end

function Plush:squishSqueak()
    Assets.stopAndPlaySound("squeaky")
    Game.world.timer:tween(0.1, self.sprite, {scale_x = self.sprite.scale_x - 0.4}, "in-out-circ", function ()
        Game.world.timer:tween(0.1, self.sprite, {scale_y = self.sprite.scale_y - 0.4}, "in-out-circ")
    end)
    Game.world.timer:after(0.1, function()
        Game.world.timer:tween(0.4, self.sprite, {scale_x = self.sprite.scale_x + 0.4, scale_y = self.sprite.scale_y + 0.4}, "in-out-back")
    end)
end

function Plush:onInteract(player, dir)
    Game.world:startCutscene(function(cutscene)
        if self.plushflag then
            Game:setFlag(self.plushflag, true)
            self:squishSqueak()
    
            cutscene:wait(0.8)
            
            Assets.playSound("hypnosis")

            local time = 2
            local sine_x, sine_y = 0, 0
            local x_speed = 8
            local y_speed = 10
            local x_dist = 8
            local y_dist = 4
            Game.world.timer:during(time, function()
                self.sprite:setOrigin(-0.5, -0.5)
                sine_x = sine_x + (x_speed * DT)
                sine_y = sine_y + (y_speed * DT)
                self.sprite.x = Utils.wave(sine_x, -x_dist, x_dist)
                self.sprite.y = Utils.wave(sine_y, -y_dist, y_dist)
            end)
    
            if player.x > self.x then
                self:slideTo(self.x - 200, self.y - Game.world.height, time, "in-quad", function()
                    self:remove()
                end)
            else
                self:slideTo(self.x + 200, self.y - Game.world.height, time, "in-quad", function()
                    self:remove()
                end)
            end
        else
            self:squishSqueak()
        end
    end)

    return true
end

return Plush