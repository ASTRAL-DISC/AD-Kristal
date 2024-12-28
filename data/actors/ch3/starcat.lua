local actor, super = Class(Actor, "starcat")

function actor:init()
    super.init(self)

    self.name = "Star Cat"

    self.width = 30
    self.height = 33

    self.hitbox = {6, 20, 20, 13}

    self.flip = "left"

    self.path = "npcs/ch3/starcat"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {}

    self.animations = {
        ["idle"] = {"idle", 0.4, true},
        ["talk"] = {"idle", 0.15, true},
    }
    
    self.offsets = {
        ["idle"] = {0, 0},
        ["talk"] = {0, 0},
    }
end

function actor:onTalkStart(text, sprite)
    if sprite.anim == "idle" then
        sprite:setAnimation("talk")
    end
end

function actor:onWorldUpdate(chara)
    if not Game.world:hasCutscene() then
        if chara.sprite.anim == "talk" then
            chara:setAnimation("idle")
        end
    end
end

return actor