return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 36,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 109,
  properties = {
    ["border"] = "castle",
    ["music"] = "funky_normal"
  },
  tilesets = {
    {
      name = "castle_town_bg",
      firstgid = 1,
      filename = "../../../tilesets/castle_town_bg.tsx",
      exportfilename = "../../../tilesets/castle_town_bg.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 36,
      height = 12,
      id = 1,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "imagelayer",
      image = "../../../../../assets/sprites/world/castle_town/castle_cafe_ch4.png",
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
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 21.919,
          y = 400,
          width = 599.175,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = -20,
          y = 200,
          width = 40,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 18.9055,
          y = 160,
          width = 844.52,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 825,
          y = 120,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 869.453,
          y = 87.5337,
          width = 560,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 861.333,
          y = 397.333,
          width = 557.333,
          height = 82.6667,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1420,
          y = 125.333,
          width = 22.6667,
          height = 272,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1193.33,
          y = 128,
          width = 65.3333,
          height = 42.6667,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 961.333,
          y = 129.333,
          width = 65.3333,
          height = 41.3333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "rectangle",
          x = 951.333,
          y = 268.667,
          width = 88,
          height = 44,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1112,
          y = 333.333,
          width = 88,
          height = 44,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 44,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1272,
          y = 268,
          width = 88,
          height = 44,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 45,
          name = "",
          type = "",
          shape = "rectangle",
          x = 438,
          y = 346.667,
          width = 88,
          height = 44,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 46,
          name = "",
          type = "",
          shape = "rectangle",
          x = 197.333,
          y = 345.333,
          width = 88,
          height = 44,
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
          name = "entry",
          type = "",
          shape = "point",
          x = 741,
          y = 400,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "spawn",
          type = "",
          shape = "point",
          x = 320,
          y = 280,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "camera",
          type = "",
          shape = "point",
          x = 1156,
          y = 256,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 95,
          name = "camera2",
          type = "",
          shape = "point",
          x = 720,
          y = 256,
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
      id = 4,
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
          id = 3,
          name = "transition_special",
          type = "",
          shape = "rectangle",
          x = 623.426,
          y = 461.094,
          width = 236.162,
          height = 18.9055,
          rotation = 0,
          visible = true,
          properties = {
            ["ch3map"] = "castletown/main2",
            ["ch4map"] = "castletown/main2",
            ["ch5map"] = "castletown/main2",
            ["ch6map"] = "castletown/main2",
            ["ch7map"] = "castletown/main2",
            ["marker"] = "entry_cafe"
          }
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 960.41,
          y = 170.94,
          width = 68,
          height = 87,
          rotation = 0,
          gid = 35,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "jukebox",
          type = "",
          shape = "rectangle",
          x = 960,
          y = 102,
          width = 67.5,
          height = 68.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "npc",
          type = "",
          shape = "point",
          x = 720.67,
          y = 140.67,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "swatch",
            ["cond"] = "Game:hasRecruit(\"swatchling\")"
          }
        },
        {
          id = 17,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 680,
          y = 138.667,
          width = 80,
          height = 61.3333,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "castletown/cafe.swatch"
          }
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 196,
          y = 391,
          width = 92,
          height = 70,
          rotation = 0,
          gid = 36,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 436,
          y = 391,
          width = 92,
          height = 70,
          rotation = 0,
          gid = 36,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "npc",
          type = "",
          shape = "point",
          x = 380.33,
          y = 386.67,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "hathy",
            ["animation"] = "idle_right"
          }
        },
        {
          id = 23,
          name = "npc",
          type = "",
          shape = "point",
          x = 577.67,
          y = 381,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "rudinn",
            ["animation"] = "talk"
          }
        },
        {
          id = 24,
          name = "npc",
          type = "",
          shape = "point",
          x = 94,
          y = 389,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "swatchling",
            ["cond"] = "Game:hasRecruit(\"swatchling\")",
            ["sprite"] = "right"
          }
        },
        {
          id = 32,
          name = "npc",
          type = "",
          shape = "point",
          x = 158,
          y = 159,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "tasque_manager",
            ["animation"] = "sing_stop",
            ["cond"] = "Game:hasRecruit(\"tasque_manager\")"
          }
        },
        {
          id = 33,
          name = "notegenerator",
          type = "",
          shape = "point",
          x = 172.67,
          y = 26,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["srctell"] = 7.67,
            ["srctell2"] = 23.22,
            ["srctell3"] = 38.57,
            ["srctell4"] = 84.48
          }
        },
        {
          id = 34,
          name = "npc",
          type = "",
          shape = "point",
          x = 285.5,
          y = 131.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "kk",
            ["animation"] = "cymbal"
          }
        },
        {
          id = 35,
          name = "deltadrums",
          type = "",
          shape = "point",
          x = 285,
          y = 118.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 36,
          name = "npc",
          type = "",
          shape = "point",
          x = 408,
          y = 157.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "sweet",
            ["animation"] = "sing_stop"
          }
        },
        {
          id = 37,
          name = "notegenerator",
          type = "",
          shape = "point",
          x = 368.33,
          y = 68,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = "225",
            ["spawn_rate"] = 1.9,
            ["srctell"] = 38.57,
            ["srctell2"] = 84.48
          }
        },
        {
          id = 38,
          name = "npc",
          type = "",
          shape = "point",
          x = 525,
          y = 159,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "shadowguy",
            ["animation"] = "play_stop",
            ["cond"] = "Game:hasRecruit(\"shadowguy\")"
          }
        },
        {
          id = 39,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1270,
          y = 314,
          width = 92,
          height = 70,
          rotation = 0,
          gid = 36,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "",
          type = "",
          shape = "rectangle",
          x = 950,
          y = 314,
          width = 92,
          height = 70,
          rotation = 0,
          gid = 36,
          visible = true,
          properties = {}
        },
        {
          id = 41,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1110,
          y = 381,
          width = 92,
          height = 70,
          rotation = 0,
          gid = 36,
          visible = true,
          properties = {}
        },
        {
          id = 96,
          name = "recruitplace",
          type = "",
          shape = "point",
          x = 918.333,
          y = 301.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "rabbick",
            ["adjacent"] = { id = 97 },
            ["cutscene"] = "castletown/cafe.rabbick",
            ["facing"] = "right"
          }
        },
        {
          id = 97,
          name = "recruitplace",
          type = "",
          shape = "point",
          x = 1072.67,
          y = 301.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "rabbick",
            ["adjacent"] = { id = 96 },
            ["cutscene"] = "castletown/cafe.rabbick",
            ["facing"] = "left"
          }
        },
        {
          id = 102,
          name = "recruitplace",
          type = "",
          shape = "point",
          x = 1236.67,
          y = 301.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "rabbick",
            ["adjacent"] = { id = 103 },
            ["cutscene"] = "castletown/cafe.rabbick",
            ["facing"] = "right"
          }
        },
        {
          id = 103,
          name = "recruitplace",
          type = "",
          shape = "point",
          x = 1393,
          y = 301.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "rabbick",
            ["adjacent"] = { id = 102 },
            ["cutscene"] = "castletown/cafe.rabbick",
            ["facing"] = "left"
          }
        },
        {
          id = 104,
          name = "recruitplace",
          type = "",
          shape = "point",
          x = 1072,
          y = 374,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "rabbick",
            ["adjacent"] = { id = 105 },
            ["cutscene"] = "castletown/cafe.rabbick",
            ["facing"] = "right"
          }
        },
        {
          id = 105,
          name = "recruitplace",
          type = "",
          shape = "point",
          x = 1238,
          y = 374,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "rabbick",
            ["adjacent"] = { id = 104 },
            ["cutscene"] = "castletown/cafe.rabbick",
            ["facing"] = "left"
          }
        },
        {
          id = 106,
          name = "npc",
          type = "",
          shape = "point",
          x = 1109,
          y = 157,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "vee",
            ["cutscene"] = "castletown/cafe.vee"
          }
        },
        {
          id = 107,
          name = "npc",
          type = "",
          shape = "point",
          x = 1161,
          y = 157,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "rhyth",
            ["cutscene"] = "castletown/cafe.rhyth"
          }
        },
        {
          id = 108,
          name = "npc",
          type = "",
          shape = "point",
          x = 1054,
          y = 157,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "lola",
            ["cutscene"] = "castletown/cafe.lola"
          }
        }
      }
    }
  }
}
