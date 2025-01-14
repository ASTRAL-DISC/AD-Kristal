FootprintsLib = {}

function FootprintsLib:init()
    self.stepped = false
    self.pstepped = false
    self.chars = {}

    Utils.hook(Character, "setActor", function(orig, self, actor)
        orig(self, actor)
        self.sprite.on_footstep2 = function(s, n) self:onFootstep2(n) end
    end)

    Utils.hook(Character, "onFootstep2", function(orig, self, num)
        Kristal.callEvent("onFootstep2", self, num)
    end)
end

function FootprintsLib:onFootstep2(char, num)
    if char == Game.world.player then
        self.pstepped = true
        table.insert(self.chars, char)

    else self.stepped = true     table.insert(self.chars, char) end

end

function FootprintsLib:postUpdate()
    if self.stepped then self.stepped = false end
    if self.pstepped then self.pstepped = false end
    self.chars = {}
end

return FootprintsLib