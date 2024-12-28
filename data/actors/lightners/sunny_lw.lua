local actor, super = Class(Actor, "sunny_lw")

function actor:init()
    super.init(self)

    self.name = "Sunny"

    self.width = 20
    self.height = 44

    self.hitbox = {0, 20, 20, 24}

    self.color = {1, 0, 1}

    self.path = "npcs/lightners/sunny/light"
    self.default = "talk"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {
        ["talk"] = 0.25,
        ["talk_left"] = 0.25,
        ["talk_right"] = 0.25
    }

    self.animations = {}

    self.offsets = {
        ["talk"] = {-1, 0},
        ["up"] = {0, 0},
        ["talk_left"] = {0, 0},
        ["talk_right"] = {0, 0},
    }
end

function actor:onTalkStart(text, sprite)
    local player = Game.world.player
    if sprite.sprite == "up" then
        if player.facing == "right" then
            sprite:setSprite("talk_left")
        elseif player.facing == "left" then
            sprite:setSprite("talk_right")
        elseif player.facing == "up" then
            sprite:setSprite("talk")
        end
    end
end

function actor:onWorldUpdate(chara)
    if not Game.world:hasCutscene() then
        if chara.sprite.sprite == "talk_left" or chara.sprite.sprite == "talk_right" or chara.sprite.sprite == "talk" then
            chara.sprite:setSprite("up")
        end
    end
end

return actor