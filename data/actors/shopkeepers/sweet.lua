local actor, super = Class(Actor, "shopkeepers/sweet")

function actor:init()
    super.init(self)

    self.name = "Sweet"

    self.width = 320
    self.height = 120

    self.path = "shopkeepers/sweet"
    self.default = "idle"

    self.miniface = "face/mini/sweet"

    self.animations = {
        ["idle"] = {"idle", 0, true},
        ["talk"] = {"talk", 0, true},
        ["happy"] = {"happy", 0, true}
    }
end

function actor:onSpriteInit(sprite)
    super.onSpriteInit(sprite)

    sprite.siner = 0

    sprite.body = Assets.getFrames(self.path.."/sweet")
    sprite.talk = Assets.getFrames(self.path.."/sweet_talk")
    sprite.happy = Assets.getTexture(self.path.."/sweet_happy")
end

function actor:onSpriteDraw(sprite)
    super.onSpriteDraw(sprite)
	
	if Game.shop.music:isPlaying() then
        sprite.siner = sprite.siner + DTMULT
    end
    if sprite.anim == "idle" then
        Draw.draw(sprite.body[math.floor(sprite.siner/6) % #sprite.body + 1], 0, 0, 0, 1, 1, 0, 0)
    end
	if sprite.anim == "talk" then
        Draw.draw(sprite.talk[math.floor(sprite.siner/6) % #sprite.talk + 1], 0, 0, 0, 1, 1, 0, 0)
	end
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