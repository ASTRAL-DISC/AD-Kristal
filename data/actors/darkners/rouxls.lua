local actor, super = Class(Actor, "rouxls")

function actor:init()
    super.init(self)
    
    self.name = "Rouxls Kaard"
    
    self.width = 47
    self.height = 57

    self.hitbox = {0, 47, 41, 10}

    self.color = {0, 0, 0.5}

    self.flip = nil

    self.path = "npcs/darkners/rouxls"
    self.default = "talk"

    self.voice = nil
    self.portrait_path = "face/rouxls"
    self.portrait_offset = {0, 0}

    self.talk_sprites = {
        ["talk"] = 0.25,
    }

    self.animations = {
        ["dance"] = {"dance", 0.2, true},
        ["cowboy/appear"] = {"cowboy/appear", 0.2, false},
        ["nun/appear"] = {"nun/appear", 0.2, false},
    }

    self.offsets = {
        ["talk"] = {0, 0},
        ["lamp"] = {0, 0},

        ["dance"] = {0, -2},

        ["cowboy/appear"] = {0, 2},
        ["nun/appear"] = {0, 0},
    }
end

function actor:onPortraitDraw(portrait, overlay, x, y, textbox)
    if Game:getFlag("cowboy_rouxls") and portrait then
        overlay = Sprite(self.portrait_path .. "/hats/cowboy", x, y - 5)
        overlay:setScale(2)
        textbox:addChild(overlay)
    end
end

return actor