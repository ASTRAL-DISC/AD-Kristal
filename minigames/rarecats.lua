---@class RareCatsMinigame : RareCats
local RareCatsMinigame, super = Class(RareCats)

function RareCatsMinigame:init()
    super.init(self)

    self.name = self.name
    self.description = self.description
end

return RareCatsMinigame