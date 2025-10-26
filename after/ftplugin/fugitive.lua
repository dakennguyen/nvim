vim.cmd [[
  silent! unmap <buffer> *
  silent! unmap <buffer> -
]]

vim.keymap.set("n", "<c-s>", "o", { buffer = true, remap = true, nowait = true })
vim.keymap.set("n", "<c-v>", "gO", { buffer = true, remap = true, nowait = true })
vim.keymap.set("n", "<c-t>", "O", { buffer = true, remap = true, nowait = true })

local opts = { buffer = true }
vim.keymap.set("n", "cl", ":Git pull", opts)
vim.keymap.set("n", "cp", ":Git push", opts)
vim.keymap.set("n", "ch", ":Git fetch", opts)
vim.keymap.set("n", "cH", ":Git remote update origin --prune", opts)
vim.keymap.set("n", "cd", ":vert Git diff", opts)
vim.keymap.set("n", "W", ":Git commit --no-verify<CR>", opts)
vim.keymap.set("n", "E", ":Git commit --amend --no-edit --no-verify", opts)

vim.keymap.set("n", "[ou", [[:Git branch -u origin/<c-r>=system('git branch --show-current')<CR><BS><CR>]], opts)
vim.keymap.set("n", "]ou", [[:Git branch -u origin/HEAD<CR>]], opts)

vim.keymap.set("n", "<leader>gd", ":vert Git diff --merge-base origin/HEAD<CR>", opts)

-- vim.cmd [[
-- "function! s:open(cmd)
-- "  call execute(a:cmd)
-- "  quit
-- "  wincmd p
-- "endfunction

-- nnoremap <silent><buffer> <leader>gz :vsplit <bar> Gclog -g stash<CR>
-- nnoremap <silent><buffer> <leader>gc :vsplit <bar> Gclog -n 50<CR>
-- ]]
