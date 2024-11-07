return {
  "github/copilot.vim",
  cmd = "Copilot",
  event = "VeryLazy",
  init = function()
    vim.g.copilot_filetypes = {
      TelescopePrompt = false,
    }

    vim.g.copilot_no_tab_map = true
  end,
  keys = {
    {
      "<c-j>",
      'copilot#Accept("<CR>")',
      mode = "i",
      silent = true,
      expr = true,
      replace_keycodes = false,
    },
  },
}
