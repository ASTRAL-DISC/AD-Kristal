return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 5,
  nextobjectid = 13,
  properties = {
    ["border"] = "castle",
    ["music"] = "queen_car_radio"
  },
  tilesets = {
    {
      name = "queen_room",
      firstgid = 1,
      filename = "../../../../../tilesets/queen_room.tsx"
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
        116, 116, 116, 116, 116, 116, 116, 116, 116, 116, 116, 116, 116, 116, 116, 116,
        116, 116, 116, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 116, 116, 116,
        116, 116, 116, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 116, 116, 116,
        116, 116, 116, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 116, 116, 116,
        116, 116, 116, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 116, 116, 116,
        63, 64, 65, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 116, 116, 116,
        91, 77, 78, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 116, 116, 116,
        89, 75, 90, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 116, 116, 116,
        102, 103, 104, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 116, 116, 116,
        115, 116, 117, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 116, 116, 116,
        116, 116, 116, 118, 119, 120, 139, 139, 139, 139, 125, 126, 127, 116, 116, 116,
        116, 116, 116, 131, 132, 133, 134, 139, 139, 139, 138, 139, 140, 116, 116, 116
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
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 120,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 80,
          width = 400,
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
          x = 520,
          y = 120,
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
          x = 120,
          y = 400,
          width = 400,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 320,
          width = 40,
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
          x = -40,
          y = 320,
          width = 120,
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
          x = -40,
          y = 200,
          width = 160,
          height = 40,
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
          id = 10,
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
          id = 11,
          name = "entry",
          type = "",
          shape = "point",
          x = 80,
          y = 280,
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
          id = 12,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 240,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "left",
            ["map"] = "castletown/rooms/queen/lobby",
            ["marker"] = "entry2",
            ["sound"] = "elecdoor_close"
          }
        }
      }
    }
  }
}
