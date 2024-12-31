local Lagoon, super = Class(Event, "lagoon")

function Lagoon:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

    if Game.world.map.id == "hometown_dark/lagoon" then
        self.lagoon = Sprite("world/hometown/lagoon_evening", -44, -40)
    else
        self.lagoon = Sprite("world/hometown/lagoon", -44, -40)
    end
    self.lagoon:setScale(2)
    self:addChild(self.lagoon)

	self.lagoon:setLayer(WORLD_LAYERS["top"])

    self.siner = 0

    --shader by Dobby233Liu
    self.shader = Assets.newShader("lagoon")
end

function Lagoon:draw()
    love.graphics.setShader(self.shader)
    self.siner = self.siner + DT

    self.shader:send("time", self.siner) -- todo:make this count up
    self.shader:send("texture_dim", {240, 280})
    super.draw(self)
    love.graphics.setShader()
end

return Lagoon