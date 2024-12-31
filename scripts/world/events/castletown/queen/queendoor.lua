local QueenDoor, super = Class(Event, "queendoor")

function QueenDoor:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

    self.solid = true

    local properties = data.properties or {}

    self.sprite_inside = Sprite("world/events/castletown/queen/door_inside")
    self.sprite_door_left = Sprite("world/events/castletown/queen/door_left")
    self.sprite_door_right = Sprite("world/events/castletown/queen/door_right")
    self.sprite_frame  = Sprite("world/events/castletown/queen/door_frame")
    
    self.sprite_inside.debug_select = false
    self.sprite_door_left.debug_select = false
    self.sprite_door_right.debug_select = false
    --self.sprite_frame.debug_select = false
    
    self:addChild(self.sprite_inside)
    self:addChild(self.sprite_door_left)
    self:addChild(self.sprite_door_right)
    --self:addChild(self.sprite_frame)


    self.sprite_inside:setScale(2)
    self.sprite_door_left:setScale(2)
    self.sprite_door_right:setScale(2)
    --self.sprite_frame:setScale(2)

    --self.sprite_frame.x = -20
    --self.sprite_frame.y = -115
    
    self.sprite_door_left.x = -20
    self.sprite_door_left.y = -115
    self.sprite_door_right.x = -20
    self.sprite_door_right.y = -115
    
    self.sprite_inside.x = -20
    self.sprite_inside.y = -115
end

function QueenDoor:onInteract()
    self.solid = not self.solid
    if not self.solid then
        self:open()
    elseif self.solid then
        self:close()
    end
end

function QueenDoor:open()
    Assets.playSound("elecdoor_open")
    self.sprite_door_left:slideTo(-84, self.sprite_door_left.y, 0.3)
    self.sprite_door_right:slideTo(46, self.sprite_door_right.y, 0.3)
end

function QueenDoor:close()
    Assets.playSound("elecdoor_close")
    self.sprite_door_left:slideTo(-20, self.sprite_door_left.y, 0.3)
    self.sprite_door_right:slideTo(-20, self.sprite_door_right.y, 0.3)
end

function QueenDoor:draw()
    Draw.scissor(-12, -155, self.sprite_frame.width * 2 - 18, self.sprite_frame.height * 4)
    super.draw(self)
    love.graphics.setScissor()
    love.graphics.draw(Assets.getTexture("world/events/castletown/queen/door_frame"), -20, -115, 0, 2, 2)
end

return QueenDoor