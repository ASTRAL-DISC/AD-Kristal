return {
    lancer = function(cutscene, event)
        local lancer = cutscene:getCharacter("lancer")
        local susie = cutscene:getCharacter("susie")
        local ralsei = cutscene:getCharacter("ralsei")
        cutscene:setSpeaker("lancer")
        cutscene:text("* Lancer cookies! [wait:5]Want one?", "disguise_smile")
        cutscene:setSpeaker()
        local choice = cutscene:choicer({"Take Cookie", "Do Not"})
        if choice == 1 then
            if Game.inventory:hasItem("lancercookie") then
                cutscene:setSpeaker("lancer")
                cutscene:text("* You already tookie a cookie!", "disguise")
                cutscene:text("* Wait! [wait:5]I'm still regenerating from the last one.", "disguise")
            else
                local success, result = Game.inventory:tryGiveItem("lancercookie")
                if success then
                    cutscene:setSpeaker("lancer")
                    cutscene:text("* I now pronounce you... [wait:5]cookie and wife.", "disguise_smile")
                    cutscene:setSpeaker()
                    cutscene:text(result)
                else
                    cutscene:setSpeaker("lancer")
                    cutscene:text("* There's no space for\nthe cookie!", "disguise")
                    cutscene:text("* Too bad!", "disguise_smile")
                    if susie then
                        cutscene:setSpeaker("susie")
                        cutscene:text("* Hey, [wait:5]why are you saving it for later, [wait:5]Kris?", "teeth")
                        cutscene:text("* Can't we just... [wait:5]eat it without pocketing it?", "smile")
                        cutscene:setSpeaker("lancer")
                        cutscene:text("* That's... [wait:5]not how it works.", "disguise_smile")
                    end
                end
            end
        else
            cutscene:setSpeaker("lancer")
            cutscene:text("* Even if you get\nstronger, [wait:5]Lancer Cookies never falter!", "disguise")
            cutscene:text("* Always reliable, [wait:5]they will heal you in times of need!", "disguise")
            if ralsei then
                cutscene:setSpeaker("ralsei")
                cutscene:text("* (Maybe if you need to be healed 1 HP...)", "surprise_neutral")
            end
        end
    end,
    malius = function(cutscene, event)
        local malius = cutscene:getCharacter("malius")
        cutscene:setSpeaker(malius)
        if event.interact_count == 1 then
            cutscene:text("* Well, [wait:5]well. [wait:5]Welcome to TOP BAKERY.")
            cutscene:text("* I am this bakery's smith, [wait:5]MALIUS.")
            cutscene:text("* I do not know what any of these STRANGE TOOLS are for.")
            cutscene:text("* But using my skills, [wait:5]I can FUSE items to create NEW ONES.")
        else
            cutscene:text("* Welcome to TOP BAKERY.")
        end
        local choice = cutscene:choicer({"Fuse Items", "Fix Us", "Chat", "Leave"})
        if choice == 1 then
            cutscene:after(function()
				Game.world:openMenu(FuseMenu())
			end)
        elseif choice == 2 then
            cutscene:text("* Your body is a weapon, [wait:5]too. [wait:5]You must take care of it from time to time.")
            cutscene:text("* Huh-hah! [wait:5]Let's feel my technique.")

            Game.world.music:pause()
            Assets.playSound("noise")
            malius:setAnimation("powerup")
            cutscene:wait(0.8)
            cutscene:detachFollowers()

            local function fix(i)
                local party = Game.party[i]
                local chara = Game.world:getCharacter(party.actor.id)

                local function maliusHit()
                    malius:setAnimation("hit")
                    Game.world.timer:after(0.3, function ()
                        Assets.playSound("squeaky")
                    end)
                    cutscene:wait(0.6)
                end

                local start_x, start_y = chara.x, chara.y
                local x, y = cutscene:getMarker("fix")
                
                chara:setPosition(x, y)
                if chara.actor.id == "noelle" or chara.actor.id == "mteen" then
                    chara:setSprite("shocked")
                elseif chara.actor.id == "ralsei" then
                    chara:setSprite("battle/hurt")
                elseif chara.actor.id == "berdly" then
                    chara:setSprite("shocked_left")
                elseif chara.actor.id == "susie" then
                    chara:setSprite("shock_left")
                elseif chara.actor.id == "kris" or chara.actor.id == "angel" then
                    chara:setFacing("down")
                end
                maliusHit()
                maliusHit()
                chara:setPosition(start_x, start_y)
                chara:resetSprite()
            end

            for i = 1, #Game.party do
                fix(i)
            end

            Game.world.music:resume()
            Assets.playSound("power")
            for _,chara in ipairs(Game.party) do
                chara:heal(math.huge, false)
            end

            malius:resetSprite()
            cutscene:setSpeaker()
            cutscene:text("* (Somehow, [wait:5]everyone's HP was restored.)")
            cutscene:setSpeaker(malius)
            cutscene:text("* Well, [wait:5]well! [wait:5]Don't you feel better after a nice massage? [wait:5]Huh-Hah!!")

            cutscene:attachFollowers()
            cutscene:interpolateFollowers()
        elseif choice == 3 then
            cutscene:setSpeaker(malius)
            cutscene:text("* BREAD...? [wait:5]What is this technique you speak of?")
        else
            cutscene:setSpeaker(malius)
            cutscene:text("* Good journey, [wait:5]my friends.")
        end
    end,
    fusing = function(cutscene, event)
        local malius = cutscene:getCharacter("malius")
        cutscene:setSpeaker(malius)

        local item1 = Game:getFlag("fuse_items_data")["item1"]
        local item2 = Game:getFlag("fuse_items_data")["item2"]

        local function maliusHit()
            malius:setAnimation("hit")
            Game.world.timer:after(0.3, function ()
                Assets.playSound("squeaky")
            end)
            cutscene:wait(0.6)
        end

        if Game:getFlag("fused_once") then
            cutscene:text("* Let's pick up the pace.")
        else
            cutscene:text("* Huh-hah! [wait:5]Let's feel my technique!")
        end

        local x, y = cutscene:getMarker("fuse")

        local bag = Sprite("misc/itembag/" ..item1.type, x - 16, y)
        bag:setOrigin(0.5, 0.5)
        bag:setScale(2)
        bag.layer = malius.layer
        Game.world:addChild(bag)

        local bag2 = Sprite("misc/itembag/" ..item2.type, x + 16, y)
        bag2:setOrigin(0.5, 0.5)
        bag2:setScale(2)
        bag2.layer = malius.layer
        Game.world:addChild(bag2)

        maliusHit()

        bag:remove()
        bag2:remove()
        if Game:getFlag("fused_once") then
            local sprite3 = Game:getFlag("fuse_items_data")["result"].type

            local bag3 = Sprite("misc/itembag/" ..sprite3, x, y)
            bag3:setOrigin(0.5, 0.5)
            bag3:setScale(2)
            bag3.layer = malius.layer
            Game.world:addChild(bag3)

            Assets.playSound("item")
            malius:resetSprite()
            cutscene:setSpeaker()
            cutscene:text("* (You got "..Game:getFlag("fuse_items_data")["result"].name.."!)")
            bag3:remove()
        else
            local smush = Sprite("misc/itembag/smush", x - 16, y)
            smush:setOrigin(0.5, 0.5)
            smush:setScale(2)
            smush:setFrame(1)
            smush.layer = malius.layer
            Game.world:addChild(smush)

            local smush2 = Sprite("misc/itembag/smush", x + 16, y)
            smush2:setOrigin(0.5, 0.5)
            smush2:setScale(2)
            smush2:setFrame(1)
            smush2.layer = malius.layer
            Game.world:addChild(smush2)

            maliusHit()
            smush:setFrame(2)
            smush2:setFrame(2)
            maliusHit()

            smush:remove()
            smush2:remove()

            local sprite3 = Game:getFlag("fuse_items_data")["result"].type

            local bag3 = Sprite("misc/itembag/" ..sprite3, x, y)
            bag3:setOrigin(0.5, 0.5)
            bag3:setScale(2)
            bag3.layer = malius.layer
            Game.world:addChild(bag3)

            Assets.playSound("item")
            malius:resetSprite()
            cutscene:setSpeaker()
            cutscene:text("* (You got "..Game:getFlag("fuse_items_data")["result"].name.."!)")
            bag3:remove()
            Game:setFlag("fused_once", true)
        end
    end,
}