local actor, super = Class(Actor, "suncat")

function actor:init()
    super.init(self)

    self.name = "Sun Cat"

    self.width = 40
    self.height = 22

    self.hitbox = {5, 10, 30, 12}

    self.flip = "left"

    self.path = "npcs/ch3/suncat"
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