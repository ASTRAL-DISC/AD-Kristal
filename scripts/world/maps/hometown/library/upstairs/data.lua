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
    ["music"] = "hometown"
  },
  tilesets = {},
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../../assets/sprites/world/hometown/library/upstairs.png",
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
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 400,
          width = 45.3573,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 526.027,
          y = 400,
          width = 33.973,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 360,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 52,
          y = 360,
          width = 40,
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
          x = 93.2134,
          y = 400,
          width = 306.787,
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
          x = 92.054,
          y = 320,
          width = 467.946,
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
          name = "entry",
          type = "",
          shape = "point",
          x = 480,
          y = 425,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "spawn",
          type = "",
          shape = "point",
          x = 440.64,
          y = 383.719,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "normal",
          type = "",
          shape = "point",
          x = 224.341,
          y = 388,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "normal2",
          type = "",
          shape = "point",
          x = 141,
          y = 388,
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
          id = 13,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 446,
          y = 480,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "down",
            ["map"] = "hometown/library/lobby",
            ["marker"] = "entry3",
            ["sound"] = "escaped"
          }
        },
        {
          id = 18,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 177.402,
          y = 320,
          width = 62.5887,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cond"] = "Game.chapter >= 5",
            ["cutscene"] = "hometown/library.bookshelf5"
          }
        },
        {
          id = 21,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 411,
          y = 320,
          width = 62.5887,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/library.bookshelf2"
          }
        },
        {
          id = 22,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 489,
          y = 320,
          width = 62.5887,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/library.bookshelf"
          }
        },
        {
          id = 23,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 333,
          y = 320,
          width = 62.5887,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cond"] = "Game.chapter >= 3",
            ["cutscene"] = "hometown/library.bookshelf3"
          }
        },
        {
          id = 24,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 255,
          y = 320,
          width = 62.5887,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cond"] = "Game.chapter >= 4",
            ["cutscene"] = "hometown/library.bookshelf4"
          }
        },
        {
          id = 25,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 102,
          y = 320,
          width = 62.5887,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cond"] = "Game.chapter >= 6",
            ["cutscene"] = "hometown/library.bookshelf6"
          }
        },
        {
          id = 26,
          name = "npc",
          type = "",
          shape = "point",
          x = 300,
          y = 388,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "normal",
            ["cutscene"] = "hometown/library.normal",
            ["facing"] = "right",
            ["flagcheck"] = "!epilogue"
          }
        }
      }
    }
  }
}
