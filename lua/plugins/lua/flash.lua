return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    {
      "s",
      mode = { "n", "o", "x" },
      function()
        require("flash").jump()
      end,
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
    },
  },
  opts = {
    jump = {
      autojump = true,
    },
    highlight = {
      groups = {
        label = "HopNextKey",
      },
    },
    modes = {
      search = {
        enabled = false,
      },
      char = {
        highlight = { backdrop = false },
      },
    },
  },
  config = true,
}
