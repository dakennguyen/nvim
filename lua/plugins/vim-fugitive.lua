local job = require("plenary.job")
_G.open_in_browser = function(url)
  local command = vim.loop.os_uname().sysname == "Darwin" and "open"
    or "xdg-open"
  job:new({ command = command, args = { url } }):start()
end

vim.cmd[[ command! -nargs=? Browse lua _G.open_in_browser(<q-args>) ]]

vim.opt.diffopt:append { 'vertical' }
map('n', 'gs', ':-1Gtabedit :<CR>',             { silent = true }) -- Git status
map('n', 'gb', ':Git blame<CR>',                { silent = true }) -- Git blame
map('n', '<leader>gl', ':Gclog -n 100',         { silent = true }) -- Git log
map('n', '<leader>glg', ':tab Git log --oneline --graph --all --decorate --abbrev-commit<CR>', { silent = true }) -- Git log
map('n', '<leader>gd', ':tab Git diff')                            -- Git diff
map('n', '<leader>gs', ':Gclog -g stash<CR>',   { silent = true }) -- Git stash
map('n', '<leader>gt', ':0Gclog<CR>',           { silent = true }) -- Git time machine
map('n', '<leader>gx', ':GBrowse<CR>',          { silent = true }) -- Git Browse
map('v', '<leader>gx', ':GBrowse<CR>',          { silent = true }) -- Git Browse in Visual mode
map('n', '<leader>gf', ':diffget //2<cr>')
map('n', '<leader>gj', ':diffget //3<cr>')

vim.cmd[[autocmd User Fugitive command! -buffer -nargs=? -complete=customlist,fugitive#CompleteObject Gu Git branch -u <args>]]
