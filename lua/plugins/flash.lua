return {
  "folke/flash.nvim",
  init = _G.lazy_load "flash.nvim",
  keys = {
    { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end },
  },
  opts = {
    modes = {
      search = { enabled = false },
      char = { enabled = false },
    },
  },
  config = function(_, opts)
    vim.api.nvim_set_hl(0, "FlashLabel", { bold = true })

    require("flash").setup(opts)
  end,
}
