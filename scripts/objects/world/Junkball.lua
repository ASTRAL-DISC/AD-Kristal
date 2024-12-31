local Junkball, super = Class(Sprite)

--hook by Skarph to make sure the object persists between rooms
Utils.hook(World, "spawnPlayer", function(orig, self, ...)
    local previous_player = self.player
    orig(self, ...)
    if (previous_player) then
        for i, obj in ipairs(previous_player.children) do
            if(obj.persistent) then
                obj:setParent(self.player)
            end
        end
    end
end)

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