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
  nextlayerid = 6,
  nextobjectid = 30,
  properties = {
    ["border"] = "leaves",
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
      image = "../../../../../../assets/sprites/world/hometown/apartments/lobby.png",
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
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 367.388,
          y = 378.807,
          width = 208.432,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 66.8668,
          y = 380.15,
          width = 206.417,
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
          x = 46.3452,
          y = 178.664,
          width = 18.8067,
          height = 200.157,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 576.292,
          y = 291.504,
          width = 16.1201,
          height = 87.317,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 369.418,
          y = 173.291,
          width = 204.187,
          height = 117.542,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 65.8236,
          y = 153.812,
          width = 124.259,
          height = 24.8518,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360.015,
          y = 58.4352,
          width = 9.40337,
          height = 120.9,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 367.403,
          y = 419.122,
          width = 36.9418,
          height = 59.7786,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 237.099,
          y = 420.465,
          width = 35.5985,
          height = 59.1069,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 272.698,
          y = 57.0919,
          width = 6.04502,
          height = 121.572,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 178.664,
          y = 56.4202,
          width = 11.4184,
          height = 97.392,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 534.649,
          y = 356.656,
          width = 26.8668,
          height = 12.7617,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 86.6453,
          y = 333.82,
          width = 31.5685,
          height = 34.2551,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "",
          type = "",
          shape = "rectangle",
          x = 191.426,
          y = 104.109,
          width = 81.272,
          height = 32.2401,
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
          id = 10,
          name = "entry2",
          type = "",
          shape = "point",
          x = 317.028,
          y = 119.557,
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
          x = 320,
          y = 400,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "spawn",
          type = "",
          shape = "point",
          x = 232.683,
          y = 335.749,
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
          id = 15,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 278.743,
          y = 58.4352,
          width = 79.9286,
          height = 12.09,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "up",
            ["map"] = "hometown/apartments/hall",
            ["marker"] = "entry",
            ["sound"] = "escaped"
          }
        },
        {
          id = 16,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 272.612,
          y = 470.897,
          width = 94.7767,
          height = 9.10322,
          rotation = 0,
          visible = true,
          properties = {
            ["exit_sound"] = "doorclose",
            ["facing"] = "down",
            ["map"] = "hometown/street3",
            ["marker"] = "entry_apartments",
            ["sound"] = "dooropen"
          }
        },
        {
          id = 17,
          name = "npc",
          type = "",
          shape = "point",
          x = 532.245,
          y = 246.398,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "ladygarf"
          }
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 83.422,
          y = 368.133,
          width = 36,
          height = 74,
          rotation = 0,
          gid = 61,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 508.664,
          y = 371.461,
          width = 56,
          height = 82,
          rotation = 0,
          gid = 62,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 83.287,
          y = 308.968,
          width = 36.9418,
          height = 59.7786,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/apartments.chair"
          }
        },
        {
          id = 24,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 526.589,
          y = 312.998,
          width = 36.2701,
          height = 57.7636,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/apartments.plant"
          }
        },
        {
          id = 25,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 480.915,
          y = 249.861,
          width = 76.5703,
          height = 40.9718,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/apartments.ladygarf"
          }
        },
        {
          id = 26,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 86.6453,
          y = 150.454,
          width = 82.6153,
          height = 28.2101,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/apartments.window"
          }
        },
        {
          id = 27,
          name = "ding",
          type = "",
          shape = "rectangle",
          x = 372.762,
          y = 225.223,
          width = 38.6567,
          height = 64.8518,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
