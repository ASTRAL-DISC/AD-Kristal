local Shadowguy, super = Class(EnemyBattler, "shadowguy")

function Shadowguy:init()
    super.init(self)
	
    self.name = "Shadowguy"
    self:setActor("shadowguy")
	
    self.waves = {
		"saxophone",
		"gunfight",
	}
	
	self.check = "Battling's just a side gig. Playing on stage is the dream!"
	
	self.spare_points = 10
	self.attack = 10
	self.health = 360
	self.max_health = 360
	self.defense = 2
	self.money = 96
	
    self.text = {
		"* Smells like shady business.",
		"* Shadowguy is keeping a low profile.",
		"* The enemy dances with your shadow."
	}
	self.low_health_text = "* Shadowguy's form is fading away."
	
	self:registerAct("ShootHearts")
	self:registerAct("ShootHeartsX", nil, "all")
	
	local socks = Sprite("enemies/ch3/shadowguy/socks", self.width * .5, self.height * .5)
	socks.visible = false
	socks:setOrigin(.5, .5)
	socks.hit = 0
	
	Utils.hook(socks, "update", function(orig, obj)
		orig(obj)
		obj:setFrame(self.sprite.frame)
	end)
	
	self.socks = socks
	self:addChild(socks)
end

function Shadowguy:getDamageSound()
    Assets.playSound("scream", 0.8, 0.9 + Utils.random(0.15))
end

function Shadowguy:onActStart(battler, name)
	if name ~= "ShootHeartsX" then
		return super.onActStart(self, battler, name)
	else
		return Game.battle:startActCutscene("shadowguy", "shoothearts_x")
	end
end

function Shadowguy:onAct(battler, name)
    if name == "ShootHearts" then
        self:addMercy(30)
        return "* "..battler.chara.name.." pointed at Shadowguy!"
	end
	
	return super.onAct(self, battler, name)
end

function Shadowguy:getXAction(battler)
    return "ShootHearts"
end

function Shadowguy:getEnemyDialogue()
    local dialogue
	
    if self.mercy >= 100 then
        dialogue = {
			-- WIP
			"That was COOL!",
			"Hee Hee!"
		}
    else
        dialogue = {
			-- WIP
			"Chasing shadows?\nJoin the mob!",
			"We'll knock your\nsocks OFF!",
			"What's up with that\nZOMBIE walk?",
		}
    end
	
    return dialogue[math.random(#dialogue)]
end

return Shadowguy