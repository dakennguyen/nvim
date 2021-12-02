map('n', '<leader>rn', ':lua require("tabline.actions").set_tabname()<CR>')
vim.cmd[[command! TabnameClear lua require("tabline.actions").clear_tabname()]]

require('tabline').setup{
  modified_icon = '●',
  close_icon = 'x',
  separator = '▎',
  padding = 1,
}
