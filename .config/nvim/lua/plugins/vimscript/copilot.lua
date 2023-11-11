return {
  "github/copilot.vim",
  cmd = "Copilot",
  event = "VeryLazy",
  config = function()
    vim.g.copilot_filetypes = {
      TelescopePrompt = false,
    }

    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<c-j>", 'copilot#Accept("<CR>")', { silent = true, script = true, expr = true })
  end,
}
