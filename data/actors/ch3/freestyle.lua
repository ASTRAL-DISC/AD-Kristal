local actor, super = Class(Actor, "freestyle")

function actor:init()
    super.init(self)

    self.name = "Freestyle"

    self.width = 47
    self.height = 64

    self.hitbox = {9, 50, 35, 14}

    self.flip = nil

    self.path = "npcs/ch3/freestyle"
    self.default = "talk_2"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {}

    self.animations = {
        ["talk"] = {"talk", function(sprite, wait)
            while true do
                for i = 1, 3 do
                    sprite:setFrame(i)
                    sprite:shake(2)
                    wait(1)
                end
            end
        end}
    }
    
    self.offsets = {
        ["talk"] = {0, 0},
    }
end

function actor:onTalkStart(text, sprite)
    if sprite.sprite == "talk_2" then
        sprite:setAnimation("talk")
    end
end

function actor:onWorldUpdate(chara)
    if not Game.world:hasCutscene() then
        if chara.sprite.anim == "talk" then
            chara:setSprite("talk_2")
        end
    end
end

return actor