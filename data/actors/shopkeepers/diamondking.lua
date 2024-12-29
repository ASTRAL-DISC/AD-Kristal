local actor, super = Class(Actor, "shopkeepers/diamondking")

function actor:init()
    super.init(self)

    self.name = "Diamond King"

    self.width = 174
    self.height = 118

    self.path = "shopkeepers/diamondking"
    self.default = "idle"

    self.animations = {
        ["idle"] = {"idle", function(sprite, wait)
            while true do
                sprite:setFrame(1)
                wait(3)
                for i = 2, 14 do
                    sprite:setFrame(i)
                    wait(2.8/30)
                end
            end
        end}
    }

    self.talk_sprites = {
        ["talk"] = 0.15
    }
end

function actor:onTalkStart(text, sprite)
    if sprite.sprite == "idle" then
        sprite:setSprite("talk")
    end
end

function actor:onTalkEnd(text, sprite)
    if sprite.sprite == "talk" then
        sprite:setAnimation("idle")
    end
end

return actor