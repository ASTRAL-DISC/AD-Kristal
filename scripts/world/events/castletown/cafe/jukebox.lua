local Jukebox, super = Class(Event, "jukebox")

function Jukebox:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

    self:setOrigin(0, 0)
	self.solid = false
	self.simple = data.properties["simple"]
end

function Jukebox:onInteract(chara, dir)
    if Game.chapter >= 3 then
        Game.world:startCutscene("castletown/cafe.jukebox")
    else
        Game.world:startCutscene(function (cutscene)
            cutscene:text("* (The jukebox is broken.)\n* (Feels like you might never find a working one...)")
        end)
    end
end

return Jukebox