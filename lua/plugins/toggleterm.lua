require("toggleterm").setup{}
vim.api.nvim_set_keymap('n', '`', ':ToggleTerm size=50<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '`', '<C-\\><C-N>:ToggleTerm<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<leader><esc>', '<C-\\><C-N>', { noremap = true })
