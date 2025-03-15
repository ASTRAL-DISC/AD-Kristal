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
  nextobjectid = 19,
  backgroundcolor = { 0, 0, 0 },
  properties = {
    ["border"] = "castle",
    ["music"] = "castletown"
  },
  tilesets = {},
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../assets/sprites/world/castle_town/west_cliff.png",
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
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 280,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 240,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 240,
          width = 320,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 360,
          width = 520,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 219,
          width = 80,
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
          id = 6,
          name = "transition_special",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 280,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["ch3map"] = "castletown/main2",
            ["ch4map"] = "castletown/main2",
            ["ch5map"] = "castletown/main2",
            ["ch6map"] = "castletown/main2",
            ["ch7map"] = "castletown/main2",
            ["facing"] = "right",
            ["marker"] = "entry_w"
          }
        },
        {
          id = 10,
          name = "plush",
          type = "",
          shape = "point",
          x = 211.333,
          y = 324.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["flagcheck"] = "!kris_plush",
            ["plushflag"] = "kris_plush",
            ["sprite"] = "kris"
          }
        },
        {
          id = 17,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 240,
          width = 80,
          height = 30.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "castletown/west.hole"
          }
        },
        {
          id = 18,
          name = "shine",
          type = "",
          shape = "point",
          x = 325.333,
          y = 243.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["cond"] = "Game.chapter == 4 and Game:getFlag(\"beat_sb\") == 3"
          }
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
          id = 4,
          name = "spawn",
          type = "",
          shape = "point",
          x = 319,
          y = 336,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "entry",
          type = "",
          shape = "point",
          x = 586,
          y = 337,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["music"] = "castletown"
          }
        }
      }
    }
  }
}
