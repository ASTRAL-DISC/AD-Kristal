local Python, super = Class(EnemyBattler, "python")

function Python:init()
    super.init(self)

    -- Enemy name
    self.name = "Python"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("python")

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
        "snake",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "This isn't Python,\nit's Lua you dummy..."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 4 DF 0\n* Cotton heart and button eye\n* Looks just like a fluffy guy."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Python attacks!",
        "* The power of cowboys is in\nthe air.",
        "* Smells like reptiles.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Python struggles to keep\nhis balance."

    self.dialogue_bubble = "signal"

    self:registerAct("Tell Story", "", {"ralsei"})
end

return Python