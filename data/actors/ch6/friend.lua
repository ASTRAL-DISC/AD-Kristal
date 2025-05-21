local FRIEND, super = Class(Actor, "friend")

function FRIEND:init()
    super.init(self)
    self.width, self.height = 103, 89
    self.hitbox = {12, 41, 30, 40}
    self.path = "npcs/ch6/friend"
    self.voice = nil
    self.flip = "right"
end

function FRIEND:createSprite()
    return FRIENDActor(self)
end

function FRIEND:onSetAnimation(sprite, anim, ...)
    local args = {...}

    if anim == "idle" then
        sprite:resetParts()

        for _, part in ipairs(sprite.parts) do
            sprite:setPartVisibility(part, true)
        end
    end
end

return FRIEND