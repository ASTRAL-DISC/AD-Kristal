return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 20,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 5,
  nextobjectid = 21,
  properties = {
    ["border"] = "leaves_dark",
    ["light"] = "true",
    ["music"] = "crickets"
  },
  tilesets = {
    {
      name = "hometown_map",
      firstgid = 1,
      filename = "../../../../tilesets/hometown_map.tsx",
      exportfilename = "../../../../tilesets/hometown_map.lua"
    },
    {
      name = "hometown_dark",
      firstgid = 24597,
      filename = "../../../../tilesets/hometown_dark.tsx"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 20,
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
        24773, 24774, 24775, 24776, 24777, 24778, 24779, 24780, 24781, 24782, 24783, 24784, 24785, 24786, 24787, 24788,
        24916, 24917, 24918, 24919, 24920, 24921, 24922, 24923, 24924, 24925, 24926, 24927, 24928, 24929, 24930, 24931,
        25059, 25060, 25061, 25062, 25063, 25064, 25065, 25066, 25067, 25068, 25069, 25070, 25071, 25072, 25073, 25074,
        25202, 25203, 25204, 25205, 25206, 25207, 25208, 25209, 25210, 25211, 25212, 25213, 25214, 25215, 25216, 25217,
        25345, 25346, 25347, 25348, 25349, 25350, 25351, 25352, 25353, 25354, 25355, 25356, 25357, 25358, 25359, 25360,
        25488, 25489, 25490, 25491, 25492, 25493, 25494, 25495, 25496, 25497, 25498, 25499, 25500, 25501, 25502, 25503,
        25631, 25632, 25633, 25634, 25635, 25636, 25637, 25638, 25639, 25640, 25641, 25642, 25643, 25644, 25645, 25646,
        25774, 25775, 25776, 25777, 25778, 25779, 25780, 25781, 25782, 25783, 25784, 25785, 25786, 25787, 25788, 25789,
        25917, 25918, 25919, 25920, 25921, 25922, 25923, 25924, 25925, 25926, 25927, 25928, 25929, 25930, 25931, 25932,
        26060, 26061, 26062, 26063, 26064, 26065, 26066, 26067, 26068, 26069, 26070, 26071, 26072, 26073, 26074, 26075,
        26203, 26204, 26205, 26206, 26207, 26208, 26209, 26210, 26211, 26212, 26213, 26214, 26215, 26216, 26217, 26218,
        26346, 26347, 26348, 26349, 26350, 26351, 26352, 26353, 26354, 26355, 26356, 26357, 26358, 26359, 26360, 26361,
        26489, 26490, 26491, 26492, 26493, 26494, 26495, 26496, 26497, 26498, 26499, 26500, 26501, 26502, 26503, 26504,
        26632, 26633, 26634, 26635, 26636, 26637, 26638, 26639, 26640, 26641, 26642, 26643, 26644, 26645, 26646, 26647,
        26775, 26776, 26777, 26778, 26779, 26780, 26781, 26782, 26783, 26784, 26785, 26786, 26787, 26788, 26789, 26790,
        26918, 26919, 26920, 26921, 26922, 26923, 26924, 26925, 26926, 26927, 26928, 26929, 26930, 26931, 26932, 26933,
        27061, 27062, 27063, 27064, 27065, 27066, 27067, 27068, 27069, 27070, 27071, 27072, 27073, 27074, 27075, 27076,
        27204, 27205, 27206, 27207, 27208, 27209, 27210, 27211, 27212, 27213, 27214, 27215, 27216, 27217, 27218, 27219,
        27347, 27348, 27349, 27350, 27351, 27352, 27353, 27354, 27355, 27356, 27357, 27358, 27359, 27360, 27361, 27362,
        27490, 27491, 27492, 27493, 27494, 27495, 27496, 27497, 27498, 27499, 27500, 27501, 27502, 27503, 27504, 27505
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
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
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 216,
          y = 200,
          width = 82.6667,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 200,
          width = 40,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 560,
          width = 200,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 560,
          width = 240,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 40,
          height = 560,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "polygon",
          x = 240,
          y = 560,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -40, y = -40 },
            { x = -80, y = -40 },
            { x = -120, y = -80 },
            { x = -160, y = -80 },
            { x = -200, y = -120 },
            { x = -200, y = 0 }
          },
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 0,
          width = 600,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 469,
          y = 200,
          width = 131,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 374.667,
          y = 200,
          width = 91.6667,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 200,
          width = 133,
          height = 140,
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
          id = 12,
          name = "entry",
          type = "",
          shape = "point",
          x = 337.333,
          y = 421.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "entry2",
          type = "",
          shape = "point",
          x = 338.667,
          y = 697.333,
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
          id = 11,
          name = "transition_extended",
          type = "",
          shape = "rectangle",
          x = 301.667,
          y = 289.333,
          width = 68,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {
            ["door"] = true,
            ["facing"] = "left",
            ["map"] = "hometown_dark/torhouse/floor1",
            ["marker"] = "entry2"
          }
        },
        {
          id = 13,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 774.667,
          width = 200,
          height = 25.3333,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "down",
            ["map"] = "hometown_dark/street",
            ["marker"] = "entry"
          }
        },
        {
          id = 18,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 360,
          width = 40,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {
            ["cond"] = "Game.chapter == 3",
            ["cutscene"] = "hometown/dreemurr.wrongway",
            ["flagcheck"] = "junkball",
            ["once"] = false
          }
        },
        {
          id = 20,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 360,
          width = 120,
          height = 10.3484,
          rotation = 0,
          visible = true,
          properties = {
            ["cond"] = "Game.chapter == 3",
            ["cutscene"] = "hometown/dreemurr.wrongway2",
            ["flagcheck"] = "junkball",
            ["once"] = false
          }
        }
      }
    }
  }
}