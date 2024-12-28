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
  nextlayerid = 7,
  nextobjectid = 43,
  properties = {
    ["border"] = "leaves",
    ["inside"] = true,
    ["light"] = "true",
    ["music"] = "hometown",
    ["name"] = "Town Hall"
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
      image = "../../../../../../assets/sprites/world/hometown/townhall/bg_townhall.png",
      id = 2,
      name = "Image Layer 1",
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
      id = 6,
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
          x = 80,
          y = 120,
          width = 48.2576,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 160,
          width = 40,
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
          x = 80,
          y = 400,
          width = 200,
          height = 119.224,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 400,
          width = 200,
          height = 117.847,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 160,
          width = 40,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 120,
          width = 360,
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
          x = 200,
          y = 217,
          width = 200,
          height = 23,
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
          y = 160,
          width = 40,
          height = 56,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 240,
          width = 200,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 494.451,
          y = 352.763,
          width = 65.5492,
          height = 47.2373,
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
          id = 24,
          name = "entry",
          type = "",
          shape = "point",
          x = 319.983,
          y = 415.634,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "entry_up",
          type = "",
          shape = "point",
          x = 160,
          y = 200,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "spawn",
          type = "",
          shape = "point",
          x = 232.59,
          y = 322.047,
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
          id = 19,
          name = "transition_extended",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 80,
          width = 80,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["door"] = true,
            ["facing"] = "up",
            ["map"] = "hometown/townhall/hallway",
            ["marker"] = "entry"
          }
        },
        {
          id = 26,
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
            ["facing"] = "down",
            ["map"] = "hometown/street4",
            ["marker"] = "entry4"
          }
        },
        {
          id = 28,
          name = "npc",
          type = "",
          shape = "point",
          x = 307.875,
          y = 200.125,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "receptionist",
            ["cutscene"] = "hometown/townhall.receptionist"
          }
        },
        {
          id = 30,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 240,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/townhall.receptionist_counter"
          }
        },
        {
          id = 31,
          name = "npc",
          type = "",
          shape = "point",
          x = 480,
          y = 240,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "politicsbear",
            ["cutscene"] = "hometown/townhall.politicsbear"
          }
        },
        {
          id = 33,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 120,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/townhall.townmap"
          }
        },
        {
          id = 36,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 493.163,
          y = 320,
          width = 66.8373,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/townhall.chair"
          }
        },
        {
          id = 37,
          name = "npc",
          type = "",
          shape = "point",
          x = 121.376,
          y = 355.871,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "blobgal",
            ["cond"] = "Game.chapter == 5",
            ["cutscene"] = "hometown/townhall.blobgal"
          }
        },
        {
          id = 40,
          name = "npc",
          type = "",
          shape = "point",
          x = 140,
          y = 279,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "businessguy",
            ["cond"] = "Game.chapter == 3 or Game.chapter == 4",
            ["cutscene"] = "hometown/townhall.businessguy"
          }
        },
        {
          id = 41,
          name = "",
          type = "",
          shape = "rectangle",
          x = 495.974,
          y = 394.03,
          width = 52,
          height = 84,
          rotation = 0,
          gid = 58,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 280.667,
          width = 200,
          height = 80,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
