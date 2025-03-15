local RectTextbox, super = Class(Object)

function RectTextbox:init(x, y, width, height, default_font, default_font_size)
    super.init(self, x, y, width, height)

    self.actor = nil

    self.default_font = default_font or "main_mono"
    self.default_font_size = default_font_size

    self.font = self.default_font
    self.font_size = self.default_font_size

    self.wrap_add_w = 14

    self.text_x = 2
    self.text_y = -4

    self.text = DialogueText("", self.text_x, self.text_y, width + self.wrap_add_w, SCREEN_HEIGHT)
    self:addChild(self.text)

    self.advance_callback = nil

    self.alpha = 0
end

function RectTextbox:update()
    super.update(self)
end

function RectTextbox:advance()
    self.text:advance()
end

function RectTextbox:setSize(w, h)
    self.width, self.height = w or 0, h or 0
    self:updateTextBounds()
end

function RectTextbox:setActor(actor)
    if type(actor) == "string" then
        actor = Registry.createActor(actor)
    end
    self.actor = actor
end

function RectTextbox:setFont(font, size)
    if not font then
        self.font = self.default_font
        self.font_size = self.default_font_size
    else
        self.font = font
        self.font_size = size
    end
end

function RectTextbox:onAddToStage()
    Game.world.timer:tween(1, self, {alpha = 1}, "linear")
end

function RectTextbox:onRemoveFromStage()
    Game.world.timer:tween(1, self, {alpha = 0}, "linear")
end

function RectTextbox:setAuto(auto)
    self.text.auto_advance = auto or false
end

function RectTextbox:setAdvance(advance)
    self.text.can_advance = advance or false
end

function RectTextbox:setSkippable(skippable)
    self.text.skippable = skippable or false
end

function RectTextbox:setAlign(align)
    self.text.align = align or "left"
    self:updateTextBounds()
end

function RectTextbox:setCallback(callback)
    self.advance_callback = callback
    self.text.advance_callback = callback
end

function RectTextbox:resetFunctions()
    self.text.functions = {}
end

function RectTextbox:addFunction(id, func)
    self.text:addFunction(id, func)
end

function RectTextbox:setText(text, callback)
    self.text.font = self.font
    self.text.font_size = self.font_size
    if self.actor then
        if self.actor:getVoice() then
            if type(text) ~= "table" then
                text = {text}
            else
                text = Utils.copy(text)
            end
            for i,line in ipairs(text) do
                text[i] = "[voice:"..self.actor:getVoice().."]"..line
            end
        end
        if self.actor:getFont() then
            if type(text) ~= "table" then
                text = {text}
            else
                text = Utils.copy(text)
            end
            for i,line in ipairs(text) do
                text[i] = "[font:"..self.actor:getFont().."]"..line
            end
        end
        if self.actor:getIndentString() then
            self.text.indent_string = self.actor:getIndentString()
        end
    end
    self.text:setText(text, callback or self.advance_callback)
end

function RectTextbox:getText()
    return self.text.text
end

function RectTextbox:updateTextBounds()
    self.text.x = self.text_x
    self.text.width = self.width + self.wrap_add_w
    if self.text.align == "right" then
        self.text.x = self.text.x - self.wrap_add_w
    end
end

function RectTextbox:isTyping()
    return self.text:isTyping()
end

function RectTextbox:isDone()
    return self.text:isDone()
end

function RectTextbox:draw()
    Draw.setColor(1, 1, 1, self.alpha)

    for i = 1, 6 do
        Draw.setColor(0, 0, 0, self.alpha * 0.15)
        local offset = (i - 1) * -2
        Draw.rectangle("fill", offset - 20, offset - 20, self.width - (offset * 2) + 40, self.height - (offset * 2) + 40)
    end

    super.draw(self)
end

return RectTextbox