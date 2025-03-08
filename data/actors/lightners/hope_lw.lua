local actor, super = Class(Actor, "hope_lw")

function actor:init()
    super.init(self)

    self.name = "Hope"

    self.width = 21
    self.height = 43

    self.hitbox = {0, 21, 21, 23}

    self.color = {1, 0, 1}

    self.path = "npcs/lightners/hope/light"
    self.default = "phone"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["phone"] = {"phone", 0.25, true},
    }

    self.offsets = {
        ["phone"] = {0, 0},
        ["phone_look"] = {0, 0},
        ["phone_look_left"] = {0, 0},
        ["phone_look_right"] = {0, 0},
    }
end

function actor:onTalkStart(text, sprite)
    local player = Game.world.player
    if sprite.sprite == "phone" then
        if player.facing == "right" then
            sprite:setSprite("phone_look_left")
        elseif player.facing == "left" then
            sprite:setSprite("phone_look_right")
        elseif player.facing == "up" then
            sprite:setSprite("phone_look")
        end
    end
end

function actor:onWorldUpdate(chara)
    if not Game.world:hasCutscene() then
        if chara.sprite.sprite == "phone_look_left" or chara.sprite.sprite == "phone_look_right" or chara.sprite.sprite == "phone_look" then
            chara:setAnimation("phone")
        end
    end
end

return actor