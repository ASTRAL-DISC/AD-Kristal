local NoteGenerator, super = Class(Event, "notegenerator")

function NoteGenerator:init(data)
    super.init(self, data.x, data.y, nil, nil, data)

    local properties = data.properties or {}

    self.spawn_rate = properties["spawn_rate"] or 1.5
    self.note_remove_after = properties["note_remove_after"] or 0.4
    self.dir = properties["dir"] or 315

    self.spawn_timer = self.spawn_rate * 30

    -- MUST be float properties in tiled
    self.srctell = properties["srctell"] or nil
    self.srctell2 = properties["srctell2"] or nil
    self.srctell3 = properties["srctell3"] or nil
    self.srctell4 = properties["srctell4"] or nil
end

function NoteGenerator:update()
    if self.spawn_timer >= 0 then
        self.spawn_timer = self.spawn_timer - DTMULT
    else
        local function spawnNote()
            local note = Sprite("effects/note", self.x, self.y)
            note.physics.direction = math.rad(self.dir)
            note.physics.speed = 1.4
            note.alpha = 0
            note:fadeTo(1, 0.5)
            Game.world.timer:after(self.note_remove_after, function()
                note:fadeOutSpeedAndRemove(0.1)
            end)
            note.layer = WORLD_LAYERS["above_events"]
            Game.world:addChild(note)
            self.spawn_timer = self.spawn_rate * 30
        end

        local music = Music.getPlaying()[1]
        
        if music then
            if self.srctell and self.srctell2 then
                if self.srctell3 and self.srctell4 then
                    if (music:tell() > self.srctell and music:tell() < self.srctell2) or (music:tell() > self.srctell3 and music:tell() < self.srctell4) then
                        spawnNote()
                    end
                else
                    if music:tell() > self.srctell and music:tell() < self.srctell2 then
                        spawnNote()
                    end
                end
            else
                spawnNote()
            end
        end
    end

    super.update(self)
end

return NoteGenerator