return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 32,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 9,
  nextobjectid = 45,
  backgroundcolor = { 0, 0, 0 },
  properties = {
    ["border"] = "castle",
    ["music"] = "castletown"
  },
  tilesets = {
    {
      name = "castle_inside",
      firstgid = 1,
      filename = "../../../tilesets/castle_inside.tsx",
      exportfilename = "../../../tilesets/castle_inside.lua"
    },
    {
      name = "castle_town_bg",
      firstgid = 129,
      filename = "../../../tilesets/castle_town_bg.tsx",
      exportfilename = "../../../tilesets/castle_town_bg.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 32,
      height = 12,
      id = 4,
      name = "tiles",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 2, 54, 54, 54, 54, 34, 54, 54, 54, 34, 54, 54, 54, 54, 54, 34, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 34, 5, 0,
        0, 0, 3, 54, 12, 13, 14, 15, 16, 54, 54, 6, 54, 54, 54, 54, 34, 54, 54, 54, 54, 54, 34, 54, 54, 54, 54, 54, 54, 54, 5, 0,
        0, 0, 3, 54, 28, 29, 30, 31, 32, 54, 34, 54, 54, 54, 54, 54, 54, 54, 22, 54, 54, 54, 54, 54, 6, 54, 54, 54, 54, 54, 18, 0,
        0, 0, 3, 34, 54, 45, 46, 47, 54, 22, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 34, 54, 54, 54, 54, 54, 22, 5, 0,
        0, 0, 19, 20, 20, 61, 62, 63, 20, 20, 36, 20, 20, 20, 20, 36, 20, 20, 20, 20, 20, 20, 20, 20, 36, 20, 20, 20, 20, 20, 21, 0,
        0, 0, 51, 82, 52, 82, 82, 82, 52, 82, 82, 82, 82, 82, 82, 82, 66, 82, 82, 82, 82, 82, 82, 52, 66, 82, 82, 82, 82, 50, 84, 0,
        0, 0, 67, 82, 82, 82, 66, 82, 82, 82, 50, 82, 82, 82, 52, 82, 82, 82, 82, 52, 82, 82, 82, 82, 82, 82, 82, 66, 52, 82, 84, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 82, 50, 82, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66, 82, 82, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 82, 82, 82, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
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
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1240,
          y = 80,
          width = 40,
          height = 280,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 360,
          width = 1039.33,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 80,
          width = 40,
          height = 400,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 80,
          width = 380,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 531.667,
          y = 80,
          width = 168.333,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 765.333,
          y = 80,
          width = 174,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1059.67,
          y = 80,
          width = 180.333,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 38,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1240,
          y = 360,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "noellecollision",
          type = "",
          shape = "rectangle",
          x = 699,
          y = 80,
          width = 64.6667,
          height = 200.667,
          rotation = 0,
          visible = true,
          properties = {
            ["flagcheck"] = "!noelle_unlock"
          }
        },
        {
          id = 40,
          name = "",
          type = "",
          shape = "rectangle",
          x = 460,
          y = 80,
          width = 70.6667,
          height = 200.667,
          rotation = 0,
          visible = true,
          properties = {
            ["flagcheck"] = "!berdly_unlock"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "objects_decor",
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
          name = "",
          type = "",
          shape = "rectangle",
          x = 162,
          y = 280,
          width = 198,
          height = 154,
          rotation = 0,
          gid = 174,
          visible = true,
          properties = {
            ["cond"] = "Game.chapter == 3"
          }
        },
        {
          id = 27,
          name = "",
          type = "",
          shape = "rectangle",
          x = 694,
          y = 280,
          width = 78,
          height = 136,
          rotation = 0,
          gid = 197,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "",
          type = "",
          shape = "rectangle",
          x = 449,
          y = 280,
          width = 96,
          height = 106,
          rotation = 0,
          gid = 199,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 8,
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
          id = 8,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 1120,
          y = 480,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "down",
            ["map"] = "castletown/floor2",
            ["marker"] = "entry_3f"
          }
        },
        {
          id = 10,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 460,
          y = 240,
          width = 72,
          height = 26,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "up",
            ["map"] = "castletown/rooms/berdly",
            ["marker"] = "entry"
          }
        },
        {
          id = 14,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 700,
          y = 234,
          width = 65.3333,
          height = 34,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "up",
            ["map"] = "castletown/rooms/noelle",
            ["marker"] = "entry"
          }
        },
        {
          id = 16,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 939.091,
          y = 263.909,
          width = 119.94,
          height = 14.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "up",
            ["map"] = "castletown/rooms/queen/lobby",
            ["marker"] = "entry"
          }
        },
        {
          id = 33,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 700.667,
          y = 216.667,
          width = 64,
          height = 63.3333,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "castletown/floor3.noelleroom",
            ["flagcheck"] = "!noelle_unlock"
          }
        },
        {
          id = 34,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 464,
          y = 215,
          width = 64,
          height = 63.3333,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "castletown/floor3.berdlyroom",
            ["flagcheck"] = "!berdly_unlock"
          }
        },
        {
          id = 37,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 218.667,
          y = 240,
          width = 84,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "castletown/floor3.renovating"
          }
        },
        {
          id = 44,
          name = "queendoor",
          type = "",
          shape = "rectangle",
          x = 939,
          y = 240.182,
          width = 120,
          height = 39.8182,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
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
          id = 19,
          name = "entry",
          type = "",
          shape = "point",
          x = 1179,
          y = 435,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "spawn",
          type = "",
          shape = "point",
          x = 1179,
          y = 355,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "entry_berdly",
          type = "",
          shape = "point",
          x = 498,
          y = 300,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "entry_noelle",
          type = "",
          shape = "point",
          x = 733,
          y = 306,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "entry_queen",
          type = "",
          shape = "point",
          x = 1000,
          y = 304,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
