return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 13,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 5,
  nextobjectid = 14,
  properties = {
    ["border"] = "leaves",
    ["inside"] = true,
    ["light"] = "true",
    ["music"] = "home",
    ["name"] = "Bathroom"
  },
  tilesets = {
    {
      name = "toriel_house",
      firstgid = 1,
      filename = "../../../../tilesets/toriel_house.tsx",
      exportfilename = "../../../../tilesets/toriel_house.lua"
    },
    {
      name = "toriel_house_robbed",
      firstgid = 1667,
      filename = "../../../../tilesets/toriel_house_robbed.tsx",
      exportfilename = "../../../../tilesets/toriel_house_robbed.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 13,
      height = 12,
      id = 1,
      name = "tiles",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 40,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        2993, 2994, 2995, 2996, 2997, 2998, 2999, 3000, 3001, 3002, 3003, 0, 0,
        3027, 3028, 3029, 3030, 3031, 3032, 3033, 3034, 3035, 3036, 3037, 0, 0,
        3061, 3062, 3063, 3064, 3065, 3066, 3067, 3068, 3069, 3070, 3071, 0, 0,
        3095, 3096, 3097, 3098, 3099, 3100, 3101, 3102, 3103, 3104, 3105, 0, 0,
        3129, 3130, 3131, 3132, 3133, 3134, 3135, 3136, 3137, 3138, 3139, 0, 0,
        3163, 3164, 3165, 3166, 3167, 3168, 3169, 3170, 3171, 3172, 3173, 0, 0,
        3197, 3198, 3199, 3200, 3201, 3202, 3203, 3204, 3205, 3206, 3207, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          x = 40,
          y = 80,
          width = 440,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 343,
          width = 440,
          height = 39,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "polygon",
          x = 477.698,
          y = 338.744,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -17, y = -17 },
            { x = -16, y = -109 },
            { x = -47, y = -141 },
            { x = -48, y = -49 },
            { x = -75, y = -75 },
            { x = -75, y = -213 },
            { x = 5, y = -211 }
          },
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "polygon",
          x = 40,
          y = 320,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 79, y = -79 },
            { x = 79, y = -215 },
            { x = 0, y = -217 }
          },
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 200,
          width = 120,
          height = 80,
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
          y = 240,
          width = 200,
          height = 50.5,
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
          id = 9,
          name = "transition_extended",
          type = "",
          shape = "rectangle",
          x = 427.989,
          y = 194.779,
          width = 36,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["door"] = true,
            ["facing"] = "right",
            ["map"] = "hometown/torhouse_robbed/floor1",
            ["marker"] = "entry3"
          }
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
          id = 10,
          name = "entry",
          type = "",
          shape = "point",
          x = 398.221,
          y = 312.291,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "spawn",
          type = "",
          shape = "point",
          x = 307.606,
          y = 310.511,
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
