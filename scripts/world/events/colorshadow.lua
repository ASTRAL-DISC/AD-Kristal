local ColorShadow, super = Class(Event, "colorshadow")

function ColorShadow:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})

    self.solid = false

    self.color = Utils.parseColorProperty(data.properties["color"] or "#ffffffff")
    self.amount = data.properties["amount"] or 1
end

function ColorShadow:drawCharacter(object)
    love.graphics.push()
    object:preDraw()
    object:draw()
    object:postDraw()
    love.graphics.pop()
end

function ColorShadow:draw()
    super.draw(self)

    local canvas = Draw.pushCanvas(self.width, self.height)
    love.graphics.clear()

    love.graphics.translate(-self.x, -self.y)

    for _, object in ipairs(Game.world.children) do
        if object:includes(Character) then
            love.graphics.setShader(Kristal.Shaders["AddColor"])
            

            Kristal.Shaders["AddColor"]:sendColor("inputcolor", self.color)
            Kristal.Shaders["AddColor"]:send("amount", self.amount)

            self:drawCharacter(object)

            love.graphics.setShader()
        end
    end

    Draw.popCanvas()

    Draw.draw(canvas)
end

return ColorShadow