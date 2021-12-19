vim.g.copilot_filetypes = {
  TelescopePrompt = false
}

vim.g.copilot_no_tab_map = true
map('i', '<c-space>', 'copilot#Accept("<CR>")', { silent = true, script = true, expr = true })
