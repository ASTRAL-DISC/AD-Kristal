---@class MusicText : DialogueText
---@field actor? Actor 
---@overload fun(...) : MusicText
local MusicText, super = Class(DialogueText)

function MusicText:init(text, x, y, w, h, options)
	super.init(self, text, x, y, w, h, options)

	self.should_type = options["should_type"] == nil and true or options["should_type"]

	self.music = options["source"] or Game:getActiveMusic()
end

function MusicText:update()
    local speed = self.state.speed

    if not OVERLAY_OPEN then
        if Input.pressed("menu") then
            self.fast_skipping_timer = 1
        end

        local input = self.can_advance and
            (Input.pressed("confirm") or (Input.down("menu") and self.fast_skipping_timer >= 1))

        if input or self.auto_advance or self.should_advance then
            self.should_advance = false
            if not self.state.typing then
                self:advance()
            end
        end

        if Input.down("menu") then
            if self.fast_skipping_timer < 1 then
                self.fast_skipping_timer = self.fast_skipping_timer + DTMULT
            end
        else
            self.fast_skipping_timer = 0
        end

        if self.skippable and ((Input.down("cancel") and not self.state.noskip) or (Input.down("menu") and not self.state.noskip)) then
            if not self.skip_speed then
                self.state.skipping = true
            else
                speed = speed * 2
            end
        end
    end

    if self.state.waiting == -1 then
        self.state.progress = self.state.progress + (DT * 30 * speed)
    else
        if self.music:tell() > self.state.waiting then
        	self.state.waiting = -1
        end
    end

    if self.state.advance_waiting > -1 then
    	if self.music:tell() > self.state.advance_waiting then
    		self.should_advance = true
    		self.state.advance_waiting = -1
    	end
    end

    if self.state.typing then
        self:drawToCanvas(function ()
            while (math.floor(self.state.progress) > self.state.typed_characters) or self.state.skipping do
                local current_node = self.nodes[self.state.current_node]

                if current_node == nil then
                    self.state.typing = false
                    break
                end

                self:playTextSound(current_node)
                self:processNode(current_node, false)

                if self.state.skipping then
                    self.state.progress = self.state.typed_characters
                end

                self.state.current_node = self.state.current_node + 1
            end
        end)
    end

    self:updateTalkSprite(self.state.talk_anim and self.state.typing)

    super.super.update(self)

    self.last_talking = self.state.talk_anim and self.state.typing
end

function MusicText:resetState()
	super.resetState(self)
	self.state["advance_waiting"] = -1
end

function MusicText:processModifier(node, dry)
	if node.command == "wait" then
		local delay = node.arguments[1]
		self.state.waiting = tonumber(delay:sub(1, -1))
		self.state.typed_characters = self.state.typed_characters + 1
	elseif node.command == "next" then
		local delay = node.arguments[1]
		if not delay and not dry then
			self.should_advance = true
		elseif delay then
			self.state.advance_waiting = tonumber(delay:sub(1, -1))
		end
	else
		super.processModifier(self, node, dry)
	end
end

function MusicText:playTextSound(current_node)
	if not self.should_type then
		return
	end
	super.playTextSound(self, current_node)
end

return MusicText