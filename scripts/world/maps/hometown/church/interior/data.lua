return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 23,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 13,
  nextobjectid = 78,
  properties = {
    ["border"] = "leaves",
    ["inside"] = true,
    ["light"] = "true",
    ["music"] = "hometown"
  },
  tilesets = {
    {
      name = "hometown_stuff",
      firstgid = 1,
      filename = "../../../../tilesets/hometown_stuff.tsx",
      exportfilename = "../../../../tilesets/hometown_stuff.lua"
    }
  },
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../../assets/sprites/world/hometown/church/bg.png",
      id = 2,
      name = "bg",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      repeatx = false,
      repeaty = false,
      properties = {}
    },
    {
      type = "imagelayer",
      image = "../../../../../../assets/sprites/world/hometown/church/bg_shadow_b.png",
      id = 11,
      name = "shadow",
      class = "",
      visible = true,
      opacity = 0.46,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      repeatx = false,
      repeaty = false,
      properties = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 377,
          y = 800,
          width = 40,
          height = 162,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 223,
          y = 800,
          width = 40,
          height = 161,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 800,
          width = 200,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 800,
          width = 200,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 360,
          width = 40,
          height = 440,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "",
          type = "",
          shape = "rectangle",
          x = 510,
          y = 254.667,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = 508.667,
          y = 340,
          width = 103.333,
          height = 36,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 377.333,
          width = 40,
          height = 422.667,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "",
          type = "",
          shape = "rectangle",
          x = 100.667,
          y = 245,
          width = 29.3333,
          height = 132,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1,
          y = 337,
          width = 99,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "",
          type = "",
          shape = "rectangle",
          x = 135,
          y = 432.5,
          width = 128,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "",
          type = "",
          shape = "rectangle",
          x = 373,
          y = 432.5,
          width = 128,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 36,
          name = "",
          type = "",
          shape = "rectangle",
          x = 136,
          y = 509.75,
          width = 128,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "",
          type = "",
          shape = "rectangle",
          x = 374,
          y = 509.75,
          width = 128,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 38,
          name = "",
          type = "",
          shape = "rectangle",
          x = 135,
          y = 589.25,
          width = 128,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "",
          type = "",
          shape = "rectangle",
          x = 373,
          y = 589.25,
          width = 128,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "",
          type = "",
          shape = "rectangle",
          x = 136,
          y = 671.25,
          width = 128,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 41,
          name = "",
          type = "",
          shape = "rectangle",
          x = 374,
          y = 671.25,
          width = 128,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 45,
          name = "",
          type = "",
          shape = "polygon",
          x = 131.333,
          y = 245.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 42.6667, y = -34 },
            { x = 116, y = -55.3333 },
            { x = 147.333, y = -58.6667 },
            { x = 238.667, y = -58.6667 },
            { x = 304, y = -44 },
            { x = 354.667, y = -20 },
            { x = 376.667, y = 7.33333 },
            { x = 378.667, y = 8 },
            { x = 378.667, y = -74.6667 },
            { x = 77.3333, y = -90.6667 },
            { x = -1.33333, y = -29.3333 }
          },
          properties = {}
        },
        {
          id = 46,
          name = "",
          type = "",
          shape = "rectangle",
          x = 232,
          y = 190.667,
          width = 34,
          height = 16.6667,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 47,
          name = "",
          type = "",
          shape = "rectangle",
          x = 273.333,
          y = 189.333,
          width = 95.3333,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 48,
          name = "",
          type = "",
          shape = "rectangle",
          x = 372.667,
          y = 188,
          width = 42.6667,
          height = 18,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "",
          type = "",
          shape = "rectangle",
          x = 301.333,
          y = 351.333,
          width = 36.6667,
          height = 43.3333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 50,
          name = "",
          type = "",
          shape = "rectangle",
          x = 280.667,
          y = 365.333,
          width = 78.6667,
          height = 11.0303,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 51,
          name = "",
          type = "",
          shape = "rectangle",
          x = 358,
          y = 341.333,
          width = 6,
          height = 32.4848,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 55,
          name = "",
          type = "",
          shape = "rectangle",
          x = 274.667,
          y = 342,
          width = 7.33333,
          height = 32.303,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 56,
          name = "",
          type = "",
          shape = "rectangle",
          x = 254.667,
          y = 341.333,
          width = 26,
          height = 10.7273,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "",
          type = "",
          shape = "rectangle",
          x = 206,
          y = 288,
          width = 28.6667,
          height = 15.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 58,
          name = "",
          type = "",
          shape = "rectangle",
          x = 206,
          y = 304,
          width = 1.33333,
          height = 58,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 59,
          name = "",
          type = "",
          shape = "rectangle",
          x = 434,
          y = 302.333,
          width = 1.33333,
          height = 58,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 60,
          name = "",
          type = "",
          shape = "rectangle",
          x = 408,
          y = 286.667,
          width = 26.6667,
          height = 15,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 61,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360.667,
          y = 338.667,
          width = 24,
          height = 13.8788,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 62,
          name = "",
          type = "",
          shape = "polygon",
          x = 386.667,
          y = 346.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 22.6667, y = -41.3333 },
            { x = 21.3333, y = -60 },
            { x = -2, y = -14 }
          },
          properties = {}
        },
        {
          id = 63,
          name = "",
          type = "",
          shape = "polygon",
          x = 256.667,
          y = 338,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -22, y = -47.3333 },
            { x = -23.3333, y = -26.6667 },
            { x = -4, y = 12 }
          },
          properties = {}
        },
        {
          id = 64,
          name = "",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 680,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 65,
          name = "",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 720,
          width = 80,
          height = 58.6667,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 66,
          name = "",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 520,
          width = 80,
          height = 61.3333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 67,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 680,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 68,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 720,
          width = 80,
          height = 58.6667,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 69,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 520,
          width = 80,
          height = 61.3333,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "alvin",
          type = "",
          shape = "point",
          x = 320,
          y = 320,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "entry",
          type = "",
          shape = "point",
          x = 320,
          y = 840,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "spawn",
          type = "",
          shape = "point",
          x = 320,
          y = 560,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "objects_party",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 276.045,
          y = 394.023,
          width = 88,
          height = 114,
          rotation = 0,
          gid = 73,
          visible = true,
          properties = {
            ["flagcheck"] = "!ch4_gathered"
          }
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 276.05,
          y = 394.02,
          width = 88,
          height = 114,
          rotation = 0,
          gid = 74,
          visible = true,
          properties = {
            ["cond"] = "Game:getFlag(\"ch4_gathered\") and Game.chapter >= 4"
          }
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 518.01,
          y = 584.01,
          width = 78,
          height = 258,
          rotation = 0,
          gid = 77,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 44,
          y = 584.011,
          width = 78,
          height = 258,
          rotation = 0,
          gid = 77,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 518.014,
          y = 727.973,
          width = 78,
          height = 258,
          rotation = 0,
          gid = 77,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 44.0469,
          y = 727.974,
          width = 78,
          height = 258,
          rotation = 0,
          gid = 77,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 264,
          y = 920,
          width = 111.333,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "down",
            ["map"] = "hometown/church/lobby",
            ["marker"] = "entry2"
          }
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "rectangle",
          x = 42,
          y = 780,
          width = 74,
          height = 84,
          rotation = 0,
          gid = 75,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "",
          type = "",
          shape = "rectangle",
          x = 516.017,
          y = 780.059,
          width = 74,
          height = 84,
          rotation = 0,
          gid = 75,
          visible = true,
          properties = {}
        },
        {
          id = 70,
          name = "",
          type = "",
          shape = "rectangle",
          x = 130,
          y = 464,
          width = 138,
          height = 58,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 71,
          name = "",
          type = "",
          shape = "rectangle",
          x = 130,
          y = 544,
          width = 138,
          height = 58,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 72,
          name = "",
          type = "",
          shape = "rectangle",
          x = 130,
          y = 624,
          width = 138,
          height = 58,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 73,
          name = "",
          type = "",
          shape = "rectangle",
          x = 130,
          y = 704,
          width = 138,
          height = 58,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 74,
          name = "",
          type = "",
          shape = "rectangle",
          x = 367.998,
          y = 464.01,
          width = 138,
          height = 58,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 75,
          name = "",
          type = "",
          shape = "rectangle",
          x = 367.998,
          y = 544.01,
          width = 138,
          height = 58,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 76,
          name = "",
          type = "",
          shape = "rectangle",
          x = 367.998,
          y = 624.01,
          width = 138,
          height = 58,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 77,
          name = "",
          type = "",
          shape = "rectangle",
          x = 367.998,
          y = 704.01,
          width = 138,
          height = 58,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 12,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
    }
  }
}
