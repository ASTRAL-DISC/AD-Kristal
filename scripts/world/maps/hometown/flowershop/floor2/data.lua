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
  nextlayerid = 6,
  nextobjectid = 31,
  properties = {
    ["border"] = "leaves",
    ["inside"] = true,
    ["light"] = "true",
    ["music"] = "hometown",
    ["name"] = "Hometown - Flower King"
  },
  tilesets = {},
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../../assets/sprites/world/hometown/flowerking/floor2.png",
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
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 440,
          width = 400,
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
          x = 0,
          y = 160,
          width = 40,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 120,
          width = 231.891,
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
          x = 271.216,
          y = 80,
          width = 88.7842,
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
          x = 360,
          y = 120,
          width = 240,
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
          x = 600,
          y = 160,
          width = 40,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 145.954,
          y = 173.658,
          width = 53.3812,
          height = 35.137,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40.5427,
          y = 179.739,
          width = 104.735,
          height = 44.5969,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 381.101,
          y = 160.144,
          width = 56.7598,
          height = 21.6228,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 447.321,
          y = 162.171,
          width = 66.8954,
          height = 18.2442,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 523.001,
          y = 159.468,
          width = 54.7326,
          height = 15.5414,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 191.226,
          y = 245.283,
          width = 237.85,
          height = 37.6525,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 383.804,
          y = 282.963,
          width = 46.6241,
          height = 125.842,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 189.875,
          y = 283.111,
          width = 45.2727,
          height = 120.288,
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
          id = 19,
          name = "entry2",
          type = "",
          shape = "point",
          x = 560,
          y = 440,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "entry",
          type = "",
          shape = "point",
          x = 80,
          y = 440,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "spawn",
          type = "",
          shape = "point",
          x = 310.652,
          y = 365.06,
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
          id = 22,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 480,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "down",
            ["map"] = "hometown/flowershop/floor1",
            ["marker"] = "entry2",
            ["sound"] = "escaped"
          }
        },
        {
          id = 23,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 480,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "down",
            ["map"] = "hometown/flowershop/floor1",
            ["marker"] = "entry3",
            ["sound"] = "escaped"
          }
        },
        {
          id = 24,
          name = "container",
          type = "",
          shape = "point",
          x = 312.327,
          y = 245.825,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "container",
          type = "",
          shape = "point",
          x = 362.968,
          y = 245.796,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["sprite"] = "yellow"
          }
        },
        {
          id = 26,
          name = "container",
          type = "",
          shape = "point",
          x = 260.5,
          y = 245.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["sprite"] = "cyan"
          }
        },
        {
          id = 27,
          name = "container",
          type = "",
          shape = "point",
          x = 212.667,
          y = 325.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["sprite"] = "purple"
          }
        },
        {
          id = 28,
          name = "container",
          type = "",
          shape = "point",
          x = 214,
          y = 269.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["sprite"] = "blue"
          }
        },
        {
          id = 29,
          name = "container",
          type = "",
          shape = "point",
          x = 407.167,
          y = 325.334,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["sprite"] = "green"
          }
        },
        {
          id = 30,
          name = "container",
          type = "",
          shape = "point",
          x = 406,
          y = 268.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["sprite"] = "orange"
          }
        }
      }
    }
  }
}
