local Credits, super = Class(Map)

function Credits:onEnter()
    super.onEnter(self)

    self.gradient = Sprite("bg/gradient_black", 0, 0)
    self.gradient:setScale(2)
    self.gradient.layer = 50
    self.gradient.wrap_texture_x = true

    Game.world:spawnObject(self.gradient, "objects_gradient")
    Game.world:spawnObject(CreditsText(0, 0), "objects")
    Game.world:spawnObject(DarkBG(0, 0), "objects_bg")

    Game.world:startCutscene("credits.start")
end

return Credits