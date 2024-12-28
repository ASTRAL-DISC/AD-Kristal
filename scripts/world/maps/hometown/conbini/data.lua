return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 23,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 45,
  properties = {
    ["border"] = "leaves",
    ["inside"] = true,
    ["light"] = "true",
    ["music"] = "muscle",
    ["name"] = "Convenience Store"
  },
  tilesets = {
    {
      name = "hometown_stuff",
      firstgid = 1,
      filename = "../../../tilesets/hometown_stuff.tsx",
      exportfilename = "../../../tilesets/hometown_stuff.lua"
    }
  },
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../assets/sprites/world/hometown/conbini/sans_conbini_bg.png",
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
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 61,
          y = 160,
          width = 739,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 62,
          y = 400,
          width = 498,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 400,
          width = 160,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 800,
          y = 200,
          width = 40,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 19,
          y = 200,
          width = 40,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 242,
          y = 201,
          width = 74,
          height = 14,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 329,
          y = 200,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 389,
          y = 201,
          width = 24,
          height = 12,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 426,
          y = 201,
          width = 49,
          height = 13,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 712,
          y = 200,
          width = 79,
          height = 17,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 104.667,
          y = 257.333,
          width = 328,
          height = 102,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 642,
          y = 345.333,
          width = 49.3333,
          height = 38,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 713.333,
          y = 340.667,
          width = 58.6667,
          height = 46,
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
          id = 17,
          name = "entry",
          type = "",
          shape = "point",
          x = 599,
          y = 418,
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
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 476,
          y = 206.333,
          width = 228,
          height = 98,
          rotation = 0,
          gid = 44,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 102.667,
          y = 359.833,
          width = 332,
          height = 142,
          rotation = 0,
          gid = 45,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 641,
          y = 387,
          width = 131,
          height = 166,
          rotation = 0,
          gid = 46,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 476.667,
          y = 144,
          width = 196,
          height = 71,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/conbini.sans"
          }
        },
        {
          id = 27,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 643.333,
          y = 329.333,
          width = 48.6667,
          height = 54.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/conbini.trash"
          }
        },
        {
          id = 29,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 716.667,
          y = 256.667,
          width = 52,
          height = 127.333,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/conbini.baskets"
          }
        },
        {
          id = 30,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 82,
          y = 160.667,
          width = 139.333,
          height = 39.3333,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/conbini.freezer"
          }
        },
        {
          id = 33,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 242,
          y = 184,
          width = 75.3333,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/conbini.eggs"
          }
        },
        {
          id = 34,
          name = "ding",
          type = "",
          shape = "rectangle",
          x = 674.5,
          y = 171.5,
          width = 29,
          height = 43.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 714.5,
          y = 178.5,
          width = 75.5,
          height = 39.5,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/conbini.rack"
          }
        },
        {
          id = 37,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 426,
          y = 172.5,
          width = 51.5,
          height = 43.5,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/conbini.fruits"
          }
        },
        {
          id = 38,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 326.75,
          y = 171.25,
          width = 51.5,
          height = 43.5,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/conbini.fruitsfake"
          }
        },
        {
          id = 39,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 384.5,
          y = 174,
          width = 34,
          height = 41,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/conbini.palmtree"
          }
        },
        {
          id = 40,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 107,
          y = 254.5,
          width = 103,
          height = 110,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/conbini.magazines"
          }
        },
        {
          id = 41,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 214.5,
          y = 254,
          width = 103,
          height = 110,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/conbini.magazines2"
          }
        },
        {
          id = 42,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 323,
          y = 254,
          width = 103,
          height = 110,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/conbini.valentines"
          }
        },
        {
          id = 43,
          name = "npc",
          type = "",
          shape = "point",
          x = 535,
          y = 163.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "sans_lw"
          }
        },
        {
          id = 44,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 480,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "down",
            ["map"] = "hometown/street3",
            ["marker"] = "entry_down"
          }
        }
      }
    }
  }
}
