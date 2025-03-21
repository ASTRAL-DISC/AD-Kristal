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
  nextobjectid = 32,
  properties = {
    ["border"] = "leaves",
    ["inside"] = true,
    ["light"] = "true",
    ["music"] = "hometown",
    ["name"] = "Hospital - Lobby"
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
      image = "../../../../../../assets/sprites/world/hometown/hospital/hospital_lobby.png",
      id = 6,
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
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 400,
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
          y = 400,
          width = 160,
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
          x = 447.433,
          y = 120,
          width = 66.4858,
          height = 61.7558,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 235.946,
          y = 200,
          width = 210.136,
          height = 58.3772,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 315.191,
          width = 52.8385,
          height = 84.8087,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 193.919,
          y = 333.514,
          width = 40,
          height = 46.7571,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 465.134,
          y = 316,
          width = 54.8656,
          height = 84,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 80,
          width = 15.2647,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 216.217,
          y = 80,
          width = 23.7829,
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
          x = 136.35,
          y = 80,
          width = 79.867,
          height = 100.947,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 440,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 440,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 183.333,
          width = 40,
          height = 136.667,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 200,
          width = 40,
          height = 120,
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
          id = 18,
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
          id = 19,
          name = "entry2",
          type = "",
          shape = "point",
          x = 175.685,
          y = 232.445,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "spawn",
          type = "",
          shape = "point",
          x = 320,
          y = 320,
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
          id = 23,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 298.92,
          y = 200,
          width = 100.271,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/hospital.nurse"
          }
        },
        {
          id = 24,
          name = "npc",
          type = "",
          shape = "point",
          x = 348.513,
          y = 198,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "nurse"
          }
        },
        {
          id = 25,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 193.929,
          y = 335.153,
          width = 39.867,
          height = 43.9212,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/hospital.toy"
          }
        },
        {
          id = 26,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 450.024,
          y = 129.061,
          width = 62.1654,
          height = 58.1112,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/hospital.piano"
          }
        },
        {
          id = 27,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 135.818,
          y = 175.766,
          width = 79.7339,
          height = 13.5142,
          rotation = 0,
          visible = true,
          properties = {
            ["exit_sound"] = "doorclose",
            ["facing"] = "up",
            ["map"] = "hometown/hospital/corridor",
            ["marker"] = "entry",
            ["sound"] = "dooropen"
          }
        },
        {
          id = 28,
          name = "",
          type = "",
          shape = "rectangle",
          x = 119.989,
          y = 342.007,
          width = 398,
          height = 50,
          rotation = 0,
          gid = 50,
          visible = true,
          properties = {}
        },
        {
          id = 29,
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
            ["marker"] = "entry_hospital",
            ["sound"] = "dooropen"
          }
        }
      }
    }
  }
}
