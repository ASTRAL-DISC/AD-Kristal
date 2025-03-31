-- original library by AcousticJamm, modified for Dark Place and modified here
local FloorMirror, super = Class(Event, "floormirror")

Utils.hook(Actor, "init", function(orig, self)
    orig(self)

    self.floor_mirror_sprites =  {
        ["walk/down"] = "walk/down",
        ["walk/up"] = "walk/up",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }
end)

Utils.hook(Actor, "getFloorMirrorSprites", function(orig, self)
    return self.floor_mirror_sprites
end)

Utils.hook(Actor, "getFloorMirrorSprite", function(orig, self, sprite)
    return self:getFloorMirrorSprites()[sprite]
end)

function FloorMirror:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

    local properties = data.properties or {}

    self.offset_add = properties["offset_add"] or 2
    self.offset_value = properties["offset_value"] or (self.height/2 + self.offset_add)

    self.offset = properties["offset"] or 1
    self.offset = self.offset - self.offset_value
    self.opacity = properties["opacity"] or 0.3

    self.bottom = self.y + self.height
    self.flip_y = true

    self.reflect = properties["reflect"] or false
    self.event_add = properties["event_add"] or 2
    self.event_value = properties["event_value"] or (self.height/2 + self.event_add)
    self.event_offset = properties["event_offset"] or 1
    self.event_offset = self.event_offset - self.event_value
end

function FloorMirror:drawMirror()
    local to_draw = {}
    local to_draw_events = {}
    for _, obj in ipairs(Game.world.children) do
        if obj:includes(Event) then
            table.insert(to_draw_events, obj)
        end
        if obj:includes(Character) then
            table.insert(to_draw, obj)
        end
    end
    for _, obj in ipairs(to_draw_events) do
        if self.reflect then
            self:drawEvent(obj)
        end
    end
    for _, obj in ipairs(to_draw) do
        self:drawCharacter(obj)
    end
end

function FloorMirror:drawCharacter(chara)
    if chara.sprite and not chara.actor.no_reflection then
        love.graphics.push()
        chara:preDraw()
        local oyd = chara.y - self.bottom
        love.graphics.translate(0, -oyd + self.offset)
        local oldsprite = string.sub(chara.sprite.texture_path, #chara.sprite.path + 2)
        local t = Utils.split(oldsprite, "_")
        local pathless = t[1]
        local frame = t[2]
        local newsprite = oldsprite
        local mirror = chara.actor:getFloorMirrorSprites()
        if mirror and mirror[pathless] then
            newsprite = mirror[pathless] .. "_" .. frame
        end
        chara.sprite:setTextureExact(chara.actor.path .. "/" .. newsprite)
        chara:draw()
        chara:postDraw()
        chara.sprite:setTextureExact(chara.actor.path .. "/" .. oldsprite)
        love.graphics.pop()
    end
end

function FloorMirror:drawEvent(event)
    if event.sprite and not event.no_reflection then
        love.graphics.push()
        event:preDraw()
        local oyd = event.y - self.bottom
        if event.reflection_offset then
            love.graphics.translate(0, -oyd + event.reflection_offset)
        else
            love.graphics.translate(0, -oyd + self.event_offset)
        end
        local oldsprite = string.sub(event.sprite.texture_path, #event.sprite.path)
        local t = Utils.split(oldsprite, "_")
        local pathless = t[1]
        local frame = t[2]
        local newsprite = oldsprite
        local mirror = event.floor_mirror_sprites
        if mirror then
            if frame then
                if mirror[pathless] then
                    newsprite = mirror[pathless] .. "_" .. frame
                else
                    newsprite = mirror .. "_" .. frame
                end
            else
                if mirror[pathless] then
                    newsprite = mirror[pathless]
                else
                    newsprite = mirror
                end
            end
        end
        event.sprite:setTextureExact(event.sprite.path .. newsprite)
        event:draw()
        event:postDraw()
        event.sprite:setTextureExact(event.sprite.path .. oldsprite)
        love.graphics.pop()
    end
end

function FloorMirror:draw()
    super.draw(self)

    local canvas = Draw.pushCanvas(self.width, self.height)
    love.graphics.clear()
    love.graphics.translate(-self.x, -self.y)
    self:drawMirror()
    Draw.popCanvas()

    Draw.setColor(1, 1, 1, self.opacity)
    Draw.draw(canvas)
    Draw.setColor(1, 1, 1, 1)
end

return FloorMirror