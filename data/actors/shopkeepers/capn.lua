local actor, super = Class(Actor, "shopkeepers/capn")

function actor:init()
    super.init(self)

    self.name = "Cap'n"

    self.width = 91
    self.height = 59

    self.path = "shopkeepers/capn"
    self.default = "idle"

    self.miniface = "face/mini/capn"

    self.animations = {
        ["idle"] = {"idle", 0.25, true},
    }

    self.talk_sprites = {
        ["talk"] = 0.15,
    }
end

function actor:onSpriteInit(sprite)
    sprite.body = Sprite(self.path.."/body", sprite.x, sprite.y + 45)
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
        sprite.anim = "talk"
    end
end

function actor:onTalkEnd(text, sprite)
    if sprite.anim == "talk" then
        sprite.anim = "idle"
    end
end

return actor