return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 5,
  nextobjectid = 19,
  properties = {
    ["border"] = "leaves",
    ["light"] = "true",
    ["music"] = "hometown",
    ["name"] = "Alley"
  },
  tilesets = {
    {
      name = "hometown_map",
      firstgid = 1,
      filename = "../../../tilesets/hometown_map.tsx",
      exportfilename = "../../../tilesets/hometown_map.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
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
        0, 0, 0, 0, 0, 0, 11371, 11372, 11373, 11374, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 11514, 11515, 11516, 11517, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 11657, 11658, 11659, 11660, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 11800, 11801, 11802, 11803, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 11943, 11944, 11945, 11946, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 12086, 12087, 12088, 12089, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 12229, 12230, 12231, 12232, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 12372, 12373, 12374, 12375, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 12515, 12516, 12517, 12518, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 12658, 12659, 12660, 12661, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 12801, 12802, 12803, 12804, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 12944, 12945, 12946, 12947, 0, 0, 0, 0, 0, 0
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
          x = 240,
          y = 0,
          width = 160,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 160,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 160,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 480,
          width = 160,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 160,
          width = 40,
          height = 223.333,
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
          id = 8,
          name = "entry",
          type = "",
          shape = "point",
          x = 320,
          y = 400,
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
          id = 6,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 462.667,
          width = 160,
          height = 17.3333,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "down",
            ["map"] = "hometown/street3",
            ["marker"] = "entry3"
          }
        },
        {
          id = 9,
          name = "milksaucer",
          type = "",
          shape = "point",
          x = 261,
          y = 238,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 337,
          width = 40,
          height = 46,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/alley.trashcan"
          }
        },
        {
          id = 12,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 280,
          width = 40,
          height = 46,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/alley.trashcan"
          }
        },
        {
          id = 13,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 227,
          width = 40,
          height = 46,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/alley.trashflowers"
          }
        },
        {
          id = 15,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 122,
          width = 40,
          height = 46,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/alley.trashflowers"
          }
        },
        {
          id = 17,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 174,
          width = 40,
          height = 46,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/alley.trashflowers"
          }
        },
        {
          id = 18,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 120,
          width = 112.667,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/alley.spraypaint"
          }
        }
      }
    }
  }
}
