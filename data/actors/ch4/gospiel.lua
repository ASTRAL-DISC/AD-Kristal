local actor, super = Class(Actor, "gospiel")

function actor:init()
    super.init(self)

    self.name = "Gospiel"

    self.width = 26
    self.height = 68

    self.hitbox = {2, 50, 21, 18}

    self.color = {1, 1, 1}

    self.path = "npcs/ch4/gospiel"
    self.default = "walk"

    self.voice = "gospiel"
    self.portrait_path = "face/gospiel"
    self.portrait_offset = {0, 0}

    self.animations = {}
    
    self.offsets = {
        --Movement
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},
        ["walk/down"] = {0, 0},

        --Cutscenes
        ["arms_open"] = {0, 0},
        ["arms_open_eye"] = {0, 0},
        ["boowomp"] = {0, 0},
        ["hands_clasped"] = {0, 0},
        ["hands_out"] = {0, 0},
        ["hands_tremble"] = {0, 0},
        ["hands_tremble_look"] = {0, 0},
    }
end

return actor