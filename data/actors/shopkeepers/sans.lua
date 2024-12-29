local actor, super = Class(Actor, "shopkeepers/sans")

function actor:init()
    super.init(self)

    self.name = "Sans"

    self.width = 135
    self.height = 109
    
    self.voice = "sans"

    self.path = "shopkeepers/sans"
    self.default = "idle"

    self.font = "comicsnas"

    self.animations = {
        ["idle"] = {"idle", function(sprite, wait)
            while true do
                sprite:setFrame(1)
                wait(2)
                for i = 2, 4 do
                    sprite:setFrame(i)
                    wait(5/30)
                end
            end
        end}
    }

    self.talk_sprites = {
        ["talk"] = 0,
        ["closed"] = 0,
        ["creepy"] = 0,
        ["eyelids"] = 0,
        ["eyelids_side"] = 0,
        ["wink"] = 0,
        ["side"] = 0
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