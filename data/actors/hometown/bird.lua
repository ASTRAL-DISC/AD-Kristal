local actor, super = Class(Actor, "bird")

function actor:init()
    super.init(self)

    self.name = "Small Bird"

    self.width = 15
    self.height = 19

    self.hitbox = {0, 10, 15, 9}

    self.color = {1, 1, 0}

    self.flip = nil

    self.path = "npcs/hometown/bird"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["idle"] = {"idle", 0.25, true},
        ["fly"] = {"fly", 0.1, true},
        ["cry"] = {"cry", 0.25, true},
        ["sleep"] = {"sleep", 0.25, true}
    }
    
    self.offsets = {
        ["idle"] = {0, 0},
        ["fly"] = {1, -1},
        ["cry"] = {0, 0},
        ["sleep"] = {-4, 4},
        ["wake"] = {-4, 4},
    }
end

function actor:onSpriteInit(sprite)
    sprite.sleeping = false

    sprite.z_spawn_rate = 0.4
    sprite.z_remove_after = 0.8
    sprite.z_spawn_timer = sprite.z_spawn_rate * 30
end

function actor:onSpriteUpdate(sprite)
    if sprite.sprite == "sleep" then
        sprite.sleeping = true
        if sprite.z_spawn_timer >= 0 then
            sprite.z_spawn_timer = sprite.z_spawn_timer - DTMULT
        else
            local z = Sprite("effects/bird_z", sprite.width/2 + 2, sprite.height/2 - 15)
            z:setScale(1)
            z.physics.direction = math.rad(math.random(-60))
            z.physics.speed = 0.3
            z.alpha = 0
            z:fadeTo(1, 0.5)
            Game.world.timer:after(sprite.z_remove_after, function()
                z:fadeOutSpeedAndRemove(0.1)
            end)
            z.layer = WORLD_LAYERS["above_events"]
            sprite:addChild(z)
            sprite.z_spawn_timer = sprite.z_spawn_rate * 30
        end
    end
end

return actor