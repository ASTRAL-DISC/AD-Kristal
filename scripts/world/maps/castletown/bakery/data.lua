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
  nextlayerid = 9,
  nextobjectid = 25,
  backgroundcolor = { 0, 0, 0 },
  properties = {
    ["border"] = "castle",
    ["music"] = "castletown"
  },
  tilesets = {
    {
      name = "castle_town_bg",
      firstgid = 1,
      filename = "../../../tilesets/castle_town_bg.tsx",
      exportfilename = "../../../tilesets/castle_town_bg.lua"
    }
  },
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../assets/sprites/world/castle_town/bakery_bg.png",
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
      type = "imagelayer",
      image = "../../../../../assets/sprites/world/castle_town/bakery_bg_counter.png",
      id = 3,
      name = "counter",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 360,
      offsety = 192,
      parallaxx = 1,
      parallaxy = 1,
      repeatx = false,
      repeaty = false,
      properties = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
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
          x = 119,
          y = 235,
          width = 402,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 77,
          y = 277,
          width = 43,
          height = 105,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 127,
          y = 291,
          width = 41,
          height = 38,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 161,
          y = 317,
          width = 74,
          height = 56,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 239,
          y = 356,
          width = 39,
          height = 51,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 137,
          y = 401,
          width = 143,
          height = 79,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 361,
          y = 400,
          width = 145,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 518,
          y = 278,
          width = 42,
          height = 109,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "polygon",
          x = 520,
          y = 379,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = 20 },
            { x = -20, y = 20 }
          },
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "polygon",
          x = 119,
          y = 380,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = 20 },
            { x = 20, y = 20 }
          },
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 8,
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
          id = 13,
          name = "entry",
          type = "",
          shape = "point",
          x = 327,
          y = 454,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "spawn",
          type = "",
          shape = "point",
          x = 329,
          y = 457,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "fix",
          type = "",
          shape = "point",
          x = 479.447,
          y = 231.361,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "fuse",
          type = "",
          shape = "point",
          x = 480.369,
          y = 197.311,
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
      name = "objects_decor",
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
          x = 121,
          y = 392,
          width = 158,
          height = 112,
          rotation = 0,
          gid = 33,
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
          id = 17,
          name = "transition_special",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 480,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["ch3map"] = "castletown/main2",
            ["ch4map"] = "castletown/main2",
            ["ch5map"] = "castletown/main2",
            ["ch6map"] = "castletown/main2",
            ["ch7map"] = "castletown/main2",
            ["facing"] = "down",
            ["marker"] = "entry_bakery"
          }
        },
        {
          id = 18,
          name = "npc",
          type = "",
          shape = "point",
          x = 393.092,
          y = 219.376,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "malius"
          }
        },
        {
          id = 19,
          name = "npc",
          type = "",
          shape = "point",
          x = 322.159,
          y = 226.815,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "lancer",
            ["facing"] = "right",
            ["sprite"] = "walk_mustache"
          }
        },
        {
          id = 21,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 240,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "castletown/bakery.malius"
          }
        },
        {
          id = 22,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 291.418,
          y = 240,
          width = 68.5824,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "castletown/bakery.lancer"
          }
        }
      }
    }
  }
}
