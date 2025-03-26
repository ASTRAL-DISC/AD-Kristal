local Apple, super = Class(Event, "apple")

function Apple:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)

    self:setOrigin(0.5, 0.5)
    self:setSprite("world/events/quest/apple", 0.25)
    self.magnesium = Sprite("world/events/quest/magnesium")
    self.money = 5
end

function Apple:onCollide(chara)
    Assets.playSound("quest/apple")
    local apples = Game:getFlag("apples", 0)
    apples = apples + 1
    Game:setFlag("apples", apples)
    Game.money = Game.money + self.money

    chara:addChild(self.magnesium)
    self.magnesium.physics.speed_y = -1
    self.magnesium.x = -20
    Game.world.timer:after(0.5, function() self.magnesium:remove() end)

    self:setFlag("dont_load", true)

    self:remove()
end

return Apple