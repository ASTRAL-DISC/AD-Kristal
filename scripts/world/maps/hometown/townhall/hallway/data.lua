return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 28,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 8,
  nextobjectid = 52,
  properties = {
    ["border"] = "leaves",
    ["inside"] = true,
    ["light"] = "true",
    ["music"] = "hometown",
    ["name"] = "Town Hall - Hallway"
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
      image = "../../../../../../assets/sprites/world/hometown/townhall/townhall_hallway.png",
      id = 2,
      name = "Image Layer 1",
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
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "collisions",
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
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 240,
          width = 622,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 280,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 400,
          width = 60.0441,
          height = 123,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 400,
          width = 40,
          height = 124.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 400,
          width = 760,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1040,
          y = 280,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 789,
          y = 113,
          width = 5.5,
          height = 167,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 880,
          y = 118,
          width = 160,
          height = 162,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 985.333,
          y = 340,
          width = 54.6667,
          height = 60,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 344,
          width = 61.3333,
          height = 56,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 370.545,
          y = 280.182,
          width = 29.2727,
          height = 14.1818,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 334.091,
          y = 279.818,
          width = 21.8182,
          height = 11.8182,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 680,
          y = 115,
          width = 21.7273,
          height = 125,
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
          id = 22,
          name = "entry2",
          type = "",
          shape = "point",
          x = 840,
          y = 240,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "entry",
          type = "",
          shape = "point",
          x = 189.5,
          y = 424,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "spawn",
          type = "",
          shape = "point",
          x = 491.333,
          y = 336,
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
      id = 3,
      name = "objects",
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
          id = 26,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 796.167,
          y = 120,
          width = 82.6667,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "up",
            ["map"] = "hometown/townhall/hallway2",
            ["marker"] = "entry",
            ["sound"] = "escaped"
          }
        },
        {
          id = 29,
          name = "transition_extended",
          type = "",
          shape = "rectangle",
          x = 140,
          y = 480,
          width = 100,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["door"] = true,
            ["facing"] = "down",
            ["map"] = "hometown/townhall/lobby",
            ["marker"] = "entry_up"
          }
        },
        {
          id = 31,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 240,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/townhall.door1"
          }
        },
        {
          id = 34,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 414,
          y = 240,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/townhall.door2"
          }
        },
        {
          id = 35,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 369.333,
          y = 249.333,
          width = 32,
          height = 50.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/townhall.watercooler"
          }
        },
        {
          id = 36,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 332,
          y = 245.333,
          width = 24,
          height = 50.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/townhall.trash"
          }
        },
        {
          id = 40,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 905,
          y = 240,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/townhall.door3"
          }
        },
        {
          id = 42,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 256.667,
          y = 214,
          width = 58.6667,
          height = 65.3333,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/townhall.window2"
          }
        },
        {
          id = 44,
          name = "npc",
          type = "",
          shape = "point",
          x = 745.333,
          y = 298,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "businessguy",
            ["cond"] = "Game.chapter == 5",
            ["cutscene"] = "hometown/townhall.businessguy"
          }
        },
        {
          id = 47,
          name = "sprite",
          type = "",
          shape = "rectangle",
          x = 369,
          y = 226,
          width = 34.25,
          height = 53.5,
          rotation = 0,
          visible = true,
          properties = {
            ["scalex"] = 2,
            ["scaley"] = 2,
            ["speed"] = 0.25,
            ["texture"] = "world/hometown/townhall/watercooler"
          }
        },
        {
          id = 48,
          name = "",
          type = "",
          shape = "rectangle",
          x = 84.6667,
          y = 394,
          width = 56,
          height = 100,
          rotation = 0,
          gid = 33,
          visible = true,
          properties = {}
        },
        {
          id = 50,
          name = "",
          type = "",
          shape = "rectangle",
          x = 980,
          y = 396,
          width = 56,
          height = 100,
          rotation = 0,
          gid = 33,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
