require('Navigator').setup({
    disable_on_zoom = true
})

vim.api.nvim_set_keymap('n', "<C-h>", "<CMD>lua require('Navigator').left()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<C-k>", "<CMD>lua require('Navigator').up()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<C-l>", "<CMD>lua require('Navigator').right()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<C-j>", "<CMD>lua require('Navigator').down()<CR>", { noremap = true, silent = true })
