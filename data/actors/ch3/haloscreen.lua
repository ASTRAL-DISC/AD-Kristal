local actor, super = Class(Actor, "haloscreen")

function actor:init()
    super.init(self)

    self.name = "Halojack"

    self.width = 78
    self.height = 49

    self.path = "npcs/ch3/halojack/screen"
    self.default = "idle"

    self.voice = "halojack"

    self.animations = {
        ["idle"] = {"idle", 0.15, true},
        ["eye"] = {"eye", 0.1, false},
        ["fix"] = {"fix", 0.1, false},
        ["poke"] = {"poke", 0.15, true},
        ["static"] = {"static", 0.1, true},
        ["squint"] = {"squint", 0, false},
        ["off"] = {"off", 0.1, false},
    }

    self.talk_sprites = {
        ["talk"] = 0.18,
    }
    
    self.offsets = {}
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