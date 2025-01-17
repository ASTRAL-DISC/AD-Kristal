-- og library by MrFukuo
local Autowalk, super = Class(Event)

function Autowalk:init(data)
    super:init(self, data.center_x, data.center_y, data.width, data.height)

    self:setOrigin(0.5, 0.5)
    self.direction = data.properties["direction"]
    if data.properties["speed"] == nil then
        self.speed = 5
    else
        self.speed = data.properties["speed"]
    end

    if data.properties["frontexit"] == nil then
        self.frontexit = false
    else
        self.frontexit = data.properties["frontexit"]
    end

    if data.properties["backenter"] == nil then
        self.backenter = false
    else
        self.backenter = data.properties["backenter"]
    end

    if data.properties["counterspeed"] == nil then
        self.counterspeed = self.speed / 2
    else
        self.counterspeed = data.properties["counterspeed"]
    end

    --[[
    -- ASK CHISEL ABOUT THIS
    -- If frontexist is flagged as false, the exit won't be blocked no matter if the player has exit or not - default behavior (?)
    -- If frontexit is flagged as true, it means the entrance will be blocked afterwards to prohibit backtracking (?)
    -- If backenter is flagged as true, the entrance will be blocked after the character have entered (?)
    if self.backenter == true and self.frontexit == true then
        self.blockfront = true
        self.blockback = true
        self.blockboth = true
    elseif self.backenter == true and self.frontexit == false then
        self.blockfront = true
        self.blockback = false
        self.blockboth = false
    elseif self.backenter == false and self.frontexit == true then
        self.blockfront = false
        self.blockback = true
        self.blockboth = false
    end
    ]]

end

function Autowalk:onEnter(player)
    if self.direction == "right" then
        self.mover = true

    elseif self.direction == "left" then
        self.movel = true
        -- if self.backenter == false then
        --     if Game.world.player.x >= self.x then
        --         Game.world.player.walk_speed = 0
        --     end
        -- end
    elseif self.direction == "up" then
        self.moveu = true
        -- if self.backenter == false then
        --     if Game.world.player.y >= self.y then
        --         Game.world.player.walk_speed = 0
        --     end
        -- end
    elseif self.direction == "down" then
        self.moved = true
        -- if self.backenter == false then
        --     if Game.world.player.y <= self.y - self.width then
        --         Game.world.player.walk_speed = 0
        --     end
        -- end
    end
end

function Autowalk:update()
    -- AUTOWALK DIRECTION: RIGHT
    if self.mover == true then
        if Input.pressed("right", false) or Input.pressed("left", false) then
            for i, follower in ipairs(Game.world.followers) do
                follower.sprite:resetSprite()
            end
        end
        -- Changes player's walk_speed to the autowalk's speed, and multiplies speed by 2 if player pressed the right direction...
        -- Note: The characters will be moving even without player input
        if Input.down("right") then
            Game.world.player.walk_speed = self.speed * 2

        -- If going left in a right autowalk, the speed will be halved...
        elseif Input.down("left") then
            Game.world.player.walk_speed = self.counterspeed

        elseif not Input.down("left") and not Input.down("right") then
            -- Stop follower from moving when no input (left and right directions in RIGHT autowalk)
            for i, follower in ipairs(Game.world.followers) do
                follower.sprite:setSprite("walk/"..follower.facing.."_1")
            end
            Game.world.player:setPosition(Game.world.player.x + self.speed, Game.world.player.y)
        end

        -- For blocking directions in the autowalk
        -- if self.blockboth == true then
        --     if Game.world.player.x > self.x + 3 and Game.world.player.x < self.x + (self.width/2) then
        --         self:setHitbox(0, 0, 1, self.height)
        --     elseif Game.world.player.x > ((self.x + self.width) - 1) then
        --         self:setHitbox(self.width - 2, 0, 1, self.height)
        --     end
        -- elseif self.blockfront then
        --     if Game.world.player.x > self.x + 3 then
        --         self:setHitbox(0, 0, 1, self.height)
        --     end
        -- elseif self.blockback then
        --     if Game.world.player.x > ((self.x + self.width) - 1) then
        --         self:setHitbox(self.width - 2, 0, 1, self.height)
        --     end
        -- end

    -- AUTOWALK DIRECTION: LEFT
    elseif self.movel == true then
        if Input.pressed("right", false) or Input.pressed("left", false) then
            for i, follower in ipairs(Game.world.followers) do
                follower.sprite:resetSprite()
            end
        end
        if Input.down("right") then
            Game.world.player.walk_speed = self.counterspeed
        elseif Input.down("left") then
            Game.world.player.walk_speed = self.speed * 2
        elseif not Input.down("left") and not Input.down("right") then
            -- Stop follower from moving when no input (left and right directions in LEFT autowalk)
            for i, follower in ipairs(Game.world.followers) do
                follower.sprite:setSprite("walk/"..Game.world.player.facing.."_1")
            end
            Game.world.player:setPosition(Game.world.player.x - self.speed, Game.world.player.y)
        end

    -- AUTOWALK DIRECTION: UP
    elseif self.moveu == true then
        if Input.pressed("up", false) or Input.pressed("down", false) then
            for i, follower in ipairs(Game.world.followers) do
                follower.sprite:resetSprite()
            end
        end
        if Input.down("up") then
            Game.world.player.walk_speed = self.speed * 2
        elseif Input.down("down") then
            Game.world.player.walk_speed = self.counterspeed
        -- Stop follower from moving when no input (down and up directions in UP autowalk)
        elseif not Input.down("down") and not Input.down("up") then
            for i, follower in ipairs(Game.world.followers) do
                follower.sprite:setSprite("walk/"..Game.world.player.facing.."_1")
            end
            Game.world.player:setPosition(Game.world.player.x, Game.world.player.y - self.speed)
        end

    -- AUTOWALK DIRECTION: DOWN    
    elseif self.moved == true then
        if Input.pressed("up", false) or Input.pressed("down", false) then
            for i, follower in ipairs(Game.world.followers) do
                follower.sprite:resetSprite()
            end
        end
        if Input.down("up") then
            Game.world.player.walk_speed = self.counterspeed
        elseif Input.down("down") then
            Game.world.player.walk_speed = self.speed * 2
        -- Stop follower from moving when no input (down and up directions in DOWN autowalk)
        elseif not Input.down("down") and not Input.down("up") then
            for i, follower in ipairs(Game.world.followers) do
                follower.sprite:setSprite("walk/"..Game.world.player.facing.."_1")
            end
            Game.world.player:setPosition(Game.world.player.x, Game.world.player.y + self.speed)
        end
    end
end

function Autowalk:onExit(player)
    Game.world.player.walk_speed = 4
    for i, follower in ipairs(Game.world.followers) do
        follower.sprite:resetSprite()
    end
    self.mover = false
    self.movel = false
    self.moveu = false
    self.moved = false
end

return Autowalk