local TsunTsun, super = Class(EnemyBattler, "tsuntsun")

function TsunTsun:init()
    super.init(self)

    -- Enemy name
    self.name = "Tsun-Tsun"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("tsuntsun")

    -- Enemy health
    self.max_health = 450
    self.health = 450
    -- Enemy attack (determines bullet damage)
    self.attack = 4
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 20

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        "movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "Tsun-Tsun\ndialogue"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 4 DF 0\n* Cotton heart and button eye\n* Looks just like a fluffy guy."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Tsun-Tsun attacks!",
        "* Truly the most tsundere of plants.",
        "* Smells like cactus.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Tsun-Tsun struggles to keep\nher balance."

    self.dialogue_bubble = "signal"
end

return TsunTsun