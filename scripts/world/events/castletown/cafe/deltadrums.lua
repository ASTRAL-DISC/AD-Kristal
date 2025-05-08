local DeltaDrums, super = Class(Event, "deltadrums")

function DeltaDrums:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})

	self:setScale(1)
    self:setOrigin(0.5, 0.5)
    self:setScaleOrigin(0.5, 0.5)
	
	self.solid = false
    
    self:setSprite("world/events/castletown/cafe/drums")

    self.timer = Timer()
    self:addChild(self.timer)
end

function DeltaDrums:update()
    super.update(self)

    local function beatToSize(beat)
        if beat % 2 < 0.5 then
            self:tweenScale(1.04, 1.04, 1, "out-quint")
        else
            self:tweenScale(1, 1, 0.2, "out-quint")
        end
    end

    local music = Music.getPlaying()[1]
    if music and MUSIC_BPM[music.current] then
        local beat = music.source:tell() / (60 / MUSIC_BPM[music.current])
        beatToSize(beat)
    end
end

function DeltaDrums:tweenScale(scale_x, scale_y, time, ease)
    self.timer:tween(time or 0.5, self, {scale_x = scale_x, scale_y = scale_y or scale_x}, ease or "linear")
end

return DeltaDrums