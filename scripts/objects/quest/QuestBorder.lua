local QuestBorder, super = Class(Object)

function QuestBorder:init()
    super:init(self, 0, 0, 320, 240)
    self:setScale(2)
    self:setOrigin(0, 0)

    self.sprite = Sprite("world/events/quest/border")
    self:addChild(self.sprite)

    self.parallax_x = 0
    self.parallax_y = 0
end

return QuestBorder