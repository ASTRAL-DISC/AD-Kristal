local AdvSource, super = Class(Object)

function AdvSource:init(x, y, canvas)
    super.init(self, x, y)
    if canvas then
        self:setCanvas(canvas)
    end
end

function AdvSource:setCanvas(canvas)
    if type(canvas) == "function" then
        self.canvas = Draw.pushCanvas()
        canvas()
        Draw.popCanvas(true)
    else
        self.canvas = canvas
    end
end

return AdvSource