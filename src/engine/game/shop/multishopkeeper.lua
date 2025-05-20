---@class MultiShopkeeper : Shopkeeper
---@overload fun(...) : MultiShopkeeper
local MultiShopkeeper, super = Class(Shopkeeper)

function MultiShopkeeper:init()
    super.init(self)
    self.actors = {}
end

function MultiShopkeeper:addActor(actor)
    if type(actor) == "string" then
        actor = Registry.createActor(actor)
    end
    local sprite = actor:createSprite()
    sprite:setScale(2, 2)
    sprite:setOrigin(0.5, 1)
    self:addChild(sprite)
    return sprite
end

return MultiShopkeeper