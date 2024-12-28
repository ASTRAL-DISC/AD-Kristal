local actor, super = Class(Actor, "rudy_lw")

function actor:init()
    super.init(self)

    self.name = "Rudy"

    self.width = 22
    self.height = 60

    self.hitbox = nil

    self.color = {1, 0, 0}

    self.path = "npcs/lightners/rudy/light"
    self.default = "down"

    self.voice = "rudy"
    self.portrait_path = "face/rudy"
    self.portrait_offset = {-20, -10}

    self.can_blush = false

    self.animations = {
        ["cough"] = {"cough", 0.2, true},
        ["laugh"] = {"laugh", 0.2, true},
    }
    
    self.offsets = {
        ["down"] = {0, 0},
        ["look"] = {0, 0},
        ["look_smile"] = {0, 0},
        ["left"] = {0, 0},
        ["laugh"] = {0, 0},
        ["cough"] = {0, 0},
    }
end

return actor