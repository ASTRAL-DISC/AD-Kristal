local ActorColor, super = Class(Event, "actorcolor")

function ActorColor:init(x, y, shape)
    super.init(self, x, y, shape)

    self.solid = false
    self.canvas = love.graphics.newCanvas(self.width, self.height)
end

function ActorColor:drawCharacter(object)
    love.graphics.push()
    object:preDraw()
    object:draw()
    object:postDraw()
    love.graphics.pop()
end

function ActorColor:draw()
    super.draw(self)

    Draw.pushCanvas(self.canvas)
    love.graphics.clear()

    love.graphics.translate(-self.x, -self.y)

    for _, object in ipairs(Game.world.children) do
        if object:includes(Character) then
            love.graphics.setShader(Kristal.Shaders["AddColor"])

            Kristal.Shaders["AddColor"]:sendColor("inputcolor", {object.actor:getColor()})
            Kristal.Shaders["AddColor"]:send("amount", 1)

            self:drawCharacter(object)

            love.graphics.setShader()
        end
    end

    Draw.popCanvas()
    Draw.draw(self.canvas)
end

--[[function ActorColor:onEnter()
    Game.world.timer:tween(0.5, self, {alpha = 1})
end

function ActorColor:onExit()
    self.alpha = 0
end]]

--[[function ActorColor:onEnter()
    for _, object in ipairs(Game.world.children) do
        if object:includes(Character) then
            local mask = object:addFX(ColorMaskFX({object.actor:getColor()}, 0))
            self.world.timer:tween(5/30, mask, {amount = 1})
        end
    end
end

function ActorColor:onExit()
    for _, object in ipairs(Game.world.children) do
        if object:includes(Character) then
            local mask = object:getFX()
            if mask then
                self.world.timer:tween(5/30, mask, {amount = 0}, "linear", function()
                    object:removeFX(mask)
                end)
            end
        end
    end
end]]

return ActorColor