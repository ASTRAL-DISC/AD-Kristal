local footprints, super = Class(Event)

function footprints:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})
    self.toggle = false
    self.playerbool = data.properties["player"] or false
    self.type = data.properties["type"] or "default"
    self.addedtype  = data.properties["type"]
    self.time = data.properties["time"] or 0.5
    self.stepcolor = Utils.parseColorProperty(data.properties["color"]) or {1, 1, 1}
    self.hitboxes = {}
    self.charinside = {}
    self.masker = Rectangle(self.x, self.y, self.width, self.height)
    Game.world:addChild(self.masker)
    self.mask = MaskFX(self.masker)

    --self.mask:addFX(MaskFX())
    --self.sprite = Sprite("footsteps")
    --self.sprite:setScale(2)
    --self.sprite:setOrigin(0.5, 0.5)
    --print(self.stepcolor)
    for _, child in ipairs(Game.world.children) do
        if child:includes(Character) then
            local table = {
                [child.actor.id] = Hitbox(child.x - 1, child.y - 1, 1, 1)
            }
            self.hitboxes = Utils.merge(self.hitboxes, table)
        end
    end
end

function footprints:onEnter(chara)
    self.toggle = true
end

function footprints:onExit(chara)
    self.toggle = false
end

function footprints:update()
    --print("FootstepLib")
    --[[for _, child in ipairs(Game.world.children) do
        if child:includes(Character) then
            if self.hitboxes[child.actor.id] then
                self.hitboxes[child.actor.id].x, self.hitboxes[child.actor.id].y = child.x, child.y
                local h = self.hitboxes[child.actor.id]

                local inside = Utils.containsValue(self.charinside, child)

                print(h.x == child.x, h.y == child.y)

                if (h.x > self.x and h.x < self.width) and (h.y > self.y and h.y < self.height) and not inside then
                    print("goober")
                    self:onEntered()
                    table.insert(self.charinside, child)
                end
                if h.x < self.x or h.x > self.width or h.y < self.y or h.y > self.height and inside then
                    --print (child.actor.id.."woober")
                    self:onExited()
                    for i, v in ipairs(self.charinside) do
                        local num = 0
                        if v == child then num = i end
                    end
                    table.remove(self.charinside, num)
                end
                
            end
        end
    end]]

    if self.playerbool and FootprintsLib.pstepped and self.toggle then
        for _, char in ipairs(FootprintsLib.chars) do
            local default = love.filesystem.getInfo(self.type and Mod.info.path.."/assets/sprites/"..char.actor.path.."/footprints/default.png")
            local typedcharfoot = love.filesystem.getInfo(self.type and Mod.info.path.."/assets/sprites/"..char.actor.path.."/footprints/"..self.type..".png")
            if self.addedtype and not typedcharfoot then Kristal.Console:warn("FOOTPRINT_LIB: "..char.actor.path.."/footprints/"..self.type.." was not found.") end
            local charfoot = love.filesystem.getInfo(Mod.info.path.."/assets/sprites/"..char.actor.path.."/footprint.png")
            local steps = Sprite((self.type and typedcharfoot) and char.actor.path.."/footprints/"..self.type or default and char.actor.path.."/footprints/default" or charfoot and char.actor.path.."/footprint" or "footprint")
            steps:setLayer(char.layer-0.1)
            steps:setScale(2)
            steps:setOrigin(0.5, 1)
            steps:setRotationOrigin(0.5, 0.5)
            steps:addFX(self.mask)
            if char.facing == "down" then steps.rotation = 0
            elseif char.facing == "left" then steps.rotation = 6.25 / 4
            elseif char.facing == "up" then steps.rotation = 6.25 / 2
            elseif char.facing == "right" then steps.rotation = 6.25 / -4 end
            steps.x, steps.y = char.x, char.y
            steps:setColor(self.stepcolor)
            Game.world:addChild(steps)
            Game.world.timer:script(function(wait)
                wait(self.time)
                TweenManager.tween(steps, {alpha = 0}, 30, "out-cubic")
                wait(1)
                steps:remove()
            end)
        end
    elseif FootprintsLib.stepped and self.toggle then 
        for _, char in ipairs(FootprintsLib.chars) do
            local default = love.filesystem.getInfo(self.type and Mod.info.path.."/assets/sprites/"..char.actor.path.."/footprints/default.png")
            local typedcharfoot = love.filesystem.getInfo(self.type and Mod.info.path.."/assets/sprites/"..char.actor.path.."/footprints/"..self.type..".png")
            if self.addedtype and not typedcharfoot then Kristal.Console:warn("FOOTPRINT_LIB: "..char.actor.path.."/footprints/"..self.type.." was not found.") end
            local charfoot = love.filesystem.getInfo(Mod.info.path.."/assets/sprites/"..char.actor.path.."/footprint.png")
            local steps = Sprite((self.type and typedcharfoot) and char.actor.path.."/footprints/"..self.type or default and char.actor.path.."/footprints/default" or charfoot and char.actor.path.."/footprint" or "footprint")
            steps:setLayer(char.layer-0.1)
            steps:setScale(2)
            steps:setOrigin(0.5, 1)
            steps:setRotationOrigin(0.5, 0.5)
            steps:addFX(self.mask)
            if char.facing == "down" then steps.rotation = 0
            elseif char.facing == "left" then steps.rotation = 6.25 / 4
            elseif char.facing == "up" then steps.rotation = 6.25 / 2
            elseif char.facing == "right" then steps.rotation = 6.25 / -4 end
            steps.x, steps.y = char.x, char.y
            steps:setColor(self.stepcolor)
            Game.world:addChild(steps)
            Game.world.timer:script(function(wait)
                wait(self.time)
                TweenManager.tween(steps, {alpha = 0}, 30, "out-cubic")
                wait(1)
                steps:remove()
            end)
        end
    end
    super.update(self)
end

--[[function footsteps:draw()
    super.draw(self)
    for _, hitbox in pairs(self.hitboxes) do
        if DEBUG_RENDER then
            hitbox:draw(0, 0, 1)
        end
    end
end]]

return footprints