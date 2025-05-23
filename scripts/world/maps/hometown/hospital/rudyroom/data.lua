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
  nextobjectid = 29,
  properties = {
    ["border"] = "leaves",
    ["inside"] = true,
    ["light"] = "true",
    ["music"] = "hometown",
    ["name"] = "Hospital - Rudy Room"
  },
  tilesets = {},
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../../assets/sprites/world/hometown/hospital/rudyroom.png",
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
          x = 360,
          y = 400,
          width = 160,
          height = 115.137,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 400,
          width = 160,
          height = 111.758,
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
          y = 290.136,
          width = 40,
          height = 109.864,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 332.839,
          width = 40,
          height = 67.1615,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 222.974,
          width = 40,
          height = 57.0258,
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
          y = 222.298,
          width = 40,
          height = 68.5129,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 181,
          width = 400,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 222.298,
          width = 80,
          height = 97.7015,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 220.947,
          width = 40,
          height = 59.0529,
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
          id = 12,
          name = "entry",
          type = "",
          shape = "point",
          x = 319.611,
          y = 424.347,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "noelle",
          type = "",
          shape = "point",
          x = 291.232,
          y = 231.769,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "noelle_exit",
          type = "",
          shape = "point",
          x = 239.878,
          y = 250.689,
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
          x = 200,
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
          id = 16,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 187.837,
          y = 147.837,
          width = 68.5129,
          height = 73.9186,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/hospital.plaque"
          }
        },
        {
          id = 17,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 357.199,
          width = 40,
          height = 42.8012,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/hospital.sink3"
          }
        },
        {
          id = 23,
          name = "npc",
          type = "",
          shape = "point",
          x = 320,
          y = 288,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "rudy_lw",
            ["cutscene"] = "hometown/hospital.rudy"
          }
        },
        {
          id = 20,
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
            ["map"] = "hometown/hospital/corridor",
            ["marker"] = "entry_rudy",
            ["sound"] = "dooropen"
          }
        },
        {
          id = 21,
          name = "flowers",
          type = "",
          shape = "point",
          x = 444,
          y = 236,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "gifts",
          type = "",
          shape = "point",
          x = 140.548,
          y = 308.367,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "rudychair",
          type = "",
          shape = "point",
          x = 498.675,
          y = 308.8,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 290.166,
          width = 40,
          height = 40.6905,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/hospital.gifts"
          }
        }
      }
    }
  }
}
