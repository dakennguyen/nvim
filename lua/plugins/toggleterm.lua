require("toggleterm").setup{}
map('n', '`', ':ToggleTerm size=50<CR>', { noremap = true })
map('t', '`', '<C-\\><C-N>:ToggleTerm<CR>', { noremap = true })
map('t', '<leader><esc>', '<C-\\><C-N>', { noremap = true })
