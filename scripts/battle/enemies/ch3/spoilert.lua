local Spoilert, super = Class(EnemyBattler, "spoilert")

function Spoilert:init()
    super.init(self)

    self.name = "Spoilert"
    self:setActor("spoilert")

    self.max_health = 320
    self.health = 320
    self.attack = 10
    self.defense = 0
    self.money = 105

    self.spare_points = 20
    self.recruit = 3

    self.waves = {
        "aiming",
        "basic"
    }

    self.check = "Will tell you all about your favorite TV show!"

    self.text = {
        "* Spoilert tells you about unaired episodes from \"Esteban of the Cosmos\".",
        "* This enemy failed to wait one week after premiere.",
        "* Spoilert holds onto important information about your favorite character.",
        "* Spoilert leaks what seems to be someone's private email address."
    }

    self.tired_text = "* Spoilert apologizes for uploading TBA content."

    self:registerAct("Avoid")
    self:registerAct("AvoidAll", "", "all")
    self:registerAct("Stare")
    self:registerAct("X-Slash")

    self.text_override = nil
    self.dialogue_bubble = "signal"
end

function Spoilert:onActStart(battler, name)
    if name == "Avoid" then
        battler:setActSprite("enemies/ch3/spoilert/avoid/kris", -2, 0, 0, false)
    elseif name == "AvoidAll" then
        for _,battler in ipairs(Game.battle.party) do
            if battler.chara.id == "kris" then
                battler:setActSprite("enemies/ch3/spoilert/avoid/kris", -3, -1, 0, false)
            elseif battler.chara.id == "susie" then
                battler:setActSprite("enemies/ch3/spoilert/avoid/susie", 3, -1, 0, false)
            elseif battler.chara.id == "ralsei" then
                battler:setActSprite("enemies/ch3/spoilert/avoid/ralsei", 0, 1, 0, false)
            end
        end
    else
        super.onActStart(self, battler, name)
    end
end

function Spoilert:onAct(battler, name)
    if name == "Avoid" then
        self:addMercy(10)
        self.text_override = "You REALLY don't\nwanna KNOW?!"
        return "* You avoided spoilers!"
    elseif name == "AvoidAll" then
        self:addMercy(30)
        self:setTired(true)
        self.text_override = "Suit yourself..."
        return "* Everyone avoided spoilers!\nSpoilert became [color:blue]TIRED[color:reset]..."
    elseif name == "Stare" then
        self:addMercy(100)
        Game.battle:startActCutscene(function(cutscene)
            cutscene:text("* You stared directly at the\noffending truth...")
            cutscene:text("* ...And immediately regretted it!")
        end)
        return
    elseif name == "X-Slash" then
        -- code by AcousticJamm
        local damage = math.floor((((battler.chara:getStat("attack") * 150) / 20) - 3 * (self.defense)) * 1.3)

        function XSlash(x_scale)
            local cut = Sprite("effects/attack/cut")
            Assets.playSound("scytheburst")
            Assets.playSound("criticalswing", 1.2, 1.3)
            battler:setActSprite("party/kris/dark/battle/attack", -8, -6, 1/15)
            cut:setOrigin(0.5,0.5)
            cut:setScale(2.5 * x_scale, 2.5)
            cut:setPosition(self:getRelativePos(self.width/2, self.height/2))
            cut.layer = self.layer + 0.01
            cut:play(1/15, false, function() cut:remove() end)
            self.parent:addChild(cut)
        end

        Game.battle:battleText("* Kris used X-Slash!")
        XSlash(1)
        self:hurt(damage, battler, function() end)
        Game.battle.timer:after(1/2, function()
            XSlash(-1)
            self:hurt(damage, battler)
            Game.battle.timer:after(1/2, function()
                Game.battle:finishActionBy(battler)
                --battler:resetSprite()
            end)
        end)
    elseif name == "Standard" then
        self:addMercy(40)
        if battler.chara.id == "susie" then
            Game.battle:startActCutscene(function(cutscene)
                cutscene:text("* Susie confronted the enemy!")
                cutscene:text("* Y'know, I don't really care for spoilers myself.", "nervous", "susie")
                cutscene:text("* So, uh, whatever.", "smile", "susie")
                cutscene:text("* Hit me with your best shot, twerp!![react:1]", "teeth_b", "susie", {reactions = {
                    {"B-But Susie, the\nviewers...", "right", "bottommid", "shock_smile", "ralsei"}
                }
            })
            end)
            return
        elseif battler.chara.id == "ralsei" then
            Game.battle:startActCutscene(function(cutscene)
                cutscene:text("* Ralsei tried to reason with the enemy!")
                cutscene:text("* Um... Most people like to consume stories for the journey rather than the end.", "smile", "ralsei")
                cutscene:text("* Don't you think that telling what happens... would ruin that?",  "pleased", "ralsei")
                cutscene:battlerText("spoilert", "I don't really care")
            end)
            return
        end
    end
    return super.onAct(self, battler, name)
end

function Spoilert:getEnemyDialogue()
    if self.text_override then
        local dialogue = self.text_override
        self.text_override = nil
        return dialogue
    end

    local dialogue
    if self.mercy >= 100 then
        dialogue = {
            "My JOB here\nis DONE!",
            "ENJOY the SHOW!"
        }
    else
        dialogue = {
            "You won't BELIEVE\nwhat happens in the\nFINAL CHAPTER!",
            "There's a CRAZY reveal\ncoming up about the MOTHER\nFIGURE...",
            "Did you SEE the\nNEWEST leak yet?!",
            "The scientist is\nNOT ACTUALLY the dad!",
            "SOMEONE DIES at the end!\n...Nearly.",
            "Gotta tell...!\n[wait:5]Gotta tell EVERYONE!"
        }
    end
    return dialogue[math.random(#dialogue)]
end

return Spoilert