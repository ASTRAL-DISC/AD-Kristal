local Python, super = Class(Encounter, "python")

function Python:init()
    super.init(self)

    self.text = "* Python attacks!"

    self.music = "battle"
    self.background = true
    
    self:addEnemy("python")
end

return Python