vim.g.copilot_filetypes = {
  TelescopePrompt = false
}

vim.g.copilot_no_tab_map = true
map('i', '<c-space>', 'copilot#Accept("<CR>")', { silent = true, script = true, expr = true })

vim.g.copilot_node_command = '/Users/dakennguyen/.asdf/installs/nodejs/16.14.2/bin/node'
