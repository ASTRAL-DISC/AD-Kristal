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
  nextobjectid = 38,
  properties = {
    ["border"] = "leaves",
    ["inside"] = true,
    ["light"] = "true",
    ["music"] = "home",
    ["name"] = "Kris' Room"
  },
  tilesets = {
    {
      name = "toriel_house",
      firstgid = 1,
      filename = "../../../../tilesets/toriel_house.tsx",
      exportfilename = "../../../../tilesets/toriel_house.lua"
    },
    {
      name = "hometown_stuff",
      firstgid = 1667,
      filename = "../../../../tilesets/hometown_stuff.tsx",
      exportfilename = "../../../../tilesets/hometown_stuff.lua"
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 749, 750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 760, 0, 0,
        0, 0, 783, 784, 785, 786, 787, 788, 789, 790, 791, 792, 793, 794, 0, 0,
        0, 0, 817, 818, 819, 820, 821, 822, 823, 824, 825, 826, 827, 828, 0, 0,
        0, 0, 851, 852, 853, 854, 855, 856, 857, 858, 859, 860, 861, 862, 0, 0,
        0, 0, 885, 886, 887, 888, 889, 890, 891, 892, 893, 894, 895, 896, 0, 0,
        0, 0, 919, 920, 921, 922, 923, 924, 925, 926, 927, 928, 929, 930, 0, 0,
        0, 0, 953, 954, 955, 956, 957, 958, 959, 960, 961, 962, 963, 964, 0, 0,
        0, 0, 987, 988, 989, 990, 991, 992, 993, 994, 995, 996, 997, 998, 0, 0,
        0, 0, 1021, 1022, 1023, 1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 0, 0,
        0, 0, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062, 1063, 1064, 1065, 1066, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 2,
      name = "tiles_up",
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 769, 770, 771, 0, 0, 0, 0, 0, 0, 831, 832, 833, 0, 0,
        0, 0, 803, 804, 805, 0, 0, 0, 0, 0, 0, 865, 866, 867, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
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
          x = 480,
          y = 360,
          width = 80,
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
          x = 560,
          y = 80,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 370.061,
          y = 400,
          width = 189.939,
          height = 80,
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
          width = 209.975,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 80,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 467,
          y = 200,
          width = 93,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 80,
          width = 99,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 160,
          width = 106,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 182,
          y = 80,
          width = 98,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 80,
          width = 80,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 383.333,
          width = 99,
          height = 16.6667,
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
          id = 25,
          name = "spawn",
          type = "",
          shape = "point",
          x = 327.333,
          y = 280.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "entry",
          type = "",
          shape = "point",
          x = 329,
          y = 415,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 36,
          name = "kris",
          type = "",
          shape = "point",
          x = 513.382,
          y = 267.33,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "kris_wake",
          type = "",
          shape = "point",
          x = 419.33,
          y = 267.33,
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
      name = "objects_party",
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
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 320,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/dreemurr.stain"
          }
        },
        {
          id = 19,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 90,
          y = 214,
          width = 87,
          height = 110,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* There are CDs under the bed.[wait:10]\n* Classical,[wait:5] jazz,[wait:5] religious ska...",
            ["text2"] = "* There's also a game console.[wait:10]\n* It has one normal controller,[wait:5] and one knock-off one."
          }
        },
        {
          id = 20,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 469,
          y = 217,
          width = 87,
          height = 36.4807,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/dreemurr.krisbed"
          }
        },
        {
          id = 21,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 360,
          width = 104,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/dreemurr.computer"
          }
        },
        {
          id = 22,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 371,
          y = 160,
          width = 94,
          height = 69,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/dreemurr.drawer2"
          }
        },
        {
          id = 23,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 185,
          y = 161,
          width = 94,
          height = 69,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/dreemurr.drawer1"
          }
        },
        {
          id = 24,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 160,
          width = 87,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/dreemurr.window"
          }
        },
        {
          id = 27,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 292,
          y = 467,
          width = 78,
          height = 13,
          rotation = 0,
          visible = true,
          properties = {
            ["exit_sound"] = "doorclose",
            ["facing"] = "down",
            ["map"] = "hometown/torhouse/floor2",
            ["marker"] = "entry",
            ["sound"] = "dooropen"
          }
        },
        {
          id = 29,
          name = "",
          type = "",
          shape = "rectangle",
          x = 86,
          y = 400.333,
          width = 92,
          height = 54,
          rotation = 0,
          gid = 1675,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = 470.333,
          y = 390,
          width = 74,
          height = 60,
          rotation = 0,
          gid = 1698,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 482.033,
          y = 343.734,
          width = 61.023,
          height = 44.7443,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown/dreemurr.birdcage"
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
          name = "bedsheet",
          type = "",
          shape = "point",
          x = 512.38,
          y = 230.435,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
