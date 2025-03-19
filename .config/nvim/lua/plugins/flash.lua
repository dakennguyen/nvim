return {
  "folke/flash.nvim",
  init = _G.lazy_load "flash.nvim",
  keys = {
    { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end },
  },
  opts = {
    jump = {
      autojump = true,
    },
    highlight = {
      groups = {
        label = "HopNextKey1",
      },
    },
    modes = {
      search = {
        enabled = false,
      },
      char = {
        enabled = false,
        highlight = { backdrop = false },
      },
    },
  },
}
