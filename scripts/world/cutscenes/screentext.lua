return {
    ch7 = function (cutscene, event)
        -- original code by KateBulka, Sylvi and Ally
        Game.world.music:pause()
        local black = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        black.parallax_x = 0
        black.parallax_y = 0
        black.layer = 100
        black.color = {0, 0, 0}
        
        local white = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        white.parallax_x = 0
        white.parallax_y = 0
        white.layer = 100
        white.color = {1, 1, 1}
        white.alpha = 0
        Game.world:addChild(black)
        Game.world:addChild(white)
        cutscene:wait(1.5)
        
        Assets.playSound("w")
        
        white.update = function(self)
		    self.alpha = self.alpha + (DT * 0.1)
        end
        
        cutscene:wait(0.5)
        local x = 320
        local y = 277

        local function unusedTextRemove(wait)
            local this_text = text
            this_text:remove()
        end
        local function unusedText(str, advance)
            text = DialogueText("[noskip][speed:0.32][voice:susie_echo][style:unused]" .. str, 160, 100, 640, 480,
                                { auto_size = true })
            text.layer = WORLD_LAYERS["top"] + 100
            text.parallax_x = 0
            text.parallax_y = 0
            Game.world:addChild(text)

            --[[if advance ~= false then
                cutscene:wait(function () return not text:isTyping() end)
                unusedTextRemove(true)
            end]]
        end

        unusedText("Kris...!")

        cutscene:wait(1)
        unusedTextRemove()
        unusedText("Wake up!")
        
        cutscene:wait(1.5)
        unusedTextRemove()
        unusedText("KRIS...!")

        white.update = function(self)
            self.alpha = self.alpha + (DT * 0.25)
        end

        cutscene:wait(2)

        white:remove()
        black:remove()
        unusedTextRemove()
        Game.world.music:resume()
    end
}