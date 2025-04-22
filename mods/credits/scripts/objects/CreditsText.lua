local CreditsText, super = Class(Object)

function CreditsText:init()
	super.init(self, 0, 20, SCREEN_WIDTH, SCREEN_HEIGHT)
	
	self.music = Music()
	self.music:play("flowbeet", 0.9)
	self.music.source:setLooping(false)

    self.font = Assets.getFont("main")
	self.parallax_x = 0
	self.parallax_y = 0

	self.continue_alpha = 0
end

function CreditsText:draw()
    love.graphics.setFont(self.font)
	Draw.setColor(0.5, 0.5, 0.5)

	if self.music:tell() > 5.7 and self.music:tell() < 8.5 then
		love.graphics.printf("ASTRAL DISC", 0, 20, SCREEN_WIDTH, "center")
		Draw.setColor(1, 1, 1)
		love.graphics.printf("by HUECYCLES\n& Lisspeed", 0, 60, SCREEN_WIDTH, "center")
	elseif self.music:tell() > 8.5 and self.music:tell() < 11.3 then
		love.graphics.printf("-Kristal Engine-", 0, 20, SCREEN_WIDTH, "center")
		Draw.setColor(1, 1, 1)
		love.graphics.printf("Kristal Team", 0, 60, SCREEN_WIDTH, "center")
	elseif self.music:tell() > 11.3 and self.music:tell() < 14.17 then
		love.graphics.printf("-Programming-", 0, 20, SCREEN_WIDTH, "center")
		Draw.setColor(1, 1, 1)
		love.graphics.printf("WIL-TZY", 0, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("J.A.R.U.", 0, 100, SCREEN_WIDTH, "center")
	elseif self.music:tell() > 14.17 and self.music:tell() < 17.0 then
		love.graphics.printf("-Programming-", 0, 20, SCREEN_WIDTH, "center")
		Draw.setColor(1, 1, 1)
		love.graphics.printf("Trashcat", 0, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("Eribetra", 0, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("Bor", 0, 140, SCREEN_WIDTH, "center")
	elseif self.music:tell() > 17.0 and self.music:tell() < 19.8 then
		love.graphics.printf("-Sprite Art & Animation-", 0, 20, SCREEN_WIDTH, "center")
		Draw.setColor(1, 1, 1)
		love.graphics.printf("WIL-TZY", -100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("SHAZ0S", -100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("spectacledraws", -100, 140, SCREEN_WIDTH, "center")
		love.graphics.printf("Bunniapa", 100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("Nebytou", 100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("Linkerbee", 100, 140, SCREEN_WIDTH, "center")
		love.graphics.printf("Jo", -100, 180, SCREEN_WIDTH, "center")
	elseif self.music:tell() > 19.8 and self.music:tell() < 22.6 then
		love.graphics.printf("-Concept Art-", 0, 20, SCREEN_WIDTH, "center")
		Draw.setColor(1, 1, 1)
		love.graphics.printf("Marbles", -100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("Wilkus Milkus", -100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("Sylladexter", -100, 140, SCREEN_WIDTH, "center")
		love.graphics.printf("MARNIE", 100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("Noudele", 100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("SHAZ0S", 100, 140, SCREEN_WIDTH, "center")
	elseif self.music:tell() > 22.6 and self.music:tell() < 25.4 then
		love.graphics.printf("-Concept Art-", 0, 20, SCREEN_WIDTH, "center")
		Draw.setColor(1, 1, 1)
		love.graphics.printf("WIL-TZY", -100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("spectacledraws", -100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("Bunniapa", -100, 140, SCREEN_WIDTH, "center")
		love.graphics.printf("Nebytou", 100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("Linkerbee", 100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("Jo", 100, 140, SCREEN_WIDTH, "center")
	elseif self.music:tell() > 25.4 and self.music:tell() < 28.3 then
		love.graphics.printf("-Music-", 0, 20, SCREEN_WIDTH, "center")
		Draw.setColor(1, 1, 1)
		love.graphics.printf("Rata", -100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("L Void", -100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("Kittblush", -100, 140, SCREEN_WIDTH, "center")
		love.graphics.printf("Sylladexter", 100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("lex", 100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("xnq", 100, 140, SCREEN_WIDTH, "center")
		love.graphics.printf("Eribetra", -100, 180, SCREEN_WIDTH, "center")
	elseif self.music:tell() > 28.3 and self.music:tell() < 31.1 then
		love.graphics.printf("-Additional Help-", 0, 20, SCREEN_WIDTH, "center")
		Draw.setColor(1, 1, 1)
		love.graphics.printf("Creepa-Bot Inc.", -100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("KateBulka", -100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("punkipatch", -100, 140, SCREEN_WIDTH, "center")
		love.graphics.printf("toosday", 100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("NE0Nbandit", 100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("bep_celeste", 100, 140, SCREEN_WIDTH, "center")
	elseif self.music:tell() > 31.1 and self.music:tell() < 33.95 then
		love.graphics.printf("-Libraries & Resources-", 0, 20, SCREEN_WIDTH, "center")
		Draw.setColor(1, 1, 1)
		love.graphics.printf("SylviBlossom", -100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("Nyakorita", -100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("Vitellary", -100, 140, SCREEN_WIDTH, "center")
		love.graphics.printf("Dobby233Liu", 100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("Skarph", 100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("J.A.R.U.", 100, 140, SCREEN_WIDTH, "center")
	elseif self.music:tell() > 33.95 and self.music:tell() < 36.7 then
		love.graphics.printf("-Libraries & Resources-", 0, 20, SCREEN_WIDTH, "center")
		Draw.setColor(1, 1, 1)
		love.graphics.printf("Hyperboid", -100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("Agent 7", -100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("AcousticJamm", -100, 140, SCREEN_WIDTH, "center")
		love.graphics.printf("FireRainV", 100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("crocokuo", 100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("Mr. Oinky", 100, 140, SCREEN_WIDTH, "center")
	elseif self.music:tell() > 36.7 and self.music:tell() < 39.5 then
		love.graphics.printf("-Libraries & Resources-", 0, 20, SCREEN_WIDTH, "center")
		Draw.setColor(1, 1, 1)
		love.graphics.printf("Simbel", -100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("KateBulka", -100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("Bor", -100, 140, SCREEN_WIDTH, "center")
		love.graphics.printf("Trashcat", 100, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("Freesound", 100, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("Spriter's Resources", 100, 140, SCREEN_WIDTH, "center")
	elseif self.music:tell() > 39.5 and self.music:tell() < 124.30 then
		-- nothin
	elseif self.music:tell() > 124.30 and self.music:tell() < 135.59 then
		love.graphics.printf("-Special Thanks-", 0, 20, SCREEN_WIDTH, "center")
		Draw.setColor(1, 1, 1)
		love.graphics.printf("Kristal Community", 0, 60, SCREEN_WIDTH, "center")
		love.graphics.printf("ASTRAL DISC Server", 0, 100, SCREEN_WIDTH, "center")
		love.graphics.printf("HUECYCLES's cats", 0, 140, SCREEN_WIDTH, "center")
	elseif self.music:tell() > 135.59 and self.music:tell() < 141.24 then
		-- nothin
	elseif self.music:tell() > 141.24 and self.music:tell() < 146.52 then
		Draw.setColor(1, 1, 0, self.continue_alpha)
		self.continue_alpha = self.continue_alpha + 0.015 * DTMULT
		love.graphics.printf("THANK YOU", 0, 60, SCREEN_WIDTH, "center")
	else
		Draw.setColor(1, 1, 0, self.continue_alpha)
		self.continue_alpha = self.continue_alpha - 0.015 * DTMULT
		love.graphics.printf("THANK YOU", 0, 60, SCREEN_WIDTH, "center")
	end

	--[[if not self.music:isPlaying() then
		self:remove()
	end]]
end

function CreditsText:update()
	super.update(self)
end

return CreditsText