local Savestar, super = Class(Interactable, "savestar")

function Savestar:init(x, y, properties)
    super.init(self, x, y, nil, nil, properties)

    properties = properties or {}

    self.marker = properties["marker"]
    self.text_once = properties["text_once"]
    self.heals = properties["heals"] ~= false

    self.solid = true

    self:setOrigin(0.5, 0.5)
    self:setSprite("world/events/quest/savestar", 1/6)

    self.used = false

    -- The hitbox is ALMOST half the size of the sprite, but not quite.
    -- It's 9 pixels tall, 10 pixels away from the top.
    -- So divide by 2, round, then multiply by 2 to get the right size for 2x.
    local width, height = self:getSize()
    self:setHitbox(0, math.ceil(height / 4) * 2, width, math.floor(height / 4) * 2)
end

function Savestar:onInteract(player, dir)
    Assets.playSound("quest/save")

    if self.text_once and self.used then
        self:onTextEnd()
        return
    end

    if self.text_once then
        self.used = true
    end

    super.onInteract(self, player, dir)
    return true
end

function Savestar:onTextEnd()
    if not self.world then return end

    if self.heals then
        for _,party in ipairs(Game.party) do
            party:heal(math.huge, false)
        end
    end

    self.world:openMenu(StarMenu(self.marker))
end

return Savestar