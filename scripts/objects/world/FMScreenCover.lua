---@class FMScreenCover : Sprite
---@overload fun(...) : FMScreenCover
local FMScreenCover, super = Class(Object)

function FMScreenCover:init()
    super.init(self, 0, 0, SCREEN_WIDTH/2, SCREEN_HEIGHT/2)

    self:setParallax(0, 0)
    self:setScale(2, 2)

    self.ball = Assets.getTexture("effects/fountainmake/ball")
    self.ball_ox = 24
    self.ball_oy = 24

    self.timer = 0
    self.cur_height = 0

    --[[self.offset = 0
    self.speed = 1

    self.size = 80]]

    self.ball_x = {}
end

function FMScreenCover:update()
    self.timer = self.timer + DTMULT
    if self.cur_height < 120 then
        self.cur_height = self.cur_height + (math.sin(self.timer / 18) + 0.3) * DTMULT
    else
        self.cur_height = self.cur_height + 0.5 * DTMULT
    end

    --[[self.offset = self.offset + self.speed * DTMULT

    if self.offset > self.size * 2 then
        self.offset = self.offset - self.size * 2
    end]]
end

function FMScreenCover:draw()
    super.draw(self)

    Draw.setColor(COLORS["white"])
    for i = 0, 12 - 1 do
        self.ball_x[i] = -40 + ((self.timer + i * 40) % 400)
        Draw.draw(self.ball, self.ball_x[i], self.cur_height - 80 + math.sin(i + self.timer / 8) * 7, 0, 1.05, 1.05, self.ball_ox, self.ball_oy)
    end

    --[[love.graphics.push()
    Draw.pushScissor()

    for i = 0, 12 - 1 do
        self.value = -self.ball_x[i]
        self.value2 = -self.cur_height - 80
    end

    Draw.scissor(-self.value, -self.value2, self.width, -90)
    love.graphics.translate(-self.value, -self.value2)]]

    Draw.setColor(COLORS["black"])

    for i = 0, 12 - 1 do
        Draw.draw(self.ball, self.ball_x[i], self.cur_height - 80 + math.sin(i + self.timer / 8) * 7, 0, 1, 1, self.ball_ox, self.ball_oy)
    end

    local function rectAxis1toAxis2(mode, x1, y1, x2, y2)
        if x1 > x2 then x1, x2 = x2, x1 end
        if y1 > y2 then y1, y2 = y2, y1 end
        love.graphics.rectangle(mode, x1, y1, x2-x1, y2-y1)
    end

    rectAxis1toAxis2("fill", 0, self.cur_height - 80, self.width, -90)

    --[[love.graphics.stencil(function()
        local last_shader = love.graphics.getShader()
        love.graphics.setShader(Kristal.Shaders["Mask"])
        for i = 0, 12 - 1 do
            Draw.draw(self.ball, self.ball_x[i], self.cur_height - 80 + math.sin(i + self.timer / 8) * 7, 0, 1, 1, self.ball_ox, self.ball_oy)
        end

        local function rectAxis1toAxis2(mode, x1, y1, x2, y2)
            if x1 > x2 then x1, x2 = x2, x1 end
            if y1 > y2 then y1, y2 = y2, y1 end
            love.graphics.rectangle(mode, x1, y1, x2-x1, y2-y1)
        end

        rectAxis1toAxis2("fill", 0, self.cur_height - 80, self.width, -90)

        love.graphics.setShader(last_shader)
    end, "replace", 1)

    love.graphics.setStencilTest("less", 1)

    Draw.setColor(1, 1, 1, 0.48)
    for i = 0, 12 - 1 do
        for x = -420, 940, 80 do
            for y = -420, 780, 80 do
                local depths = Assets.getTexture("effects/fog/tundra")
                Draw.draw(depths, x + self.offset/2, y + self.offset/2)
            end
        end
    end

    love.graphics.setStencilTest()

    Draw.popScissor()
    love.graphics.pop()]]
end

return FMScreenCover