local actor, super = Class(Actor, "shopkeepers/sweet")

function actor:init()
    super.init(self)

    self.name = "Sweet"

    self.width = 84
    self.height = 86

    self.path = "shopkeepers/sweet"
    self.default = "idle"

    self.miniface = "face/mini/sweet"

    self.animations = {
        ["idle"] = {"idle", 0.18, true}
    }

    self.talk_sprites = {
        ["talk"] = 0.15,
        ["happy"] = 0,
    }
    
    self.offsets = {
        ["idle"] = {0, 0},
        ["talk"] = {3, 0},
        ["happy"] = {3, 0},
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