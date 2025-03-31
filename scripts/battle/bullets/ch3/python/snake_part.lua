local SnakePart, super = Class(Bullet, "bullets/ch3/python/snake_part")

function SnakePart:init(x, y)
    super.init(self, x, y, "bullets/ch3/python/snake")
end

return SnakePart