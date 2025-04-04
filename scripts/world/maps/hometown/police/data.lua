return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 45,
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
      filename = "../../../tilesets/hometown_stuff.tsx",
      exportfilename = "../../../tilesets/hometown_stuff.lua"
    }
  },
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../assets/sprites/world/hometown/police/base.png",
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
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 400,
          width = 40,
          height = 120,
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
          y = 344.598,
          width = 40,
          height = 55.4023,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 400,
          width = 80,
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
          x = 400,
          y = 360,
          width = 80,
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
          x = 457,
          y = 260.58,
          width = 62.7687,
          height = 99.4203,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 360,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 153.793,
          width = 40,
          height = 126.207,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 200,
          width = 80,
          height = 5.84702,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "jail_collision",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 200,
          width = 80,
          height = 5.84702,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 191,
          width = 89.3753,
          height = 156.342,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 210.715,
          y = 151.294,
          width = 147.946,
          height = 48.036,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 354.643,
          y = 113.303,
          width = 165.357,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "",
          type = "",
          shape = "rectangle",
          x = 253.803,
          y = 265.857,
          width = 142.639,
          height = 59.6003,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "",
          type = "",
          shape = "rectangle",
          x = 293.314,
          y = 262.509,
          width = 63.6183,
          height = 30.135,
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
          id = 27,
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
        },
        {
          id = 28,
          name = "spawn",
          type = "",
          shape = "point",
          x = 274.153,
          y = 371.384,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "gaybaby",
          type = "",
          shape = "point",
          x = 481.382,
          y = 179.462,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "susie",
          type = "",
          shape = "point",
          x = 440,
          y = 240,
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
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 30,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 480,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["exit_sound"] = "doorclose",
            ["facing"] = "down",
            ["map"] = "hometown/street2",
            ["marker"] = "entry_police",
            ["sound"] = "dooropen"
          }
        },
        {
          id = 31,
          name = "jail",
          type = "",
          shape = "rectangle",
          x = 354.643,
          y = 70.2853,
          width = 165.357,
          height = 130.715,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 340,
          width = 170,
          height = 118,
          rotation = 0,
          gid = 71,
          visible = true,
          properties = {
            ["cond"] = "Game:getFlag(\"undyne_break_table\") == nil or Game:getFlag(\"undyne_break_table\") == false"
          }
        },
        {
          id = 33,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 340,
          width = 170,
          height = 118,
          rotation = 0,
          gid = 72,
          visible = true,
          properties = {
            ["cond"] = "Game:getFlag(\"undyne_break_table\") == true"
          }
        },
        {
          id = 36,
          name = "boombox",
          type = "",
          shape = "point",
          x = 184.158,
          y = 161.39,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 38,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 200,
          width = 80,
          height = 13.883,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/police.jail"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
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
          id = 35,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 242.679,
          y = 260.76,
          width = 160,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/police.table"
          }
        }
      }
    }
  }
}
