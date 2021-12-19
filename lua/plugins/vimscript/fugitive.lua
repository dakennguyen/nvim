-- local job = require("plenary.job")
-- _G.open_in_browser = function(url)
--   local command = vim.loop.os_uname().sysname == "Darwin" and "open"
--     or "xdg-open"
--   job:new({ command = command, args = { url } }):start()
-- end

-- vim.cmd[[ command! -nargs=? Browse lua _G.open_in_browser(<q-args>) ]]

vim.opt.diffopt:append { 'vertical' }
map('n', 'gs', ':tab G<CR>',                           { silent = true }) -- Git status
map('n', 'gb', ':Git blame<CR>',                       { silent = true }) -- Git blame
map('n', '<leader>gc', ':Gclog! -n 50 | copen<cr>',    { silent = true }) -- Git log
map('n', '<leader>gd', ':Gdiffsplit<CR>')                                 -- Git diff
map('n', '<leader>gz', ':Gclog! -g stash | copen<CR>', { silent = true }) -- Git stash
map('n', '<leader>gt', ':0Gclog! | copen<CR>',         { silent = true }) -- Git time machine
map('n', '<leader>gx', ':GBrowse<CR>',                 { silent = true }) -- Git Browse
map('v', '<leader>gx', ':GBrowse<CR>',                 { silent = true }) -- Git Browse in Visual mode

-- vimdiff
map('n', '<leader>gh', ':diffget //2 | diffupdate<cr>')
map('n', '<leader>gl', ':diffget //3 | diffupdate<cr>')
map('', '<leader>gj', ':diffput | diffupdate<cr>')
map('', '<leader>go', ':diffget | diffupdate<cr>')

-- vim.cmd[[autocmd User Fugitive command! -buffer -nargs=? -complete=customlist,fugitive#CompleteObject Gu Git branch -u <args>]]
