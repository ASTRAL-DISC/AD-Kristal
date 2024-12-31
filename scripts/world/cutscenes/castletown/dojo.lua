return {
    joe = function(cutscene, event)
        cutscene:setSpeaker(event)
		cutscene:text("* Hey, [wait:5]boss! [wait:5]How can I help ya!?")
        cutscene:setSpeaker()
        if cutscene:choicer({"Challenge", "Nothing"}) == 1 then
			cutscene:after(function()
				Game.world:openMenu(ChallengeMenu())
			end)
		else
            cutscene:setSpeaker(event)
			cutscene:text("* We'll be working on NEW CHALLENGES, [wait:5]so check back in, [wait:5]Boss!")
		end
    end,
	reward = function(cutscene, event)
        local id = Game:getFlag("current_challenge")
        local challenge_data = Kristal.callEvent("createChallenge", id)
        if not Game:getFlag("challenges_completed") then
            Game:setFlag("challenges_completed", {})
        end
        if not Utils.getIndex(Game:getFlag("challenges_completed"), challenge_data.id) then
			cutscene:wait(0.8)
            cutscene:setSpeaker("joe")
			cutscene:text("* An amazing battle!")
        	cutscene:text("* As promised, [wait:5]here is your reward!")
            cutscene:setSpeaker()
            if type(challenge_data.prize_id) == "number" then
                Game.money = Game.money + challenge_data.prize_id
                cutscene:text("* (You received $"..challenge_data.prize.."!)")
                table.insert(Game:getFlag("challenges_completed"), id)
            elseif type(challenge_data.prize_id) == "string" then
                local item = Registry.createItem(challenge_data.prize_id)
                if Game.inventory:addItem(item) then
                    cutscene:text("* (You received "..item.name.."!)")
                    table.insert(Game:getFlag("challenges_completed"), id)
                else
                    Game:setFlag("challenges_completed", false)
                    cutscene:setSpeaker("joe")
                    cutscene:text("* Your inventory is too full, [wait:5]Boss!")
                    cutscene:text("* Try again!")
                end
            end
		elseif challenge_data.claimed then
            cutscene:wait(0.8)
            cutscene:setSpeaker("joe")
			cutscene:text("* An amazing battle!")
        	cutscene:text("* But you already won that prize, [wait:5]so we don't have another!")
        else
            cutscene:wait(0.8)
            cutscene:setSpeaker("joe")
			cutscene:text("* An amazing battle!")
        	cutscene:text("* But you already won that prize, [wait:5]so we don't have another!")
		end
        Assets.playSound("power")
        for _,chara in ipairs(Game.party) do
            chara:heal(math.huge, false)
        end
        local player = Game.world.player
        player:setFacing("down")
    end,
	graze = function(cutscene, event)
        cutscene:wait(1)
        cutscene:setSpeaker("joe")
		cutscene:text("* Boss! [wait:5]For bullets aimed right at you, [wait:5]try moving [color:yellow]one direction bit by bit[color:resetSprite]...!")
		Assets.playSound("power")
		for _,chara in ipairs(Game.party) do
			chara:heal(math.huge, false)
		end
		local player = Game.world.player
		player:setFacing("down")
    end,
	fommt = function(cutscene, event)
        cutscene:setSpeaker(event)
		cutscene:text("* Hee hee hee... [wait:5]Shall I help you SAVE?")
		cutscene:wait(0.25)
		Assets.playSound("save")

		event:setSprite("idle_1")
        event.sprite:flash()

		cutscene:wait(0.5)
		Game:saveQuick(Game.world.player:getPosition())
		cutscene:text("* (SAVE complete.)")
		event:resetSprite()
    end,
	
}