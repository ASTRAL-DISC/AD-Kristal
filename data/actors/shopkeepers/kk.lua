local actor, super = Class(Actor, "shopkeepers/kk")

function actor:init()
    super.init(self)

    self.name = "K_K"

    self.width = 144
    self.height = 93

    self.path = "shopkeepers/kk"
    self.default = "idle"

    self.miniface = "face/mini/kk"

    self.animations = {
        ["idle"] = {"idle", function(sprite, wait)
            while true do
                sprite:setFrame(1)
                wait(0.5)
                for i = 2, 4 do
                    sprite:setFrame(i)
                    wait(4/30)
                end
            end
        end}
    }

    self.talk_sprites = {
        ["talk"] = 0.15,
    }
end

function actor:onSpriteInit(sprite)
    sprite.body = Sprite(self.path.."/body", sprite.x - 18, sprite.y + 25)
    sprite.body:setLayer(sprite.layer - 1)
    sprite.body:play(0.1, true)
    sprite:addChild(sprite.body)
end

function actor:onSetSprite(sprite, texture, keep_anim)
    if texture == "idle_1" then
        sprite.body:stop()
    elseif texture == "idle" then
        sprite.body:play(0.1, true)
    end
end

function actor:onTalkStart(text, sprite)
    if sprite.anim == "idle" then
        sprite:setSprite("talk")
    end
end

function actor:onTalkEnd(text, sprite)
    if sprite.anim == "talk" then
        sprite:setAnimation("idle")
    end
end

return actor