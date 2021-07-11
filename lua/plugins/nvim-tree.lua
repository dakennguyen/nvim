map('n', '<leader>0', ':NvimTreeFindFile<CR>')
map('n', '<leader>nt', ':NvimTreeToggle<CR>')
map('n', '<leader>nr', ':NvimTreeRefresh<CR>')

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  { key = "v",  cb = tree_cb("vsplit") },
  { key = "s",  cb = tree_cb("split") },
  { key = "t",  cb = tree_cb("tabnew") },
  { key = "ma", cb = tree_cb("create") },
  { key = "md", cb = tree_cb("remove") },
  { key = "mm", cb = tree_cb("rename") },
  { key = "mc", cb = tree_cb("copy") .. tree_cb("paste") },
}

vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}

vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_width = 50
