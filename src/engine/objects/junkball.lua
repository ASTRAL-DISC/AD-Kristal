---@class Junkball : Sprite
---@overload fun(...) : Junkball
local Junkball, super = Class(Sprite)

function Junkball:init()
    super.init(self)
    self.sprite = Sprite("misc/trash_ball")
    self:setOrigin(0.5, 1)
    self.persistent = true
end

function Junkball:update()
    super.update(self)
    if self.persistent and (Game.world:hasCutscene() and Game.world.cutscene.id == "enterdark") then
        self.persistent = false
    end
end

return Junkball