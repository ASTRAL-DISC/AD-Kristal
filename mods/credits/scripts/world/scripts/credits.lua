return {
    susie = function()
        local susie = Game.world:getCharacter("susie")

        susie:setSprite("shock_left")
        susie:alert(0.5, {play_sound = false})

        Game.world.timer:script(function(wait)
            wait(1.5)

            susie:resetSprite()
            susie:spin(3)

            wait(16/30)
            susie:spin(0)
            susie:setSprite("pose")
        end)
    end,

    noelle = function()
        local noelle = Game.world:getCharacter("noelle")

        noelle:setSprite("shocked_behind")
        noelle:shake(3)
        noelle:alert(0.5, {play_sound = false})

        Game.world.timer:script(function(wait)
            wait(1.5)

            noelle:setSprite("walk_happy")
            noelle:spin(3)

            wait(16/30)
            noelle:spin(0)
            noelle:setSprite("pose")
        end)
    end,

    berdly = function()
        local berdly = Game.world:getCharacter("berdly")

        berdly:setSprite("shocked_left")
        berdly:alert(0.5, {play_sound = false})

        Game.world.timer:script(function(wait)
            wait(1)

            berdly:setAnimation("laugh")
        end)
    end,

    mteen = function()
        local mteen = Game.world:getCharacter("mteen")

        Game.world.timer:script(function(wait)
            mteen.physics.speed_y = -5
            mteen.physics.gravity = 0.8
    
            mteen:setSprite("shocked")
            mteen:alert(0.3, {play_sound = false})

            wait(0.4)

            mteen.physics.speed_y = 0
            mteen.physics.gravity = 0

            wait(0.1)

            mteen:setSprite("fell")
            mteen.physics.speed_x = 14
            mteen.physics.friction = 2

            wait(0.4)
            mteen.physics.speed_x = 0
            mteen.physics.friction = 0

            wait(0.8)

            mteen:setSprite("fell_look")
        end)
    end,
}