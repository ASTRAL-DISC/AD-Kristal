local WetFloor, super = Class(Event, "wetfloor")

function WetFloor:init(x, y, w, h, properties)
    super.init(self, x, y, w, h)

    --self.fall = properties["fall"] or "kris"
end

function WetFloor:onCollide(chara)
    if (chara.last_x or chara.x) < self.x + self.width and (chara.last_y or chara.y) < self.y + self.height and chara.is_player then
        if chara.state ~= "WETSLIDE" then
            if self:checkAgainstWall(chara) then return end

            Assets.stopAndPlaySound("wing")
        end

        chara:setState("WETSLIDE", false)

        chara.current_wetslide_area = self
    end
end

function WetFloor:onExit(chara)
    if chara.is_player and chara.state == "WETSLIDE" then
        chara:setState("WALK")
        chara.current_wetslide_area = nil
    end
end

function WetFloor:update()
    if not Game.world.player then return end

    local stopped = false

    Object.startCache()

    if Game.world.player.x > self.x + self.width and Game.world.player.y > self.y + self.height and not Game.world.player:collidesWith(self.collider) then
        self.solid = true

        if Game.world.player.state == "WETSLIDE" and Game.world.player.current_wetslide_area == self then
            stopped = true
        end
    else
        self.solid = false
    end

    if not stopped and Game.world.player.state == "WETSLIDE" and Game.world.player.current_wetslide_area == self then
        stopped = self:checkAgainstWall(Game.world.player)
    end

    Object.endCache()

    if stopped then
        Game.world.player:setState("WALK")
        Game.world.player.sprite:resetSprite()
        for i, follower in ipairs(Game.world.followers) do
            follower.sprite:resetSprite()
        end

        Game.world.player.current_wetslide_area = nil
    end

    super.update(self)
end

function WetFloor:checkAgainstWall(chara)
    local hb = chara.collider

    if hb and hb:includes(Hitbox) then
        local extended_hitbox = Hitbox(chara, hb.x + 0.25, hb.y + 0.25, hb.width - 0.5, (hb.height - 0.5) * 1.5)

        if self.world:checkCollision(extended_hitbox) then
            return true
        end
    end

    return false
end

return WetFloor